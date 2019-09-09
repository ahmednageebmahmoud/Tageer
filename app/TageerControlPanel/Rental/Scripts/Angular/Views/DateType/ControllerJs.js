myApp.controller("ctrlDateType", ["$scope", "$http", "serviceDateType", "serviceView", function (s, h, service, serviceView) {
    //Config
    s.ShowEdit = -1;
    s.AllDateType=[];

    //Get DateType
    s.GetDateType =   ()=> {
        startBlock();
        service.GetDateType().then((d) => {
            stopBlock();
            if (d.data == '')
                s.AllDateType = [];
            else
            s.AllDateType = d.data;
            console.log("AllDateType");
            console.log(s.AllDateType);
        });
    }; 


    //Add New dateType 
    s.Create = (dateType) => {

        s.NameArDuplicate = serviceView.isDuplicated('NameAr', dateType.NameAr, s.AllDateType);
        s.NameEnDuplicate = serviceView.isDuplicated('NameEn', dateType.NameEn, s.AllDateType);

        if (s.NameArDuplicate || s.NameEnDuplicate)
            return;
        //تم وضع معرف لاننا فى عملية المسح نعتمد على المعرف ولا يمكن ان نعتمد على الرتبة لانهناك عمليةتصفح
        dateType.Id = "xNew" + Math.floor(Math.random() * 1000000);
        dateType.State = RequestType.Create;
        s.AllDateType.push(angular.copy(dateType));
        s.Restart();
        s.filter();
    };
    //save Edit dateType
    s.Edit =   (dateType) =>{
        dateType.NameArDuplicate = serviceView.isDuplicatedEdit('NameAr', dateType.NameAr, s.AllDateType, dateType.Id);
        dateType.NameEnDuplicate = serviceView.isDuplicatedEdit('NameEn', dateType.NameEn, s.AllDateType, dateType.Id);
        if (dateType.NameArDuplicate || dateType.NameEnDuplicate)
            return;

        if (dateType.State != RequestType.Create)
            dateType.State = RequestType.Update;
        s.RestartEdit();
    };
    //Save Chenage
    s.SaveChenage =   (DateType)=> {
        startBlock();
        service.SaveChenage(DateType).then((d) => {
            stopBlock();
            switch (d.data.RequestType) {
                case 1: {
                    toastr.success(d.data.Message, d.data.Title);
                    s.GetDateType();
                    hideDeleteConfirm();
                }
                    break;
                case 2: {
                    toastr.error(d.data.Message, d.data.Title)

                }
                    break;
                case 3: {
                    toastr.warning(d.data.Message, d.data.Title)

                }
                    break;
                case 4: {
                    toastr.info(d.data.Message, d.data.Title)

                }
            }
        });
    };

    //Delete Confirm
    s.DeleteConfirm = (id) => {
        s.DeleteId = id;
        showDeleteConfirm();
    };
    //Delete
    s.Delete = () => {
        if (s.DeleteId != null) {
            s.AllDateType.forEach((item, index) => {
                if (item.Id === s.DeleteId) {
                    if (item.State == RequestType.Create)
                        s.AllDateType.splice(index, 1);
                    else
                        item.State = RequestType.Delete
                    hideDeleteConfirm();
                    s.filter()
                }
            });

        }
    };
    //Cancel Delete
    s.CancelDelete = () => {
        hideDeleteConfirm();
        s.DeleteId = null;
    };


    //Change
    s.Change = (index) => {

        if (s.ShowEdit != -1) {
            s.RestartEdit(true);
        }
        s.ShowEdit = index;
        s.RowEditBackup = angular.copy(s.AllDateTypeRepeat[index]);
    };

    //Restart Edit
    s.RestartEdit = (resort) => {
        //Resort Backup 
        if (resort) {
            s.AllDateType.forEach((x, index) => {
                if (x.Id == s.RowEditBackup.Id)
                    s.AllDateType[index] = s.RowEditBackup;
            });
            s.filter();
        }
        s.ShowEdit = -1;
        s.IsEdit = false;
    };

    //Restart
    s.Restart = () => {
        s.DateType = {};
        s.IsSubmit = false;

    };


    //Call Function
    s.CallFunctions = () => {
        s.GetDateType();
    }; s.CallFunctions();
}]);