/// <reference path="../../Shared/Module.js" />
myApp.service("servicePagesRoles", ["$http", function (h) {
    var controller = "/PagesRoles/",
        functions = {

            //get Menus
            getMenus() {
                return h({
                    method: 'Get',
                    url: `${controller}getMenus`,
                });
            },
            //Get PagesRoles
            getPagesRoles(menuId, userId) {
                return h({
                    method: 'Get',
                    url: `${controller}GetPagesRoles?menuId=${menuId}&userId=${userId}`,
                });
            },

            //Get Users
            getUsers() {
                return h({
                    method: 'Get',
                    url: `${controller}getUsers`,
                });
            },
            //Get Pages Role Types
            getPagesRoleTypes() {
                return h({
                    method: 'Get',
                    url: `${controller}GetPagesRoleTypes`,
                });
            },
            //save Change
            saveChange(data) {
                return h({
                    method: 'Post',
                    url: `${controller}SaveChenage`,
                    data: data
                });
            }



        };
    return functions;
}]);