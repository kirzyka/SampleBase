Q.Sprite.extend('Player', {
    init: function (p) {
        this._super(p, {
            asset: 'player.png',
            type: Q.SPRITE_PLAYER,
            collisionMask: Q.SPRITE_ENEMY | Q.SPRITE_WORLD,
            jumpSpeed: -400
        });
        this.add('2d, platformerControls');

        Q.input.on('fire',this,'fire');
    },
    fire: function() {
        var p = this.p;
        this.stage.insert(new Q.Bullet({
            x: p.x + (p.flip ? -22 : 22),
            y: p.y - p.h/2 + 25,
            vx: (p.flip ? -1 : 1) * 300,
            vy: 1,
            gravity: 0
        }));
        Q.audio.play('shot.mp3');
    },
    step: function (dt) {
        if (Q.inputs['left'] && this.p.direction == 'right') {
            this.p.flip = 'x';
        }
        if (Q.inputs['right'] && this.p.direction == 'left') {
            this.p.flip = false;
        }
    }
});