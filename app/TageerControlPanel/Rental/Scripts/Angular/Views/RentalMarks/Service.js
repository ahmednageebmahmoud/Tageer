myApp.service("serviceRentalMarks", ["$http", function (h) {
    var fun = {},
        Controller = "/RentalMarks/";

    //Get  RentelMarksByCategory
    fun.GetRentelMarksByCategory = function (categoryId) {
        return h({
            method: "Get",
            url: Controller + "GetRentelMarksByCategory?categoryId=" + categoryId
        });
    };

 


    //Get Categories
    fun.GetCategories = function () {
        return h({
            method: "Get",
            url: Controller + "GetCategories"
        });
    };
    //Get Sub Categories
    fun.GetSubCategories = function () {
        return h({
            method: "Get",
            url: Controller + "GetSubCategories"
        });
    };

    //Get RentalMarksBySubCategory
    fun.GetRentalMarksBySubCategory = function (subCategoryId) {
        return h({
            method: "Get",
            url: Controller + "GetRentalMarksBySubCategory?subCategoryId=" + subCategoryId
        });
    };

    

    //Save Chenage
    fun.SaveChange = function (rentalMarks) {
        return h({
            method: "post",
            url: Controller + "SaveChange",
            data: rentalMarks
        });
    };

    return fun;
}]);