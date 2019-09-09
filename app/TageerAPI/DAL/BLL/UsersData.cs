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
    public class UsersData : BasicBLL
    {
        AdsData AdsData = new AdsData();

        //Get Notifications
        public object GetNotifications(long lastNotifiId, int takeCount)
        {
            try
            {
                bool IsEn = LanguageService.IsEn;
                var Notifications = db.GetUserNotifications(AccessToken.GetUserId(), lastNotifiId, takeCount)
                    .Select(c => new NotificationVM
                    {
                        Id = c.Id,
                        Title = IsEn ? c.TitleEn : c.TitleAr,
                        DateTimeSince = DateService.CaltDateTimeSince(c.DataTime)
                    }).ToList();

                if (Notifications.Count == 0)
                {
                    if (lastNotifiId == 0)
                        return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResult);
                    return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResultMore);
                }

                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, Notifications);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }
        }

        //Get Favorites
        public object GetFavorites(int lastAdId, int takeCount)
        {
            var UserFavoAds = db.SelectAdsByFilter(lastAdId, takeCount, UserLoggadId, null, null, null, null, null, null, true, null, null).ToList();

            //Skip And Take 
            if (UserFavoAds.Count == 0)
            {
                if (lastAdId == 0)
                    return new ResponseVM(RequestTypeEnumVM.Error, Token.NoResult);
                return new ResponseVM(RequestTypeEnumVM.Error, Token.NoResultMore);
            }

            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, UserFavoAds.Select(c => AdsData.GetSampleAdInformation(c)));
        }




        /// <summary>
        /// Save Change Calling From Api
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public object SaveChenage(UserVM user, bool isUpdateData, bool isUpdateCountry = false)
        {
            //PagesAllow PageAllow = PageService.GetPageAllow(PageEnumVM.Users);


            try
            {

                var ObjectReturn = CreateS.User(user);

                if (ObjectReturn != null)
                    return ObjectReturn;

                db.SaveChanges();

                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = isUpdateData || isUpdateData ? Token.Updated : Token.Created };

            }
            catch (Exception ex)
            {
                return new ResponseVM { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange, DevMessage = ex.Message };
            }
        }

        public object ResendActiveCodeToPhone(string phoneNumber)
        {
            int Status = db.UpdateActiveCode(phoneNumber, 4444).First().Value;
            if (Status == 1)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.InvalidPhoneNotFound);

            return new ResponseVM(RequestTypeEnumVM.Success, Token.SuccessResendCode);

        }

        public object GetCurrentUserInformation()
        {
          
            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success,new { UserInformation = db.Users_SelectByPk(this.UserLoggadId).GroupBy(c => new
            {
                c.Id,
                c.UserName,
                c.Email,
                c.Password,
                c.FullName,
                c.FKLanguage_Id,
                c.PhoneNumber,
                c.PhoneActiveCode,
                c.IsPhoneActivated,
                c.LanguageCode,
                c.Image,
                c.CompanyDescription,
                c.CompanyActivityNameAr,
                c.CompanyActivityNameEn,
                c.CompanyActivityNameId
            }).Select(c => new
            {
                Id = c.Key.Id,
                UserName = c.Key.UserName,
                Email = c.Key.Email,
                Password = c.Key.Password,
                FullName = c.Key.FullName,
                LanguageId = c.Key.FKLanguage_Id,
                PhoneNumber = c.Key.PhoneNumber,
                LanguageCode = c.Key.LanguageCode,
                Image = c.Key.Image,
                IsCompany = !string.IsNullOrEmpty(c.Key.CompanyDescription),

                Company = new CompanyInfomrationVM
                {
                    Description = c.Key.CompanyDescription,
                    ActivityId = c.Key.CompanyActivityNameId.HasValue ? c.Key.CompanyActivityNameId.Value : 0,
                    ActivityName = this.LangIsEn ? c.Key.CompanyActivityNameEn : c.Key.CompanyActivityNameAr,
                },
                ActivityId = c.Key.CompanyActivityNameId,
                CompanyOffices = c.Select(v => new CompanyOfficeVM
                {
                    Address = v.CompanyOffice_Street,
                    CountryId = v.CompanyOffice_CountryId.HasValue ? v.CompanyOffice_CountryId.Value : 0,
                    Latitude = v.CompanyOfficeLocation_Latitude,
                    Longitude = v.CompanyOfficeLocation_Longitude,
                })
            })
        });
        }

        public object GetUserIformation(long userId)
        {
            return
                db.Users_SelectByPk(this.UserLoggadId).GroupBy(c => new
                {
                    c.Id,
                    c.UserName,
                    c.Email,
                    c.Password,
                    c.FullName,
                    c.FKLanguage_Id,
                    c.PhoneNumber,
                    c.PhoneActiveCode,
                    c.IsPhoneActivated,
                    c.LanguageCode,
                    c.Image,
                    c.CompanyDescription,
                    c.CompanyActivityNameAr,
                    c.CompanyActivityNameEn,
                    c.CompanyActivityNameId
                }).Select(c => new
                {
                    Id = c.Key.Id,
                    UserName = c.Key.UserName,
                    Email = c.Key.Email,
                    Password = c.Key.Password,
                    FullName = c.Key.FullName,
                    LanguageId = c.Key.FKLanguage_Id,
                    PhoneNumber = c.Key.PhoneNumber,
                    LanguageCode = c.Key.LanguageCode,
                    Image = c.Key.Image,
                    IsCompany = !string.IsNullOrEmpty(c.Key.CompanyDescription),

                    Company = new CompanyInfomrationVM
                    {
                        Description = c.Key.CompanyDescription,
                        ActivityId = c.Key.CompanyActivityNameId.HasValue ? c.Key.CompanyActivityNameId.Value : 0,
                        ActivityName = this.LangIsEn ? c.Key.CompanyActivityNameEn : c.Key.CompanyActivityNameAr,
                    },
                    ActivityId = c.Key.CompanyActivityNameId,
                    CompanyOffices = c.Select(v => new CompanyOfficeVM
                    {
                        Address = v.CompanyOffice_Street,
                        CountryId = v.CompanyOffice_CountryId.HasValue ? v.CompanyOffice_CountryId.Value : 0,
                        Latitude = v.CompanyOfficeLocation_Latitude,
                        Longitude = v.CompanyOfficeLocation_Longitude,
                    })
                });
        }
        public object ActivePhoneNumber(string phoneNumber, int code)
        {

            int Status = db.ActiveAccountByPhoneAndCode(phoneNumber, code).First().Value;
            // Invalid Phone Number
            if (Status == 1)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.InvalidPhoneNotFound);
            //Invalid Active Code
            if (Status == 2)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.InvalidCode);
            //Already Activated
            if (Status == 3)
                return new ResponseVM(RequestTypeEnumVM.Info, Token.AlreadyActivated);

            var User = db.Users.First(c=> c.PhoneNumber==phoneNumber);
            

            LanguageService.SetCulture(User.LanguageType.Code);
            //Now Create Access Token
            AccessTokenVM AccessToken = CreateS.CreateToken(User, User.LanguageType.Code, false);
            //Activated
            return new ResponseVM(RequestTypeEnumVM.Success, Token.Activated,
                new
                {
                    IsActivePhone = true,
                    UserInformation = new UsersData().GetUserIformation(User.Id),
                    AccessToken
                });
        }

    }//end Class
}
