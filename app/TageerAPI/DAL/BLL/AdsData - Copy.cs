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
    public class AdsDataC : BasicBLL
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

            List<Ad> Ads = new List<Ad>();
            if (User == null || !User.UserRoles.Any(c => c.FkRole_Id == RoleEnumVM.Client))
                return new ResponseVM(RequestTypeEnumVM.Error, Token.UserNotFound);

            //Skip And Take 
            if (lastAdId > 0)
                Ads = User.Ads.OrderByDescending(c => c.Id).Where(c => c.Id < lastAdId).Take(take).ToList();
            else
                Ads = User.Ads.OrderByDescending(c => c.Id).Skip(0).Take(take).ToList();

            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, new
            {
                User.UserInformation.FullName,
                User.UserName,
                AdsCount = User.Ads.Count,
                JoinedDate = User.CreateDate,
                Posts = GetSampleAdsInformation(Ads)
            });
        }

        /// <summary>
        /// الحصول على جميع معلومات اعلان معين بالاضافة الى آخر 10 تعليقات
        /// </summary>
        /// <param name="adId"></param>
        /// <returns></returns>
        public object GetAdDetailsById(int adId)
        {
            var Ad = db.Ads.Find(adId);
            int UserId = AccessToken.GetUserId();
            if (Ad == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.AdNotFound);

            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, new
            AdDetailsVM
            {

                Id = Ad.Id,
                Title = Ad.Title,
                Description = Ad.Description,
                Price = Ad.Price.ToString(),
                UserName = Ad.User.UserName,
                Province = Ad._Province,
                SinceDateTime = Ad._Time,
                Images = Ad.Album.AlbumFiles.Select(v => v.File.FullFileUrl),
                AdPath = Ad._AdPath,
                PhoneNumbre = Ad.User.UserInformation.PhoneNumber,

                FooterValues = GetBottomBar(Ad),
                AdComments = Ad.AdComments.OrderByDescending(c => c.Id).Skip(0).Take(10).Select(c => CommData.GetCommentInfrmation(c)),


                CategoryName = Ad.Category.CategoryName,
                SubCategoryName = Ad.SubCategory.SubCategoryName,
                RentalTimeTypeName = Ad.RentalTimesType.RentalTimeTypeName,
                AdIndividualFieldsDetails = Ad.AdIndividualFieldsDetails.Select(c => new AdIndividualFieldsDetailsVM
                {
                    IndividualFieldId = c.FkIndividualField_Id,
                    Value = c.Value,
                    IndividualFieldName = c.IndividualField.IndividualFieldName
                }).ToList(),


                //Direct Fields
                AdDirectFieldDetails = new AdDirectFieldDetailsVM
                {
                    Area = AdService.GetAdValue("Area", Ad.AdDirectFieldDetail.Area),
                    Location = AdService.GetAdValue("Location", Ad.AdDirectFieldDetail.Location),
                    Country = AdService.GetAdValue("Country", Ad.AdDirectFieldDetail.Country),
                    Province = AdService.GetAdValue("Province", Ad.AdDirectFieldDetail.Province),
                    Mark = AdService.GetAdValue("Mark", Ad.AdDirectFieldDetail.Mark),
                    Material = AdService.GetAdValue("Material", Ad.AdDirectFieldDetail.Material),
                    Nationality = AdService.GetAdValue("Nationality", Ad.AdDirectFieldDetail.Nationality),
                    Size = AdService.GetAdValue("Size", Ad.AdDirectFieldDetail.Size),
                },

                AdGroupsDetails = Ad.AdGroupsDetails.Select(c => new
                {
                    GroupId = c.FKGroup_Id,
                    GroupName = c.Group.GroupName,
                    Value = c.Value

                }).GroupBy(v => new { v.GroupName, v.GroupId },

                (group, values) => new AdGroupsDetailsVM { GroupId = group.GroupId, GroupName = group.GroupName, Values = values.Select(c => c.Value) }
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
            List<Ad> Ads = new List<Ad>();

            /*
             +A+=== Search ====++
             1: search By Title
             2: search By Category 
             3: search By Sub Category 
             4: search By Country
             5: search By Province

             +B+==== Sort  ====++
             1: Sort By Amount Asc Or
             2: Sort By Amount Dasc Or 
             3: Sort By New <Default>
             */


            //Search By Title
            if (string.IsNullOrEmpty(search.Title))
                Ads = db.Ads.ToList();
            else
                Ads = db.Ads.Where(c => c.Title.Contains(search.Title)).ToList();


            /*
            //Search By Category
            if (search.CategoryId.HasValue && search.CategoryId > 0)
                Ads = Ads.Where(c => c.FkCategory_Id == search.CategoryId.Value).ToList();
            //Search By Sub Category
            if (search.SubCategoryId.HasValue && search.SubCategoryId > 0)
                Ads = Ads.Where(c => c.FkSubCategory_Id == search.SubCategoryId.Value).ToList();

            //Search By Country
            if (search.CountryId.HasValue && search.CountryId > 0)
                Ads = Ads.Where(c => c.AdDirectFieldDetail.FkCountry_Id == search.CountryId.Value).ToList();
            //Search By Category
            if (search.ProvinceId.HasValue && search.ProvinceId > 0)
                Ads = Ads.Where(c => c.AdDirectFieldDetail.FkProvince_Id == search.ProvinceId.Value).ToList();
            */




            //Skip And Take And Sort
            Ads = SortAndTakeAds(Ads, search);

            if (Ads.Count() == 0)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.NoDataMore);

            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, GetSampleAdsInformation(Ads));
        }

        /// <summary>
        /// Skip And Take And Sort
        /// </summary>
        /// <param name="ads"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        private List<Ad> SortAndTakeAds(List<Ad> ads, SearchVM search)
        {
            Ad LastAd = new Ad();

            //check last ad
            if (search.LastAdId.HasValue)
            {
                LastAd = db.Ads.Find(search.LastAdId);
                if (LastAd == null)
                    search.LastAdId = null;
            }

            //Sor By Amount Asc
            if (search.SortType == SortTypeEnumVM.ByAmountAsc)
            {
                //Sort By Amount Asc
                ads = ads.OrderBy(c => c.Price).ToList();

                //Skip And Take 
                if (search.LastAdId.HasValue)
                    return ads.Where(c => c.Price > LastAd.Price).Take(search.Take).ToList();
                return ads.Skip(0).Take(search.Take).ToList();
            }
            else if (search.SortType == SortTypeEnumVM.ByAmountDesc)
            {
                //Sort By Amount Asc
                ads = ads.OrderByDescending(c => c.Price).ToList();

                //Skip And Take 
                if (search.LastAdId.HasValue)
                    return ads.Where(c => c.Price < LastAd.Price).Take(search.Take).ToList();
                return ads.Skip(0).Take(search.Take).ToList();
            }
            else
            {
                //Sort Sort By New
                ads = ads.OrderByDescending(c => c.Id).ToList();

                //Skip And Take 
                if (search.LastAdId.HasValue)
                    return ads.Where(c => c.Id < search.LastAdId).Take(search.Take).ToList();
                return ads.Skip(0).Take(search.Take).ToList();
            }


            return ads;


        }

        /// <summary>
        /// الحصول على المعلومات الابتدائية للاعلان
        /// </summary>
        /// <param name="ads"></param>
        /// <returns></returns>
        public List<AdInformationVM> GetSampleAdsInformation(List<Ad> ads)
        {
            return ads.Select(c => new AdInformationVM
            {
                Id = c.Id,
                Title = c.Title,
                Price = c.Price.ToString(),
                UserName = c.User.UserName,
                Province = c._Province,
                SinceDateTime = c._Time,
                IsFavorite = c._IsFavorite,
                CommentsCount = c._CommentsCount,
                FavoritesCount = c._FavoritesCount,
                Images = c.Album.AlbumFiles.Select(v => v.File.FullFileUrl),
                FooterValues = GetBottomBar(c),
                AdPath = c._AdPath
            }).ToList();
        }


        /// <summary>
        /// الحصول على البيانات التى سوف تعرض فى البار 
        /// </summary>
        /// <param name="ad"></param>
        /// <returns></returns>
        public List<PostFooterVM> GetBottomBar(Ad ad)
        {
            List<RentalIndividualField> RentalIndividualFields = new List<RentalIndividualField>();
            List<PostFooterVM> BottomBarVMs = new List<PostFooterVM>();


            //get by category
            if (ad.SubCategory.RentalIndividualFields.Count == 0)
                RentalIndividualFields = ad.Category.RentalIndividualFields.Where(c => c.IsRequired && c.IsBar
                  && !c.FKSubCategory_Id.HasValue
                  ).ToList();
            //get by subcategory
            else
                RentalIndividualFields = ad.SubCategory.RentalIndividualFields.Where(c => c.IsRequired && c.IsBar && c.FKSubCategory_Id == ad.FkSubCategory_Id).ToList();

            foreach (var item in RentalIndividualFields)
            {
                var AdIndividualFieldsDetail = ad.AdIndividualFieldsDetails.FirstOrDefault(v => v.FkIndividualField_Id == item.FkIndividualField_Id);

                BottomBarVMs.Add(new PostFooterVM()
                {
                    IndividualFieldId = item.FkIndividualField_Id,
                    Value = AdIndividualFieldsDetail == null ? "" : AdIndividualFieldsDetail.Value,
                    IndividualFieldName = item.IndividualField.ResourcesName
                });
            }

            return BottomBarVMs;
        }






    }//end Class
}
