using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Enums;
using DAL.Service;
using DAL.Models.ViewModel;
using System.Web;
using DAL.Resource;

namespace DAL.BLL
{
    public class UserProfileData : BasicBLL
    {
        //GetUserData
        public object GetUserData(long userId)
        {
            var data = db.Users.Where(x => x.Id == userId).Single();
            if (data.AllFile  == null)
                data.AllFile = new AllFile() { FileUrl = DefaultsVM.ImageDefult };

            return new
            {
                data.UserName,
                data.FullName,
                ImageUrl = data.AllFile.FullFileUrl
            };

        }

        public object GetUserDataForUpdate(long userId)
        {
            var User = db.Users.Where(x => x.Id == userId).Single();
            if (User == null)
                return null;

            return new
            {
                User.Email,
                User.UserName,
                User.FullName,
                User.PhoneNumber,
                User.Address.Street,
                User.Address.FKCountry_Id,
                User.FKLanguage_Id,
                ImageUrl = User.AllFile.FullFileUrl,
            };
        }

        public object SaveChange( Address address, User user, HttpPostedFileBase image)
        {
            try
            {
                var ObjectReturn = UpdateS.User(address, user, image);
                if (ObjectReturn != null)
                    return ObjectReturn;

                db.SaveChanges();

                var User = db.Users.Find(user.Id);
                CookieService.SetUserInCookie(User);
                LanguageService.SetCulture(User.LanguageType.Code);
                this.RemoveFiles();

                return new { RequestType = RequestTypeEnumVM.Success, Message = Token.Saved };
            }
            catch (Exception ex)
            {
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange };
            }

        }

    }//end Class
}
