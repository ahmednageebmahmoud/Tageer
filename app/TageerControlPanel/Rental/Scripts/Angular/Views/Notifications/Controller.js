/// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlNotifications', ['$scope', '$http', '$filter', 'serviceNotifications', 'serviceView', function (s, h, filter, service, serviceView) {

    //<!--Config-->
    s.Token = Token;
    s.notificationsFilter = {
        skip: 0,
        take: 40,
        isRead: 'false',
    };
    s.notifications = [];


    //Get Notifications
    s.getNotifications = reset => {
        if (reset) {
            s.notifications = [];
            s.notificationsFilter.skip = 0;
        }

        startBlock();
        service.getNotifications(s.notificationsFilter).then((d) => {
            debugger;
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        s.notifications = s.notifications.concat(d.data.Data);
                        s.notificationsFilter.skip += s.notificationsFilter.take;
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
            co("R-getNotifications", d);
            stopBlock();
        }).catch((error) => {
            toastr.error(Token.someErrorHasBeen, Token.Error); co("Error getNotifications", error.data);
            stopBlock();
        });
    };

    s.readNotification = noti=> {
        service.readNotification(noti.Id).then((d) => {
        
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        noti.IsRead = true;
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

    s.getDataMore = () => {
        s.getNotifications();
    };
    s.getNotifications()
    $(window).on('beforeunload', function () {
        if (s.RowUpdateBackup || s.country.NameEn || s.country.NameAr)
            return "";
    });
}]);