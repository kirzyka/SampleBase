Q.scene('ui', function(stage){

    var UiLivesLabel = document.getElementById('lives-label');
    var UiCoinsLabel = document.getElementById('coins-label');

    UiLivesLabel.innerHTML =  Q.state.get('lives');
    UiCoinsLabel.innerHTML = Q.state.get('coins');

    Q.state.on('change.lives',this, function() {
        UiLivesLabel.innerHTML = Q.state.get('lives');
    });

    Q.state.on('change.coins',this, function() {
        UiCoinsLabel.innerHTML = Q.state.get('coins');
    });
});