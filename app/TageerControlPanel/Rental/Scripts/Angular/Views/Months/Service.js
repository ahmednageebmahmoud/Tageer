myApp.service("serviceMonth", ["$http", function (h) {
    var fun = {},
        Controller = "/Months/";

    //Get Months
    fun.GetMonths = function (dateTypeId) {
        return h({
            method: "Get",
            url: Controller + "GetMonths?dateTypeId=" + dateTypeId
        });
    };
 
    //Create
    fun.Create = function (month) {
        return h({
            method: "Post",
            url: Controller + "Create",
            data: { month: month }
        });
    };
    //Edit
    fun.Edit = function (month) {
        return h({
            method: "post",
            url: Controller + "Edit",
            data: { month: month }
        });
    };
    //Delete
    fun.Delete = function (monthId) {
        return h({
            method: "post",
            url: Controller + "Delete?monthId=" + monthId,
            
        });
    };

    //Save Chenage
    fun.SaveChenage = function (months) {
        return h({
            method: "post",
            url: Controller + "SaveChenage",
            data: months
        });
    };

    return fun;
}]);