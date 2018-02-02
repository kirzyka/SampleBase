define(['./_module'], function (module) {
    'use strict';

    module.controller('UserCtrl', controllerFn);

    controllerFn.$inject = ['$scope', '$routeParams', '$log'];
    function controllerFn($scope, $routeParams, $log) {

        var vm = this;
        var logger = $log.getInstance('module.user.controller');

        vm.init =  init;
        vm.userId = 0;

        function init() {
            logger.info('init');
            vm.userId = $routeParams.id;
        };
    }
});