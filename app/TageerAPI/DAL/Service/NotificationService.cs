using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using System.Text.RegularExpressions;
using DAL.Models.ViewModel;
using DAL.Resource;

namespace DAL.Service
{
    public class NotificationService : IDisposable
    {
        TageerEntities db = new TageerEntities();

        UserService UserS = new UserService();




        public void Dispose()
        {
            UserS.Dispose();
            db.Dispose();
        }

        public object GetNotifications(int userId, int skip, int take)
        {
            return null; 
        }

       

        public object ClintReadNotify(int? notifyId)
        {
            try
            {

                return new ResponseVM {RequestType=RequestTypeEnumVM.Success,Message=Token.Saved };
            }
            catch (Exception ex)
            {
                return new ResponseVM {RequestType=RequestTypeEnumVM.Error,Message=Token.Error,InnerException=ex.InnerException };
            }
        }

        string GetNotifyMessage(int stateId, string userName, string name)
        {

            if (stateId == StateEnumVM.Update)
                return string.Format("{1} {2} {3} {4}",  Token.HasBeenUpdated, name );
            else if (stateId == StateEnumVM.Delete)                                  
                return string.Format("{1} {2} {3} {4}",  Token.HasBeenDeleted, name );
            else if (stateId == StateEnumVM.Reject)                                  
                return string.Format("{1} {2} {3} {4}",  Token.ItsBeenRejected, name );
            else if (stateId == StateEnumVM.Approve)                                 
                return string.Format("{1} {2} {3} {4}",  Token.IveBeenApproved, name );

            return null;
        }


        //Get Notifications For Application
        public object GetNotificationsForApplication(int userId, int skip, int take)
        {
            return new ResponseVM {RequestType=RequestTypeEnumVM.Success,IsData=true, Data = GetNotifications(userId, skip, take) };
        }

    }//End Class
}
