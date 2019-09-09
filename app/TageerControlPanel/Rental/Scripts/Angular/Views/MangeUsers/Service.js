myApp.service("serviceMangeUsers", ["$http", function (h) {
    var fun = {},
        Controller = "/MangeUsers/";

    //Get Users
    fun.GetUsers = function () {
        return h({
            method: "Get",
            url: Controller + "GetUsers"
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