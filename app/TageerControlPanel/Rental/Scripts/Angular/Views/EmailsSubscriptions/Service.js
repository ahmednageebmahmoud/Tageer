/// <reference path="../../Shared/Module.js" />
myApp.service("serviceEmailsSubscriptions", ["$http", function (h) {
    var controller = "/EmailsSubscriptions/",
        functions = {
 
            //Get EmailsSubscriptions
            getEmailsSubscriptions(filter) {
                return h({
                    method: 'Get',
                    url: `${controller}GetEmailsSubscriptions?skip=${filter.skip}&take=${filter.take}&emailSearch=${filter.emailSearch}&to=${filter.createDateTo}&from=${filter.createDateFrom}`,
                });
            },

            //Get User For Update
            getUserForUpdate(userId) {
                return h({
                    method: 'Get',
                    url: `${controller}GetUserForUpdate?userId=${userId}`,
                });
            },
            //Get User For Update
            getRoles() {
                return h({
                    method: 'Get',
                    url: `${controller}GetRoles`,
                });
            },
            
            deleteUser(userId) {
                return h({
            method: 'Get',
            url: `${controller}Delete?userId=${userId}`,
    });
    },

            //save Change
            sendMessage(data) {
                return h({
                    method: "post",
                    url: `${controller}sendMessage`,
                    data: data,
                });
            }



        };
    return functions;
}]);