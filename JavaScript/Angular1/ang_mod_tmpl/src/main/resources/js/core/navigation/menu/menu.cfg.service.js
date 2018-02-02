define(['angular','./_module'], function (ng, module) {
    'use strict';

    module.provider('MenuCfgService', providerFn);

    function providerFn() {

        var menuItemList = [{link:'#', label:'default', order: 0}];

        this.addMenuItems = addMenuItems;
        this.$get = MenuService;

        function addMenuItems(value) {
            menuItemList = menuItemList.concat(value);
        }

        function MenuService() {

            var service = {};

            service.getMenuItems = getMenuItems;

            return service;

            function getMenuItems() {
                return menuItemList.sort(function(a, b) {
                    if(ng.isUndefined(a['order']) && ng.isUndefined(b['order']))
                        return a['label'] > b['label'];
                    if(ng.isUndefined(a['order'])) return 1;
                    if(ng.isUndefined(b['order'])) return -1;
                    return a['order'] - b['order'];
                });
            }
        }
    }

});