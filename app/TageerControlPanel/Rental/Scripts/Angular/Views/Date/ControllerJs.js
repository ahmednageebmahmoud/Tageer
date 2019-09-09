myApp.controller("ctrlDate", ["$scope", "$http", "serviceDate", "serviceView", function (s, h, service, serviceView) {
    //Config
    s.ShowEdit = -1;

    //Get Dates
    s.GetDates = () => {
        startBlock();

        service.GetDates().then(  (d) =>{
            stopBlock();
            if (d.data === '')
                s.AllDates = [];
            else
            s.AllDates = d.data;
            console.log("AllDates");
            console.log(s.AllDates);
        });
    }; 

    //Add New date 
    s.Create = (date) => {
       
        date.FKDateTypeIdDuplicate = serviceView.isDuplicated('FKDateTypeId', date.FKDateTypeId, s.AllDates);
        date.IsDefultDuplicate = serviceView.isDuplicated('IsDefult', date.IsDefult, s.AllDates);

        if (date.FKDateTypeIdDuplicate || date.IsDefultDuplicate)
            return;
        //تم وضع معرف لاننا فى عملية المسح نعتمد على المعرف ولا يمكن ان نعتمد على الرتبة لانهناك عمليةتصفح
        date.Id = "xNew" + Math.floor(Math.random() * 1000000);
        date.State = RequestType.Create;
        s.AllDates.push(angular.copy(date));
        s.Restart();
        s.filter();
    };
    //save Edit Date
    s.Edit = (date, index) => {
      //  date.FKDateTypeIdDuplicate = serviceView.isDuplicatedEdit('FKDateTypeId', date.FKDateTypeId, s.AllDates, index);
        //date.IsDefultDuplicate = serviceView.isDuplicatedEdit('IsDefult', date.IsDefult, s.AllDates, index);
        //if (date.FKDateTypeIdDuplicate || date.IsDefultDuplicate)
          //  return;
        debugger;
        //يجب ان يكون هناك تاريخ واحد على الاقل هوا معين بشكل رسمى
        if (date.IsDefult) {
            if(index===1){
                s.AllDates[0].IsDefult = false;
                s.AllDates[0].State = State.Update;
                if (s.AllDates.length > 1) {

                s.AllDates[1].IsDefult = true;
                s.AllDates[1].State = State.Update;
                }
            }
        else{
                s.AllDates[0].IsDefult = true;
                s.AllDates[0].State = State.Update;
                if (s.AllDates.length > 1) {
                	s.AllDates[1].IsDefult = false;
                	s.AllDates[1].State = State.Update;
                }
                }
        }

        //if (date.State != RequestType.Create)
        s.RestartEdit();
    };
    //Save Chenage
    s.SaveChenage = (dates) => {
        startBlock();
        service.SaveChenage(dates).then((d) => {
            stopBlock();
            switch (d.data.RequestType) {
                case 1: {
                    toastr.success(d.data.Message, d.data.Title);
                    s.GetDates();
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
    s.Delete =   ()=> {
        if (s.DeleteId != null) {
            s.AllDates.forEach(  (item, index)=> {
                if (item.Id === s.DeleteId) {
                    if (item.State == RequestType.Create)
                        s.AllDates.splice(index, 1);
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
        s.RowEditBackup = angular.copy(s.AllDates[index]);
    };

    //Restart Edit
    s.RestartEdit = (resort) => {
        //Resort Backup 
        if (resort) {
            s.AllDates.forEach((x, index) => {
                if (x.Id == s.RowEditBackup.Id)
                    s.AllDates[index] = s.RowEditBackup;
            });
            s.filter();
        }
        s.ShowEdit = -1;
        s.IsEdit = false;
    };

 
    //Restart
    s.Restart =   () =>{
        s.Date = {};
        s.IsSubmit = false;
    };

    //Call Function
    s.CallFunctions = () => {
        s.GetDates();
    }; s.CallFunctions();
}]);