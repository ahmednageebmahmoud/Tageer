myApp.service("serviceRentalMaterials", ["$http", function (h) {
    var fun = {},
        Controller = "/RentalMaterials/";

    //Get  RentelMaterialsByCategory
    fun.GetRentelMaterialsByCategory = function (categoryId) {
        return h({
            method: "Get",
            url: Controller + "GetRentelMaterialsByCategory?categoryId=" + categoryId
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

    //Get RentalMaterialsBySubCategory
    fun.GetRentalMaterialsBySubCategory = function (subCategoryId) {
        return h({
            method: "Get",
            url: Controller + "GetRentalMaterialsBySubCategory?subCategoryId=" + subCategoryId
        });
    };

    

    //Save Chenage
    fun.SaveChange = function (rentalMaterials) {
        return h({
            method: "post",
            url: Controller + "SaveChange",
            data: rentalMaterials
        });
    };

    return fun;
}]);