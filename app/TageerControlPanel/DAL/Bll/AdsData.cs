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
    public class AdsData : BasicBLL
    {
        //Get Ads
        public object GetAds(SearchVM search)
        {
            var Ads = db.SelectAdsByFilter(search.LastAdId, search.Take,
                     null, search.Title, search.UcerCreatedId, search.CategoryId, search.SubCategoryId, search.CountryId,
                     search.ProvinceId, null, null, null).ToList();

            if (Ads.Count() == 0)
            {
                if (!(search.LastAdId >= 1))
                    return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResult);
                return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResultMore);
            }

            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, Ads.Select(c => GetSampleAdInformation(c)));
        }

        public object GetSampleAdInformation(SelectAdsByFilter_Result c)
        {
            return new
            {
                Id = c.Id,
                Title = c.Title,
                Description = c.Description,
                Price = c.Price.ToString(),
                UserName = c.UserCreated_UserName,
                CreatedDate = DateService.GetDateByCulture(c.CreateDateTime),
                CommentsCount = c.CommentsCount.Value,
                FavoritesCount = c.FavoritesCount,
            };
        }

        public object DeleteAd(int adId)
        {
            try
            {

                var ObjectReturn = DeleteS.Ad(adId);
                if (ObjectReturn != null)
                    return ObjectReturn;
                db.SaveChanges();
                this.RemoveFiles();

                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer);
            }
        }


        public object GetAdDetails(int adId)
        {
            var Ad = db.SelectAdDetails(adId).FirstOrDefault();

            if (Ad == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.AdNotFound);

            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, new
            {
                Id = Ad.Id,
                Title = Ad.Title,
                Description = Ad.Description,
                Price = Ad.Price.ToString(),
                UserName = Ad.UserCreated_UserName,
                Province = Ad._Province,
                Country = Ad._CountryName,
                SinceDateTime = Ad._Time,
                Images = db.SelectAlbumImages(Ad.FKAlbum_Id).Select(v => v),
                AdPath = Ad._AdPath,
                PhoneNumbre = Ad.UserCreated_PhoneNumber,

                CategoryName = Ad._CategoryName,
                SubCategoryName = Ad._SubCategoryName,
                RentalTimeTypeName = Ad._RentalTimeTypeName,
                AdIndividualFieldsDetails = db.GetAdIndividualFieldsDetails(Ad.Id).Select(c => new
                {
                    IndividualFieldId = c.FkIndividualField_Id,
                    Value = c.Value,
                    IndividualFieldName = c._IndividualFieldName
                }).ToList(),


                //Direct Fields
                AdDirectFieldDetails = new
                {
                    Area = new Area
                    {
                        Height = Ad.Area_Height,
                        Width = Ad.Area_Width,
                        Length = Ad.Area_Length,
                    },
                    Location = new Location
                    {
                        Latitude = Ad.Location_Latitude,
                        Longitude = Ad.Location_Longitude
                    },
                    Country = GetValueByLanguage(Ad.Country_NameEn, Ad.Country_NameAr),
                    Province = GetValueByLanguage(Ad.Province_NameEn, Ad.Province_NameAr),
                    Mark = GetValueByLanguage(Ad.Mark_NameEn, Ad.Mark_NameAr),
                    Material = GetValueByLanguage(Ad.Material_NameEn, Ad.Material_NameAr),
                    Nationality = GetValueByLanguage(Ad.Nationality_NameEn, Ad.Nationality_NameAr),
                    Size = Ad.Size,
                },

                AdGroupsDetails = db.SelectAdGroupsDetails(Ad.Id).Select(c => new
                {
                    GroupId = c.FKGroup_Id,
                    GroupName = c._GroupName,
                    Value = c.Value

                })
                      .GroupBy(v => new { v.GroupName, v.GroupId },
                      (group, values) => new
                      {
                          GroupId = group.GroupId,
                          GroupName = group.GroupName,
                          Values = values.Select(c => c.Value)
                      }).ToList()
            });
        }



    }//End Class
}
