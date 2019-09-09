myApp.controller("ctrlRentalMarks", ["$scope", "$http", "serviceRentalMarks", "serviceView", "$filter",  function (s, h, service, serviceView, filter) {
    //Config
    s.ShowEdit = -1;
    s.RentalMarks = [];
    s.RentalMark = {
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
    
    //Get RentelTypeMarks
    s.GetRentalMarksBySubCategory = subCategoryId => {
        if (IsNullOrEmptyOrUndefined(subCategoryId)) return;
        startBlock();
        service.GetRentalMarksBySubCategory(subCategoryId).then((d) => {
            s.AllMark = d.data;
            console.log("AllMark");
            console.log(s.AllMark);
            stopBlock();
            
        });
    };

    //Ge Marks
    s.GetMarks = () => {
        s.AllMark = [];

        if (!IsNullOrEmptyOrUndefined(s.RentalMark.FKSubCategory_Id))
         s.GetRentalMarksBySubCategory(s.RentalMark.FKSubCategory_Id);
     else if (!IsNullOrEmptyOrUndefined(s.RentalMark.FKCategory_Id))
            s.GetRentelMarksByCategory(s.RentalMark.FKCategory_Id);
    };


    //Get Rentel   Marks By Category
    s.GetRentelMarksByCategory = (categoryId) => {
        if (IsNullOrEmptyOrUndefined(categoryId)) return;
        s.Restart();
        startBlock();

        service.GetRentelMarksByCategory(categoryId).then((d) => {
            if (d.data == '')
                s.AllMark = [];
            else
                s.AllMark = d.data;
            console.log("AllMark");
            console.log(s.AllMark);
            stopBlock();
        });
    };


    //Mark Added To Rental Category Marks
    s.MarkChangeState = mark=> {
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
        var MarksActions = filter('filterIsEquals')(s.AllMark, 'State', State.Create, State.Update, State.Delete);

        if (MarksActions.length == 0)
        {
            toastr.error(Token.NoDataForSave, Token.Error);
            return;
        }
        startBlock();
        
        service.SaveChange(MarksActions).then((d) => {
            switch (d.data.RequestType) {
                case 1: {
                    toastr.success(d.data.Message, d.data.Title);
                    s.GetMarks();

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
        s.AllMark = [];
        s.RentalMarksCount = 0;
        s.AllMarkCount = 0;

    };
    //Call Function
    s.CallFunctions =   (categoryId) =>{
        s.GetCategories();
        s.GetSubCategories();
        s.GetMarks();
    }; s.CallFunctions();

}]);