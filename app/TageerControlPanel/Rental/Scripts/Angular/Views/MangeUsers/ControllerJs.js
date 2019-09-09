myApp.controller("ctrlMangeUsers", ["$scope", "$http", "serviceMangeUsers", "serviceView", function (s, h, service, serviceView) {
    //Config
    s.ShowEdit = -1;

    //GetUsers
    s.GetUsers = () => {
        startBlock();
        service.GetUsers().then(  (d) =>{
            stopBlock();
            if (d.data === '')
                s.AllMangeUsers = [];
            else
            s.AllMangeUsers = d.data;
            console.log("AllMangeUsers");
            console.log(s.AllMangeUsers);
        });
    }; 

    //Add New mangeUser 
    s.Create = (mangeUser) => {
        //تم وضع معرف لاننا فى عملية المسح نعتمد على المعرف ولا يمكن ان نعتمد على الرتبة لانهناك عمليةتصفح
        mangeUser.Id = "xNew" + Math.floor(Math.random() * 1000000);
        mangeUser.State = RequestType.Create;
        s.AllMangeUsers.push(angular.copy(mangeUser));
        s.Restart();
        s.filter();
    };
    //save Edit MangeUsers
    s.Edit =   (mangeUser) =>{

        if (mangeUser.State !== RequestType.Create)
            mangeUser.State = RequestType.Update;
        s.RestartEdit();
    };
    //Save Chenage
    s.SaveChenage = (mangeUsers) => {
        startBlock();
        service.SaveChenage(mangeUsers).then((d) => {
            stopBlock();
            switch (d.data.RequestType) {
                case 1: {
                    toastr.success(d.data.Message, d.data.Title);
                }
                    break;
                case 2: {
                    toastr.error(d.data.Message, d.data.Title);

                }
                    break;
                case 3: {
                    toastr.warning(d.data.Message, d.data.Title);

                }
                    break;
                case 4: {
                    toastr.info(d.data.Message, d.data.Title);

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
    s.Delete = () => {
        if (s.DeleteId !== null) {
            s.AllMangeUsers.forEach((item, index) => {
                if (item.Id === s.DeleteId) {
                    if (item.State === RequestType.Create)
                        s.AllMangeUsers.splice(index, 1);
                    else
                        item.State = RequestType.Delete;
                    hideDeleteConfirm();
                    s.filter()
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
        s.RowEditBackup = angular.copy(s.AllMangeUsers[index]);
    };

    //Restart Edit
    s.RestartEdit = (resort) => {
        //Resort Backup 
        if (resort) {
            s.AllMangeUsers.forEach((x, index) => {
                if (x.Id == s.RowEditBackup.Id)
                    s.AllMangeUsers[index] = s.RowEditBackup;
            });
            s.filter();
        }
        s.ShowEdit = -1;
        s.IsEdit = false;
    };


    //Restart
    s.Restart = () => {
        s.MangeUsers = {};
        s.IsSubmit = false;
    };

    //Call Function
    s.CallFunctions = () => {
        s.GetUsers();
    }; s.CallFunctions();
}]);