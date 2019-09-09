myApp.service("serviceRentalGroupsItems", ["$http", function (h) {
    var fun = {},
        Controller = "/RentalGroupsItems/";

    //Get Ads Groups Items By Category
    fun.GetRentalGroupsItemsByCategory = function (categoryId) {
        return h({
            method: "Get",
            url: Controller + "GetRentalGroupsItemsByCategory?categoryId=" + categoryId
        });
    };

    
    //Get Groups
    fun.GetGroups = function () {
        return h({
            method: "Get",
            url: Controller + "GetGroups"
        });
    };

    //Get Categories
    fun.GetCategories = function () {
        return h({
            method: "Get",
            url: Controller + "GetCategories"
        });
    };


    //Get Ads Groups Items By SubCategory
    fun.GetRentalGroupsItemsBySubCategory = function (subCategoryId) {
        return h({
            method: "Get",
            url: Controller + "GetRentalGroupsItemsBySubCategory?subCategoryId=" + subCategoryId
        });
    };

    //Get Sub Categories
    fun.GetSubCategories = function () {
        return h({
            method: "Get",
            url: Controller + "GetSubCategories"
        });
    };

    //Save Chenage
    fun.SaveChenage = function (rentalRentalGroupsItems) {
        return h({
            method: "post",
            url: Controller + "SaveChenage",
            data: rentalRentalGroupsItems
        });
    };

    return fun;
}]);