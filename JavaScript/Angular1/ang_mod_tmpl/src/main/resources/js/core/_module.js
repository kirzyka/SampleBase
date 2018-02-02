define([
    'angular',

    '../module/user/_index',
    '../module/report/_index'
], function (ng) {
    'use strict';

    var NAME = 'core';
    return ng.module(NAME, [
        'ngRoute',
        'ngAnimate',
        'ngLogger',

        'core.security',
        'core.messaging',
        'core.navigation.menu',
        'core.component.date',
        'core.component.input',
        'core.component.menu',
        'core.component.popup',

        'module.user',
        'module.report'
    ])
        .config(configFn)
        .run(runFn);

    configFn.$inject = ['$routeProvider', '$httpProvider', 'logEnhancerProvider', 'MenuCfgServiceProvider'];
    function configFn($routeProvider, $httpProvider, logEnhancerProvider, MenuCfgServiceProvider) {

        $routeProvider
            .when('/default', {
                templateUrl: './html/core/page/default.html',
                controller: 'DefaultPageCtrl',
                controllerAs: 'vm'
            })
            .otherwise({
                redirectTo: '/default'
            });

        /*
         $httpProvider.defaults.headers.put = {
         'Access-Control-Request-Origin': '*',
         'Access-Control-Request-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
         'Access-Control-Request-Headers': 'Content-Type, X-Requested-With'
         };
         $httpProvider.defaults.useXDomain = true;
        */

        logEnhancerProvider.logLevels = {
            /*'a.b.c': logEnhancerProvider.LEVEL.TRACE, // trace + debug + info + warn + error
            'a.b.d': logEnhancerProvider.LEVEL.ERROR, // error
            'a.b': logEnhancerProvider.LEVEL.DEBUG, // debug + info + warn + error
            'a': logEnhancerProvider.LEVEL.WARN, // warn + error
            '*': logEnhancerProvider.LEVEL.WARN // warn + error*/
            //'core': logEnhancerProvider.LEVEL.OFF
        };

        MenuCfgServiceProvider.addMenuItems([
            {link: '#', label: 'mnu 1', order: 1},
            {link: '#', label: 'mnu 2', order: 2},
            {link: '#', label: 'mnu 3', order: 3}
        ]);
    }

    runFn.$inject = ['$log'];
    function runFn($log) {
        $log.getInstance(NAME).info('is running...');
    }
});