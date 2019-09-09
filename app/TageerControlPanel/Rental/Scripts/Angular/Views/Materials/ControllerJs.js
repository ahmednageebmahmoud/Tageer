/// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlMaterials', ['$scope', '$http', '$filter', 'serviceMaterials', 'serviceView', function (s, h, filter, service, serviceView) {

    //<!--Config-->
    s.Token = Token;
    s.State = State;
    s.Materials = [];
    //</!--Config-->

    //Get Materials
    s.getMaterials = () => {
        startBlock();
        service.getMaterials().then((d) => {
            if (d.data != "" && d.data != null)
                s.Materials = d.data;
            else
                s.Materials = [];
            co("R-getMaterials", d);
            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);
            toastr.error(Token.OrSomeErrorInServer, Token.Error); co("Error Login", error.data);
            stopBlock();
        });
    };


    //Create
    s.create = () => {

        //If Dublicate
        s.Material.NameArDuplicate = serviceView.isDuplicated({ 'NameAr': s.Material.NameAr }, s.Materials);
        s.Material.NameEnDuplicate = serviceView.isDuplicated({ 'NameEn': s.Material.NameEn }, s.Materials);

        if (s.Material.NameArDuplicate || s.Material.NameEnDuplicate)
            return;

        //Added To List
        s.Material.State = State.Create;
        s.Material.Id = "xNew" + Math.floor(Math.random() * 1000000);
        s.Material.MaterialName = Service.isEn ? s.Material.NameEn : s.Material.NameAr;
        s.Materials.push(angular.copy(s.Material));

        s.filter();
        s.Material.NameAr = null;
        s.Material.NameEn = null;
    };

    //Update
    s.update = (nationality) => {
        //If Dublicate
        nationality.NameArDuplicate = serviceView.isDuplicated({ 'NameAr': nationality.NameAr }, s.Materials, nationality.Id);
        nationality.NameEnDuplicate = serviceView.isDuplicated({ 'NameEn': nationality.NameEn }, s.Materials, nationality.Id);

        if (nationality.NameArDuplicate || nationality.NameEnDuplicate)
            return;

        if (nationality.State != State.Create)
            nationality.State = State.Update;
        s.restartUpdate();
    };

    //Change For Update
    s.changeForUpdate = (index) => {
        if (s.ShowUpdate != -1) {
            s.MaterialsRepeat[s.ShowUpdate] = s.RowUpdateBackup;
        }
        s.ShowUpdate = index;
        s.RowUpdateBackup = angular.copy(s.MaterialsRepeat[index]);
    };

    //Restart Update
    s.restartUpdate = (resort) => {
        //Resort Backup 
        if (resort) {
            s.Materials.forEach((nationality, index) => {
                if (nationality.Id == s.RowUpdateBackup.Id) {
                    s.Materials[index] = s.RowUpdateBackup;
                }
            });
            // s.filter();
        }
        s.ShowUpdate = -1;
        s.IsUpdate = false;
    };

    //Delete Confirm
    s.deleteConfirm = (id) => {
        s.deleteId = id;
        showDeleteConfirm();
    };

    //Delete
    s.delete = () => {
        if (s.deleteId != null) {
            s.Materials.forEach((item, index) => {
                if (item.Id === s.deleteId) {
                    if (item.State == State.Create)
                        item.State = State.Delete
                    else
                        item.State = State.Delete
                    hideDeleteConfirm();
                    s.filter();
                }
            });
        }
    };

    //Cancel Delete
    s.cancelDelete = () => {
        hideDeleteConfirm();
        s.deleteId = null;
    };

    //Undo Delete
    s.undoDelete = nationality=> {
        if (nationality.Id.toString().includes('xNew'))
            nationality.State = State.Create;
        else
            nationality.State = null;

    };

    //Save Change
    s.saveChange = () => {
        //Check Data For Save
        var dataForSave = filter('filterIsEquals')(s.Materials, 'State', State.Create, State.Delete, State.Update);
        dataForSave = filter('filterIsNotConstantWithDelete')(dataForSave, 'Id', "xNew");
        if (dataForSave.length == 0) {

            toastr.error(Token.NoDataForSave, Token.Error);
            return;
        }

        startBlock();
        service.saveChange(dataForSave).then(d=> {
            co("R-SaveChange", d);
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        toastr.success(d.data.Message, Token.Success);
                        s.getMaterials();
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
            stopBlock();
        }).catch((error) => {
            if (!navigator.onLine)
                toastr.error(Token.ICantCallToServer, Token.Error);
            toastr.error(Token.OrSomeErrorInServer, Token.Error); co("Error Login", error.data);
            stopBlock();
        });

    };


    //Restart
    s.rest = () => {

    };

    //Call Functions
    s.callFunctions = () => {
        s.getMaterials();
    }; s.callFunctions();


    $(window).on('beforeunload', function () {
        var dataForSave = filter('filterIsEquals')(s.Materials, 'State', State.Create, State.Delete, State.Update);
        dataForSave = filter('filterIsNotConstantWithDelete')(dataForSave, 'Id', "xNew");
        if (dataForSave.length > 0)
            return "";
    });
}]);