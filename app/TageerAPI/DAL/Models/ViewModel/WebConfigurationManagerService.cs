using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace DAL.Models.ViewModel
{
    public static class WCMVM
    {

        /// <summary>
        /// Access Token Long  Days as (remmber me)
        /// </summary>
        public static int AccessTokenLongDays{ get { return Convert.ToInt32(GetValue("AccessTokenLongDays")); } }

        /// <summary>
        /// Access Token Short Days
        /// </summary>
        public static int AccessTokenShortDays { get { return Convert.ToInt32(GetValue("AccessTokenShortDays")); } }
        public static string ApiFilesLink { get { return GetValue("ApiFilesLink"); } }

        
        internal static string GetValue(string key)
        {
            return WebConfigurationManager.AppSettings[key];
        }
    }   
}
