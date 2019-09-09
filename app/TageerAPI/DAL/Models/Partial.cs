using DAL.Models.ViewModel;
using DAL.Models.ViewModels;
using DAL.Resource;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using static DAL.Enums.Enums;

namespace DAL.Models
{
    public partial class User
    {
        public bool RememberMe { get; set; }
        public string NewPassword { get; set; }
        //public string CurrentPassword { get; set; }
        public string ConfirmPassword { get; set; }
        public bool IsSuccessLogin { get; set; }
        public string UserCulture { get; set; }
        public string Image { get {
                if (this.AllFile == null) return "";
                return this.AllFile.FullFileUrl;
                } }
        public bool IsEnglish => this.LanguageType.Id == (int)LanguageEnum.English;
    }


    public partial class PhoneNumber
    {
        public int State { get; set; }
    }

    public partial class UserRole
    {
        public int State { get; set; }
    }
    public partial class PagesRole
    {
        public int State { get; set; }
    }


    public partial class LanguageUsing
    {
        public int State { get; set; }
    }



    public partial class Province
    {
        public string ProvinceName { get { return LanguageService.IsEn ? NameEn : NameAr; } }
        public string State { get; set; }
    }


    public partial class Nationality
    {
        public string NationalityName { get { return LanguageService.IsEn ? NameEn : NameAr; } }
        public string State { get; set; }


    }


    public partial class Country
    {
        public string CountryName { get { return LanguageService.IsEn ? NameEn : NameAr; } }
        public string State { get; set; }

    }



    public partial class PagesAllow
    {
        public string State { get; set; }
    }
    public partial class Role
    {
        public string TokenValue { get { return ResourceService.GetToken(this.ResourceName); } }
    }
    public partial class Menu
    {
        public string State { get; set; }
        public string TokenValue { get { return ResourceService.GetToken(this.ResourceName); } }
    }
    public partial class SubMenu
    {
        public string State { get; set; }
        public string SubMenuName { get { return this.Page.TokenValue; } }
    }

    public partial class Gender
    {
        public string TokenValue { get { return ResourceService.GetToken(this.ResourceName); } }
    }

    public partial class LanguageType
    {
        public string TokenValue { get { return ResourceService.GetToken(this.ResourceName); } }
    }

    public partial class Page
    {
        public string TokenValue { get { return ResourceService.GetToken(this.ResourceName); } }
    }


    public partial class State
    {
        public string TokenValue { get { return ResourceService.GetToken(this.ResourceName); } }
    }

    public partial class AllFile
    {
        public string FullFileUrl { get
            {
                return WCMVM.ApiFilesLink + this.FileUrl; } }
    }

    public partial class SubCategory
    {
        public string SubCategoryName { get { return LanguageService.IsEn ? this.NameEn : this.NameAr; } }

    }
    public partial class Category
    {
        public string CategoryName { get { return LanguageService.IsEn ? this.NameEn : this.NameAr; } }

    }


    public partial class Group
    {
        public string GroupName { get { return ResourceService.GetToken(this.ResourceName); } }

    }


    public partial class GroupsItem
    {
        public string GroupItemName { get { return ResourceService.GetToken(this.ResourceName); } }

    }

    public partial class RentalTimesType
    {
        public string RentalTimeTypeName { get { return ResourceService.GetToken(this.ResourceName); } }

    }

    public partial class Mark
    {
        public string MarkName { get { return LanguageService.IsEn ? this.NameEn : this.NameAr; } }
    }


    public partial class Material
    {
        public string MaterialName { get { return LanguageService.IsEn ? this.NameEn : this.NameAr; } }
    }
    public partial class Activity
    {
        public string Name { get { return LanguageService.IsEn ? this.NameEn : this.NameAr; } }
    }
    public partial class SelectAdGroupsDetails_Result
    {
        public string _GroupName { get { return ResourceService.GetToken(this.GroupResourceName); } }
    }

    public partial class SelectAdDetails_Result
    {
        public string _Province
        {
            get
            {
                return LanguageService.IsEn ? this.Province_NameEn : this.Province_NameAr;
            }
        }

  public string _CountryName
        {
            get
            {
                return LanguageService.IsEn ? this.Country_NameEn : this.Country_NameAr;
            }
        }
        
        public string _CategoryName
        {
            get
            {
                return LanguageService.IsEn ? this.Category_NameEn : this.Category_NameAr;
            }
        }

        public string _SubCategoryName
        {
            get
            {
                return LanguageService.IsEn ? this.SubCategory_NameEn : this.SubCategory_NameAr;
            }
        }

        public string _RentalTimeTypeName { get { return ResourceService.GetToken(this.RentalTimesType_ResourceName); } }

        public string _Time { get { return DateService.CaltDateTimeSince(this.CreateDateTime); } }

        public string _AdPath
        {
            get
            {

                return $"Ad/{this.Id}/{this.Title.TrimStart().TrimEnd().Replace(" ", "-")}";
            }
        }
    }

    public partial class AdIndividualFieldsDetail
    {
        public static AdIndividualFieldsDetail GetNewAdIndividualFieldsDetail(int individualFieldId, string value)
        {
            return new AdIndividualFieldsDetail
            {
                FkIndividualField_Id = individualFieldId,
                Value = value
            };
        }
    }


    public partial class SelectAdsByFilter_Result
    {
        public string _Province
        {
            get
            {
                return LanguageService.IsEn ? this.Province_NameEn : this.Province_NameAr;
            }
        }

        public string _Time { get { return DateService.CaltDateTimeSince(this.CreateDateTime); } }

        public string _AdPath
        {
            get
            {

                return $"Ad/{this.Id}/{this.Title.TrimStart().TrimEnd().Replace(" ", "-")}";
            }
        }

    }


    public partial class IndividualField
    {
        public string IndividualFieldName => ResourceService.GetToken(this.ResourcesName);
    }

    public partial class AdGroupsDetail
    {
        public string Value
        {
            get
            {

                if (this.IsCustomValue)
                    return CustomValue;
                return GroupsItem.GroupItemName;
            }
        }
    }


    public partial class SelectMessages_Result
    {
        public string _SendDateTime { get { return DateService.GetDateTimeByCulture(DateTime); } }
        public string _Name
        {
            get
            {
                if (string.IsNullOrEmpty(this.UserFullName)) return this.UserName;
                return this.UserFullName;
            }
        }
    }

    public partial class SeelctChatByUserRecivedName_Result
    {
        public string _Name
        {
            get
            {
                if (string.IsNullOrEmpty(this.UserFullName)) return this.UserName;
                return this.UserFullName;
            }
        }
    }
    public partial class SelectLastMessage_Result
    {

        public string _SendDateTime { get { return DateService.GetDateTimeByCulture(DateTime); } }
        public string _Name
        {
            get
            {
                if (string.IsNullOrEmpty(this.UserFullName)) return this.UserName;
                return this.UserFullName;
            }
        }
    }

    public partial class SelectUserChats_Result
    {
        public string _Name
        {
            get
            {
                if (string.IsNullOrEmpty(this.UserFullName)) return this.UserName;
                return this.UserFullName;
            }
        }
    }


    public partial class SelectAdGroupsDetails_Result
    {
        public string Value { get { return ResourceService.GetToken(this.GroupsItemName); } }
    }

    public partial class GetAdIndividualFieldsDetails_Result
    {
        public string _IndividualFieldName => ResourceService.GetToken(this.IndividualFieldsResourcesName);
    }










}
