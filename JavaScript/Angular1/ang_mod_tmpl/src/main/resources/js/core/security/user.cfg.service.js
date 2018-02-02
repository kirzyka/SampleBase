define(['./_module'], function (module) {
    'use strict';

    module.provider('UserCfgService', providerFn);

    function providerFn() {

        var user = null;

        this.$get = UserService;

        UserService.$inject = ['$q', '$log', 'MessageService', 'MessageFactory', 'MSG_CONST'];
        function UserService($q, $log, MessageService, MessageFactory, MSG_CONST) {

            var service = {};

            service.logInByEmail = logInByEmail;
            service.getUser = getUser;

            return service;

            function logInByEmail(email) {
                var deferred = $q.defer();

                if (email) {
                    user = {user: 'User1', email: email};
                    MessageService.sendMsg(MessageFactory(MSG_CONST.USER_LOGIN_SUCCESS, user));
                    deferred.resolve();
                } else {
                    user = null;
                    deferred.reject('Email is required!')
                }
                return deferred.promise;
            }
            function logInByUsernameAndPassword() {

            }
            function getUser() {
                return user;
            }
        }
    }
});