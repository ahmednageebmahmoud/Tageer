myApp.service("serviceMarks", ["$http", function (h) {
    var fun = {},
        Controller = "/Marks/";

    //Get  Marks
    fun.getMarks = function () {
        return h({
            method: "Get",
            url: Controller + "GetMarks"
        });
    };
 
    //Save Change
    fun.saveChange = function (Marks) {
        return h({
            method: "post",
            url: Controller + "SaveChange",
            data: Marks
        });
    };

    return fun;
}]);