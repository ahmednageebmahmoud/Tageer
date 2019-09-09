myApp.service("serviceDateType", ["$http", function (h) {
    var fun = {},
        Controller = "/DateType/";

    //Get Date Type
    fun.GetDateType = function () {
        return h({
            method: "Get",
            url: Controller + "GetDateType"
        });
    };
 
    //Save Chenage
    fun.SaveChenage = function (dateType) {
        return h({
            method: "post",
            url: Controller + "SaveChenage",
            data: dateType
        });
    };

    return fun;
}]);