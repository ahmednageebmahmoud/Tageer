myApp.service("serviceUserLogin", ["$http", function (h) {
    var fun = {},
        Controller = "/UserLogin/";

    //Get UserLogins
    fun.GetUserLogins = function (userSerial) {
        return h({
            method: "Get",
            url: Controller + "GetUserLogins?userSerial=" + userSerial
        });
    };

    //Save Chenage
    fun.SaveChenage = function (jobs) {
        return h({
            method: "post",
            url: Controller + "SaveChenage",
            data:jobs
        });
    };
    return fun;
}]);