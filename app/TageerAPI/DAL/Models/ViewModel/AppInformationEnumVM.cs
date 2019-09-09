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
        public static int ControllPanelLink { get { return Convert.ToInt32(AppInformationEnum.ControllPanelLink); } }
        public static int ApiLink { get { return Convert.ToInt32(AppInformationEnum.ApiLink); } }
        public static int AddressAr { get { return Convert.ToInt32(AppInformationEnum.AddressAr); } }
        public static int AddressEn { get { return Convert.ToInt32(AppInformationEnum.AddressEn); } }
        public static int Phone { get { return Convert.ToInt32(AppInformationEnum.Phone); } }
        public static int Email { get { return Convert.ToInt32(AppInformationEnum.Email); } }
        public static int AboutUsEn { get { return Convert.ToInt32(AppInformationEnum.AboutUsEn); } }
        public static int AboutUsAr { get { return Convert.ToInt32(AppInformationEnum.AboutUsAr); } }
        public static int ApiFiles { get { return Convert.ToInt32(AppInformationEnum.ApiFiles); } }
        public static int FaceBook { get { return Convert.ToInt32(AppInformationEnum.FaceBook); } }
        public static int Twitter { get { return Convert.ToInt32(AppInformationEnum.Twitter); } }
        public static int AboutUsImage { get { return Convert.ToInt32(AppInformationEnum.AboutUsImage); } }
        public static int FooterDescriptionEn { get { return Convert.ToInt32(AppInformationEnum.FooterDescriptionEn); } }
        public static int FooterDescriptionAr { get { return Convert.ToInt32(AppInformationEnum.FooterDescriptionAr); } }



    }
}
