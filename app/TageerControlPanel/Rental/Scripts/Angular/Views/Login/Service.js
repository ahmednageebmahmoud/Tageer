﻿/// <reference path="../../Shared/Module.js" />
myApp.service("serviceLogin", ["$http", function (h) {
    var controller = "/Login/", functions = {

        //Login
        login(userData, returnUrl) {
            return h({
                method: 'post',
                url: `${controller}Login?returnUrl=${returnUrl}`,
                data: userData
            });
        },




    };
    return functions;
}]);