myApp.service("serviceRolePrivileges", ["$http", function (h) {
    var fun = {},
        Controller = "/PrivilegeRoles/";

    //Get RolePrivileges
    fun.GetPrivilegeRoles = function () {
        return h({
            method: "Get",
            url: Controller + "GetPrivilegeRoles"
        });
    };

    //Get PrivilegeType
    fun.GetPrivilegeType = function () {
        return h({
            method: "Get",
            url: Controller + "GetPrivilegeType"
        });
    };
    //Get Privileges
    fun.GetPrivileges = function () {
        return h({
            method: "Get",
            url: Controller + "GetPrivileges"
        });
    };


    //Save Chenage
    fun.SaveChenage = function (privileges) {
        debugger;
        return h({
            method: "post",
            url: Controller + "SaveChenage",
            data:privileges
        });
    };
    //Create
    fun.Create = function (privilege) {
        debugger;
        return h({
            method: "post",
            url: Controller + "Create",
            data: privilege
        });
    };
    return fun;
}]);