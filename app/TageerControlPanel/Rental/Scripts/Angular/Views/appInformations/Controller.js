/// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlAppsInformations', ['$scope', '$http', '$filter', 'serviceAppsInformations', 'serviceView', function (s, h, filter, service, serviceView) {

    //<!--Config-->
    s.Token = Token;
    s.AppsInformations = [];
    s.AppInformation = AppInformation;
    //</!--Config-->

    //Get AppsInformations
    s.getAppsInformations = () => {
        startBlock();
        service.getAppsInformations().then((d) => {
            s.AppsInformations = d.data.Data;
            co("R-getAppsInformations", d);
            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);
            toastr.error(Token.OrSomeErrorInServer, Token.Error); co("Error getAppsInformations", error.data);
            stopBlock();
        });
    };





    //Save Change
    s.saveChange = () => {
        startBlock();

        s.AppsInformations[9].NewFile = s.imageeReview;
        service.saveChange(s.AppsInformations).then(d=> {
            co("R-SaveChange", d);
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        toastr.success(d.data.Message);
                    }
                    break;
                case RequestType.Error:
                    {
                        toastr.error(d.data.Message);
                    }
                    break;
                case 3:
                    break;
            }
            stopBlock();
        }).catch((error) => {
            toastr.error(Token.OrSomeErrorInServer, Token.Error); co("Error Login", error.data);
            stopBlock();
        });

    };


    //Restart
    s.rest = () => {

    };

    //Call Functions
    s.callFunctions = () => {
        s.getAppsInformations();
    }; s.callFunctions();


    $(window).on('beforeunload', function () {
        var dataForSave = filter('filterIsEquals')(s.AppsInformations, 'State', State.Create, State.Delete, State.Update);
        dataForSave = filter('filterIsNotConstantWithDelete')(dataForSave, 'Id', "xNew");
        if (dataForSave.length > 0)
            return "";
    });
}]);