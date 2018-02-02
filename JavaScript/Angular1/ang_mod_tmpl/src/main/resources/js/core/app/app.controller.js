define(['../_module'], function (module) {
    'use strict';

    module.controller('AppCtrl', controllerFn);

    controllerFn.$inject = ['$log', 'MessageService', 'MSG_CONST'];
    function controllerFn($log, MessageService, MSG_CONST) {

        var vm = this;
        var logger = $log.getInstance('core.app.controller');

        vm.init = init;
        vm.mnuItems = [];
        vm.user = null;

        function init() {
            logger.info('init');
            MessageService.registerListener(MSG_CONST.USER_LOGIN_SUCCESS, userListener);
        };

        function userListener(msg) {
            vm.user = msg.getData();
            MessageService.unregisterListener(MSG_CONST.USER_LOGIN_SUCCESS, userListener);
        }
    }
});

