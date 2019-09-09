using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;

namespace DAL.Service
{
    public class DropDownService : IDisposable
    {
        TageerEntities db = new TageerEntities();

        public void Dispose()
        {
            db.Dispose();
        }

        public object AboutUs()
        {
            int Id = LanguageService.IsEn ? AppInformationEnumVM.AboutUsEn : AppInformationEnumVM.AboutUsAr;
            var Data = db.AppsInformations.Find(Id);

            return new ResponseVM
            {
                RequestType = RequestTypeEnumVM.Success,
                IsData = true,
                Data = Data.Value
            };
        }

        public object Countries()
        {
            var Data = db.Countries.ToList();
            if (Data.Count() == 0)
                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = Token.DataNotFound };

            return new ResponseVM
            {
                RequestType = RequestTypeEnumVM.Success,
                IsData = true,
                Data = Data.Select(c => new
                {
                    c.Id,
                    Name = c.CountryName,
                    c.CountryKey,
                    CountryFlag = c.AllFile.FullFileUrl
                }).ToList()
            };
        }
        public object Categories()
        {
            var Data = db.Categories.ToList();
            if (Data.Count() == 0)
                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = Token.DataNotFound };

            return new ResponseVM
            {
                RequestType = RequestTypeEnumVM.Success,
                IsData = true,
                Data = Data.Select(c => new
                {
                    c.Id,
                    Name = c.CategoryName,
                    Image = c.AllFile.FullFileUrl

                }).ToList()
            };
        }


        public object SubCategories(int categoryId)
        {
            var Data = db.SubCategories.Where(c => c.FKCategory_Id == categoryId).ToList();
            if (Data.Count() == 0)
                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = Token.DataNotFound };

            return new ResponseVM
            {
                RequestType = RequestTypeEnumVM.Success,
                IsData = true,
                Data = Data.Select(c => new
                {
                    c.Id,
                    Name = c.SubCategoryName,
                    c.FKCategory_Id,
                    Image = c.AllFile.FullFileUrl

                }).ToList()
            };
        }

        public object SubCategories()
        {
            var Data = db.SubCategories.ToList();
            if (Data.Count() == 0)
                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = Token.DataNotFound };

            return new ResponseVM
            {
                RequestType = RequestTypeEnumVM.Success,
                IsData = true,
                Data = Data.Select(c => new
                {
                    c.Id,
                    Name = c.SubCategoryName,
                    c.FKCategory_Id,
                    Image = c.AllFile.FullFileUrl

                }).ToList()
            };
        }

        public object RentalTimeTypes()
        {

            var Data = db.RentalTimesTypes.ToList();
            if (Data.Count() == 0)
                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = Token.DataNotFound };

            return new ResponseVM
            {
                RequestType = RequestTypeEnumVM.Success,
                IsData = true,
                Data = Data.Select(c => new
                {
                    c.Id,
                    Name = c.RentalTimeTypeName,
                }).ToList()
            };
        }

        public object GetActivities()
        {

            var Data = db.Activities.ToList();
            if (Data.Count() == 0)
                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = Token.DataNotFound };

            return new ResponseVM
            {
                RequestType = RequestTypeEnumVM.Success,
                IsData = true,
                Data = Data.Select(c => new
                {
                    c.Id,
                    Name = c.Name,
                }).ToList()
            };
        }

        public object GetAppInformation()
        {
            var Appinfo = db.AppsInformations.Select(c => new
            {
                c.Id,
                c.Value,
                c.AllFile
            }).ToList();

            string AboutUs = LanguageService.IsEn ?
                             Appinfo.Single(c => c.Id == AppInformationEnumVM.AboutUsEn).Value :
                             Appinfo.Single(c => c.Id == AppInformationEnumVM.AboutUsAr).Value,
                   Address = LanguageService.IsEn ?
                             Appinfo.Single(c => c.Id == AppInformationEnumVM.AddressEn).Value :
                             Appinfo.Single(c => c.Id == AppInformationEnumVM.AddressAr).Value,
                   FooterDescription = LanguageService.IsEn ?
                      Appinfo.Single(c => c.Id == AppInformationEnumVM.FooterDescriptionEn).Value :
                      Appinfo.Single(c => c.Id == AppInformationEnumVM.FooterDescriptionAr).Value;
            return new ResponseVM
            (
                 RequestTypeEnumVM.Success,
                Token.Success,
                 new
                 {
                     AboutUs ,
                     Address ,
                     FooterDescription,
                     Phone = Appinfo.Single(c => c.Id == AppInformationEnumVM.Phone).Value,
                     Email = Appinfo.Single(c => c.Id == AppInformationEnumVM.Email).Value,
                     FaceBookLink = Appinfo.Single(c => c.Id == AppInformationEnumVM.FaceBook).Value,
                     TwitterLink= Appinfo.Single(c => c.Id == AppInformationEnumVM.Twitter).Value,
                     AboutUsImage = Appinfo.Single(c => c.Id == AppInformationEnumVM.AboutUsImage).AllFile.FullFileUrl,
                 }
            );
        }

        public object Provinces(int countryId)
        {
            var Data = db.Provinces.Where(c => c.FKCountry_Id == countryId).ToList();
            if (Data.Count() == 0)
                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = Token.DataNotFound };

            return new ResponseVM
            {
                RequestType = RequestTypeEnumVM.Success,
                IsData = true,
                Data = Data.Select(c => new
                {
                    c.Id,
                    Name = c.ProvinceName,
                    CountryId = c.FKCountry_Id

                }).ToList()
            };
        }
        public object Provinces()
        {
            var Data = db.Provinces.ToList();
            if (Data.Count() == 0)
                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = Token.DataNotFound };

            return new ResponseVM
            {
                RequestType = RequestTypeEnumVM.Success,
                IsData = true,
                Data = Data.Select(c => new
                {
                    c.Id,
                    Name = c.ProvinceName,
                    CountryId = c.FKCountry_Id
                }).ToList()
            };
        }

        public object Genders()
        {
            var Data = db.Genders.ToList();
            if (Data.Count == 0)
                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = Token.DataNotFound };

            return new ResponseVM
            {
                RequestType = RequestTypeEnumVM.Success,
                IsData = true,
                Data = Data.Select(c => new
                {
                    c.Id,
                    Name = c.TokenValue,
                }).ToList()
            };
        }


    }//end Class
}
