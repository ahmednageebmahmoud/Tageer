/// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlLogin', ['$scope', '$http', 'serviceLogin', function (s,h,service) {

    //<!--Config-->
    s.Year = new Date().getFullYear();
    //</!--Config-->

    //Login
    s.login = () => {
        s.rest();
        service.login(s.userDatalogin, getQueryStringValue("ReturnUrl")).then(d=> {
            co("R-Login", d);
            debugger;
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                         window.location.href = d.data.ReturnUrl;
                    }
                    break;
                case RequestType.Error:
                    {
                        toastr.error(d.data.Message, Token.Error);

                        s.showAlertMessage = true;
                        s.AlertMessage = d.data.Message;
                    }
                    break;
                case 3:
                    break;
            }
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
        s.showAlertMessage = false;
        s.AlertMessage = null;
    };




}]);