define(['./_module'], function (module) {
    'use strict';

    module.directive('leftMenu', directiveFn);

    directiveFn.$inject = ['$log'];
    function directiveFn($log) {

        var logger = $log.getInstance('leftMenu');

        return {
            restrict: 'E',
            scope: {},
            replace: true,
            templateUrl: 'html/core/component/menu/menu-left.directive.html',
            controller: controllerFn,
            controllerAs: 'menuLeftVm'
        }

        controllerFn.$inject = ['$scope', '$element', 'MenuCfgService'];
        function controllerFn($scope, $element, MenuCfgService) {

            var vm = this;

            vm.init = init;
            vm.mnuItems = [];

            function init() {
                vm.mnuItems = MenuCfgService.getMenuItems();
            };
        }
    }
});