using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DAL.Models.ViewModel
{
   public class UserDataVM
    {

        public string Email;
        public int LangId;
        public string Phone;
        public string Password;
        public string UserName;
        public string FullName;
        public DateTime BirthDate;
        public string City;
        public int CountryId;
        public int ProvinceId;
        public string FileBase64;
        public bool IsAllowSMS;
        public bool IsAllowEmail;
        public bool IsAdSummary;

        public bool IsUpdateImageProfile { get; set; }
        public bool IsUpdateEmail { get; set; }
        public bool IsUpdatePhone { get; set; }
        public bool IsUpdateLanguage { get; set; }
        public bool IsUpdatePassword { get; set; }
        public bool IsUpdateUserName { get; set; }
        public bool IsUpdateFullName { get; set; }
        public bool IsUpdateBirthDate { get; set; }
        public bool IsUpdateAllowSMS { get; set; }
        public bool IsUpdateAllowEmail { get; set; }
        public bool IsUpdateCity { get; set; }
        public bool IsUpdateCountry { get; set; }
        public bool IsUpdateProvince { get; set; }
    }
}
