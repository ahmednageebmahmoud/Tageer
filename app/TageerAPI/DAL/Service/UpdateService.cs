using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using DAL.Bll;
using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;

namespace DAL.Service
{
    public class UpdateService
    {
        TageerEntities db;
        CheckedService CheckedS;
        List<HistoryDetailVM> HistoryDetails = new List<HistoryDetailVM>();


        public UpdateService(TageerEntities _db)
        {
            this.CheckedS = new CheckedService(_db);
            this.db = _db;
        }



        internal object UpdateUserData(UserDataVM userDataVM)
        {
            var UserDataUpdate = db.Users.Find(AccessToken.GetUserId());

            //Check Is Update Language
            if(userDataVM.IsUpdateLanguage)
            {

                if (userDataVM.LangId<=0)
                    return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Language} : {Token.FiledIsRequired}");

                if (!db.LanguageTypes.Any(c=> c.Id==userDataVM.LangId))
                    return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Language} : {Token.NotFound}");

                UserDataUpdate.
                            FKLanguage_Id = userDataVM.LangId;

            }

            //Check Is Update Email 
            else if (userDataVM.IsUpdateEmail)
            {
                if (string.IsNullOrEmpty(userDataVM.Email))
                    return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Email} : {Token.FiledIsRequired}");

                if (!CheckedS.EmailIsCorrect(userDataVM.Email))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Email} : {Token.InvalidData}");

                if (db.Users.Where(c=> c.Id!=UserDataUpdate.Id).Any(c => c.Email == userDataVM.Email))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Email} : {Token.BeforeUsed}");

                UserDataUpdate.Email = userDataVM.Email;
                return null;
            }

            //Check Is Update Phone 
            else if (userDataVM.IsUpdatePhone)
            {
                if (string.IsNullOrEmpty(userDataVM.Phone))
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Phone + " >> " + Token.FiledIsRequired };

                if (!CheckedS.NumberValid(userDataVM.Phone))
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Phone + " >> " + Token.InvalidNumber };



                if (userDataVM.Phone.Length > 15)
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Phone + " >> " + Token.MaxLength + "= 15" };


                UserDataUpdate.PhoneNumber = userDataVM.Phone;
            }
            //Check Is Update Password 
            else if (userDataVM.IsUpdatePassword)
            {
                if (string.IsNullOrEmpty(userDataVM.Password))
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Password + " >> " + Token.FiledIsRequired };
                UserDataUpdate.Password = userDataVM.Password;
            }
            //Check Is Update UserName 
            else if (userDataVM.IsUpdateUserName)
            {
                if (string.IsNullOrEmpty(userDataVM.UserName))
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Password + " >> " + Token.FiledIsRequired };

                if (db.Users.Where(c=> c.Id!=UserDataUpdate.Id).Any(c => c.UserName == userDataVM.UserName))
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.UserName + " >> " + Token.ErrorDuplicate };

                UserDataUpdate.UserName = userDataVM.UserName;
            }
            //Check Is Update Full Name 
            else if (userDataVM.IsUpdateFullName)
            {
                if (string.IsNullOrEmpty(userDataVM.FullName))
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FullName + " >> " + Token.FiledIsRequired };

                UserDataUpdate.FullName = userDataVM.FullName;
            }
           
            //Check Is Update Country 
            else if (userDataVM.IsUpdateCountry)
            {
                if (userDataVM.CountryId <= 0)
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Country + " >> " + Token.FiledIsRequired };

                UserDataUpdate.Address.FKCountry_Id = userDataVM.CountryId;
            }
            //Check Is Update City 
            else if (userDataVM.IsUpdateCity)
            {
                if (string.IsNullOrEmpty(userDataVM.City))
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.City + " >> " + Token.FiledIsRequired };

                UserDataUpdate.Address.City = userDataVM.City;
            }
            //Check Is Update Province 
            else if (userDataVM.IsUpdateProvince)
            {
                if (userDataVM.ProvinceId <= 0)
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Province + " >> " + Token.FiledIsRequired };

                UserDataUpdate.Address.FkProvince_Id = userDataVM.ProvinceId;
            }
            //Check Is Update Profile Image 
            else if (userDataVM.IsUpdateImageProfile)
            {
                if (string.IsNullOrEmpty(userDataVM.FileBase64))
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.ImageProfile + " >> " + Token.FiledIsRequired };

                //Uplaod Image 
                FileSaveVM FileSave = FileService.SaveFileBase64(new FileSaveVM()
                {
                    FileBase64 = userDataVM.FileBase64,
                    ServerPathSave = "/Files/Images/Users/Profile/"
                });


                if (!FileSave.IsSave)
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotSaveFile };

                UserDataUpdate.AllFile.FileUrl = FileSave.SavedPath;
                UserDataUpdate.AllFile.FKAppInformation_Id = AppInformationEnumVM.ApiLink
                    ;

            }

            return null;
        }

        /// <summary>
        /// تبديل تفضيل الاعلان
        /// </summary>
        /// <param name="ad"></param>
        /// <returns></returns>
        internal object AdFavoriteToggle(Ad ad)
        {
            if (ad == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.AdNotFound);

            var Favo = ad.AdFavorites.SingleOrDefault(c => c.FkUser_Id == AccessToken.UserId);

            //check is favorite 
            if (Favo == null)
            {
                //favorite
                ad.AdFavorites.Add(new AdFavorite
                {
                    FkUser_Id = AccessToken.GetUserId(),

                });
            }
            else
            {
                //un favorite
                db.AdFavorites.Remove(Favo);
            }
            return null;
        }



    }//End Class
}
