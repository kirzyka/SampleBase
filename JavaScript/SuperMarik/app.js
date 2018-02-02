var Q = Quintus()
    .include('Audio, Sprites, Scenes, Input, 2D, Touch, UI')
    .enableSound()
    .setup({
        width: 960,
        height: 640,
        development: true
    })
    .controls()
    .touch();

Q.SPRITE_PLAYER = 1;
Q.SPRITE_BULLET = 2;
Q.SPRITE_ENEMY = 3;
Q.SPRITE_WORLD = 4;
Q.SPRITE_FINISH = 5;

var ASSETS_IMAGE = ['bg.jpg', 'tiles.png', 'player.png', 'enemy.png', 'bullet.png'];
var ASSETS_AUDIO = ['base.mp3', 'shot.mp3'];
var ASSETS_LEVEL = ['level1.tmx'/*, 'level2.tmx'*/];
var LEVEL_COUNT = ASSETS_LEVEL.length;

var UIQuintus = document.getElementById('quintus_container');
var UiBaseBox = document.getElementById('base-box');
var UiGameBox = document.getElementById('game-box');
var UiLoadingBox = document.getElementById('loading-box');
var UiLoadingProgress = document.getElementById('loading-progress');
var UiStatsBox = document.getElementById('stats-box');

Q.v = {
    player: null,
    background: null,
    currentLevel: 0
};

Q.load(
    ASSETS_IMAGE.concat(
        ASSETS_AUDIO.concat(
            ASSETS_LEVEL)).join(','),
    function () {

        Q.sheet('tiles', 'tiles.png', { tilew: 72, tileh: 72});
        Q.sheet('finish','tiles.png', { 'tilew': 70, 'tileh': 70,'sx': 288,'sy': 360});
        Q.stageScene('gameStart');
        Q.audio.play('base.mp3',{ loop: true });


    },
    {
        progressCallback: function(loaded,total) {
            UiLoadingProgress.style.width = Math.floor( loaded / total * 100) + '%';
            if(loaded >= total) {
                UiLoadingBox.parentNode.removeChild(UiLoadingBox);
            }


        }
    }
);

        