var $$DATA; //
var maxRegexId = 0;
var maxTemplateId = 0;
var curTemplate = null;

var cpRegexState = true;
var cpGroupsState = true;
var cpTemplatesState = false;
var cpSubstitutionState = true;
// ------------------------

var getFromLS = function() {
    return JSON.parse(localStorage.getItem('data')) || {};
}
var setToLS = function(data) {
    localStorage.setItem('data', JSON.stringify(data));
}
var getPatternByID = function(id) {
    var item = null;
    for(var i=0; i<$$DATA.regexList.length; i++) {
        if($$DATA.regexList[i].id == id) item = $$DATA.regexList[i];
    }
    return item;
}
var getTemplateByID = function(id) {
    var item = null;
    for(var i=0; i<$$DATA.templateList.length; i++) {
        if($$DATA.templateList[i].id == id) item = $$DATA.templateList[i];
    }
    return item;
}

var clearTemplate = function() {
    curTemplate = null;
    $('#txtTemplateKey').val('');
    $('#txtTemplateName').val('');
    $('#txtTemplate').val('');
}

var refreshRegexList = function() {
    var list = $$DATA.regexList || [];
    $('#tblRegex .tbody table').empty();
    for (var i=0; i<list.length; i++) {
        var item = list[i];
        if(item.id-0 > maxRegexId) maxRegexId = item.id-0;
        $('#tblRegex .tbody table')
            .append($('<tr data-id="' + item.id + '">')
                .append($('<td class="td1">')
                    .append(item.id)
            )
                .append(item.comment ?
                    $('<td class="td2 hasTooltip">')
                        .append(item.regexBody)
                        .append('<pre class="c_blue"> flags: </pre>')
                        .append(item.regexFlag)
                        .append($('<span>')
                            .append(item.comment)
                    ) :
                    $('<td class="td2">')
                        .append(item.regexBody)
                        .append('<pre class="c_blue"> flags: </pre>')
                        .append(item.regexFlag)
            )
                .append($('<td class="td3">')
                    .html(
                    '<div class="icon go"></div>'+
                    '<div class="icon delete"></div>')
            )
        );
    }
}
var refreshTemplateList = function() {
    var list = $$DATA.templateList || [];
    $('#tblTemplate .tbody table').empty();
    for (var i=0; i<list.length; i++) {
        var item = list[i];
        if(item.id-0 > maxTemplateId) maxTemplateId = item.id-0;
        var codeTooltip = item.code
            .replace(/</g,'&lt;')
            .replace(/>/g,'&gt;')
            .replace(/\$\$[A-Za-z0-9]*\$\$/g, function(c) {
                return '<pre class="c_blue">' + c + '</pre>';
            });

        $('#tblTemplate .tbody table')
            .append($('<tr data-id="' + item.id + '">')
                .append($('<td class="td1">')
                    .append(item.id)
            )
                .append($('<td class="td2">')
                    .append(item.key)
            )
                .append(item.code ?
                    $('<td class="td3 hasTooltip">')
                        .append(item.name)
                        .append($('<span style="white-space: pre;">')
                            .append(codeTooltip)
                    ) :
                    $('<td class="td3">')
                        .append(item.name)
            )
                .append($('<td class="td4">')
                    .html(
                    '<div class="icon edit"></div>'+
                    '<div class="icon delete"></div>')
            )
        );
    }
}

var cpChangeState = function(cp, state) {
    state = !state;
    if(state) {
        cp.removeClass('cp-expanded');
        cp.addClass('cp-collapsed');
    } else {
        cp.removeClass('cp-collapsed');
        cp.addClass('cp-expanded');
    }
    return state;
}

var generate = function(tmpl, groups) {
    if(tmpl.replace(/G\d*/g, '').length == 0) {
        return groups[tmpl.replace(/G/,'')-0];
    } else {
        for(var i=0; i < $$DATA.templateList.length; i++) {
            var item = $$DATA.templateList[i];
            if(item.key == tmpl) {
                code = item.code;
                break;
            }
        }
    }
    if(!code) {
        return '';
    } else {
        var result = code.replace(/\$\$[A-Za-z0-9]*\$\$/g, function(c) {
            var t = generate(c.replace(/\$/g,''), groups);
            return t;
        });
        return result;
    }
}

$( document ).ready(function() {

    $('#popTest').hide();

    $$DATA = getFromLS();
    console.log($$DATA);

    if($$DATA) {
        cpRegexState = cpChangeState($('#cpRegex'), cpRegexState);
        cpGroupsState = cpChangeState($('#cpGroups'), cpGroupsState);
        cpTemplatesState = cpChangeState($('#cpTemplates'), cpTemplatesState);
        cpSubstitutionState = cpChangeState($('#cpSubstitution'), cpSubstitutionState);
        refreshRegexList();
        refreshTemplateList();
    }

    $('#btnRegExSave').on('click', function(e) {
        var comment = prompt('Add your comment','');
        if(!$$DATA['regexList']) $$DATA['regexList'] = [];
        maxRegexId++;
        $$DATA.regexList.push({
            id:maxRegexId,
            regexBody:$('#txtRegExBody').val(),
            regexFlag:$('#txtRegExFlag').val(),
            comment: comment
        });
        setToLS($$DATA);
        refreshRegexList();
    });

    $('#btnGenerate').on('click', function(e) {
        var substitution = $('#txtSubstitution').val().split('\n');
        var sMap = {};
        for(var i=0; i<substitution.length; i++) {
            var item = substitution[i].split('=');
            sMap[item[0]] = item[1];
        }

        var pattern = new RegExp($('#txtRegExBody').val(), $('#txtRegExFlag').val());
        var s =$('#txtTestResult').val();
        if(pattern && s) {
            var res = '';
            var r = pattern.exec(s);
            while(r) {

                for(var i=0; i<r.length; i++) {
                    if(r[i] && sMap['G'+i]) {
                        res += generate(sMap['G'+i], r);
                    }
                }

                r = pattern.exec(s);
            }
            $('#txtSubstResult').val(res)
        }
    });

    $('#tblRegex').on('click', '.go', function(e) {
        var patternId = $(this).closest('tr').data('id')-0;
        var pattern = getPatternByID(patternId);
        $('#txtRegExBody').val(pattern.regexBody);
        $('#txtRegExFlag').val(pattern.regexFlag);
    });
    $('#tblRegex').on('click', '.delete', function(e) {
        var patternId = $(this).closest('tr').data('id')-0;
        for(var i=0; i<$$DATA.regexList.length; i++) {
            if($$DATA.regexList[i].id == patternId) {
                $$DATA.regexList.splice(i, 1);
                break;
            }
        }
        setToLS($$DATA);
        refreshRegexList();
    });

    $('#btnGetGroups').on('click', function(e) {
        var pattern = new RegExp($('#txtRegExBody').val(), $('#txtRegExFlag').val());
        var s =$('#txtTestResult').val();
        if(pattern && s) {
            $('#lstGroup').empty();
            var groups = pattern.exec(s);
            if(!groups) {
                console.log('not match');
                return
            }
            for(var i=1; i<groups.length; i++) {
                var g = groups[i] ? groups[i].replace(/\s{1,}/g,'<span class="bg_blue">_</span>') : 'empty';
                $('#lstGroup')
                    .append($('<li>')
                        .append(g)
                    )
            }
        } else {
            console.log('not match')
        }
    })

    $('#tblTemplate').on('click', '.edit', function(e) {
        var templateId = $(this).closest('tr').data('id')-0;
        curTemplate = getTemplateByID(templateId);
        $('#txtTemplateKey').val(curTemplate.key);
        $('#txtTemplateName').val(curTemplate.name);
        $('#txtTemplate').val(curTemplate.code);
    });
    $('#tblTemplate').on('click', '.delete', function(e) {
        var templateId = $(this).closest('tr').data('id')-0;
        for(var i=0; i<$$DATA.templateList.length; i++) {
            if($$DATA.templateList[i].id == templateId) {
                $$DATA.templateList.splice(i, 1);
                break;
            }
        }
        clearTemplate();
        setToLS($$DATA);
        refreshTemplateList();
    });
    $('#btnTemplateNew').on('click', function(e) {
        clearTemplate();
    })
    $('#btnTemplateSave').on('click', function(e) {
        if (!curTemplate) {
            curTemplate = {id:0}
        }
        curTemplate.key = $('#txtTemplateKey').val();
        curTemplate.name = $('#txtTemplateName').val();
        curTemplate.code = $('#txtTemplate').val();
        if(!$$DATA) $$DATA = {};
        if(!$$DATA['templateList']) $$DATA['templateList'] = [];
        if(curTemplate.id == 0) {
            maxTemplateId++;
            curTemplate.id = maxTemplateId;
            $$DATA.templateList.push(curTemplate);
        } else {
            for(var i=0; i<$$DATA.templateList.length; i++) {
                if($$DATA.templateList[i].id == curTemplate.id) $$DATA.templateList[i] = curTemplate;
            }
        }
        setToLS($$DATA);
        refreshTemplateList();
        clearTemplate();
    })

    $('#cpRegex .header .btn').on('click', function(e) {
        cpRegexState = cpChangeState($('#cpRegex'), cpRegexState);
    })
    $('#cpGroups .header .btn').on('click', function(e) {
        cpGroupsState = cpChangeState($('#cpGroups'), cpGroupsState);
    })
    $('#cpTemplates .header .btn').on('click', function(e) {
        cpTemplatesState = cpChangeState($('#cpTemplates'), cpTemplatesState);
    })
    $('#cpSubstitution .header .btn').on('click', function(e) {
        cpSubstitutionState = cpChangeState($('#cpSubstitution'), cpSubstitutionState);
    })
});