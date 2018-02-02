Q.Sprite.extend('Finish', {
    init: function(p) {
        this._super(p, {
            sheet: 'finish',
            type: Q.SPRITE_FINISH,
            collisionMask: Q.SPRITE_PLAYER | Q.SPRITE_WORLD
        });

        this.add('2d');

        this.on('hit');
    },
    hit: function(col) {
        if (col.obj.isA('Player')) {
            if(Q.v.currentLevel < LEVEL_COUNT) {
                // Next Level
                nextLevel();
            } else {
                // GameOver
                Q.clearStages();
                Q.stageScene('gameStart');
            }
        }
    }
});
