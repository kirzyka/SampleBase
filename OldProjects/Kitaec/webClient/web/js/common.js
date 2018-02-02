// CONSTANTS
// -------------------------------------------------------
const BASKET_MSG = "Корзина пуста"

const HOME = "/index.html";

const MONTH = [
    "января",
    "февраля",
    "марта",
    "апреля",
    "мая",
    "июня",
    "июля",
    "августа",
    "сентября",
    "октября",
    "ноября",
    "декабря"
];

/* cookie var names*/
const CKS_BASKET 		= "bsk";
const CKS_SUPPLIER 	= "s";
const CKS_LOCATION 	= "l";
const CKS_DATE		 	= "d";
const CKS_TIME 		= "t";
/* path var names */
const PATH_SUPPLIER 	= "s";
const PATH_LOCATION 	= "l";
const PATH_DATE 		= "d";
const PATH_TIME 		= "t";
/* Service URLs */
const URL_SUPPLIER      = "/supplier";
const URL_LOCATION      = "/loc";
const URL_OFFER         = "/offer";
/* Events */
const EVENT_SUPPLIER_CHANGED = "supplierChanged";
const EVENT_LOCATION_CHANGED = "locationChanged";
const EVENT_DATE_CHANGED = "dateChanged";
const EVENT_TIME_CHANGED = "timeChanged";

/* Common */
const TIMEOUT = 10000;


// VARIABLES
// -------------------------------------------------------
var suppliers = [];/*
 { id: 1, name: "Вегано Хулигано", description: "здоровье и созидание", color: "green" },
 { id: 2, name: "Фреш Фактори", description: "энергия и сила", color: "orange" }
 ]; */

var locations = [];/*
 { id: 1, name: 'БЦ "Irva", корп. Б (Luxoft)' },
 { id: 2, name: 'БЦ "Shmirva", корп. A (Luxoft)' }
 ]; */

var dates = [];/*
 { date: 1393804800000 }, // 3.03
 { date: 1393977600000 },
 { date: 1394150400000 }, // 7.03
 { date: 1394323200000 },
 { date: 1394496000000 },
 { date: 1397174400000 }, // 11.04
 { date: 1399766400000 }  // 11.05
 ];*/

var times = [];/*
 { id: 1, name: "12:00", value: 12*60*60 },
 { id: 2, name: "14:00", value: 14*60*60 },
 { id: 3, name: "16:00", value: 16*60*60 }
 ];  */

var pathParameters = {};
var currentUser = {};
var currentSupplier = null;// = SUPPLIERS[0];
var currentLocation = null;// = LOCATIONS[0];
var currentDate = null;//DATES[0].date / 1000;
var currentTime = null;

// AJAX Manager
var ajaxManager = (function() {
    var requests = [];

    return {
        addReq:  function(opt) {
            requests.push(opt);
        },
        removeReq:  function(opt) {
            if( $.inArray(opt, requests) > -1 )
                requests.splice($.inArray(opt, requests), 1);
        },
        run: function() {
            var self = this,
                orgSuc;

            if( requests.length ) {
                oriSuc = requests[0].complete;

                requests[0].complete = function() {
                    if( typeof oriSuc === 'function' ) oriSuc();
                    requests.shift();
                    self.run.apply(self, []);
                };

                $.ajax(requests[0]);
            } else {
                self.tid = setTimeout(function() {
                    self.run.apply(self, []);
                }, 1000);
            }
        },
        stop:  function() {
            requests = [];
            clearTimeout(this.tid);
        }
    };
}());

var _Supplier = {
    getList: function() {
        var promise = $.Deferred();
        ajaxManager.addReq({
            timeout: TIMEOUT,
            //contentType: "text/plain; charset=UTF-8",
            type: "POST",
            url: URL_SUPPLIER,
            cache: false,
            data: {
                action: "get_supplier_list"
            },
            success: function(result){
                promise.resolve(result.data);
            },
            error: function (request, errorType, errorMessage) {
                promise.reject(errorMessage);
            }
        });
        return promise;
    },
    getItem: function(list) {
        var result;
        if(getUrlVars()[PATH_SUPPLIER] === undefined) {
            // set supplier from cookies
            result = this.getItemById(list, $.cookie(CKS_SUPPLIER));
        } else {
            // set supplier from path param
            result = this.getItemById(list, getUrlVars()[PATH_SUPPLIER]);
        }
        if(result == null && list != null && list.length > 0) {
            result = list[0];
        }
        return result;
    },
    getItemById: function(list, id) {
        for(var i = 0; i < list.length; i++) {
            var supplier = list[i];
            if(supplier.supplier_id == id){
                return supplier;
            }
        }
        return null;
    },
    setItem: function(value) {
        currentSupplier = value;
        $(document).trigger(EVENT_SUPPLIER_CHANGED);
        if(value != null) {
            $("#nav-selected").text(value.name);
            $("#nav-selected").removeClass();
            $('#mnuSupLink').attr("href", "/supplier.html?" + PATH_SUPPLIER + "=" + value.supplier_id);
            //$("#nav-selected").addClass(supplier.color);

            $.cookie(CKS_SUPPLIER, value.supplier_id);
            pathParameters[PATH_SUPPLIER] = value.supplier_id;
            setUrlVars(pathParameters);
        }
    },
    createSupplierMenu: function() {
        $("#nav-drop-list").html("");
        for(var i = 0; i < suppliers.length; i++) {
            var supplier = suppliers[i];
            $("#nav-drop-list").append('<li><a href="#" class="nav-item green' + /*supplier.color*/ '" data-id="' + supplier.supplier_id + '" title="' + supplier.description + '">' + supplier.name + '</a></li>');
        }
    }
}

var _Location = {
    getList: function(supplierId) {
        var promise = $.Deferred();
        ajaxManager.addReq({
            timeout: TIMEOUT,
            //contentType: "text/plain; charset=UTF-8",
            type: "POST",
            url: URL_LOCATION,
            cache: false,
            data: {
                action: "get_loc_list_by_sup_id",
                supplier_id: supplierId
            },
            success: function(result){
                promise.resolve(result.data);
            },
            error: function (request, errorType, errorMessage) {
                promise.reject(errorMessage);
            }
        });
        return promise;
    },
    getItem: function(list) {
        var result;
        if(getUrlVars()[PATH_LOCATION] === undefined) {
            // get location from cookies
            result = this.getItemById(list, $.cookie(CKS_LOCATION));
        } else {
            // get location from path param
            result = this.getItemById(list, getUrlVars([PATH_LOCATION]));
        }
        if(result == null && list != null && list.length > 0) {
            result = list[0];
        }
        return result;
    },
    getItemById: function(list, id) {
        for(var i = 0; i < list.length; i++) {
            var location = list[i];
            if(location.location_id == id){
                return location;
            }
        }
        return null;
    },
    setItem: function(value) {
        currentLocation = value;
        $(document).trigger(EVENT_LOCATION_CHANGED);
        if(value != null) {
            $('#selectedAddress').html(value.name);
            $('.location').find('a').html("Другой адрес (" + locations.length + ")");

            $.cookie(CKS_LOCATION, value.location_id);
            pathParameters[PATH_LOCATION] = value.location_id;
            setUrlVars(pathParameters);
        }
    }
}

var _Date = {
    getList: function(supplierId, locationId) {
        var promise = $.Deferred();
        ajaxManager.addReq({
            timeout: TIMEOUT,
            type: "POST",
            url: URL_OFFER,
            cache: false,
            data: {
                action: "get_offer_day_list",
                supplier_id: supplierId,
                location_id: locationId
            },
            success: function(result){
                promise.resolve(result.data);
            },
            error: function (request, errorType, errorMessage) {
                promise.reject(errorMessage);
            }
        });
        return promise;
    },
    getItem: function(list) {
        var result;
        if(getUrlVars()[PATH_DATE] === undefined) {
            // get date from cookies
            result = this.getItemByValue(list, $.cookie(CKS_DATE));
        } else {
            // get date from path param
            result = this.getItemByValue(list, getUrlVars()[PATH_DATE]);
        }
        if(result == null && list != null && list.length > 0) {
            result = list[0].date / 1000;
        }
        return result;
    },
    getItemByValue: function(list, value) {
        for(var i = 0; i < list.length; i++) {
            var date = list[i];
            if(date == value){
                return date;
            }
        }
        return null;
    },
    setItem: function(value){
        currentDate = value;
        $(document).trigger(EVENT_DATE_CHANGED);
        if(value != null){
            var tmpDate = new Date(value * 1000);
            $('#selectedDate').html(tmpDate.getDate());
            $('#selectedMonth').html(MONTH[tmpDate.getMonth()]);

            $.cookie(CKS_DATE, value);
            pathParameters[PATH_DATE] = value;
            setUrlVars(pathParameters);
        }
    }
}

var _Time = {
    getList: function(supplierId, locationId, date) {
        var promise = $.Deferred();
        ajaxManager.addReq({
            timeout: TIMEOUT,
            type: "POST",
            url: URL_OFFER,
            cache: false,
            data: {
                action: "get_offer_time_list",
                supplier_id: supplierId,
                location_id: locationId,
                date: date * 1000
            },
            success: function(result){
                promise.resolve(result.data);
            },
            error: function (request, errorType, errorMessage) {
                promise.reject(errorMessage);
            }
        });
        return promise;
    },
    getItem: function(list) {
        var result;
        if(getUrlVars()[PATH_TIME] === undefined) {
            // get time from cookies
            result = this.getItemById(list, $.cookie(CKS_TIME));
        } else {
            // get time from path param
            result = this.getItemById(list, getUrlVars()[PATH_TIME]);
        }
        if(result == null && list != null && list.length > 0) {
            result = list[0];
        }
        return result;
    },
    getItemById: function(list, id) {
        for(var i = 0; i < list.length; i++) {
            var time = list[i];
            if(time.id == id){
                return time;
            }
        }
        return null;
    },
    setItem: function(value) {
        currentTime = value;
        $(document).trigger(EVENT_TIME_CHANGED);
        if(value != null) {
            $('#selectedTime').html(currentTime.name);
            $('.time').find('a').html("Другое время (" + times.length + ")");
        }
    }
}

var _Basket = {
    getBaskets: function() {
        var baskets;
        if (typeof localStorage !== "undefined") {
            baskets = localStorage.getItem(CKS_BASKET);
        } else {
            baskets = $.cookie(CKS_BASKET);
        }

        if (baskets != null) {
            baskets = JSON.parse(baskets);
        } else {
            baskets = [];
        }

        return baskets;
    },
    getBasket: function(list) {
        var basket = null;
        $.each(list, function( i, item ) {
            if(item.supplier_id == currentSupplier.supplier_id &&
                item.location_id == currentLocation.location_id &&
                item.date == currentDate &&
                item.time == currentTime.value) {
                basket = item;
            }
        });

        return basket;
    },
    updateBasketMsg: function() {
        var msg = BASKET_MSG;
        var baskets = this.getBaskets();
        var basket = this.getBasket(baskets);
        if(basket != null) {
            var total = 0;
            $.each(basket.orders, function( j, order ) {
                total += order.price * order.count;
            });
            msg = total + ' грн.';
        }
        $('#basketMsg').html(msg);
    },
    saveBaskets: function(baskets) {
        if (typeof localStorage !== "undefined") {
            localStorage.setItem(CKS_BASKET, JSON.stringify(baskets));
        } else {
            $.cookie(CKS_BASKET, JSON.stringify(baskets));
        }
    },
    cleanBaskets: function() {
        this.saveBaskets(null);
    },
    addToBasket: function (offerId, name, description, price) {
        var baskets = this.getBaskets();
        var currentBasket = this.getBasket(baskets);
        var currentOrder;

        if(currentBasket == null) {
            currentBasket = { supplier_id: currentSupplier.supplier_id,
                location_id: currentLocation.location_id,
                date: currentDate,
                time: currentTime.value,
                orders:[]} ;

            baskets.push(currentBasket);
        }
        if(currentBasket.orders == null) { currentBasket.orders = [] };
        $.each(currentBasket.orders, function( index, item ) {
            if(item.offer_id == offerId) {
                currentOrder = item;
            }
        });
        if(currentOrder == null) {
            currentBasket.orders.push( { offer_id:offerId, name:name, description:description, price:price, count: 1 } );
        } else {
            currentOrder.count++;
        }

        this.saveBaskets(baskets);
        this.updateBasketMsg();
    },
    increaseFromBasket: function(offerId) {
        var baskets = this.getBaskets();
        var currentBasket = this.getBasket(baskets);
        var currentOrder;

        if(currentBasket.orders == null) { currentBasket.orders = [] };
        $.each(currentBasket.orders, function( index, item ) {
            if(item.offer_id == offerId) {
                currentOrder = item;
            }
        });
        if(currentOrder != null) {
            currentOrder.count++;
        }

        this.saveBaskets(baskets);
        this.updateBasketMsg();
    },
    removeFromBasket: function(offerId) {
        var baskets = this.getBaskets();
        var currentBasket = this.getBasket(baskets);
        var currentOrder;

        if(currentBasket.orders == null) { currentBasket.orders = [] };
        $.each(currentBasket.orders, function( index, item ) {
            if(item.offer_id == offerId) {
                currentOrder = item;
            }
        });
        if(currentOrder != null) {
            if(currentOrder.count > 1) {
                currentOrder.count--;
            } else {
                removeFromArray(currentBasket.orders, currentOrder);
            }
        }

        this.saveBaskets(baskets);
        this.updateBasketMsg();
    }
}

// Triggers
function supplierTrigger() {
    if(currentSupplier == null) { return; }
    $.when(_Location.getList(currentSupplier.supplier_id)).then(function(list) {
            locations = list;
            _Location.setItem(_Location.getItem(list));
        }
    );
}

function locationTrigger() {
    if(currentLocation == null) { return; }
    $.when(_Date.getList(currentSupplier.supplier_id, currentLocation.location_id)).then(function(list) {
            dates = list;
            _Date.setItem(_Date.getItem(list));
        }
    );
}

function dateTrigger() {
    if(currentDate == null) { return; }
    $.when(_Time.getList(currentSupplier.supplier_id, currentLocation.location_id, currentDate)).then(function(list) {
            times = list;
            _Time.setItem(_Time.getItem(list));
        }
    );
}


// FUNCTIONS
// -------------------------------------------------------

function init() {

    // Run AjaxManager
    ajaxManager.run();

    // URL
    pathParameters = getUrlVars();

    // Menu (active/inactive)
    $('#navigation').find('li').removeClass('active');
    var page_path = $(location).attr('pathname');
    if(page_path == "/") { page_path = "/index.html"; }
    $('#navigation').find('a[href$="' + page_path + '"]').closest('li').addClass('active');

    // Element Listners
    // --------------------------
    // order
    $('#order, #basketMsg, #order p').on('click', function (event) {
        event.preventDefault();
        goToPage("order.html");
    });
    // change supplier
    $('.nav-item').on('click', function (event) {
        event.preventDefault();
        for(var i = 0; i < suppliers.length; i++) {
            var supplier = suppliers[i];
            if(supplier.id == $(this).data("id")){
                setSupplier(supplier);
                goToPage(HOME);
            }
        }
    });
    // --------------------------

    // VAR Listners
    $(document).bind(EVENT_SUPPLIER_CHANGED, supplierTrigger);
    $(document).bind(EVENT_LOCATION_CHANGED, locationTrigger);
    $(document).bind(EVENT_DATE_CHANGED, dateTrigger);


    // Get Suppliers
    _Supplier.getList().done(function(list) {
        suppliers = list;
        _Supplier.setItem(_Supplier.getItem(list));
        _Supplier.createSupplierMenu();
    });
}

// Popup
// -------------------------------------------------------
function openSelectPopup(source, closeClass, outputSetter, callBack) {
    if(source == null || source.length == 0) {
        console.log("Невозможно открыть окно выбора. Нет источника данных.");
        return;
    }

    var popup = $('#popup-select');
    $(popup).find('ul').html('');
    for(var i = 0; i < source.length; i++) {
        var item = source[i];
        $('#popup-select').find('ul').append('<li class="popup-select-item ' + closeClass + '" data-id="' + item.id + '">' + item.name + '</li>');
    }

    $(popup).show();
    $('.overlay').show();
    $(popup).addClass('animate-popup-in');
    $(popup).removeClass('animate-popup-out');

    $('.' + closeClass).on('click', function (event) {
        for(var i = 0; i < source.length; i++) {
            var item = source[i];
            if(item.id == $(this).data('id')) {
                outputSetter(item);
                break;
            }
        }

        $('.overlay, .popup-select').hide();
        $(popup).addClass('animate-popup-out');
        $(popup).removeClass('animate-popup-in');
        if(callBack != null) {
            callBack();
        };
    });
}

function openDatePopup(closeClass, outputSetter, callBack) {
    if(dates == null || dates.length == 0) {
        console.log("Невозможно открыть календарь. Нет источника данных.");
        return;
    }

    var popup = $('#popup-date');
    $(popup).show();
    $('.overlay').show();
    $(popup).addClass('animate-popup-in');
    $(popup).removeClass('animate-popup-out');

    moment.lang('ru');

    var s = $('#calendarTemplate').html();
    $('.calendar').clndr({
        template: $('#calendarTemplate').html(),
        weekOffset: 0,
        forceSixRows: true,
        events: dates,
        clickEvents: {
            click: function(item) {
                console.log(item);
                if(item.events.length > 0) {
                    outputSetter(item.events[0].date / 1000); /*.unix()*/
                    $('.overlay, .popup-date').hide();
                    $(popup).addClass('animate-popup-out');
                    $(popup).removeClass('animate-popup-in');
                    if(callBack != null) {
                        callBack();
                    };
                }
            },
            onMonthChange: function(month) {
                console.log('you just went to ' + month.format('MMMM, YYYY'));
            }
        },
        daysOfTheWeek: ['П', 'В', 'С', 'Ч', 'П', 'С', 'В']
    });
}



// Common Help Functions
// -------------------------------------------------------
function goToPage(page) {
    window.location.href = page;
}

function removeFromArray (arr, item) {
    for(var i = arr.length; i--;) {
        if(arr[i] === item) {
            arr.splice(i, 1);
        }
    }
}

// URL
// -------------------------------------------------------
function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}

function setUrlVars(vars) {
    var paramPart = "";
    for(param in vars) {
        paramPart = updateQueryStringParameter(paramPart, param, vars[param]);
    }
    var newUrl = window.location.href + "?";
    newUrl = newUrl.replace(/\?.*/gi, paramPart);
    window.history.pushState(null, window.title, newUrl);
}

function updateQueryStringParameter(uri, key, value) {
    var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    var separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
        return uri.replace(re, '$1' + key + "=" + value + '$2');
    }
    else {
        return uri + separator + key + "=" + value;
    }
}
