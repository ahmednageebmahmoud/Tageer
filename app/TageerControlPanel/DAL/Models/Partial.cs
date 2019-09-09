using DAL.Models.ViewModel;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DAL.Models
{
    public partial class User
    {

        public bool RememberMe { get; set; }
        public string FullUserName { get; set; }

        public string FileUrl { get; set; }

        public string CurrentPassword { get; set; }
        public string NewPassword { get; set; }
        public string ConfirmPassword { get; set; }
        public string _Language { get; set; }
        public string OldImageUrl { get;   set; }
    }

    public partial class Activity
    {
        public string ActivityName { get { return LanguageService.IsEn ? NameEn : NameAr; } }
        public int State { get; set; }
    }

    public partial class Country
    {
        public string CountryName { get { return LanguageService.IsEn ? NameEn : NameAr; } }
        public int State { get; set; }
        public string FlagUrl { get; set; }
    }
    public partial class Province
    {
        public string ProvinceName { get { return LanguageService.IsEn ? NameEn : NameAr; } }
        public int State { get; set; }
    }
     
    public partial class Date
    {
        public int State { get; set; }
    }
    public partial class UserRole
    {
        public int State { get; set; }
    }
    public partial class PrivilegeType
    {
        public int State { get; set; }
    }
    public partial class Privilege
    {
        public int State { get; set; }
    }
    public partial class PrivilegeRole
    {
        public int State { get; set; }
    }
    public partial class UserLogin
    {
        public int State { get; set; }
    }
    public partial class NotificationRole
    {
        public int State { get; set; }
    }
    public partial class NotificationsPage
    {
        public int State { get; set; }
    }
   
    public partial class Mark
    {
        public string MarkName { get { return LanguageService.IsEn ? NameEn : NameAr; } }
        public int State { get; set; }
    }
    public partial class Category
    {
        public string CategoryName { get { return LanguageService.IsEn ? NameEn : NameAr; } }
        public int State { get; set; }
        public string Image64 { get; set; }

    }
    public partial class SubCategory
    {
        public string SubCategoryName { get { return LanguageService.IsEn ? NameEn : NameAr; } }
        public int State { get; set; }
        public string Image64 { get; set; }
    }
    public partial class RentalMark
    {
        public int State { get; set; }
    }
    public partial class InputsType
    {
        public string InputTypeName { get { return PublicService.GetToken(this.ResourcesName); } }

    }
    public partial class IndividualField
    {
        public string InputName { get { return PublicService.GetToken(this.ResourcesName); } }
        public string NameAr { get { return PublicService.GetTokenAr(this.ResourcesName); } }
        public string NameEn { get { return PublicService.GetTokenEn(this.ResourcesName); } }

    }
    public partial class RentalIndividualField
    {
        public int State { get; set; }
    }
    public partial class Material
    {
        public string MaterialName { get { return LanguageService.IsEn ? NameEn : NameAr; } }
        public int State { get; set; }
    }
    public partial class RentalMaterial
    {
        public int State { get; set; }
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

    public partial class Page
    {
        public string TokenValue { get { return ResourceService.GetToken(this.ResourceName); } }
    }

    public partial class State
    {
        public string TokenValue { get { return ResourceService.GetToken(this.ResourceName); } }
    }

    
    public partial class DirectField
    {
        public string FieldName { get { return PublicService.GetToken(this.ResourceName); } }
    }
    public partial class GroupsItem
    {
        public string GroupItemName { get { return PublicService.GetToken(this.ResourceName); } }
        public int State { get; set; }
    }
    
            public partial class RentalGroupsItem
    {
        public int State { get; set; }
    }
    public partial class Group
    {
        public string GroupName { get { return PublicService.GetToken(this.ResourceName); } }
        public int State { get; set; }
    }
    
    public partial class GroupsDisplayType
    {
        public int State { get; set; }
    }

  

    public partial class Nationality
    {
        public string NationalityName { get { return LanguageService.IsEn ? NameEn : NameAr; } }
        public int State { get; set; }
    }

    public partial class AllFile
    {
        public string FullFileUrl { get { return WebConfigurationManagerService.ApiFilesLink + this.FileUrl; } }
    }

    public partial class PagesRole
    {
        public int State { get; set; }
    }


    public partial class User
    {
        public string ImageUrl { get {
                if (this.AllFile == null) return "";
                return this.AllFile.FullFileUrl;
            } }
        public bool IsSuccessLogin { get; set; }

        public string UserCulture { get; set; }
    }
   
    public partial class LanguageType
    {
        public string TokenValue { get { return ResourceService.GetToken(this.ResourceName); } }
    }
   
    public partial class AppsInformation
    {
        public string TokenValue { get { return ResourceService.GetToken(this.ResourceName); } }
        public string NewFile { get; set; }
    }

 

    public partial class PhoneNumber
    {
        public int State { get; set; }
    }
    public partial class LanguageUsing
    {
        public int State { get; set; }
    }


    public partial class IndividualField
    {
        public bool IsTypeAllowCustom
        {
            get
            {
                if (this.FKInputType_Id == InputsTypeEnumVM.Number) return true;
                else return false;
            }
        }

    }


    public partial class RentalDirectField
    {
        public int State { get; set; }
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
    public partial class SelectAdGroupsDetails_Result
    {
        public string _GroupName { get { return ResourceService.GetToken(this.GroupResourceName); } }
    }

    public partial class SelectAdGroupsDetails_Result
    {
        public string Value { get { return ResourceService.GetToken(this.GroupsItemName); } }
    }

    public partial class GetAdIndividualFieldsDetails_Result
    {
        public string _IndividualFieldName => ResourceService.GetToken(this.IndividualFieldsResourcesName);
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


}
