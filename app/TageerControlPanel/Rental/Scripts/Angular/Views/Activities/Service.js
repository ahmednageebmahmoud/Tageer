/// <reference path="../../Shared/Module.js" />
myApp.service("serviceActivities", ["$http", function (h) {
    var controller = "/Activities/",
        functions = {
            //Get Activities
            getActivities() {
                return h({
                    method: 'Get',
                    url: `${controller}GetActivities`,
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