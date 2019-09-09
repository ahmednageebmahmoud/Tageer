/// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlTechnicalSupport', ['$scope', '$http', '$filter', 'serviceTechnicalSupport', 'serviceView', function (s, h, filter, service, serviceView) {

    //<!--Config-->
    s.Token = Token;
    s.State = State;

    s.technicalSupportFilter = {
        skip: 0,
        take: 10,
        isRead: 'false',
        isContact: 'null'
    };


    s.TechnicalSupport = [];

    //</!--Config-->

    //Get TechnicalSupport
    s.getTechnicalSupport = (isrestart) => {
        if (isrestart) {
            s.technicalSupportFilter.skip = 0;
            s.TechnicalSupport = [];
        }

        startBlock();
        service.getTechnicalSupport(s.technicalSupportFilter).then((d) => {

            switch (d.data.RequestType) {
                case RequestType.Info: {
                    toastr.info(d.data.Message, Token.Info);

                } break;
                case RequestType.Error: {
                    toastr.error(d.data.Message, Token.Error);
                } break;
                default: {
                    s.TechnicalSupport = s.TechnicalSupport.concat(d.data.Data);
                    s.technicalSupportFilter.skip += s.technicalSupportFilter.take;
                }
            }
            co("R-getTechnicalSupport", d);
            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);

            toastr.error(Token.OrSomeErrorInServer, Token.Error);
            co("Error getTechnicalSupport", error.data);
            stopBlock();
        });
    };

    s.readTechnicalSupport = tec=> {
        service.readTechnicalSupport(tec.Id).then((d) => {

            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        tec.IsRead = true;
                    } break;
                case RequestType.Error:
                    {
                        toastr.error(d.data.Message);
                    } break;

                case RequestType.Info:
                    {
                        toastr.info(d.data.Message);
                    } break;
            }
            co("R-readNotifications", d);
            stopBlock();
        });
    };

    //Restart
    s.rest = () => {

    };
    s.getDataMore = () => {
        s.getTechnicalSupport();
    };
    //Call Functions
    s.callFunctions = () => {
        s.getTechnicalSupport();
    }; s.callFunctions();



}]);