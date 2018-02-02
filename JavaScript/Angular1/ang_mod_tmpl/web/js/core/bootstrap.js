/**
 * bootstraps angular onto the window.document node
 */
define([
    'require',
    'angular',
    'angular-route',
    'angular-logger',
    'ngAnimate',

    './_index'

], function (require, ng) {
    'use strict';


    require(['domReady!'], function (document) {
        ng.bootstrap(document, ['core']);
    });
});