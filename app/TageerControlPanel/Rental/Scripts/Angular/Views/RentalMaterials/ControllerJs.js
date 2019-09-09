myApp.controller("ctrlRentalMaterials", ["$scope", "$http", "serviceRentalMaterials", "serviceView", "$filter",  function (s, h, service, serviceView, filter) {
    //Config
    s.ShowEdit = -1;
    s.RentalMaterials = [];
    s.RentalMaterial = {
        'FKCategory_Id':null,
        'FKRental_Id':null
    };
    s.State = State;
 

    //Get Categorys
    s.GetCategories = () => {
        startBlock();
        service.GetCategories().then((d) => {
            s.Categories = d.data;
            console.log("Categories");
            console.log(s.Categories);
            stopBlock();
        });
    }

    //Get Categories 
    s.GetSubCategories = () => {
        startBlock();
        service.GetSubCategories().then((d) => {
            s.SubCategories = d.data;
            console.log("SubCategories");
            console.log(s.SubCategories);

            stopBlock();
        });
    }
    
    //Get RentelTypeMaterials
    s.GetRentalMaterialsBySubCategory = subCategoryId => {
        if (IsNullOrEmptyOrUndefined(subCategoryId)) return;
        startBlock();
        service.GetRentalMaterialsBySubCategory(subCategoryId).then((d) => {
            s.AllMaterial = d.data;
            console.log("AllMaterial");
            console.log(s.AllMaterial);
            stopBlock();
            
        });
    };

    //Ge Materials
    s.GetMaterials = () => {
        s.AllMaterial = [];

        if (!IsNullOrEmptyOrUndefined(s.RentalMaterial.FKSubCategory_Id))
         s.GetRentalMaterialsBySubCategory(s.RentalMaterial.FKSubCategory_Id);
     else if (!IsNullOrEmptyOrUndefined(s.RentalMaterial.FKCategory_Id))
            s.GetRentelMaterialsByCategory(s.RentalMaterial.FKCategory_Id);
    };


    //Get Rentel   Materials By Category
    s.GetRentelMaterialsByCategory = (categoryId) => {
        if (IsNullOrEmptyOrUndefined(categoryId)) return;
        s.Restart();
        startBlock();

        service.GetRentelMaterialsByCategory(categoryId).then((d) => {
            if (d.data == '')
                s.AllMaterial = [];
            else
                s.AllMaterial = d.data;
            console.log("AllMaterial");
            console.log(s.AllMaterial);
            stopBlock();
        });
    };


    //Material Added To Rental Category Materials
    s.MaterialChangeState = mark=> {
        switch (mark.State) {
            case null:
            case "":
            case 0:
            case undefined:
                mark.State = State.Create;
                break;
            case State.Delete:
                mark.State = State.Update;
                break;
            case State.Update:
            case State.Old:
                mark.State = State.Delete;
                break;
            case State.Create:
                mark.State = null;
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
    s.SaveChange = () => {
        var MaterialsActions = filter('filterIsEquals')(s.AllMaterial, 'State', State.Create, State.Update, State.Delete);

        if (MaterialsActions.length == 0)
        {
            toastr.error(Token.NoDataForSave, Token.Error);
            return;
        }
        startBlock();
        
        service.SaveChange(MaterialsActions).then((d) => {
            switch (d.data.RequestType) {
                case 1: {
                    toastr.success(d.data.Message, d.data.Title);
                    s.GetMaterials();

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
            stopBlock();

        });
    };
 



    //Restart
    s.Restart = () => {
        s.AllMaterial = [];
        s.RentalMaterialsCount = 0;
        s.AllMaterialCount = 0;

    };
    //Call Function
    s.CallFunctions =   (categoryId) =>{
        s.GetCategories();
        s.GetSubCategories();
        s.GetMaterials();
    }; s.CallFunctions();

}]);