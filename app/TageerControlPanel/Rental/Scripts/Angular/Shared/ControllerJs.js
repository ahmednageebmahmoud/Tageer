myApp.controller("ctrlLayOut", ["$scope", "$http", "serviceLayOut", function (s, h, service) {

    var pageName = document.location.pathname.replace('/', '');
    s.page = pageName;
    s.Skip = 0;
    s.Take = 10;
    s.TechnicalSupportSkip = 0;
    s.TechnicalSupportTake = 10;
    s.Notifications = [];
    s.TechnicalSupport = [];

    s.FillUserData = function () {
        service.FillUserData().then(function (d) {
            s.UserData = d.data;
            console.log("UserData");
            console.log(s.UserData);
        });
    };

    //Get Menu
    s.GetMenu = function () {

        service.GetMenu().then(function (d) {
                    s.AllMenu = d.data;
        });
    };


    //Get Notifications
    s.getNotifications = function (isCallFroPage) {
        service.getNotifications(s.Skip, s.Take).then(function (d) {
            switch (d.data.RequestType) {
                case RequestType.Success: {
                    if (Array.isArray(d.data.Data)) {
                        s.Notifications = s.Notifications.concat(d.data.Data);
                        s.NotificationCount = s.Notifications[0].NotificationCount;
                        co('Notifications', s.Notifications);
                    }
                }
            }
        });
    };

    s.readTecSupport = tec=> {
        s.tecSupport = tec;
        $("#tecSupportModel").modal();

        service.readTecSupport(tec.Id);
    };

    s.readNotification = notify=> {
        s.notify = notify;
        $("#notifyModel").modal();

        service.readNotification(notify.Id);
    };


    //Get TechnicalSupport
    s.getTechnicalSupport = () => {
        service.getTechnicalSupport(s.TechnicalSupportSkip, s.TechnicalSupportTake).then((d) => {
            switch (d.data.RequestType) {
                case RequestType.Success: {
                    if (Array.isArray(d.data.Data)) {
                        s.TechnicalSupport = s.TechnicalSupport.concat(d.data.Data);
                        s.TechnicalSupportCount = s.TechnicalSupport[0].TechnicalSupportCount;
                        co('TechnicalSupport', s.TechnicalSupport);
                    }
                }
            }
            co("R-getTechnicalSupport", d);
        })
    };


    //Call Function
    s.CallFunctionsShared = function () {
        s.GetMenu();
        s.FillUserData();
        s.getNotifications();
        s.getTechnicalSupport();

    }; s.CallFunctionsShared();


    //Active Menu
    s.activeMenu = function (subMenus) {

        var activeMenu = false;
        subMenus.forEach(function (item) {
            if (item.Url == pageName) {
                activeMenu = true;
                //s.CurrentName = currentName;
                //	s.ParentUrl = parentUrl;
            }
        });
        return activeMenu;
    };
    //active SubMenu
    s.activeSubMenu = (subMenuName) => {
        return pageName == subMenuName;
    };

    //setInterval(() => {
    //    s.getNotifications();
    //    s.getTechnicalSupport();
    //}, 30000);
    //setInterval(() => {

    //	s.GetMenu();
    //}, 180000);

}]);