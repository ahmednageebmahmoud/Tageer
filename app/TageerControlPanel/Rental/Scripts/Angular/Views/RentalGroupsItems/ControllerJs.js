myApp.controller("ctrlRentalGroupsItems", ["$scope", "$http", "serviceRentalGroupsItems", "serviceView", "$filter",  function (s, h, service, serviceView, filter) {
    //Config
    s.ShowEdit = -1;
    s.State = State;
    s.AllRentalGroupsItem = [];
    s.RentalGroupsItem = {
        'FKCategory_Id': null,
        'FKSubCategory_Id': null
    };

    

    //Groups
    s.GetGroups = () => {
        startBlock();
        service.GetGroups().then((d) => {
            s.Groups = d.data;
            console.log("Groups");
            console.log(s.Groups);
            stopBlock();
        });
    };

    //Get Categorys
    s.GetCategories = () => {
        startBlock();
        service.GetCategories().then((d) => {
            s.Categories = d.data;
            console.log("Categories");
            console.log(s.Categories);
            stopBlock();
        });
    };


    //Get Categories 
    s.GetSubCategories = () => {
        startBlock();
        service.GetSubCategories().then((d) => {
            s.SubCategories = d.data;
            console.log("SubCategories");
            console.log(s.SubCategories);

            stopBlock();
        });
    };

    //Get GetRentelTypeRentalGroupsItems
    s.GetRentalGroupsItemsByCategory = categoryId => {
        if (IsNullOrEmptyOrUndefined(categoryId)) return;
        startBlock();
        service.GetRentalGroupsItemsByCategory(categoryId).then((d) => {
            s.AllRentalGroupsItem = d.data;
            console.log("AllRentalGroupsItem");
            console.log(s.AllRentalGroupsItem);
            stopBlock();
        });
    };
    

    //Get RentalGroupsItems
    s.GetRentalGroupsItems = () => {
        if (!IsNullOrEmptyOrUndefined(s.RentalGroupsItem.FKSubCategory_Id))
            s.GetRentalGroupsItemsBySubCategory(s.RentalGroupsItem.FKSubCategory_Id);
        else if (!IsNullOrEmptyOrUndefined(s.RentalGroupsItem.FKCategory_Id))
            s.GetRentalGroupsItemsByCategory(s.RentalGroupsItem.FKCategory_Id);
    };

 
    //Get RentalGroupsItems
    s.GetRentalGroupsItemsBySubCategory = (subCategoryId) => {
        if (IsNullOrEmptyOrUndefined(subCategoryId)) return;
        s.Restart();
        startBlock();

        service.GetRentalGroupsItemsBySubCategory(subCategoryId).then((d) => {
            if (d.data == '')
                s.AllRentalGroupsItem = [];
            else
                s.AllRentalGroupsItem = d.data;
            console.log("AllRentalGroupsItem");
            console.log(s.AllRentalGroupsItem);

            stopBlock();
        });
    };


    //RentalGroupsItem Change State
    s.RentalGroupsItemChangeState = input=> {
        switch (input.State) {
            case null:
            case "":
            case 0:
            case undefined:
                input.State = State.Create;
                break;
            case State.Delete:
                input.State = State.Update;
                break;
            case State.Old:
            case State.Update:
                input.State = State.Delete;
                break;
            case State.Create:
                input.State = 0;
                break;
        }
    };
    
    //ChangeStateIsRequired
    s.ChangeStateIsRequired = input=> {
        switch (input.State) {
            case 0:
            case State.Old:
                input.State = State.Update;
                break;
        }
    };


 
    //Save Chenage
    s.SaveChenage = ( ) => {
        var RentalGroupsItemsActions = filter('filterIsEquals')(s.AllRentalGroupsItem, 'State', State.Create, State.Delete, State.Update);

        if (RentalGroupsItemsActions.length == 0)
        {
            toastr.warning(s.warning,s.NotNotFoundDataForSaved)
            return;
        }
        startBlock();
        
        service.SaveChenage(RentalGroupsItemsActions).then((d) => {
            switch (d.data.RequestType) {
                case RequestType.Success: {
                    toastr.success(d.data.Message, Token.Success);
                    s.GetRentalGroupsItems();
                }
                    break;
                case RequestType.Error: {
                    toastr.error(d.data.Message, Token.Error)

                }
                    break;
                case RequestType.Warning: {
                    toastr.warning(d.data.Message, Token.Warring)

                }
                    break;
                case RequestType.Info: {
                    toastr.info(d.data.Message,Token.Info)

                }
            }
            stopBlock();

        });
    };
 



    //Restart
    s.Restart = () => {
        s.AllRentalGroupsItem = [];
        s.AllRentalGroupsItemCount = 0;
        s.AllRentalGroupsItemCount = 0;

    };
    //Call Function
    s.CallFunctions = (categoryId) =>{
        s.GetCategories();
        s.GetSubCategories();
        s.GetGroups();
       // s.GetRentalGroupsItems();
    }; s.CallFunctions();

}]);