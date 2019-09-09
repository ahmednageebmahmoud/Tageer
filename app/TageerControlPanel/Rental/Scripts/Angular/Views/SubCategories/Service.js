myApp.service("serviceSubCategories", ["$http", function (h) {
    var fun = {},
        Controller = "/SubCategories/";

    //Get Provinces
    fun.GetSubCategories = function (categoryId) {
        return h({
            method: "Get",
            url: Controller + "GetSubCategories?categoryId=" + categoryId
        });
    };

    //Get  Categories
    fun.GetCategories = function () {
        return h({
            method: "Get",
            url: Controller + "GetCategories"
        });
    };

    //Save Chenage
    fun.SaveChenage = function (rentalSubCategories) {
 

        return h({
            method: "post",
            url: Controller + "SaveChenage",
            data: rentalSubCategories,
        });
    };

    return fun;
}]);