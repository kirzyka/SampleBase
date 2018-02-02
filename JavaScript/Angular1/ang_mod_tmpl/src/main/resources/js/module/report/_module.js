define([
    'angular'
], function (ng) {
    'use strict';

    var NAME = 'module.report';
    return ng.module(NAME, [
        'core',
        'core.navigation.menu'
    ])
        .config(configFn)
        .run(runFn);

    configFn.$inject = ['$routeProvider', 'MenuCfgServiceProvider'];
    function configFn($routeProvider, MenuCfgServiceProvider) {

        $routeProvider
            .when('/report', {
                templateUrl: './html/module/report/index.html',
                controller: 'ReportCtrl',
                controllerAs: 'vm'
            });


        MenuCfgServiceProvider.addMenuItems([
            {link: '#report', label: 'Report'}
        ]);
    }

    runFn.$inject = ['$log'];
    function runFn($log) {
        $log.getInstance(NAME).info('is running...');
    }
});