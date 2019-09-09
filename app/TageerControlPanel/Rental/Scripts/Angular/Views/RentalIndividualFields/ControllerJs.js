myApp.controller("ctrlRentalIndividualFields", ["$scope", "$http", "serviceRentalIndividualFields", "serviceView", "$filter",  function (s, h, service, serviceView, filter) {
    //Config
    s.State = State;
    s.ShowEdit = -1;
    s.AllRentalIndividualField = [];
    s.Token = Token;
    s.RentalIndividualField = {
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

    //Get RentalIndividualFieldsBySubCategoryId
    s.getRentalIndividualFieldsBySubCategoryId = subCategoryId => {
        if (IsNullOrEmptyOrUndefined(subCategoryId)) return;
        startBlock();
        service.getRentalIndividualFieldsBySubCategoryId(subCategoryId).then((d) => {
            s.AllInput = d.data;
            console.log("AllInput");
            console.log(s.AllInput);
            stopBlock();
        });
    };
    
    

    //Get Inputs
    s.GetInputs = () => {
        //جلب بناء على الفئة الفعرية واذا لم يكن جلب لناء على الفئة الاساسية
        if (!IsNullOrEmptyOrUndefined(s.RentalIndividualField.FKSubCategory_Id))
            s.getRentalIndividualFieldsBySubCategoryId(s.RentalIndividualField.FKSubCategory_Id);
        else if (!IsNullOrEmptyOrUndefined(s.RentalIndividualField.FKCategory_Id))
            s.getRentalIndividualFieldsByCategoryId(s.RentalIndividualField.FKCategory_Id);
    };

 
    //Get RentalIndividualFieldsByCategoryId
    s.getRentalIndividualFieldsByCategoryId = (categoryId) => {
        if (IsNullOrEmptyOrUndefined(categoryId)) return;
        s.Restart();
        startBlock();

        service.getRentalIndividualFieldsByCategoryId(categoryId).then((d) => {
            if (d.data == '')
                s.AllInput = [];
            else
                s.AllInput = d.data;
            console.log("AllInput");
            console.log(s.AllInput);

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
        //فقط الى يوضع فى البار يجب ان يكون مطلوب بحيث لا يوضع قيم فارغة
        if (!input.IsRequired)
            input.IsBar = false;

        switch (input.State) {
            case 0:
            case State.Old:
                input.State = State.Update;
                break;
        }
    };

 
    //Change State Is Bar
    s.changeStateIsBar = input=> {
        //chekc if length <=5 لان هما فقط 5 اماكن فى البار
        var inputIsBarLength = s.AllInput.filter(c=> (c.State == State.Create || c.State == State.Update) && c.IsBar).length;

        if (inputIsBarLength==5)
        {
            toastr.error(Token.CanNotImportMore, Token.Error);
            input.IsBar = false;
            return;
        }

        switch (input.State) {
            case 0:
            case State.Old:
                input.State = State.Update;
                break;
        }
    };

    //Save Chenage
    s.SaveChenage = ( ) => {
        var InputsActions = filter('filterIsEquals')(s.AllInput, 'State', State.Create, State.Delete, State.Update);

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
        s.AllInput = [];
        s.AllRentalIndividualFieldCount = 0;
        s.AllInputCount = 0;

    };
    //Call Function
    s.CallFunctions = (categoryId) =>{
        s.getCategories();
        s.getSubCategories();
        s.GetInputs( );
    }; s.CallFunctions();

}]);