myApp.service("serviceUserProfile", ["$http", function (h) {
    var fun = {},
        Controller = "/UserProfile/";

    //getUserData
    fun.getUserData = function () {
        return h({
            method: "Get",
            url: Controller + "GetUserData"
        });
    };
    //Get User Data For Update
    fun.getUserDataForUpdate = function () {
        return h({
            method: "Get",
            url: Controller + "GetUserDataForUpdate"
        });
    };





    //Get Languages
    fun.getLanguages = function () {
        return h({
            method: "Get",
            url: Controller + "GetLanguages"
        });
    };

    //Get Countries
    fun.getCountries = function () {
        return h({
            method: "Get",
            url: Controller + "GetCountries"
        });
    };





    fun.saveChange = function (user, image) {
        var formData = new FormData();
        if (image != undefined)
            formData.append("image", image);

        {

        }
        var keys = [
            "Id",
            "NewPassword",
             "FullName",
        "PhoneNumber",
        "BirthDate",
        "FKCountry_Id",
        "FKGender_Id",
        "UserName",
        "FKLanguage_Id",
        "FkRole_Id",
        "IsBlocked",
        "IsAgent",
        "Email",
        "Street1",
        "Street2",
        "Points"
        ], index = 0;


        formData.append(`userRoles[0].FkRole_Id`, user.FkRole_Id);

        keys.forEach(function (key) {
            if (user[key] != undefined) {
                formData.append(key, user[key]);
            }
        });
        return h({
            method: "post",
            url: `${Controller}SaveChange`,
            data: formData,
            headers: {
                'Content-Type': undefined
            },
        });
    }

    return fun;
}]);