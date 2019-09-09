myApp.controller("ctrlCategories", ["$scope", "$http", "$filter", "serviceCategories", "serviceView", function (s, h,filter, service, serviceView) {
    //Config
    s.ShowEdit = -1;
    s.AllCategories=[];
    s.State = State;
    s.Token = Token;

    //Get Categories
    s.GetCategories = () => {
        startBlock();
        service.GetCategories().then(  (d)=> {

            if (d.data == '')
                s.AllCategories = [];
            else
            s.AllCategories = d.data;
            console.log("AllCategories");
            console.log(s.AllCategories);

            stopBlock();
        });
    }; 


    //Add New rentalType 
    s.Create = (rentalType) => {

        s.NameArDuplicate = serviceView.isDuplicated({'NameAr': rentalType.NameAr}, s.AllCategories);
        s.NameEnDuplicate = serviceView.isDuplicated({'NameEn': rentalType.NameEn}, s.AllCategories);

        if (s.NameArDuplicate || s.NameEnDuplicate)
            return;
        //تم وضع معرف لاننا فى عملية المسح نعتمد على المعرف ولا يمكن ان نعتمد على الرتبة لانهناك عمليةتصفح
        rentalType.Id = "xNew" + Math.floor(Math.random() * 1000000);  
        rentalType.State = State.Create;

        /*
        s.NewCategory = angular.copy(rentalType);
    
        // Add Image After Copy Because is copy image  object  fire expression
       // s.NewCategory.Photo = s.RentalNewImage;
       
        s.AllCategories.push(s.NewCategory);
        */

        rentalType.Image64 = s.RentalNewImage;
        rentalType.Image = s.imageeReview;
        s.AllCategories.push(rentalType);


        s.filter();
        s.Restart();

    };
    //save Edit rentalType
    s.Edit = function (rentalType, newImagUrl,rentalEditImage) {
        rentalType.NameArDuplicate = serviceView.isDuplicated({'NameAr': rentalType.NameAr}, s.AllCategories, rentalType.Id);
        rentalType.NameEnDuplicate = serviceView.isDuplicated({'NameEn': rentalType.NameEn}, s.AllCategories, rentalType.Id);
        if (rentalType.NameArDuplicate || rentalType.NameEnDuplicate)
            return;

        if (rentalType.State != State.Create)
            rentalType.State = State.Update;

        
        if (!IsNullOrEmptyOrUndefined(newImagUrl)) {
            rentalType.Image = newImagUrl;
            rentalType.Image64 = rentalEditImage;
        }
        s.RestartEdit();
    };
    //Save Chenage
    s.SaveChenage = (Categories) => {
       //Check Data For Save
        var dataForSave = filter('filterIsEquals')(Categories, 'State', State.Create, State.Delete, State.Update);
        dataForSave = filter('filterIsNotConstantWithDelete')(dataForSave, 'Id', "xNew");
        if (dataForSave.length == 0) {
            showAlertNotDataToSave();
            return;
        }
        startBlock();
        service.SaveChenage(dataForSave).then((d) => {
            stopBlock();
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        toastr.success(d.data.Message, d.data.Title);
                        s.GetCategories();
                        hideDeleteConfirm();
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
            s.AllCategories.forEach(  (item, index) =>{
                if (item.Id === s.DeleteId) {
                    if (item.State == State.Create)
                        s.AllCategories.splice(index, 1);
                    else
                        item.State = State.Delete
                    hideDeleteConfirm();
                    s.filter(); 
                }
            });

        }
    };
    //Cancel Delete
    s.CancelDelete =   ()=> {
        hideDeleteConfirm();
        s.DeleteId = null;
    };

        //Change
    s.Change = (index) => {

        if (s.ShowEdit != -1) {
            s.RestartEdit(true);
        }
        s.ShowEdit = index;
        s.RowEditBackup = angular.copy(s.AllCategoriesRepeat[index]);
    };

    //Restart Edit
    s.RestartEdit = (resort) =>{
        //Resort Backup 
        if (resort) {
            s.AllCategories.forEach((x,index)=> {
                if(x.Id==s.RowEditBackup.Id)
                    s.AllCategories[index] = s.RowEditBackup;
            });
            s.filter();
        }
        s.ShowEdit = -1;
        s.IsEdit = false;
        s.imagEditReview = null;
        s.RentalEditImage = null;
        SetValueNullByNameJQ('rentalEditImage');
    };

    //Restart
    s.Restart =   () =>{
        s.Category = {};
        s.IsSubmit = false;
        s.RentalNewImage = null;
        s.imageeReview = null;
        SetValueNullByNameJQ('rentalImage');
    };




    //Call Function
    s.CallFunctions = () => {
        s.GetCategories();
    }; s.CallFunctions();
}]);