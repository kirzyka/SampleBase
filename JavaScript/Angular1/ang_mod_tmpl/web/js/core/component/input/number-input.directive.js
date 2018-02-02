define(['./_module'], function (module) {
    'use strict';

    module.directive('numberInput', function() {

        var SCALE_DEFAULT = 9;
        var PRECISION_DEFAULT = 2;

        return {
            restrict: 'A',
            require: 'ngModel',
            link: function($scope, $element, $attrs, $ctrl) {

                var oldValue;

                var onlyInt = $attrs.hasOwnProperty('int') ? true : false;
                var scale = $attrs['scale'] ? $attrs['scale'] : SCALE_DEFAULT;
                var precision  = $attrs['precision '] ? $attrs['precision '] : PRECISION_DEFAULT;
                var allowNegative = $attrs.hasOwnProperty('negative') ? true : false;

                $ctrl.$parsers.push(function (inputValue) {

                    if (inputValue == undefined || inputValue == NaN || inputValue == null ) return ''
                    var pattern;
                    if(onlyInt) {
                        if(allowNegative) {
                            pattern = /^\-?\d*$/;
                        } else {
                            pattern = /^\d*$/;
                        }
                    } else {
                        if(allowNegative) {
                            pattern = new RegExp('^\\-?[0-9]{0,' + scale + '}(\\.[0-9]{0,' + precision  + '})?$');
                        } else {
                            pattern = new RegExp('^[0-9]{0,' + scale + '}(\\.[0-9]{0,' + precision  + '})?$');
                        }
                    }

                    if(oldValue == undefined) {
                        oldValue = $ctrl.$viewValue;
                    }

                    if(pattern.test(inputValue)) {
                        oldValue = inputValue;
                    } else {
                        if(oldValue != inputValue) {
                            $ctrl.$setViewValue(oldValue);
                            $ctrl.$render();
                        }
                    }
                });
            }
        }
    });
});