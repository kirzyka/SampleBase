define(['./_module'], function (module) {
    'use strict';

    module.directive('login', directiveFn);

    directiveFn.$inject = ['$log'];
    function directiveFn($log) {

        var logger = $log.getInstance('login');

        return {
            restrict: 'E',
            scope: {},
            templateUrl: 'html/core/security/login.directive.html',
            controller: controllerFn,
            controllerAs: 'loginVm'
        }

        controllerFn.$inject = ['$timeout', 'UserCfgService'];
        function controllerFn($timeout, UserCfgService) {

            var vm = this;

            vm.styleClass = 'log-in';

            vm.users = [];
            vm.user = {email: ''};

            vm.init = init;
            vm.keypress = keypress;
            vm.submit = submit;

            function init() {
            };
            function keypress(event) {
                logger.log('KeyPress', event)
                if (event.which === 13) {
                    submit();
                }
            };
            function submit() {
                if (!vm.user.email) {
                    vm.styleClass = 'log-error';
                    $timeout(function () {
                        vm.styleClass = 'log-in';
                    }, 500)
                    return;
                }
                UserCfgService.logInByEmail(vm.user.email)
                    .then(function (result) {
                        vm.styleClass = 'log-out';
                    }, function (error) {
                        logger.error(error);
                    }
                )
            };
        }
    }
});