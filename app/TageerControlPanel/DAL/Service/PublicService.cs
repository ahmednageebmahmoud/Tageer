using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Data.Entity.Design.PluralizationServices;
using System.Globalization;
using System.Resources;
using System.Reflection;
using DAL.Resource;
using System.Xml;
using System.Security.Cryptography;
using DAL.Models.ViewModel;

namespace DAL.Service
{
    public class PublicService
    {

        /// <summary>
        /// Convert Word Singularize to Word Single
        /// </summary>
        /// <param name="wordSingularize"></param>
        /// <returns></returns>
        public static string ConvertToWordSingle(string wordSingularize)
        {
            CultureInfo ci = new CultureInfo("en-us");
            PluralizationService ps =
              PluralizationService.CreateService(ci);

            if (ps.IsSingular(wordSingularize) == true)
                return ps.Pluralize(wordSingularize);
            else
                return ps.Singularize(wordSingularize);
        }

        public static string GetToken(string token)
        {
            ResourceManager rm = new ResourceManager("DAL.Resource.Token", Assembly.GetExecutingAssembly());
            return rm.GetString(token);
        }
        public static string GetTokenAr(string token)
        {
            ResourceManager rm = new ResourceManager("DAL.Resource.Token", Assembly.GetExecutingAssembly());
            return rm.GetString(token, new CultureInfo("ar"));
        }
        public static string GetTokenEn(string token)
        {
            ResourceManager rm = new ResourceManager("DAL.Resource.Token", Assembly.GetExecutingAssembly());
            return rm.GetString(token, new CultureInfo("en"));
        }

        public static void WritrInXmlFile(string ElementName, string Value)
        {
            string serverpath = System.Web.HttpContext.Current.Server.MapPath("~/Files/Document/");
            XmlDocument dco = new XmlDocument();
            dco.Load(serverpath + "ApplicationConfig.xml");
            XmlNodeList xmlList = dco.GetElementsByTagName(ElementName);
            xmlList[0].InnerXml = Value;
            dco.Save(serverpath + "ApplicationConfig.xml");
        }

        public static string ReadInXmlFile(string ElementName)
        {
            XmlDocument dco = new XmlDocument();
            string serverpath = System.Web.HttpContext.Current.Server.MapPath("~/Files/Document/");
            dco.Load(serverpath + "ApplicationConfig.xml");
            XmlNodeList xmlList = dco.GetElementsByTagName(ElementName);
            return xmlList[0].InnerText;
        }
    
       
 
        /// <summary>
        /// Encrypts a given password and returns the encrypted data
        /// as a base64 string.
        /// </summary>
        /// <param name="plainText">An unencrypted string that needs
        /// to be secured.</param>
        /// <returns>A base64 encoded string that represents the encrypted
        /// binary data.
        /// </returns>
        /// <remarks>This solution is not really secure as we are
        /// keeping strings in memory. If runtime protection is essential,
        /// <see cref="SecureString"/> should be used.</remarks>
        /// <exception cref="ArgumentNullException">If <paramref name="plainText"/>
        /// is a null reference.</exception>
        public static string EncryptText(string plainText)
        {
            //if (plainText == null) throw new ArgumentNullException("plainText");

            //encrypt data
            var data = Encoding.Unicode.GetBytes(plainText);
            byte[] encrypted = ProtectedData.Protect(data, null,DataProtectionScope.CurrentUser);

            //return as base64 string
            return Convert.ToBase64String(encrypted);
        }

        /// <summary>
        /// Decrypts a given string.
        /// </summary>
        /// <param name="cipher">A base64 encoded string that was created
        /// through the <see cref="Encrypt(string)"/> or
        /// <see cref="Encrypt(SecureString)"/> extension methods.</param>
        /// <returns>The decrypted string.</returns>
        /// <remarks>Keep in mind that the decrypted string remains in memory
        /// and makes your application vulnerable per se. If runtime protection
        /// is essential, <see cref="SecureString"/> should be used.</remarks>
        /// <exception cref="ArgumentNullException">If <paramref name="cipher"/>
        /// is a null reference.</exception>
        public static string DecryptText(string cipher)
        {
            if (cipher == null) return null;
            //parse base64 string
          byte[] data = Convert.FromBase64String(cipher);

            //decrypt data
          byte[] decrypted = ProtectedData.Unprotect(data, null, DataProtectionScope.CurrentUser);
          string decryptedString= Encoding.Unicode.GetString(decrypted);
          return decryptedString;
        }


	}//end 
}
