(function(){
    var level = 1;
    /*for(level = 1; level <= LEVEL_COUNT; level++ ) {

    }*/

    Q.scene('level' + level, function (stage) {

        setupBackground(stage, level);
        setupCollision(stage, level);
        setupObjects(stage, level);

        setupViewport(level);

        showUiBox();
    });
}());
