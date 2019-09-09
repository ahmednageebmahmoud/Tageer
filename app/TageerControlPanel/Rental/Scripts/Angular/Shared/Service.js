myApp.service("serviceLayOut", ["$http", function (h) {
    var controller = "/Service/",
   functions = {

   

       //Get TechnicalSupport
       getTechnicalSupport(skip, take) {
           return h({
               method: 'Get',
               url: `${controller}GetTechnicalSupport?skip=${skip}&take=${take}`,
           });
       },
       //Gat User Data
       FillUserData   () {
           return h({
               method: "Get",
               url: controller + "FillUserData"
           });
       },
       //Get Menu
       GetMenu   () {
           return h({
               method: "Get",
               url: controller + "GetControlPanelMenu"
           });
       },

       //GetNotifications
       getNotifications   (skip, take) {
           return h({
               method: "Get",
               url: `${controller}GetNotifications?skip=${skip}&take=${take}`
           });
       },
       readNotification   (notifyId) {
           return h({
               method: "Get",
               url: `${controller}readNotification?notifyId=${notifyId}`
           });
       },

       readTecSupport   (tecId) {
           return h({
               method: "Get",
               url: `${controller}readTecSupport?tecId=${tecId}`
           });
       },
   };

return functions;
  
}]);

