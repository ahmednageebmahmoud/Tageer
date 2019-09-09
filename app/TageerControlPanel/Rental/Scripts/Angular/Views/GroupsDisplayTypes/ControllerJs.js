myApp.controller("ctrlGroupsDisplayTypes", ["$scope", "$http", "serviceGroupsDisplayTypes", "serviceView", "$filter", function (s, h, service, serviceView, filter) {
    //Config
    s.ShowEdit = -1;
    s.State = State;
    s.AllGroupsDisplayTypes = [];

    //Get GroupsDisplayTypes
    s.GetGroupsDisplayTypes =   () =>{
        startBlock();
        service.GetGroupsDisplayTypes().then((d) => {
            stopBlock();
            if (d.data == '')
                s.AllGroupsDisplayTypes = [];
            else
            s.AllGroupsDisplayTypes = d.data;
            console.log("AllGroupsDisplayTypes");
            console.log(s.AllGroupsDisplayTypes);
        });
    }; 

    //Get Groups
    s.GetGroups= () => {
        startBlock();
        service.GetGroups().then((d) => {
            stopBlock();
            s.Groups = d.data;
            console.log("Groups");
            console.log(s.Groups);
        });
    };

    //Get CAtegories
    s.GetCategories = () => {
        startBlock();
        service.GetCategories().then((d) => {
            stopBlock();
            s.Categories = d.data;
            console.log("Categories");
            console.log(s.Categories);
        });
    };

    //Get Rental Categories
    s.GetSubCategories = () => {
        startBlock();
        service.GetSubCategories().then((d) => {
            stopBlock();
            s.SubCategories = d.data;
            console.log("SubCategories");
            console.log(s.SubCategories);
        });
    };
    
    //Get Input Types
    s.GetInputTypes = () => {
        startBlock();
        service.GetInputTypes().then((d) => {
            stopBlock();
            s.InputTypes = d.data;
            console.log("InputTypes");
            console.log(s.InputTypes);
        });
    };

    //Add New rentalGroupsField 
    s.Create = (rentalGroupsField) => {
        //تم وضع معرف لاننا فى عملية المسح نعتمد على المعرف ولا يمكن ان نعتمد على الرتبة لانهناك عمليةتصفح
        rentalGroupsField.Id = "xNew" + Math.floor(Math.random() * 1000000);
        rentalGroupsField.State = State.Create;
        s.AllGroupsDisplayTypes.push(angular.copy(rentalGroupsField));
        s.Restart();
        s.filter();
    };

    //save Edit GroupsDisplayType
    s.Edit = (rentalGroupsField) => {
        if (rentalGroupsField.State != State.Create)
            rentalGroupsField.State = State.Update;
        s.RestartEdit();
    };

    //Save Chenage
    s.SaveChenage = (rentalGroupsItems) =>{
        var rentalGroupsItemsSave = filter('filterIsEquals')(rentalGroupsItems, 'State', State.Create, State.Update, State.Delete);

        if (rentalGroupsItemsSave.length == 0)
        {
            toastr.error(s.NoDataForSave);
        return;
        }

        startBlock();
        service.SaveChenage(rentalGroupsItemsSave).then((d) => {
            stopBlock();
            switch (d.data.RequestType) {
                case RequestType.Success: {
                    toastr.success(d.data.Message, Token.Success);
                    s.GetGroupsDisplayTypes();
                    hideDeleteConfirm();
                }
                    break;
                case RequestType.Error: {
                    toastr.error(d.data.Message, Token.Error)
                }
                    break;
                case RequestType.Warning: {
                    toastr.warning(d.data.Message, Token.Warning)

                }
                    break;
                case RequestType.Info: {
                    toastr.info(d.data.Message, Token.Info)

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
            s.AllGroupsDisplayTypes.forEach(  (item,index  )=> {
                if (item.Id === s.DeleteId) {
                    if (item.State == State.Create)
                        s.AllGroupsDisplayTypes.splice(index, 1);
                    else
                        item.State = State.Delete
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
        s.RowEditBackup = angular.copy(s.AllGroupsDisplayTypesRepeat[index]);
    };

    //Restart Edit
    s.RestartEdit = (resort) => {
        //Resort Backup 
        if (resort) {
            s.AllGroupsDisplayTypes.forEach((x, index) => {
                if (x.Id == s.RowEditBackup.Id)
                    s.AllGroupsDisplayTypes[index] = s.RowEditBackup;
            });
            s.filter();
        }
        s.ShowEdit = -1;
        s.IsEdit = false;
    };



    //Restart
    s.Restart = () => {
        s.GroupsDisplayType = {};
        s.IsSubmit = false;
    };

    //Call Function
    s.CallFunctions = () => {
        s.GetGroups();
        s.GetCategories();
        s.GetSubCategories();
        s.GetInputTypes();
        s.GetGroupsDisplayTypes();
    }; s.CallFunctions();
}]);