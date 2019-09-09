myApp.service("serviceRentalIndividualFields", ["$http", function (h) {
    var fun = {},
        Controller = "/RentalIndividualFields/";

    //Get RentalIndividualFieldsByCategoryId
    fun.getRentalIndividualFieldsByCategoryId = function (categoryId) {
        return h({
            method: "Get",
            url: Controller + "GetRentalIndividualFieldsByCategoryId?categoryId=" + categoryId
        });
    };

 
    //Get  Categories
    fun.getCategories = function () {
        return h({
            method: "Get",
            url: Controller + "GetCategories"
        });
    };


    //Get RentalIndividualFieldsBySubCategoryId
    fun.getRentalIndividualFieldsBySubCategoryId = function (subCategoryId) {
        return h({
            method: "Get",
            url: Controller + "GetRentalIndividualFieldsBySubCategoryId?subCategoryId=" + subCategoryId
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