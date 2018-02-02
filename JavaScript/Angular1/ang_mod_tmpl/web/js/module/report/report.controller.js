define(['./_module'], function (module) {
    'use strict';

    var NAME = 'ReportCtrl';
    module.controller(NAME, controllerFn);

    controllerFn.$inject = ['$log'];
    function controllerFn($log) {

        var vm = this;
        var logger = $log.getInstance('module.report.controller');

        vm.init = init;
        vm.testDate1 = 1433894400000;
        vm.testDate2 = 1433808000000;
        vm.disabledDates = [
            1433462400000,1433721600000,1433808000000, /* 5.06, 8.06,  9.06*/
            {end:1433289600000}, /* 3.06 */
            {start:1434931200000, end:1435104000000 }, /* 22.06 - 24.06 */
            {start:1435363200000} /* 27.06 */
        ];

        function init() {
            logger.info('init');
        };
    }
});