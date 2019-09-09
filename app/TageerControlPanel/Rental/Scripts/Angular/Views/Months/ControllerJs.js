myApp.controller("ctrlMonth", ["$scope", "$http","$filter", "serviceMonth", "serviceView", function (s, h,filter, service, serviceView) {
    //Config
    s.ShowEdit = -1;
    s.AllMonth = [];

    //Get Months
    s.GetMonths = (dateTypeId) => {
		if(dateTypeId!=undefined)
        startBlock();
        service.GetMonths(dateTypeId).then((d) => {
            stopBlock();
            if (d.data == null || d.data == "")
                s.AllMonth = [];
            else
                s.AllMonth = d.data;
            console.log("AllMonth");
            console.log(s.AllMonth);
        });
    };

    //Add New month 
    s.Create = (month) => {
        s.NameArDuplicate = serviceView.isDuplicated('NameAr', month.NameAr,  s.AllMonth);
        s.NameEnDuplicate = serviceView.isDuplicated('NameEn', month.NameEn,  s.AllMonth);
        s.ShortNameDuplicate = serviceView.isDuplicated('ShortName', month.ShortName, s.AllMonth);
        s.MonthIndexDuplicate = serviceView.isDuplicated('MonthIndex', month.MonthIndex, s.AllMonth);

        if (s.NameArDuplicate || s.NameEnDuplicate || s.ShortNameDuplicate || s.MonthIndexDuplicate)
            return;
        //تم وضع معرف لاننا فى عملية المسح نعتمد على المعرف ولا يمكن ان نعتمد على الرتبة لانهناك عمليةتصفح
        month.Id = "xNew" + Math.floor(Math.random() * 1000000);
        month.State = State.Create;
         s.AllMonth.push(angular.copy(month));
        s.Restart();
        s.filter();
    };
    //save Edit Job
    s.Edit = function (month) {
                month.NameArDuplicate = serviceView.isDuplicatedEdit('NameAr', month.NameAr,  s.AllMonth, month.Id);
                month.NameEnDuplicate = serviceView.isDuplicatedEdit('NameEn', month.NameEn, s.AllMonth, month.Id);
                month.ShortNameDuplicate = serviceView.isDuplicatedEdit('ShortName', month.ShortName, s.AllMonth, month.Id);
                month.MonthIndexDuplicate = serviceView.isDuplicatedEdit('MonthIndex', month.MonthIndex, s.AllMonth, month.Id);

        if (month.NameArDuplicate || month.NameEnDuplicate || month.ShortNameDuplicate || month.MonthIndexDuplicate)
            return;

        if (month.State != State.Create)
            month.State = State.Update;

        s.RestartEdit();
    };
    //Save Chenage
    s.SaveChenage = function (months) {
        //Check Data For Save
        var dataForSave = filter('filterIsEquals')(s.AllMonth, 'State', State.Create, State.Delete, State.Update);
        if (dataForSave.length == 0) {
            toastr.error(Token.NoDataForSave, Token.Error);
            return
        }
        startBlock();
        service.SaveChenage(dataForSave).then(function (d) {
            stopBlock();
            switch (d.data.RequestType) {
                case 1: {
                    toastr.success(d.data.Message, d.data.Title);
                    s.GetMonths(s.Month.FkdateTypeId);
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
    s.DeleteConfirm = function (id) {
        s.DeleteId = id;
        showDeleteConfirm();
    };
    //Delete
    s.Delete = function () {
        if (s.DeleteId != null) {
            s.AllMonth.forEach(function (item, index) {
                if (item.Id === s.DeleteId) {
                    if (item.State == State.Create)
                        s.AllMonth.splice(index, 1);
                    else
                        item.State = State.Delete
                    hideDeleteConfirm();
                    s.filter()
                }
            });

        }
    };
    //Cancel Delete
    s.CancelDelete = function () {
        hideDeleteConfirm();
        s.DeleteId = null;
    };







    //Change
    s.Change = (index) => {

        if (s.ShowEdit != -1) {
            s.RestartEdit(true);
        }
        s.ShowEdit = index;
        s.RowEditBackup = angular.copy(s.AllMonthRepeat[index]);
    };

    //Restart Edit
    s.RestartEdit = (resort) => {
        //Resort Backup 
        if (resort) {
            s.AllMonth.forEach((x, index) => {
                if (x.Id == s.RowEditBackup.Id)
                    s.AllMonth[index] = s.RowEditBackup;
            });
            s.filter();
        }
        s.ShowEdit = -1;
        s.IsEdit = false;
    };


    //Restart
    s.Restart = function () {
        s.Month.NameAr = null;
        s.Month.NameEn = null;
        s.Month.ShortName = null;
        s.Month.FKDateTypeId = null;
        s.MonthIndex = null;

        s.MonthIndexDuplicate = false;
        s.IsSubmit = false;
    };


    //Call Function
    s.CallFunctions = function (fkdateTypeId) {
        s.GetMonths(fkdateTypeId);
    }; s.CallFunctions();

}]);