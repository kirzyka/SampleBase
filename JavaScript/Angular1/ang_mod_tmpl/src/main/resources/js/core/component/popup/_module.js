define([
    'angular'
], function (ng) {
    'use strict';

    var NAME = 'core.component.popup';
    return ng.module(NAME, [])
        .run(runFn);

    runFn.$inject = ['$log'];
    function runFn($log) {
        $log.getInstance(NAME).info('is running...');
    }
});