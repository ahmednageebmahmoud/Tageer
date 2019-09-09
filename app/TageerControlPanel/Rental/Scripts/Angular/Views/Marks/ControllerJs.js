/// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlMarks', ['$scope', '$http', '$filter', 'serviceMarks', 'serviceView', function (s, h, filter, service, serviceView) {

    //<!--Config-->
    s.Token = Token;
    s.State = State;
    s.Marks = [];
    //</!--Config-->

    //Get Marks
    s.getMarks = () => {
        startBlock();
        service.getMarks().then((d) => {
            if (d.data != "" && d.data != null)
                s.Marks = d.data;
            else
                s.Marks = [];
            co("R-getMarks", d);
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
        s.Mark.NameArDuplicate = serviceView.isDuplicated({ 'NameAr': s.Mark.NameAr }, s.Marks);
        s.Mark.NameEnDuplicate = serviceView.isDuplicated({ 'NameEn': s.Mark.NameEn }, s.Marks);

        if (s.Mark.NameArDuplicate || s.Mark.NameEnDuplicate)
            return;

        //Added To List
        s.Mark.State = State.Create;
        s.Mark.Id = "xNew" + Math.floor(Math.random() * 1000000);
        s.Mark.MarkName = Service.isEn ? s.Mark.NameEn : s.Mark.NameAr;
        s.Marks.push(angular.copy(s.Mark));

        s.filter();
        s.Mark.NameAr = null;
        s.Mark.NameEn = null;
    };

    //Update
    s.update = (nationality) => {
        //If Dublicate
        nationality.NameArDuplicate = serviceView.isDuplicated({ 'NameAr': nationality.NameAr }, s.Marks, nationality.Id);
        nationality.NameEnDuplicate = serviceView.isDuplicated({ 'NameEn': nationality.NameEn }, s.Marks, nationality.Id);

        if (nationality.NameArDuplicate || nationality.NameEnDuplicate)
            return;

        if (nationality.State != State.Create)
            nationality.State = State.Update;
        s.restartUpdate();
    };

    //Change For Update
    s.changeForUpdate = (index) => {
        if (s.ShowUpdate != -1) {
            s.MarksRepeat[s.ShowUpdate] = s.RowUpdateBackup;
        }
        s.ShowUpdate = index;
        s.RowUpdateBackup = angular.copy(s.MarksRepeat[index]);
    };

    //Restart Update
    s.restartUpdate = (resort) => {
        //Resort Backup 
        if (resort) {
            s.Marks.forEach((nationality, index) => {
                if (nationality.Id == s.RowUpdateBackup.Id) {
                    s.Marks[index] = s.RowUpdateBackup;
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
            s.Marks.forEach((item, index) => {
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
        var dataForSave = filter('filterIsEquals')(s.Marks, 'State', State.Create, State.Delete, State.Update);
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
                        s.getMarks();
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
        s.getMarks();
    }; s.callFunctions();


    $(window).on('beforeunload', function () {
        var dataForSave = filter('filterIsEquals')(s.Marks, 'State', State.Create, State.Delete, State.Update);
        dataForSave = filter('filterIsNotConstantWithDelete')(dataForSave, 'Id', "xNew");
        if (dataForSave.length > 0)
            return "";
    });
}]);