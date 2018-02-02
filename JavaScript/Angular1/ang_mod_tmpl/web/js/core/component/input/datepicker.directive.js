define(['./_module'], function (module) {
    'use strict';

    module.directive('datepicker', directiveFn);

    directiveFn.$inject = ['$document', 'dateFilter'];
    function directiveFn($document, dateFilter) {
        return {
            restrict: 'E',
            require: 'ngModel',
            scope: {
                disabledDates: '=?',
                enabledDates: '=?'
            },
            templateUrl: 'html/core/component/input/datepicker.directive.html',
            link: linkFn,
            controller: controllerFn,
            controllerAs: 'datepickerVm'

        }

        function linkFn($scope, $element, $attrs, $ctrl) {

            $ctrl.$render = function () {
                if ($ctrl.$viewValue) {
                    $scope.selectedDate = $ctrl.$viewValue;
                }
            };

            $scope.$watch(function () {
                    return angular.toJson([$scope.selectedDate]);
                }, function () {
                    var format = ($attrs.format || 'MM/dd/yyyy').replace(/m/g, 'M');
                    $scope.selectedDateLabel = dateFilter(new Date($scope.selectedDate), format);
                }
            );
        }

        controllerFn.$inject = ['$scope'];
        function controllerFn($scope) {

            var vm = this;

            vm.isCalendarOpen = false;
            vm.calendarPosition = {};
            vm.openCalendar = openCalendar;
            vm.onOverlayClick = onOverlayClick;
            vm.onDateChanged = onDateChanged;

            function openCalendar($event) {
                var targetPos = $event.target.getBoundingClientRect();

                vm.calendarPosition = {
                    'left': (targetPos.left - 200 + 16 + 4) + 'px',
                    'top': (targetPos.top + 16 + 4) + 'px'
                };
                vm.isCalendarOpen = true;

                $document.bind('keydown', onKeyDown);
            }
            function onOverlayClick() {
                closeCalendar();
            }
            function onDateChanged() {
                vm.isCalendarOpen = false;
            }
            function onKeyDown(event) {
                if (event.keyCode == 27) {
                    closeCalendar();
                    $scope.$apply();
                }
            }
            function closeCalendar() {
                vm.isCalendarOpen = false;
                $document.unbind('keydown', onKeyDown);
            }

        }
    };
});