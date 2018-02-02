Q.Sprite.extend('Bullet',{
    init: function(p) {

        this._super(p,{
            asset: 'bullet.png',
            x: 5,
            y: 5,
            type: Q.SPRITE_BULLET,
            collisionMask: Q.SPRITE_ENEMY | Q.SPRITE_WORLD,
            sensor: true
        });

        this.add('2d');
        //this.on('hit.sprite', this, 'collision');
        this.on('hit');
    },
    hit: function(col) {
        if (col.obj.p.name == 'World') {
            this.destroy();
        }
        /*
         else if (col.obj.isA('Bullet')) {
         this.destroy();
         col.obj.destroy();
         }*/
    },
    step: function(dt) {

    }/*,

     collision: function(col) {
     console.log('collision', col.obj.p);


     col.obj.destroy();
     this.destroy();
     }*/
});
