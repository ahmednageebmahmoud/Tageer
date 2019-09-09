using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace DAL.Models.ViewModel
{
  public  class WebConfigurationManagerService
    {
        public static string ApiFilesLink { get { return GetValue("ApiFilesLink"); } }


        internal static string GetValue(string key)
        {
            return WebConfigurationManager.AppSettings[key];
        }
    }
}
