Q.Sprite.extend('Enemy', {
    init: function(p) {
        this._super(p, {
            asset: 'enemy.png',
            vx: -70, defaultDirection: 'left',
            type: Q.SPRITE_ENEMY,
            live: 100,
            collisionMask: Q.SPRITE_BULLET | Q.SPRITE_PLAYER | Q.SPRITE_WORLD,

            skipCollide: true
        });

        this.add('2d, aiBounce');

        this.on('hit');
    },
    step: function(dt) {
        //console.log('Step enemy', dt);
    },
    hit: function(col) {
        if (col.obj.isA('Player')) {
            if (Q.state.get('lives') - 1 > 0) {
                Q.state.set('lives', Q.state.get('lives') - 1);
            } else {
                // GameOver
                Q.clearStages();
                Q.stageScene('gameStart');
            }
            this.destroy();
        } else if (col.obj.isA('Bullet')) {
            console.log(this.p.live);
            this.p.live -= 25;
            if(this.p.live <= 0) {
                this.destroy();
                Q.state.set('coins', Q.state.get('coins') + 15);
            } else {
                // todo slow motion
                Q.state.set('coins', Q.state.get('coins') + 5);
            }
            col.obj.destroy();
        }
    }
});
