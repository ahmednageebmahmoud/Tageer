using DAL.Models;
using DAL.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace DAL.Service
{
    public class HttpService
    {
        public static void DeleteImage(string imageUrl)
        {
            try
            {
                string Path = "/Tageer/Api/Files/Delete",
                    BaseUrl = string.Empty;

                using (TageerEntities db = new TageerEntities())
                    BaseUrl = db.AppsInformations.Find(AppInformationEnumVM.ApiFiles).Value;

                using (HttpClient HC = new HttpClient())
                {
                    JavaScriptSerializer Serializer = new JavaScriptSerializer();
                    List<string> Files = new List<string>()
                    {
                        imageUrl
                    };

                    string ObjectJson = Serializer.Serialize(Files);

                    var ObjectJsonBytes = System.Text.Encoding.UTF8.GetBytes(ObjectJson);
                    var ByteContent = new ByteArrayContent(ObjectJsonBytes);

                    //Create Header
                    HC.DefaultRequestHeaders.Accept.Clear();
                    ByteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
                    HC.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    HC.BaseAddress = new Uri(BaseUrl);

                    //Call Api
                    var Respo = HC.PostAsync(Path, ByteContent);
                    var Content = Respo.Result.Content;
                    string Message = Content.ReadAsStringAsync().Result;
                }
            }
            catch (Exception)
            {

            }
        }

        public static void DeleteImages(List<string> files)
        {
            try
            {
                string Path = "/Tageer/Api/Files/Delete",
                    BaseUrl = string.Empty;

                using (TageerEntities db = new TageerEntities())
                    BaseUrl = db.AppsInformations.Find(AppInformationEnumVM.ApiFiles).Value;

                using (HttpClient HC = new HttpClient())
                {
                    JavaScriptSerializer Serializer = new JavaScriptSerializer();

                    string ObjectJson = Serializer.Serialize(files);

                    var ObjectJsonBytes = System.Text.Encoding.UTF8.GetBytes(ObjectJson);
                    var ByteContent = new ByteArrayContent(ObjectJsonBytes);

                    //Create Header
                    HC.DefaultRequestHeaders.Accept.Clear();
                    ByteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
                    HC.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    HC.BaseAddress = new Uri(BaseUrl);

                    //Call Api
                    var Respo = HC.PostAsync(Path, ByteContent);
                    var Content = Respo.Result.Content;
                    string Message = Content.ReadAsStringAsync().Result;
                }
            }
            catch (Exception)
            {

            }
        }


        public static string PostFile(FileSaveVM file)
        {
            try
            {
                string Path = "/Tageer/Api/Files/Post",
                    BaseUrl = string.Empty;
                using (HttpClient HC = new HttpClient())
                {
                        BaseUrl =WCMVM.ApiFilesLink;

                        JavaScriptSerializer Serializer = new JavaScriptSerializer();

                    string ObjectJson = Serializer.Serialize(file);

                    var ObjectJsonBytes = System.Text.Encoding.UTF8.GetBytes(ObjectJson);
                    var ByteContent = new ByteArrayContent(ObjectJsonBytes);

                    //Create Header
                    HC.DefaultRequestHeaders.Accept.Clear();
                    ByteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
                    HC.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    HC.BaseAddress = new Uri(BaseUrl);

                    //Call Api
                    var Respo = HC.PostAsync(Path, ByteContent);
                    var Content = Respo.Result.Content;
                    string Message = Content.ReadAsStringAsync().Result;

                    return Message.Replace("\"",string.Empty);
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

        
    }
}
