// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlUserCreateAndUpdate', ['$scope', '$http','$filter', 'serviceUsers', 'serviceView', function (s, h, filter,service, serviceView) {

    //<!--Config-->
    s.Token = Token;
    s.State = State;
    s.coutnUserTake = 10;
    s.coutnUserSkip = 0;
    s.userId = getQueryStringValue("userId");
    s.IsUpdate = s.userId != null && s.userId != undefined && s.userId != "";
    
    //</!--Config-->

    //Get Countries
    s.getCountries = () => {
        startBlock();
        service.getCountries().then((d) => {
            s.Countries = d.data;
            co("R-getCountries", d);
            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);
            toastr.error(Token.OrSomeErrorInServer, Token.Error); co("Error Login", error.data);
            stopBlock();
        });
    };


  
   
    //Get User For Update 
    s.getUserForUpdate = () => {
        if (!s.IsUpdate) return;

        startBlock();
        service.getUserForUpdate(s.userId).then((d) => {
            switch (d.data.RequestType) {
                case RequestType.Error:
                    {
                        toastr.error(d.data.Message, Token.error)
                    }
                default:
                    {
                        s.User = d.data;
                        s.imageeReview = s.User.ImageUrl;
                    }
            }

            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);
            toastr.error(Token.OrSomeErrorInServer, Token.Error);
            co("Error getUserForUpdate", error.data);
            stopBlock();
        });
    };

    //Get Languages 
    s.getLanguages = function () {
        startBlock();
        service.getLanguages().then(function (d) {
            stopBlock();
            s.Languages = d.data;
            co("Languages", s.Languages);
        });
    };

    

    //Get Roles 
    s.getRoles = function () {
        startBlock();
        service.getRoles().then(function (d) {
            stopBlock();
            s.Roles = d.data;
            co("Roles", s.Roles);
        });
    };


    //Save Change
    s.saveChange = () => {
        if (s.User.NewPassword !== s.User.ConfirmPassword) {
            toastr.warning(Token.ErrorConfirmPassword, Token.Warning);
            return;
        }

        
        startBlock();
        service.saveChange(s.User,s.myImage,s.IsUpdate).then(d=> {
            co("R-SaveChange", d);
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        toastr.success(d.data.Message, Token.Success);
                        if (s.IsUpdate)
                            s.getUserForUpdate();
                        else {
                            s.IsUpdate = true;
                            s.User = d.data.User;
                            s.userId = s.User.Id;
                        }
                    }
                    break;
                case RequestType.Error:
                    {
                        toastr.error(d.data.Message, Token.Error);
                        co("ErrorSave",d.data)
                    }
                    break;
                case 3:
                    {
                        toastr.warning(d.data.Message, Token.warning);

                    }
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
        s.getUserForUpdate();
        s.getCountries();
        s.getLanguages();
        s.getRoles();
    }; s.callFunctions();


    $(window).on('beforeunload', function () {
        var dataForSave = filter('filterIsEquals')(s.Users, 'State', State.Create, State.Delete, State.Update);
        dataForSave = filter('filterIsNotConstantWithDelete')(dataForSave, 'Id', "xNew");
        if (dataForSave.length >0)
            return "";
    });
}]);