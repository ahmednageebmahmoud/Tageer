using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Enums
{
    public class Enums
    {

        public enum SortType
        {
            ByNew = 1,
            ByAmountDesc = 2,
            ByAmountAsc = 3,
        }
        public enum RequestStatus
        {
            Success = 1,
            Error = 2,
            Warning = 3,
            Info = 4
        }

        public enum AdTypeEnum
        {
            Image = 1,
            Video = 2,
            PrivateLive = 3,
            PublicLive = 4,
        }
        public enum PageEnum
        {
            Cities = 1,
            Users = 2,
            Jobs = 3,
            Countries = 4,
            PagesAllow = 5,
            PagesRoles = 6,
            Nationalities = 7,
            UserLogins = 8,
            Notifications = 9,
            TechnicalSupports = 16,
            Menus = 17,
            SubMenus = 18,
            Ads = 21

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
            Client = 3,
            Company=4
        }

        public enum SocialStatusesEnum
        {
            Single = 1,
            Married = 2,
            Widower = 3
        }

        public enum StateEnum
        {
            Create = 1,
            Update = 2,
            Delete = 3,
            Reject = 4,
            Approve = 5,
            Buy = 6,
            CreateLiveStreamAd = 7
        }

        public enum GenderEnum
        {
            Male = 1,
            Female = 2
        }

        public enum AppInformationEnum
        {
            ControllPanelLink = 1,
            ApiLink = 2,
            ApiFiles = 3,
            AboutUsEn = 4,
            AboutUsAr = 5,
            AddressEn = 6,
            AddressAr = 7,
            Phone = 8,
            Email = 9,
            AboutUsImage = 10,
            FaceBook = 11,
            Twitter = 12,
            FooterDescriptionAr = 13,
            FooterDescriptionEn = 14,
        }

        public enum FileTypeEnum
        {
            Image = 1,
            Text = 2,
            Audio = 3
        }

        public enum DirectFieldsEnum
        {
            Nationality = 1,
            Area = 2,
            Mark = 3,
            Location = 4,
            Materials = 5,
            Size = 6,
            Country = 7,
            Province = 8
        }


        public enum IndividualFieldEnum
        {
            RoomsCount = 1,
            SeatsCount = 2,
            ToiletsCount = 3,
            FloorNumber = 5,
            BuildingYear = 7,
            StreetWidth = 8,
            PricePerMeter = 9,
            ApartmentCount = 10,
            ElevatorCount = 11,
            ParkingCount = 13,
            Model = 14,
            BagsSmallCount = 15,
            BagsBigCount = 16,
            Age = 17,
            AmountOfInsurance = 19,
            Color = 20,
        }

        public enum LanguageEnum
        {
            Arabic=1,
            English=2
        }


        }//End CLass
    }
