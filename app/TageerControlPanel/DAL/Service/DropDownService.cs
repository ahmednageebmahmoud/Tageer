using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using DAL.Models.ViewModel;

namespace DAL.Service
{
    public class DropDownService : IDisposable
    {
        TageerEntities db = new TageerEntities();

        public void Dispose()
        {
            db.Dispose();
        }

        /// <summary>
        /// Get All Countries
        /// </summary>
        /// <returns></returns>
        public object Countries()
        {
            var Data = db.Countries.ToList();
            return Data.Select(c => new
            {
                c.Id,
                c.CountryName,
            }).ToList();
        }

        public object Pages()
        {
            var Data = db.Pages.ToList();
            return Data.Select(c => new
            {
                c.Id,
                Name = c.TokenValue,
            }).ToList();
        }

        public object Admins()
        {
            return db.Users.Where(c => c.UserRoles.Any(v => v.FkRole_Id == RoleEnumVM.Manager)).Select(c => new
            {
                c.Id,
                c.UserName
            }).ToList();
        }

        public object UserInformation(int? userId)
        {
            if (!userId.HasValue)
                return null;
            var User = db.Users.Find(userId.Value);

            if (User == null)
                return null;

            return new
            {
                User.UserName
            };
        }

        public object Groups()
        {
            var Data = db.Groups.ToList();
            return Data.Select(c => new
            {
                c.Id,
                c.GroupName,
            }).ToList();
        }

        public object SubCategories()
        {
            var Data = db.SubCategories.ToList();
            return Data.Select(c => new
            {
                c.Id,
                c.SubCategoryName,
                c.FKCategory_Id
            }).ToList();
        }

        public object GroupsItems()
        {
            var Data = db.GroupsItems.ToList();
            return Data.Select(c => new
            {
                c.Id,
                c.GroupItemName,
            }).ToList();
        }

        public object Categories()
        {
            var Data = db.Categories.ToList();
            return Data.Select(c => new
            {
                c.Id,
                c.CategoryName,
            }).ToList();
        }

        //Menus 
        public object Menus()
        {
            var Data = db.Menus.ToList();
            return Data.Select(c => new
            {
                c.Id,
                Name = c.TokenValue,
            }).ToList();
        }



        public object InputTypes()
        {
            var Data = db.InputsTypes.Where(c => c.Id == InputsTypeEnumVM.Checkbox ||
            c.Id == InputsTypeEnumVM.Radio).ToList();
            return Data.Select(c => new
            {
                c.Id,
                c.InputTypeName,
            }).ToList();
        }

        public object Roles()
        {
            var Data = db.Roles.ToList();
            return Data.Select(c => new
            {
                c.Id,
                Name = c.TokenValue,
            }).ToList();
        }

        public object Provinces(int countryId)
        {
            var Data = db.Provinces.Where(c => c.FKCountry_Id == countryId).ToList();
            return Data.Select(c => new
            {
                c.Id,
                c.ProvinceName,
            }).ToList();
        }
        public object Provinces()
        {
            var Data = db.Provinces.ToList();
            return Data.Select(c => new
            {
                c.Id,
                c.ProvinceName,
                c.FKCountry_Id
            }).ToList();
        }

        public object LanguageTypes()
        {
            var Data = db.LanguageTypes.ToList();
            return Data.Select(c => new
            {
                c.Id,
                Name = c.TokenValue,
            }).ToList();
        }


        public object Genders()
        {
            var Data = db.Genders.ToList();
            return Data.Select(c => new
            {
                c.Id,
                Name = c.TokenValue,
            }).ToList();
        }


    }
}
