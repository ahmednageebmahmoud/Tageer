myApp.controller("ctrlSubCategories", ["$scope", "$http", "$filter", "serviceSubCategories", "serviceView", function (s, h, filter, service, serviceView) {
    //Config
    s.ShowEdit = -1;
    s.AllRental = [];
    s.State = State;
    s.Token = Token;

    //Get Category
    s.GetCategories = () => {
        startBlock();
        service.GetCategories().then((d) => {
            s.AllCategory = d.data;
            console.log("AllCategory");
            console.log(s.AllCategory);
            stopBlock();
        });
    }; 

    //Get SubCategories
    s.GetSubCategories = (rentalTypeId) => {
        if (IsNullOrEmptyOrUndefined(rentalTypeId)) return;
        startBlock();
        

        service.GetSubCategories(rentalTypeId).then((d) => {
            if (d.data == '')
                s.AllSubCategory = [];
            else
                s.AllSubCategory = d.data;
            console.log("AllSubCategory");
            console.log(s.AllSubCategory);
            stopBlock();
        });
    };


    //Add New rentalSubCategory 
    s.Create = (rentalSubCategory) => {
        s.NameArDuplicate = serviceView.isDuplicated({ 'NameAr': rentalSubCategory.NameAr },  s.AllSubCategory);
        s.NameEnDuplicate = serviceView.isDuplicated({'NameEn': rentalSubCategory.NameEn},  s.AllSubCategory);
        

        if (s.NameArDuplicate || s.NameEnDuplicate)
            return;
        //تم وضع معرف لاننا فى عملية المسح نعتمد على المعرف ولا يمكن ان نعتمد على الرتبة لانهناك عمليةتصفح
        rentalSubCategory.Id = "xNew" + Math.floor(Math.random() * 1000000);
        rentalSubCategory.State = State.Create;
    
    //     s.AllSubCategory.push(angular.copy(rentalSubCategory));

        
        s.NewRental = angular.copy(rentalSubCategory);
  
      // Add Image After Copy Because is copy image  object  fire expression
        s.NewRental.Image64 = s.SubCategoryNewImage;
        s.NewRental.Image = s.imageeReview;

        s.AllSubCategory.push(s.NewRental);

        s.filter();
        s.Restart();
    };
    //save Edit rentalSubCategory
    s.Edit = (rentalSubCategory, newImagUrl, rentalEditImage) => {
        
        debugger;
        rentalSubCategory.NameArDuplicate = serviceView.isDuplicated({ 'NameAr': rentalSubCategory.NameAr }, s.AllSubCategory, rentalSubCategory.Id);
        rentalSubCategory.NameEnDuplicate = serviceView.isDuplicated({'NameEn': rentalSubCategory.NameEn}, s.AllSubCategory,rentalSubCategory.Id)
        if (rentalSubCategory.NameArDuplicate || rentalSubCategory.NameEnDuplicate)
            return;

        if (rentalSubCategory.State != State.Create)
            rentalSubCategory.State = State.Update;


        if (!IsNullOrEmptyOrUndefined(newImagUrl)) {
        rentalSubCategory.Image = newImagUrl;
        rentalSubCategory.Image64 = rentalEditImage;
        }

        s.RestartEdit();
        s.filter()

    };
    //Save Chenage
    s.SaveChenage = (rentalSubCategories) => {
        var dataForSave = filter('filterIsEquals')(rentalSubCategories, 'State', State.Create, State.Delete, State.Update);
        dataForSave = filter('filterIsNotConstantWithDelete')(dataForSave, 'Id', "xNew");
        if (dataForSave.length == 0) {
            toastr.error(Token.NoDataForSave, Token.Error);
            return;
        }

        if (Array.isArray(dataForSave))
            dataForSave.forEach(d=> {
                d.Image = null;
            });

        startBlock();
        service.SaveChenage(dataForSave).then((d) => {
            switch (d.data.RequestType) {
                case 1: {
                    toastr.success(d.data.Message, d.data.Title);
                    debugger;
                    s.GetSubCategories(s.SubCategory.FKCategory_Id);
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
            stopBlock();

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
            s.AllSubCategory.forEach((item, index) => {
                if (item.Id === s.DeleteId) {
                    if (item.State == State.Create)
                        s.AllSubCategory.splice(index, 1);
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
    s.Change =   (index) =>{
        if (s.ShowEdit != -1) {
            s.AllSubCategoryRepeat[s.ShowEdit] = s.RowEditBackup;
        }
        s.ShowEdit = index;
        s.RowEditBackup = angular.copy(s.AllSubCategoryRepeat[index]);
        s.imagEditReview = s.RowEditBackup.Image;
    };

    //Change
    s.Change = (index) => {

        if (s.ShowEdit != -1) {
            s.RestartEdit(true);
        }
        s.ShowEdit = index;
        s.RowEditBackup = angular.copy(s.AllSubCategoryRepeat[index]);
        s.imagEditReview = s.RowEditBackup.Image;
    };

    //Restart Edit
    s.RestartEdit = (resort) => {
        //Resort Backup 
        if (resort) {
            s.AllSubCategory.forEach((x, index) => {
                if (x.Id == s.RowEditBackup.Id)
                    s.AllSubCategory[index] = s.RowEditBackup;
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
    s.Restart = () => {
        s.SubCategory.NameAr = null;
        s.SubCategory.NameEn = null;
        s.SubCategory.ImagesCount = null;
        s.NewRental = null;

        s.IsSubmit = false;
        s.RentalNewImage = null;
        s.imageeReview = null;
        SetValueNullByNameJQ('rentalImage');

    };
    //Call Function
    s.CallFunctions =   (coountryId) =>{
        s.GetCategories();
        s.GetSubCategories(coountryId);
    }; s.CallFunctions();

}]);