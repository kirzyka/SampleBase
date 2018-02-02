// Viewport
var setupViewport = function(stage) {
    stage.add('viewport').follow(
        Q.v.player,
        {x: true, y: true},
        {minX: 0, maxX: Q.v.background.p.w, minY: 0, maxY: Q.v.background.p.h}
    );
}

// Process Layers
// Background
var setupBackground= function(stage, level) {
    Q.v.background = new Q.TileLayer({
        dataAsset: 'level' + level + '.tmx',
        layerIndex: 0,
        sheet: 'tiles',
        tileW: 70,
        tileH: 70,
        type: Q.SPRITE_NONE
    });
    stage.insert(Q.v.background);
};

// Collision
var setupCollision= function(stage, level) {
    stage.collisionLayer(new Q.TileLayer({
        dataAsset: 'level' + level + '.tmx',
        layerIndex: 1,
        sheet: 'tiles',
        tileW: 70,
        tileH: 70,
        name: 'World',
        type: Q.SPRITE_WORLD
    }));
};

// Objects
var setupObjects = function(stage, level) {
    var i = 0;
    var j = 0;
    var source = Q.asset('level' + level + '.tmx');
    var parser = new DOMParser();
    var doc = parser.parseFromString(source, 'application/xml');
    var objGroups = doc.getElementsByTagName('objectgroup');
    var objList;
    for(i = 0; i < objGroups.length; i++) {
        var objGroup = objGroups[i];
        if(objGroup.getAttribute('name') == 'enemy') {
            objList = objGroup.getElementsByTagName('object');
            for(j = 0; j < objList.length; j++) {
                var enemyObj = objList[j];
                var x = enemyObj.getAttribute('x') - 0;
                var y = enemyObj.getAttribute('y') - 0;
                stage.insert(new Q.Enemy({ x: x, y: y }));
            }
        }

        if(objGroup.getAttribute('name') == 'player') {
            objList = objGroup.getElementsByTagName('object');
            for(j = 0; j < objList.length; j++) {
                var playerObj = objList[j];
                var x = playerObj.getAttribute('x') - 0;
                var y = playerObj.getAttribute('y') - 0;
                Q.v.player = new Q.Player({ x: x, y: y });
                stage.insert(Q.v.player);
                break;
            }
        }

        if(objGroup.getAttribute('name') == 'finish') {
            objList = objGroup.getElementsByTagName('object');
            for(j = 0; j < objList.length; j++) {
                var finishObj = objList[j];
                var x = finishObj.getAttribute('x') - 0;
                var y = finishObj.getAttribute('y') - 0;
                stage.insert(new Q.Finish({ x: x, y: y }));
                break;
            }
        }
    }
};

// UI Box
var showUiBox = function() {
    UIQuintus.appendChild(UiGameBox);
    UiGameBox.style.display = 'inline-block';
    Q.stageScene('ui', 1);
};

var nextLevel = function() {
    Q.v.currentLevel ++;
    Q.clearStages();
    Q.stageScene('level' + Q.v.currentLevel);
}
        