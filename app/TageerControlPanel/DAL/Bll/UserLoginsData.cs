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
    public class UserLoginsData : BasicBLL
    {

        //Get User Logins
        public object GetUserLogins(string id, int take, int skip)
        {
            var User = db.Users.Find(id);
            if (User == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.UserNotFound);

            var UserLogins = User.UserLogins.OrderByDescending(c => c.Id).Skip(skip).Take(take).ToList();
            if (UserLogins.Count==0)
            {
                if (skip == 0)
                    return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResult);
                    return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResultMore);
            }
            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, UserLogins.Select(x => new { x.Id, x.User.FullName, x.User.UserName, x.IsSuccess, LoginDate = DateService.GetDateByCulture(x.LoginDate) }));
        }



        public void Dispose()
        {
            db.Dispose();
            CheckedS.Dispose();
               }
    }//End Class
}
