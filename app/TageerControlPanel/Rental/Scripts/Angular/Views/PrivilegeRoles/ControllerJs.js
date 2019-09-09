myApp.controller("ctrlRolePrivileges", ["$scope", "$http", "serviceRolePrivileges", "serviceView", function (s, h, service, serviceView) {
    //Config
    s.ShowEdit = -1;

    //Get RolePrivileges
    s.GetPrivilegeRoles = function () {
        startBlock();
        service.GetPrivilegeRoles().then(function (d) {
            stopBlock();
            if (d.data == '')
                s.AllRolePrivileges = [];
            else
            s.AllRolePrivileges = d.data;
            console.log("AllRolePrivileges");
            console.log(s.AllRolePrivileges);
        });
    }; 

 //Get  Privileges
    s.GetPrivileges = function () {
        startBlock();
        service.GetPrivileges().then(function (d) {
            stopBlock();
            s.AllPrivileges = d.data;
            console.log("AllPrivileges");
            console.log(s.AllPrivileges);
        });
    }; 
    //Add New privileges 
    s.Create = function (privileges) {
        debugger;
        if (serviceView.CheckedDobuleValue('FKPrivilegeId', privileges.FKPrivilegeId, 'FkRole_Id', privileges.FkRole_Id, s.AllRolePrivileges)) {
            toastr.warning(s.CanNotDuplicatePrivilegesWiththisRole, s.warningTitle)
            return;
        }

        //تم وضع معرف لاننا فى عملية المسح نعتمد على المعرف ولا يمكن ان نعتمد على الرتبة لانهناك عمليةتصفح
        privileges.Id = "xNew" + Math.floor(Math.random() * 1000000);
        privileges.State = RequestType.Create;
        privileges.PrivilegeName = privileges.PrivilegeName;
        
        s.AllRolePrivileges.push(privileges);
        s.filter();
        s.Restart();
    };
    //save Edit RolePrivileges
    s.Edit = function (privileges, index) {



        if (serviceView.CheckedDobuleValueEdit('FKPrivilegeId', privileges.FKPrivilegeId,'FkRole_Id', privileges.FkRole_Id, s.AllRolePrivileges, index)) {
            toastr.warning(s.CanNotDuplicatePrivilegesWiththisRole, s.warningTitle)
            return;
        }

        if (privileges.State != RequestType.Create)
            privileges.State = RequestType.Update;
        s.RestartEdit();
    };
    //Save Chenage
    s.SaveChenage = function (privilegess) {
        startBlock();
        service.SaveChenage(privilegess).then(function (d) {
            stopBlock();
            switch (d.data.RequestType) {
                case 1: {
                    toastr.success(d.data.Message, d.data.Title);
                    s.GetPrivilegeRoles();
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
            s.AllRolePrivileges.forEach(function (item, index) {
                if (item.Id === s.DeleteId) {
                    if (item.State == RequestType.Create)
                        s.AllRolePrivileges.splice(index, 1);
                    else
                        item.State = RequestType.Delete
                    hideDeleteConfirm();
                    s.filter()
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
        s.RowEditBackup = angular.copy(s.AllRolePrivilegesRepeat[index]);
    };

    //Restart Edit
    s.RestartEdit = (resort) => {
        //Resort Backup 
        if (resort) {
            s.AllRolePrivileges.forEach((x, index) => {
                if (x.Id == s.RowEditBackup.Id)
                    s.AllRolePrivileges[index] = s.RowEditBackup;
            });
            s.filter();
        }
        s.ShowEdit = -1;
        s.IsEdit = false;
    };
 

    //Restart
    s.Restart = function () {
        s.RolePrivileges = {};
        s.pri = {};
        s.IsSubmit = false;
    };

    //Call Function
    s.CallFunctions = function () {
        s.GetPrivilegeRoles();
        s.GetPrivileges();
    }; s.CallFunctions();
}]);