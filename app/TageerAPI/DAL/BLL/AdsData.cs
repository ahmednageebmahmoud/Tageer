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
    public class AdsData : BasicBLL
    {
        CommentData CommData = new CommentData();


        public object Create(AdCreateVM adCereateVM)
        {
            try
            {

                object ObjectReturn = CreateS.Ad(adCereateVM);
                if (ObjectReturn != null) return ObjectReturn;

                db.SaveChanges();
                return new ResponseVM(RequestTypeEnumVM.Success, Token.Created);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }
        }

        /// <summary>
        /// الحصول على اعلانات المستخدم ولاكن بمقدار معين
        /// </summary>
        /// <param name="user"></param>
        /// <param name="take"></param>
        /// <returns></returns>
        public object GetUserAds(string userName, int lastAdId, int take)
        {
            var User = db.Users.SingleOrDefault(c => c.UserName == userName);

            if (User == null || !User.UserRoles.Any(c => c.FkRole_Id == RoleEnumVM.Client))
                return new ResponseVM(RequestTypeEnumVM.Error, Token.UserNotFound);

            var Ads = db.SelectAdsByFilter(lastAdId, take, UserLoggadId, null, User.Id, null, null, null, null,null, null, null).ToList();

            if (Ads.Count == 0)
            {
                if (!(lastAdId > 0))
                    return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResult);
                return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResultMore);
            }

            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, new
            {
                User.FullName,
                User.UserName,
                AdsCount = User.Ads.Count,
                JoinedDate = User.CreateDate,
                Posts = Ads.Select(c => GetSampleAdInformation(c))
            });
        }

        /// <summary>
        /// الحصول على جميع معلومات اعلان معين بالاضافة الى آخر 10 تعليقات
        /// </summary>
        /// <param name="adId"></param>
        /// <returns></returns>
        public object GetAdDetailsById(int adId)
        {
            var Ad = db.SelectAdDetails(adId).FirstOrDefault();
            if (Ad == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.AdNotFound);

            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, new
            AdDetailsVM
            {

                Id = Ad.Id,
                Title = Ad.Title,
                Description = Ad.Description,
                Price = Ad.Price.ToString(),
                UserName = Ad.UserCreated_UserName,
                Province = Ad._Province,
                SinceDateTime = Ad._Time,
                Images = db.SelectAlbumImages(Ad.FKAlbum_Id).Select(v => v),
                AdPath = Ad._AdPath,
                PhoneNumbre = Ad.UserCreated_PhoneNumber,

                FooterValues = GetBottomBar(Ad.Id, Ad.FkCategory_Id, Ad.FkSubCategory_Id),
                AdComments = db.SelectAdComments(null, 10, Ad.Id).Select(c=> CommData.GetCommentInfrmation(c)),


                CategoryName = Ad._CategoryName,
                SubCategoryName = Ad._SubCategoryName,
                RentalTimeTypeName = Ad._RentalTimeTypeName,
                AdIndividualFieldsDetails = db.GetAdIndividualFieldsDetails(Ad.Id).Select(c => new AdIndividualFieldsDetailsVM
                {
                    IndividualFieldId = c.FkIndividualField_Id,
                    Value = c.Value,
                    IndividualFieldName = c._IndividualFieldName
                }).ToList(),


                //Direct Fields
                AdDirectFieldDetails = new AdDirectFieldDetailsVM
                {
                    Area = new Area
                    {
                        Height=Ad.Area_Height,
                        Width=Ad.Area_Width,
                        Length=Ad.Area_Length,
                    },
                    Location =new Location {
                        Latitude=Ad.Location_Latitude,
                        Longitude=Ad.Location_Longitude
                    },
                    Country =GetValueByLanguage(Ad.Country_NameEn,Ad.Country_NameAr),
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
                (group, values) => new AdGroupsDetailsVM
                {
                    GroupId = group.GroupId,
                    GroupName = group.GroupName,
                    Values = values.Select(c => c.Value)
                }
                ).ToList()
            });
        }

        /// <summary>
        /// تفضيل الاعلان
        /// </summary>
        /// <param name="adId"></param>
        /// <returns></returns>
        public object AdFavoriteToggle(int adId)
        {
            try
            {
                var Ad = db.Ads.Find(adId);

                object ObjectReturn = UpdateS.AdFavoriteToggle(Ad);
                if (ObjectReturn != null) return ObjectReturn;

                db.SaveChanges();
                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }
        }

        /// <summary>
        /// الحصول على الاعلانات
        /// </summary>
        /// <param name="skip"></param>
        /// <param name="take"></param>
        /// <returns></returns>
        public object GetAds(SearchVM search)
        {
            var Ads = db.SelectAdsByFilter(search.LastAdId, search.Take,
                    UserLoggadId, search.Title, null, search.CategoryId, search.SubCategoryId, search.CountryId,
                    search.ProvinceId,null, search.SortType == SortTypeEnumVM.ByAmountDesc, search.SortType == SortTypeEnumVM.ByAmountAsc).ToList();

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
            return new AdInformationVM
            {
                Id = c.Id,
                Title = c.Title,
                Price = c.Price.ToString(),
                UserName = c.UserCreated_UserName,
                Province = c._Province,
                SinceDateTime = c._Time,
                IsFavorite = c.IsFavorite.Value,
                CommentsCount = c.CommentsCount.Value,
                FavoritesCount = c.FavoritesCount,
                Images = db.SelectAlbumImages(c.FKAlbum_Id).Select(v => v),
                FooterValues = GetBottomBar(c.Id, c.FkCategory_Id, c.FkSubCategory_Id),
                AdPath = c._AdPath
            };
        }





        /// <summary>
        /// الحصول على البيانات التى سوف تعرض فى البار 
        /// </summary>
        /// <param name="ad"></param>
        /// <returns></returns>
        private List<PostFooterVM> GetBottomBar(int adId, int categoryId, int subcategoryId)
        {

            var d = db.SelectAdBottomBar(adId, categoryId, subcategoryId).Select(v => new PostFooterVM
            {
                IndividualFieldId = v.FkIndividualField_Id,
                IndividualFieldName = v.IndividualField_ResourcesName,
                Value = v.AdIndividualFieldValue
            }).ToList();
            return db.SelectAdBottomBar(adId, categoryId, subcategoryId).Select(v => new PostFooterVM
            {
                IndividualFieldId = v.FkIndividualField_Id,
                IndividualFieldName = v.IndividualField_ResourcesName,
                Value = v.AdIndividualFieldValue
            }).ToList();
        }



    }//end Class
}
