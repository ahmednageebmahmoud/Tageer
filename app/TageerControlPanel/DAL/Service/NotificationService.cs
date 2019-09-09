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

       
       
        string GetNotifyMessage(int stateId, string userName, string page, string name)
        {
            string Name = name;

            if (stateId == StateEnumVM.Create)
                return string.Format("{0} \n {1} {2} {3} {4}", userName, Token.HasCreatedThe, Name, Token.In, page);
            else if (stateId == StateEnumVM.Update)
                return string.Format("{0} \n {1} {2} {3} {4}", userName, Token.HasUpdatedThe, Name, Token.From, page);
            else if (stateId == StateEnumVM.Delete)
                return string.Format("{0} \n {1} {2} {3} {4}", userName, Token.HasDeletedThe, Name, Token.From, page);
                        return null;
        }


      
    }//End Class
}
