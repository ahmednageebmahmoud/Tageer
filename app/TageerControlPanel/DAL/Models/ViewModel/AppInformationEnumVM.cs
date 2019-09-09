using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.Models.ViewModel
{
    public class AppInformationEnumVM
    {
        public static int ControllPanelLink => (int)AppInformationEnum.ControllPanelLink;
        public static int ApiLink => (int)AppInformationEnum.ApiLink;
        public static int ApiFiles => (int)AppInformationEnum.ApiFiles;
        public static int AboutUsEn => (int)AppInformationEnum.AboutUsEn;
        public static int AboutUsAr => (int)AppInformationEnum.AboutUsAr;
        public static int AddressEn => (int)AppInformationEnum.AddressEn;
        public static int AddressAr => (int)AppInformationEnum.AddressAr;
        public static int Phone => (int)AppInformationEnum.Phone;
        public static int Email => (int)AppInformationEnum.Email;
        public static int AboutUsImage => (int)AppInformationEnum.AboutUsImage;
        public static int FaceBook => (int)AppInformationEnum.FaceBook;
        public static int Twitter => (int)AppInformationEnum.Twitter;
        public static int FooterDescriptionAr => (int)AppInformationEnum.FooterDescriptionAr;
        public static int FooterDescriptionEn => (int)AppInformationEnum.FooterDescriptionEn;
    }
}
