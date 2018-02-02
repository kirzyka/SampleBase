var domReadyrPath = './js/_lib/domReady';
var angularPath = './js/_lib/angular';
var angularRoutePath = './js/_lib/angular-route';
var angularLoggerPath = './js/_lib/angular-logger';
var angularAnimatePath = './js/_lib/angular-animate';

require.config({
    /*baseUrl: '/web-app',*/
    baseUrl: './',
    paths: {
        'domReady': domReadyrPath,
        'angular': angularPath,
        'angular-route': angularRoutePath,
        'angular-logger': angularLoggerPath,
        'ngAnimate':angularAnimatePath
    },

    shim: {
        'angular': {
            exports: 'angular'
        },
        'angular-route': {
            exports: 'ngRoute',
            deps: ['angular']
        },
        'angular-grid':{
            deps: ['angular'],
            exports: 'angularGrid'
        },
        'angular-logger': {
            exports: 'ngLogger',
            deps: ['angular']
        },
        'ngAnimate':{
            exports:'ngAnimate',
            deps:['angular']
        }
    },

    // запустить приложение
    deps: ['./js/core/bootstrap']
});















