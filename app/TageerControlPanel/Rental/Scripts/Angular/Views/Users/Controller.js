/// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlUsers', ['$scope', '$http', '$filter', 'serviceUsers', 'serviceView', function (s, h, filter, service, serviceView) {

    //<!--Config-->
    s.Token = Token;
    s.usersFilter = {
        skip: 0,
        take: 30,
        accountTypeId: "3",
        isBlock: "null",
        isAgent: "null",
        countryId: "null",
        createDateFrom: null,
        createDateTo: null
    };
    s.users = [];

    //</!--Config-->

    //Get Users
    s.getUsers = reset => {
        if (reset) {
            s.users = [];
            s.usersFilter.skip = 0;
        }
        debugger;
        s.usersFilter.createDateFrom = $('input[name="createDateFrom"]').val();
        s.usersFilter.createDateTo = $('input[name="createDateTo"]').val();
        startBlock();
        service.getUsers(s.usersFilter).then((d) => {
            debugger;
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        s.users = s.users.concat(d.data.Data);
                        s.usersFilter.skip += s.usersFilter.take;
                        s.filter();
                    } break;
                case RequestType.Error:
                    {
                        toastr.error(d.data.Message);
                    } break;

                case RequestType.Info:
                    {
                        toastr.info (d.data.Message);
                    } break;
            }
            co("R-getUsers", d);
            stopBlock();
        }).catch((error) => {
            toastr.error(Token.someErrorHasBeen, Token.Error); co("Error getUsers", error.data);
            stopBlock();
        });
    };

    s.getCountries = () => {
        startBlock();
        service.getCountries().then((d) => {
            s.countries = d.data;
            co("R-getCountries", d);
            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);
            toastr.error(Token.OrSomeErrorInServer, Token.Error); co("Error Login", error.data);
            stopBlock();
        });
    };

    //Delete
    s.delete = (userId, index) => {
        var conf = confirm(Token.AreYouSureDelete);
        if (conf) {
            startBlock();
            service.deleteUser(userId).then(d=> {
                stopBlock();
                switch (d.data.RequestType) {
                    case RequestType.Success:
                        {
                            toastr.success(d.data.Message);
                            s.users.splice(s.users.findIndex(c=> c.Id == userId), 1);
                            s.fop();
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
            }).catch(c=> {
                stopBlock();
                toastr.error(Token.someErrorHasBeen);
            });
        }
    };



    s.getDataMore = () => {
        s.getUsers();
    };

    s.getUsers();
    s.getCountries();
}]);