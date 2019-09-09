myApp.service("serviceRentalDirectFields", ["$http", function (h) {
    var fun = {},
        Controller = "/RentalDirectFields/";

    //Get RentalDirectFieldsByCategoryId
    fun.getRentalDirectFieldsByCategoryId = function (categoryId) {
        return h({
            method: "Get",
            url: Controller + "GetRentalDirectFieldsByCategoryId?categoryId=" + categoryId
        });
    };

 
    //Get  Categories
    fun.getCategories = function () {
        return h({
            method: "Get",
            url: Controller + "GetCategories"
        });
    };


    //Get RentalDirectFieldsBySubCategoryId
    fun.getRentalDirectFieldsBySubCategoryId = function (subCategoryId) {
        return h({
            method: "Get",
            url: Controller + "GetRentalDirectFieldsBySubCategoryId?subCategoryId=" + subCategoryId
        });
    };

    //Get Categories
    fun.getSubCategories = function () {
        return h({
            method: "Get",
            url: Controller + "getSubCategories"
        });
    };

    //Save Chenage
    fun.SaveChenage = function (rentalInputs) {
        return h({
            method: "post",
            url: Controller + "SaveChenage",
            data: rentalInputs
        });
    };

    return fun;
}]);