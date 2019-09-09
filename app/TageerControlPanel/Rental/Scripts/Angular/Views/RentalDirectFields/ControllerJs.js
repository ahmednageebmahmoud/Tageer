myApp.controller("ctrlRentalDirectFields", ["$scope", "$http", "serviceRentalDirectFields", "serviceView", "$filter",  function (s, h, service, serviceView, filter) {
    //Config
    s.State = State;
    s.ShowEdit = -1;
    s.AllRentalDirectField = [];
    s.Token = Token;
    s.RentalDirectField = {
        'FKCategory_Id': null,
        'FKRental_Id': null
    };


    //Get Categories
    s.getCategories = () => {
        startBlock();
        service.getCategories().then((d) => {
            s.Categories = d.data;
            console.log("getCategories");
            console.log(s.Categories);
            stopBlock();
        });
    };


    //Get Categories 
    s.getSubCategories = categoryId => {
        startBlock();
        service.getSubCategories(categoryId).then((d) => {
            s.SubCategories = d.data;
            console.log("getSubCategories");
            console.log(s.SubCategories);

            stopBlock();
        });
    };

    //Get RentalDirectFieldsBySubCategoryId
    s.getRentalDirectFieldsBySubCategoryId = subCategoryId => {
        if (IsNullOrEmptyOrUndefined(subCategoryId)) return;
        startBlock();
        service.getRentalDirectFieldsBySubCategoryId(subCategoryId).then((d) => {
            s.DirectFields = d.data;
            console.log("DirectFields");
            console.log(s.DirectFields);
            stopBlock();
        });
    };
    
    

    //Get Inputs
    s.GetInputs = () => {
        //جلب بناء على الفئة الفعرية واذا لم يكن جلب لناء على الفئة الاساسية
        if (!IsNullOrEmptyOrUndefined(s.RentalDirectField.FKSubCategory_Id))
            s.getRentalDirectFieldsBySubCategoryId(s.RentalDirectField.FKSubCategory_Id);
        else if (!IsNullOrEmptyOrUndefined(s.RentalDirectField.FKCategory_Id))
            s.getRentalDirectFieldsByCategoryId(s.RentalDirectField.FKCategory_Id);
    };

 
    //Get RentalDirectFieldsByCategoryId
    s.getRentalDirectFieldsByCategoryId = (categoryId) => {
        if (IsNullOrEmptyOrUndefined(categoryId)) return;
        s.Restart();
        startBlock();

        service.getRentalDirectFieldsByCategoryId(categoryId).then((d) => {
            if (d.data == '')
                s.DirectFields = [];
            else
                s.DirectFields = d.data;
            console.log("DirectFields");
            console.log(s.DirectFields);

            stopBlock();
        });
    };


    //Input Change State
    s.InputChangeState = input=> {
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
            case State.Update:
            case State.Old:
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
        var InputsActions = filter('filterIsEquals')(s.DirectFields, 'State', State.Create, State.Delete, State.Update);

        if (InputsActions.length == 0)
        {
            toastr.warning(Token.Error,s.NotNotFoundDataForSaved)
            return;
        }
        startBlock();
        
        service.SaveChenage(InputsActions).then((d) => {
            switch (d.data.RequestType) {
                case 1: {
                    toastr.success(d.data.Message,Token.Success);
                    s.GetInputs();
                }
                    break;
                case 2: {
                    toastr.error(d.data.Message, Token.Error)

                }
                    break;
                case 3: {
                    toastr.warning(d.data.Message, Token.warning)

                }
                    break;
                case 4: {
                    toastr.info(d.data.Message, Token.Info)

                }
            }
            stopBlock();

        });
    };
 



    //Restart
    s.Restart = () => {
        s.DirectFields = [];
        s.AllRentalDirectFieldCount = 0;
        s.DirectFieldsCount = 0;

    };
    //Call Function
    s.CallFunctions = (categoryId) =>{
        s.getCategories();
        s.getSubCategories();
        s.GetInputs( );
    }; s.CallFunctions();

}]);