define(['angular', './_module'], function (ng, module) {
    'use strict';

    module.directive('popup', directiveFn);

    function directiveFn() {

        return {
            restrict: 'E',
            transclude: true,
            scope: {
                isModal: '@?'
            },
            templateUrl: 'html/core/component/popup/popup.directive.html',
            compile: compileFn,
            controller: controllerFn
        }

        function compileFn(element, attrs) {
            if (!attrs.isModal) {
                attrs.isModal = false;
            } else {
                attrs.isModal = attrs.isModal == 'true' ? true : false;
            }
        }

        controllerFn.$inject = ['$scope', '$http'];
        function controllerFn($scope, $http) {

        }
    }
});