using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Enums;
using DAL.Models.ViewModel;
using DAL.Service;
using System.Web;
using DAL.Resource;

namespace DAL.BLL
{
    public class UserProfilesData : BasicBLL
    {


        /// <summary>
        /// الحصول على معلومات
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public object GtUserProfileData(string userName)
        {
            var User = db.Users.SingleOrDefault(c => c.UserName == userName);
            if (User == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.UserNotFound);


            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, new
            {
                User.UserName,
                JoinedDate = User.CreateDate,
           
            });
        }

    }//end Class
}
