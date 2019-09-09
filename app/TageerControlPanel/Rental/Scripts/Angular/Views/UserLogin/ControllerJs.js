myApp.controller("ctrlUserLogin", ["$scope", "$http", "serviceUserLogin", "serviceView", function (s, h, service, serviceView) {
    //Config
    s.ShowEdit = -1;
    s.UserSerialNo = getQueryStringValue("userSerial");


    //Get UserLogins
    s.GetUserLogins = function (userSerial) {
        if (userSerial == null || userSerial == undefined) return;

        startBlock();
        service.GetUserLogins(userSerial).then(function (d) {
            stopBlock();
            if (d.data == '')
                s.AllUserLogins = [];
            else
            s.AllUserLogins = d.data;
            console.log("AllUserLogins");
            console.log(s.AllUserLogins);
        });
    }; s.GetUserLogins(s.UserSerialNo);

    //Add New userLogin 
    s.Create = function (userLogin) {
       
        s.NameArDuplicate = serviceView.isDuplicated('NameAr', userLogin.NameAr, s.AllUserLogins);
        s.NameEnDuplicate = serviceView.isDuplicated('NameEn', userLogin.NameEn, s.AllUserLogins);

        if (s.NameArDuplicate || s.NameEnDuplicate)
            return;

        //تم وضع معرف لاننا فى عملية المسح نعتمد على المعرف ولا يمكن ان نعتمد على الرتبة لانهناك عمليةتصفح
        userLogin.Id = "xNew" + Math.floor(Math.random() * 1000000);
        userLogin.State = RequestType.Create;
        s.AllUserLogins.push(angular.copy(userLogin));
        s.Restart();
        s.filter();
    };
    //save Edit UserLogin
    s.Edit = function (userLogin) {
        if (userLogin.State != RequestType.Create)
            userLogin.State = RequestType.Update;
        s.RestartEdit();
    };
    //Save Chenage
    s.SaveChenage = function (userLogins) {
        startBlock();
        service.SaveChenage(userLogins).then(function (d) {
            stopBlock();
            switch (d.data.RequestType) {
                case 1: {
                    toastr.success(d.data.Message, d.data.Title);
                    s.GetUserLogins();
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
            s.AllUserLogins.forEach(function (item,index  ) {
                if (item.Id === s.DeleteId) {
                    if (item.State == RequestType.Create)
                        s.AllUserLogins.splice(index, 1);
                    else
                        item.State = RequestType.Delete
                    hideDeleteConfirm();

                    s.filter();

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
        s.RowEditBackup = angular.copy(s.AllUserLoginsRepeat[index]);
    };

    //Restart Edit
    s.RestartEdit = (resort) => {
        //Resort Backup 
        if (resort) {
            s.AllUserLogins.forEach((x, index) => {
                if (x.Id == s.RowEditBackup.Id)
                    s.AllUserLogins[index] = s.RowEditBackup;
            });
            s.filter();
        }
        s.ShowEdit = -1;
        s.IsEdit = false;
    };

    //Restart
    s.Restart = function () {
        s.UserLogin = {};
        s.IsSubmit = false;
    };

    //Call Function
    s.CallFunctions = function () {
        s.GetUserLogins();
    }; s.CallFunctions();
}]);