define(['../_module'], function (module) {
    'use strict';

    module.controller('DefaultPageCtrl', DefaultPageController);

    DefaultPageController.$inject = ['$scope', '$http', '$log'];

    function DefaultPageController($scope, $http, $log) {

        var vm = this;
        var logger = $log.getInstance('core.page.default.controller');

        vm.init = function() {
            logger.info('init');
        };
    }
});