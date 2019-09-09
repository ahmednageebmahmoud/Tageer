myApp.service("serviceCategories", ["$http", function (h) {
    var fun = {},
        Controller = "/Categories/";

    //Get  Categories
    fun.GetCategories = function () {
        return h({
            method: "Get",
            url: Controller + "GetCategories"
        });
    };
 
    //Save Chenage
    fun.SaveChenage = function (rentalCategories) {
        return h({
            method: "post",
            url: Controller + "SaveChenage",
            data: rentalCategories,
        });
    };

    return fun;
}]);