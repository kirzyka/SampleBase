Q.scene('gameStart', function(stage) {
    stage.insert(new Q.UI.Button({
        asset: 'bg.jpg',
        x: 0,
        y: 0,
        w: 1,
        h: 1
    }));

    var box = stage.insert(new Q.UI.Container(
        {
            x: 180,
            y: 400,
            fill: 'rgba(17,24,19,0.9)'
        }
    ));

    var btnSatr = box.insert(new Q.UI.Button(
        {
            x: 0,
            y: 0,
            w: 250,
            size: 18,
            fill: '#fcfdfe',
            label: 'СТАРТ'
        }
    ));
    var btnOptions = box.insert(new Q.UI.Button(
        {
            x: 0,
            y: 50,
            w: 250,
            size: 18,
            fill: '#fcfdfe',
            label: 'АВТОРЫ'
        }
    ));
    /*var label = box.insert(new Q.UI.Text({x:10, y: -10 - button.p.h,
        label: stage.options.label }));  */

    btnSatr.on('click',function() {
        Q.state.reset({coins: 0,lives: 3});
        Q.v.currentLevel = 1;
        Q.clearStages();
        Q.stageScene('level' + Q.v.currentLevel);
    });
    box.fit(20);


});

