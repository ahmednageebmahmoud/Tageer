myApp.service("serviceDate", ["$http", function (h) {
    var fun = {},
        Controller = "/Date/";

    //Get Dates
    fun.GetDates = function () {
        return h({
            method: "Get",
            url: Controller + "GetDates"
        });
    };

    

    //Save Chenage
    fun.SaveChenage = function (dates) {
        return h({
            method: "post",
            url: Controller + "SaveChenage",
            data: dates
        });
    };
    return fun;
}]);