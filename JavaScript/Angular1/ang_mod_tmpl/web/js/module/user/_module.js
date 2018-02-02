define([
    'angular'
], function (ng) {
    'use strict';

    var NAME = 'module.user';
    return ng.module(NAME, [
        'core',
        'core.navigation.menu'
    ])
        .config(configFn)
        .run(runFn);

    configFn.$inject = ['$routeProvider', 'MenuCfgServiceProvider'];
    function configFn($routeProvider, MenuCfgServiceProvider) {

        $routeProvider
            .when('/user', {
                templateUrl: './html/module/user/index.html',
                controller: 'UserCtrl',
                controllerAs: 'vm'
            })
            .when('/user/:id', {
                templateUrl: './html/module/user/id.html',
                controller: 'UserCtrl',
                controllerAs: 'vm'
            });

        MenuCfgServiceProvider.addMenuItems([
            {link: '#user', label: 'User'}

        ]);
    }

    runFn.$inject = ['$log'];
    function runFn($log) {
        $log.getInstance(NAME).info('is running...');
    }
});