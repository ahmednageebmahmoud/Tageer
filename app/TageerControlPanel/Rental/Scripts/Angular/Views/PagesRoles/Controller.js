/// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlPagesRoles', ['$scope', '$http', '$filter', 'servicePagesRoles', 'serviceView', function (s, h, filter, service, serviceView) {

    //<!--Config-->
    s.Token = Token;
    s.State = State;
    s.boolTrue = Token.active;
    s.boolFalse = Token.disActive;
    s.PagesRoleType = PagesRoleTypes;

    //</!--Config-->

    //Get Menus
    s.getMenus = () => {
        startBlock();
        service.getMenus().then((d) => {
            s.menus = d.data;
            co("R-getMenus", d);
            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);
            toastr.error(Token.OrSomeErrorInServer, Token.Error);
            co("Error Menus", error.data);
            stopBlock();
        });
    };

    //Get PagesRoles
    s.getPagesRoles = (menuId, userId) => {
        startBlock();
        service.getPagesRoles(menuId, userId).then((d) => {
            s.PagesRoles = d.data;
            co("R-getPagesRoles", d);
            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);
            toastr.error(Token.OrSomeErrorInServer, Token.Error);
            co("Error Login", error.data);
            stopBlock();
        });
    };

    //Get Users
    s.getUsers = () => {
        startBlock();
        service.getUsers().then((d) => {
            s.users = d.data;
            co("R-getUsers", d);
            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);
            toastr.error(Token.OrSomeErrorInServer, Token.Error);
            co("Error getUsers", error.data);
            stopBlock();
        });
    };



    //Save Change
    s.saveChange = () => {



        //Check Data For Save
        var dataForSave = s.PagesRoles.filter(c=>  c.PagesRole != null &&( c.PagesRole.IsCreate || c.PagesRole.IsUpdate || c.PagesRole.IsDelete || c.PagesRole.IsDisplay)).map(c=> {
            return {
                FkUser_Id: s.userId,
                FkPage_Id: c.PageId,
                IsCreate: c.PagesRole.IsCreate,
                IsUpdate: c.PagesRole.IsUpdate,
                IsDelete: c.PagesRole.IsDelete,
                IsDisplay: c.PagesRole.IsDisplay
            }
        });
        if (dataForSave.length == 0) {
            showAlertNotDataToSave();
            return;
        }

        startBlock();
        service.saveChange(dataForSave).then(d=> {
            co("R-SaveChange", d);
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        toastr.success(d.data.Message, Token.Success);
                    }
                    break;
                case RequestType.Error:
                    {
                        toastr.error(d.data.Message, Token.Error);
                    }
                    break;
                case 3:
                    break;
            }
            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);
            toastr.error(Token.OrSomeErrorInServer, Token.Error);
            co("Error Login", error.data);
            stopBlock();
        });

    };

    //Restart
    s.rest = () => {

    };

    //Call Functions
    s.callFunctions = () => {
        s.getMenus();
        s.getUsers();
    }; s.callFunctions();


    $(window).on('beforeunload', function () {
        var dataForSave = filter('filterIsEquals')(s.PagesRoles, 'State', State.Create, State.Delete, State.Update);
        dataForSave = filter('filterIsNotConstantWithDelete')(dataForSave, 'Id', "xNew");
        if (dataForSave.length > 0)
            return "";
    });
}]);