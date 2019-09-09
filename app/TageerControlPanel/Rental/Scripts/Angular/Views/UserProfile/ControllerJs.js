myApp.controller("ctrlUserProfile", ["$scope", "$http", "serviceUserProfile", function (s, h, service) {
    //Config
    s.page = 1;
    s.State = State;

    //Get countries
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

    //Get User Data For Update
    s.getUserDataForUpdate = function () {
        if (s.User !== undefined)
            return;
        startBlock();
        service.getUserDataForUpdate().then(function (d) {
            stopBlock();
            s.User = d.data;
            co("User", s.User);
            s.imageeReview = s.User.ImageUrl;
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

    // SaveChange
    s.saveChange = function (User) {
        if (User.NewPassword && User.NewPassword !== User.ConfirmPassword) {
            toastr.warning(Token.ErrorConfirmPassword, Token.WarningTitle);
            return;
        }
        s.User.BirthDate = $('#BirthDate').val()

        startBlock();
        service.saveChange(User, s.myImage).then(function (d) {
            stopBlock();
            switch (d.data.RequestType) {
                case RequestType.Success: {
                    toastr.success(d.data.Message, Token.Success);
                    s.getUserDataForUpdate();
                    hideDeleteConfirm();
                }
                    break;
                case RequestType.Error: {
                    toastr.error(d.data.Message, Token.Error);
                    co("ErrorSave", d.data)

                }
                    break;
            }
        }).catch((error) => {
            stopBlock();
            toastr.error(Token.Error, Token.Error);
        });
    };

    //Call Function
    s.CallFunctions = function () {
        s.getCountries();
        s.getLanguages();
        s.getUserDataForUpdate();
    }; s.CallFunctions();


}]);