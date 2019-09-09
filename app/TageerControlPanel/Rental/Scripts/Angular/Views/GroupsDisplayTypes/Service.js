myApp.service("serviceGroupsDisplayTypes", ["$http", function (h) {
    var fun = {},
        Controller = "/GroupsDisplayTypes/";

    //Get GroupsDisplayTypes
    fun.GetGroupsDisplayTypes = function () {
        return h({
            method: "Get",
            url: Controller + "GetRentelGroupsItems"
        });
    };


    //Get Groups
    fun.GetGroups = function () {
        return h({
            method: "Get",
            url: Controller + "GetGroups"
        });
    };

    //Get Caegories
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

    //Get Input Types
    fun.GetInputTypes = function () {
        return h({
            method: "Get",
            url: Controller + "GetInputTypes"
        });
    };


    //Save Chenage
    fun.SaveChenage = function (rentalGroupsItems) {
        return h({
            method: "post",
            url: Controller + "SaveChenage",
            data: rentalGroupsItems
        });
    };
    return fun;
}]);