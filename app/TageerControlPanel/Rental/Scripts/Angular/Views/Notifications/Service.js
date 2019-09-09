/// <reference path="../../Shared/Module.js" />
myApp.service("serviceNotifications", ["$http", function (h) {
    var controller = "/Notifications/",
        functions = {

   

            //Get Notifications
            getNotifications(filter) {
                return h({
                    method: 'Get',
                    url: `${controller}GetNotifications?skip=${filter.skip}&take=${filter.take}&isRead=${filter.isRead}`,
                });
            },

            readNotification(notiId) {
                return h({
                    method: 'Post',
                    url: `${controller}ReadNotification?notifyId=${notiId}`,
                });
            },
        };
    return functions;
}]);