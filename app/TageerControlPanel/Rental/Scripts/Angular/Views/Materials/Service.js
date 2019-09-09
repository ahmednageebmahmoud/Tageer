myApp.service("serviceMaterials", ["$http", function (h) {
    var fun = {},
        Controller = "/Materials/";

    //Get  Materials
    fun.getMaterials = function () {
        return h({
            method: "Get",
            url: Controller + "GetMaterials"
        });
    };
 
    //Save Change
    fun.saveChange = function (Materials) {
        return h({
            method: "post",
            url: Controller + "SaveChange",
            data: Materials
        });
    };

    return fun;
}]);