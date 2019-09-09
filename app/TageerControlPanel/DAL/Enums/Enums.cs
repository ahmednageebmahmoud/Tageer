using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Enums
{
    public class Enums
    {
        public enum RequestTypeEnum
        {
            Success = 1,
            Error = 2,
            Warning = 3,
            Info = 4
        }

        public enum PageEnum
        {

            Users = 2,
            Countries = 4,
            PagesRoles = 5,
            Nationalities = 7,
            UserLogins = 8,
            Notifications = 9,
            TechnicalSupport = 16,
            Menus = 17,
            SubMenus = 18,
            Categories = 19,
            SubCategories = 20,
            Months = 21,
            Provinces = 23,
            DatesTypes = 27,
            AppsInformations = 28,
            Dates = 29,
            MangeUsers = 30,
            RentalTypes = 31,
            Marks = 33,
            RentalIndividualFields = 35,
            Materials = 36,
            RentalMaterials = 37,
            GroupsDisplayTypes = 38,
            RentalGroupsItems = 40,
            RentalMarks = 41,
            RentalDirectFields = 42,
            Ads=43,
            EmailsSubscriptions=44,
            Activities=45
        }

        public enum PagesRoleTypeEnum
        {
            Management = 1,
            Notifications = 2,
            Logs = 3
        }

        public enum PhoneTypeEnum
        {

            Mobile = 1,
            Fax = 2,
            Home = 3
        }

        public enum RoleEnum
        {
            Manager = 1,
            Supervisor = 2,
            Client = 3
        }

        public enum StateEnum
        {
            Create = 1,
            Update = 2,
            Delete = 3,
            Reject = 4,
            Approve = 5,
            Old = 2536525
        }
        public enum AppInformationEnum
        {
	ControllPanelLink       = 1 ,	
	ApiLink                 =2	,
	ApiFiles                =3	,
	AboutUsEn               =4	,
	AboutUsAr               =5	,
	AddressEn	            =6	,
	AddressAr	            =7	,
	Phone	                =8	,
	Email                   =9	,
	AboutUsImage            =10	,
	FaceBook                =11	,
	Twitter                 =12	,
	FooterDescriptionAr     =13	,
	FooterDescriptionEn     =14	,
        }

        public enum FileTypeEnum
        {
            Image = 1,
            Text = 2,
            Audio = 3
        }

        public enum GenderEnum
        {
            Male = 1,
            Female = 2,
        }
        public enum SocialStatusEnum
        {
            Married = 1,
            Single = 2,
            Widow = 3
        }
        public enum DateTypeEnum
        {
            Melady = 1,
            Hegrey = 2,
        }

        public enum RolesEnum
        {
            Manager = 1,
            Supervisor = 2,
            Client = 3,
            Company=4
        }

        public enum LanguageCodeEnum
        {
            English = 1,
            Arabic = 2
        }
        public enum NotificationTypeActionEnum
        {
            Add = 1,
            Edit = 2,
            Delete = 3

        }



        public enum InputsTypeEnum
        {
            Text = 1,
            Number = 2,
            Select = 3,
            Checkbox = 4,
            Radio = 5,
            Date = 6,
            Time = 7,
            LinkWithTable = 8,
            Decimal = 9
        }

        public static string ImageDefult { get { return "/Files/Images/Users/Profile/userDefult.jpg"; } }
        public static string[] ExtinctionImageProfile { get { return new string[] { ".jpeg", ".jpg", ".png" }; } }

    }//End Class
}
