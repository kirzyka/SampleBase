define([
    'angular'
], function (ng) {
    'use strict';

    var NAME = 'core.messaging';
    return ng.module(NAME, [])
        .config(configFn)
        .run(runFn);

    configFn.$inject = [];
    function configFn() {

    }

    runFn.$inject = ['$log'];
    function runFn($log) {
        $log.getInstance(NAME).info('is running...');
    }
});