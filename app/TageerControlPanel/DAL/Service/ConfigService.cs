using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace BLL.Services
{
    class ConfigService
    {
        public static string HostMail { get { return GetValue("HostMail"); } }
        public static string BaseEmail { get { return GetValue("BaseEmail"); } }
        public static string BaseEmailPassword { get { return GetValue("BaseEmailPassword"); } }


        internal static string GetValue(string key)
        {
            return WebConfigurationManager.AppSettings[key];
        }
    }
}
