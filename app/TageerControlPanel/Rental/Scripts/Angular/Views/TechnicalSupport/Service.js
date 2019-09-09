/// <reference path="../../Shared/Module.js" />
myApp.service("serviceTechnicalSupport", ["$http", function (h) {
    var controller = "/TechnicalSupport/",
        functions = {

            //Get TechnicalSupport
            getTechnicalSupport(filter) {
                return h({
                    method: 'Get',
                    url: `${controller}GetTechnicalSupport?skip=${filter.skip}&take=${filter.take}&isContact=${filter.isContact}&isRead=${filter.isRead}`,
                });
            },
            getTechnicalSupportDetails(technicalSupportId) {
                return h({
                    method: 'Get',
                    url: `${controller}GetTechnicalSupportDetails?technicalSupportId=${technicalSupportId}`,
                });
            },
            

            readTechnicalSupport   (tecId) {
                return h({
                    method: "Get",
                    url: `${controller}readTecSupport?tecId=${tecId}`
                });
            },




        };
    return functions;
}]);