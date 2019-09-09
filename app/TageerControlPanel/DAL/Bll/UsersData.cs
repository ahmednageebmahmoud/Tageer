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
        UserService UserS = new UserService();
        public object GetUsers(int take, int skip, int? countryId, int? accountTypeId, bool? isBlocked, DateTime? createDateFrom, DateTime? createDateTo)
        {
            try
            {
                var Result = db.SelectUsersByFilter(skip, take, accountTypeId, isBlocked, countryId, createDateFrom, createDateTo).ToList().Select(c => new
                {
                    c.Id,
                    CreateDate = DateService.GetDateTimeByCulture(c.CreateDate),
                    c.Email,
                    c.FullName,
                    c.Image,
                    c.IsBlocked,
                    Country = LanguageService.IsEn ? c.NameEn : c.NameAr,
                    c.PhoneNumber,
                    c.UserName
                }).ToList();

                if (Result.Count == 0)
                {
                    if (skip == 0)
                        return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResult);
                    return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResultMore);
                }
                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, Result);

            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }
        }

        //GetUserData
        public object GetUserData(int userId)
        {
            var User = db.Users.Find(userId);

            if (User == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.UserNotFound);


            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, new
            {
                User.UserName,
                User.FullName
            });


        }

        //Save Chenage
        public object SaveChenage( Address address, User user, UserRole[] userRoles, HttpPostedFileBase image, bool isUpdate)
        {
            try
            {
                var ObjectReturn = new object();
                if (isUpdate)
                {
                    ObjectReturn = UpdateS.User(address, user, image);
                }
                else
                {
                    ObjectReturn = CreateS.User( address, user, userRoles, image);
                }

                if (ObjectReturn != null)
                    return ObjectReturn;

                db.SaveChanges();

                this.RemoveFiles();
                if (isUpdate)
                    return new { RequestType = RequestTypeEnumVM.Success, Message = Token.Saved, User = GetUserDataForUpdate(user.Id) };
                else
                    return new { RequestType = RequestTypeEnumVM.Success, Message = Token.Saved, User = GetUserDataForUpdate(user.Id) };
            }
            catch (Exception ex)
            {
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange };
            }
        }


        public object GetUserDataForUpdate(long id)
        {
            if (id <= 0)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.UserNotFound };


            var CurrentUser = UserS.GetCurrentUser();
            if (CurrentUser.Id == id)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotUpdateYourInformationFromHere };

            var User = db.Users.Find(id);

            var userData = new
            {
                User.Id,
                User.Email,
                User.UserName,
                User.IsBlocked,
               
                UserRoles = User.UserRoles.Select(c => new { c.FkRole_Id, c.Id }).ToList(),
                User.FullName,
                User.FKLanguage_Id,
                User.PhoneNumber,
            
                ImageUrl = User.AllFile.FileUrl,

                FkRole_Id = User.UserRoles.First().FkRole_Id,


                FKCountry_Id = User.Address == null ? 0 : User.Address.FKCountry_Id,
                FkProvince_Id = User.Address == null ? 0 : User.Address.FkProvince_Id,
                PostalCode = User.Address == null ? "" : User.Address.PostalCode,
                 User.Address.Street,
               
                City = User.Address == null ? "" : User.Address.City,

            };

            return userData;
        }
        //public object Delete(int id)
        //{
        //    try
        //    {
        //        var ObjectReturn = DeleteS.User(id);

        //        if (ObjectReturn != null)
        //            return ObjectReturn;
        //        db.SaveChanges();
        //        return new { RequestType = RequestTypeEnumVM.Success, Message = Token.Saved };
        //    }
        //    catch (Exception ex)
        //    {
        //        return new { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange };
        //    }
        //}

    }//end Class
}