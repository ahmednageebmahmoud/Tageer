using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.BLL
{
    public class ActivitiesData : BasicBLL
    {

        //Get Activities
        public object GetActivities() {
            var Activity = db.Activities.ToList();
            if (Activity.Count == 0)
                return null;
            return Activity.Select(x => new { x.Id, x.NameAr,x.NameEn,x.ActivityName}).ToList();
        }

        public object GetSimpleActivities()
        {
            var Activity = db.Activities.ToList();
            if (Activity.Count == 0)
                return new ResponseVM { RequestType = RequestTypeEnumVM.Info, Message = Token.DataNotFound };
            return new ResponseVM
            {
                RequestType = RequestTypeEnumVM.Success,
                IsData = true,
                Data = Activity.Select(x => new { x.Id, x.ActivityName }).ToList()
            };
        }

        //Get Flags
        public object GetFlags()
        {
          return DefaultsVM.Flags.ToList();
        }

        public void Dispose()
        {
            db.Dispose();
        }

        //Save Chenage
        public object SaveChenage(Activity[] countries)
        {
            try
            {
                foreach (Activity Activity in countries)
                {
                    if (Activity.State == StateEnumVM.Delete)
                    {
                        //Delete
                        var ObjectReturn = DeleteS.Activity(Activity);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (Activity.State == StateEnumVM.Update)
                    {
                        //Update
                        var ObjectReturn = UpdateS.Activity(Activity);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (Activity.State == StateEnumVM.Create)
                    {
                        //Create
                        var ObjectReturn = CreateS.Activity(Activity);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                }
                db.SaveChanges();
                return new { RequestType = RequestTypeEnumVM.Success, Message = Token.Saved };
            }
            catch (Exception ex)
            {
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange };
            }
        }

    }//End Class
}
