using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.Models.ViewModel
{
  public static  class PageEnumVM
    {

        public static int Provinces { get { return Convert.ToInt32(PageEnum.Provinces); } }
        public static int Countries { get { return Convert.ToInt32(PageEnum.Countries); } }
        public static int Date { get { return Convert.ToInt32(PageEnum.Dates); } }
        public static int DateType { get { return Convert.ToInt32(PageEnum.DatesTypes); } }
        public static int Months { get { return Convert.ToInt32(PageEnum.Months); } }

        public static int Notifications { get { return Convert.ToInt32(PageEnum.Notifications); } }
        public static int Menus { get { return Convert.ToInt32(PageEnum.Menus); } }
        public static int SubMenus { get { return Convert.ToInt32(PageEnum.SubMenus); } }

        public static int Users { get { return Convert.ToInt32(PageEnum.Users); } }
        public static int UserLogins { get { return Convert.ToInt32(PageEnum.UserLogins); } }
        public static int MangeUsers { get { return Convert.ToInt32(PageEnum.MangeUsers); } }
        public static int SubCategories { get { return Convert.ToInt32(PageEnum.SubCategories); } }
        public static int Categories { get { return Convert.ToInt32(PageEnum.Categories); } }
        public static int Marks { get { return Convert.ToInt32(PageEnum.Marks); } }
        public static int RentalMarks { get { return Convert.ToInt32(PageEnum.RentalMarks); } }
        public static int RentalIndividualFields { get { return Convert.ToInt32(PageEnum.RentalIndividualFields); } }
        public static int Materials { get { return Convert.ToInt32(PageEnum.Materials); } }
        public static int RentalMaterials { get { return Convert.ToInt32(PageEnum.RentalMaterials); } }
        public static int GroupsDisplayTypes { get { return Convert.ToInt32(PageEnum.GroupsDisplayTypes); } }
        public static int Nationalities { get { return Convert.ToInt32(PageEnum.Nationalities); } }
        public static int TechnicalSupports { get { return Convert.ToInt32(PageEnum.TechnicalSupport); } }
        public static int PagesRoles { get { return Convert.ToInt32(PageEnum.PagesRoles); } }
        public static int AppsInformations { get { return Convert.ToInt32(PageEnum.AppsInformations); } }
        public static int RentalGroupsItems { get { return Convert.ToInt32(PageEnum.RentalGroupsItems); } }
        public static int RentalDirectFields { get { return Convert.ToInt32(PageEnum.RentalDirectFields); } }
        public static int Activities { get { return Convert.ToInt32(PageEnum.Activities); } }


        



    }

}
