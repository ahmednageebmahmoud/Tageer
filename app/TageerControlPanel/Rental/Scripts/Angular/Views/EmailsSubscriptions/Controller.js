/// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlEmailsSubscriptions', ['$scope', '$http', '$filter', 'serviceEmailsSubscriptions', 'serviceView', function (s, h, filter, service, serviceView) {

    //<!--Config-->
    s.Token = Token;
    s.emailsSubscriptionsFilter = {
        skip: 0,
        take: 30,
        emailSearch: "",
        createDateFrom: null,
        createDateTo: null
    };
    s.emailsSubscriptions = [];

    //</!--Config-->

    //Get EmailsSubscriptions
    s.getEmailsSubscriptions = reset => {
        if (reset) {
            s.emailsSubscriptions = [];
            s.emailsSubscriptionsFilter.skip = 0;
        }
        s.emailsSubscriptionsFilter.createDateFrom = $('input[name="createDateFrom"]').val();
        s.emailsSubscriptionsFilter.createDateTo = $('input[name="createDateTo"]').val();
        startBlock();
        service.getEmailsSubscriptions(s.emailsSubscriptionsFilter).then((d) => {
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        s.emailsSubscriptions = s.emailsSubscriptions.concat(d.data.Data);
                        s.emailsSubscriptionsFilter.skip += s.emailsSubscriptionsFilter.take;
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
            co("R-getEmailsSubscriptions", d);
            stopBlock();
        }).catch((error) => {
            toastr.error(Token.someErrorHasBeen, Token.Error); co("Error getEmailsSubscriptions", error.data);
            stopBlock();
        });
    };

    s.selectAll = () => {
        s.emailsSubscriptions.forEach(elm=> {
            elm.Selected=true
        })
    }
   
    //Delete
    s.sendMessage = () => {
        s.emailMessage.Message = CKEDITOR.instances.message.getData();
        s.emailMessage.Emails = s.emailsSubscriptions.filter(c=> c.Selected).map(c=> c.Email);

        if (s.emailMessage.Emails.length == 0)
        {
            toastr.error(langIsEn?"Must be select emails":"يجب تحديد اميل واحد على الاقل");
            return;
        }
        startBlock();

        service.sendMessage(s.emailMessage).then(d=> {
                stopBlock();
                switch (d.data.RequestType) {
                    case RequestType.Success:
                        {
                            toastr.success(d.data.Message);
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
    };



    s.getDataMore = () => {
        s.getEmailsSubscriptions();
    };

    s.getEmailsSubscriptions();
}]);    