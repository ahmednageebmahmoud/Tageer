/// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlActivities', ['$scope', '$http','$filter', 'serviceActivities', 'serviceView', function (s, h, filter,service, serviceView) {

    //<!--Config-->
    s.Token = Token;
    s.State = State;
    s.Activities = null;
    s.Activity = {};
    //</!--Config-->

    //Get Activities
    s.getActivities = () => {
        startBlock();
        service.getActivities().then((d) => {
            if(d.data!=""&&d.data!=null)
            s.Activities = d.data;
                else
                s.Activities = [];
            co("R-getActivities", d);
            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);
            toastr.error(Token.OrSomeErrorInServer, Token.Error); co("Error Login", error.data);
            stopBlock();
        });
    };

    


    //Create
    s.create = () => {
        
        //If Dublicate
        s.Activity.NameArDuplicate = serviceView.isDuplicated({ 'NameAr': s.Activity.NameAr }, s.Activities);
        s.Activity.NameEnDuplicate = serviceView.isDuplicated({ 'NameEn': s.Activity.NameEn }, s.Activities);
        
        if (s.Activity.NameArDuplicate || s.Activity.NameEnDuplicate)
            return;

        //Added To List
        s.Activity.State = State.Create;
        s.Activity.Id = "xNew" + Math.floor(Math.random() * 1000000);
        s.Activity.ActivityName = Service.isEn ? s.Activity.NameEn : s.Activity.NameAr;
        s.Activities.push(angular.copy(s.Activity));

        s.filter();
        s.Activity.NameAr = null;
        s.Activity.NameEn = null;
    };

    //Update
    s.update = (activity) => {
        //If Dublicate
        activity.NameArDuplicate = serviceView.isDuplicated({ 'NameAr': activity.NameAr }, s.Activities, activity.Id);
        activity.NameEnDuplicate = serviceView.isDuplicated({ 'NameEn': activity.NameEn }, s.Activities, activity.Id);


        if (activity.NameArDuplicate || activity.NameEnDuplicate )
            return;

        if (activity.State !=State.Create)
            activity.State = State.Update;
        s.restartUpdate();
    };

    //Change For Update
    s.changeForUpdate = (index) => {
        if (s.ShowUpdate != -1) {
            s.ActivitiesRepeat[s.ShowUpdate] = s.RowUpdateBackup;
        }
        s.ShowUpdate = index;
        s.RowUpdateBackup = angular.copy(s.ActivitiesRepeat[index]);
    };

    //Restart Update
    s.restartUpdate = (resort) => {
        //Resort Backup 
        if (resort) {
            s.Activities.forEach((activity,index) => {
                if(activity.Id==s.RowUpdateBackup.Id)
                {
                    s.Activities[index] = s.RowUpdateBackup;
                    s.filter();
                }
            });
        }
        s.ShowUpdate = -1;
        s.IsUpdate = false;
    };

    //Delete Confirm
    s.deleteConfirm = (id) => {
        s.deleteId = id;
        showDeleteConfirm();
    };

    //Delete
    s.delete = () => {
        if (s.deleteId != null) {
            s.Activities.forEach((item, index) => {
                if (item.Id === s.deleteId) {
                    if (item.State == State.Create)
                        item.State = State.Delete
                    else
                        item.State = State.Delete
                    hideDeleteConfirm();
                    s.filter();
                }
            });
        }
    };

    //Cancel Delete
    s.cancelDelete = () => {
        hideDeleteConfirm();
        s.deleteId = null;
    };

    //Undo Delete
    s.undoDelete = activity=> {
        if (activity.Id.toString().includes('xNew'))
            activity.State = State.Create;
        else
            activity.State = null;

    };

    //Save Change
    s.saveChange = () => {
        //Check Data For Save
        var dataForSave = filter('filterIsEquals')(s.Activities, 'State', State.Create, State.Delete, State.Update);
        dataForSave = filter('filterIsNotConstantWithDelete')(dataForSave, 'Id', "xNew");
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
                        s.getActivities();
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
            toastr.error(Token.OrSomeErrorInServer, Token.Error); co("Error Login", error.data);
            stopBlock();
        });

    };


    //Restart
    s.rest = () => {
       
    };

    //Call Functions
    s.callFunctions = () => {
        s.getActivities();
    }; s.callFunctions();


    $(window).on('beforeunload', function () {
        var dataForSave = filter('filterIsEquals')(s.Activities, 'State', State.Create, State.Delete, State.Update);
        dataForSave = filter('filterIsNotConstantWithDelete')(dataForSave, 'Id', "xNew");
        if (dataForSave.length >0)
            return "";
    });
}]);