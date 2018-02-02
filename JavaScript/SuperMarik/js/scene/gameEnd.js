Q.scene('gameEnd',function(stage) {
    var label = stage.insert(new Q.UI.Text({
        x: Q.width/2,
        y: Q.height/2,
        label: stage.options.label
    }));
});