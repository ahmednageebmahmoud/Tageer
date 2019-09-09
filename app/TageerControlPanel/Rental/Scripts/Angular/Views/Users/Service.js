/// <reference path="../../Shared/Module.js" />
myApp.service("serviceUsers", ["$http", function (h) {
    var controller = "/Users/",
        functions = {
             

            //Get Countries
            getCountries() {
                return h({
                    method: 'Get',
                    url: `${controller}getCountries`,
                });
            },



            //Get Languages
            getLanguages  () {
                return h({
                    method: "Get",
                    url: `${controller}GetLanguages`
                });
            },

            //Get Users
            getUsers(filter) {
                return h({
                    method: 'Get',
                    url: `${controller}GetUsers?skip=${filter.skip}&take=${filter.take}&countryId=${filter.countryId}&createDateFrom=${filter.createDateFrom}&createDateTo=${filter.createDateTo}&accountTypeId=${filter.accountTypeId}&isBlocked=${filter.isBlock}&isAgent=${filter.isAgent}`,
                });
            },

            //Get User For Update
            getUserForUpdate(userId) {
                return h({
                    method: 'Get',
                    url: `${controller}GetUserForUpdate?userId=${userId}`,
                });
            },
            //Get User For Update
            getRoles() {
                return h({
                    method: 'Get',
                    url: `${controller}GetRoles`,
                });
            },
            
            deleteUser(userId) {
                return h({
            method: 'Get',
            url: `${controller}Delete?userId=${userId}`,
    });
    },

            //save Change
            saveChange(user, image, isUpdate) {
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
                "Street",
                ], index = 0;


                formData.append(`userRoles[0].FkRole_Id`, user.FkRole_Id);
             
                keys.forEach(function (key) {
                    if (user[key] != undefined) {
                        formData.append(key, user[key]);
                    }
                }); 
                formData.append(`isUpdate`, isUpdate);
                return h({
                    method: "post",
                    url: `${controller}SaveChanage`,
                    data: formData,
                    headers: {
                        'Content-Type': undefined
                    },
                });
            }



        };
    return functions;
}]);