define([
    'angular'
], function (ng) {
    'use strict';

    var NAME = 'core.security';
    return ng.module(NAME, ['core.messaging'])
        .run(runFn);

    runFn.$inject = ['$log'];
    function runFn($log) {
        $log.getInstance(NAME).info('is running...');
    }
});