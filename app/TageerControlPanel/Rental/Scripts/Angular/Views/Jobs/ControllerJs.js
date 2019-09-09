myApp.controller("ctrlJobs", ["$scope", "$http", "serviceJobs", "serviceView", function (s, h, service, serviceView) {
    //Config
    s.ShowEdit = -1;

    //Get Jobs
    s.GetJobs =   () =>{
        startBlock();
        service.GetJobs().then((d) => {
            stopBlock();
            if (d.data == '')
                s.AllJobs = [];
            else
            s.AllJobs = d.data;
            console.log("AllJobs");
            console.log(s.AllJobs);
        });
    }; 

    //Add New job 
    s.Create = (job) => {
       
        s.NameArDuplicate = serviceView.isDuplicated('NameAr', job.NameAr, s.AllJobs);
        s.NameEnDuplicate = serviceView.isDuplicated('NameEn', job.NameEn, s.AllJobs);

        if (s.NameArDuplicate || s.NameEnDuplicate)
            return;

        //تم وضع معرف لاننا فى عملية المسح نعتمد على المعرف ولا يمكن ان نعتمد على الرتبة لانهناك عمليةتصفح
        job.Id = "xNew" + Math.floor(Math.random() * 1000000);
        job.State = RequestType.Create;
        s.AllJobs.push(angular.copy(job));
        s.Restart();
        s.filter();
    };
    //save Edit Job
    s.Edit = (job) => {
        job.NameArDuplicate = serviceView.isDuplicatedEdit('NameAr', job.NameAr, s.AllJobs, job.Id);
        job.NameEnDuplicate = serviceView.isDuplicatedEdit('NameEn', job.NameEn, s.AllJobs, job.Id);
        if (job.NameArDuplicate || job.NameEnDuplicate)
            return;

        if (job.State != RequestType.Create)
            job.State = RequestType.Update;
        s.RestartEdit();
    };
    //Save Chenage
    s.SaveChenage =   (jobs) =>{
        startBlock();
        service.SaveChenage(jobs).then((d) => {
            stopBlock();
            switch (d.data.RequestType) {
                case 1: {
                    toastr.success(d.data.Message, d.data.Title);
                    s.GetJobs();
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
    s.DeleteConfirm = (id) => {
        s.DeleteId = id;
        showDeleteConfirm();
    };
    //Delete
    s.Delete =   ()=> {
        if (s.DeleteId != null) {
            s.AllJobs.forEach(  (item,index  )=> {
                if (item.Id === s.DeleteId) {
                    if (item.State == RequestType.Create)
                        s.AllJobs.splice(index, 1);
                    else
                        item.State = RequestType.Delete
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
    s.Change = (index) => {

        if (s.ShowEdit != -1) {
            s.RestartEdit(true);
        }
        s.ShowEdit = index;
        s.RowEditBackup = angular.copy(s.AllJobsRepeat[index]);
    };

    //Restart Edit
    s.RestartEdit = (resort) => {
        //Resort Backup 
        if (resort) {
            s.AllJobs.forEach((x, index) => {
                if (x.Id == s.RowEditBackup.Id)
                    s.AllJobs[index] = s.RowEditBackup;
            });
            s.filter();
        }
        s.ShowEdit = -1;
        s.IsEdit = false;
    };



    //Restart
    s.Restart = () => {
        s.Job = {};
        s.IsSubmit = false;
    };

    //Call Function
    s.CallFunctions = () => {
        s.GetJobs();
    }; s.CallFunctions();
}]);