using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DAL
{
    public class FileService
    {

        public static string SaveFile(FileVM file)
        {   
            try
            {
                string FileName = string.Empty,
                    ServerPath = "/Files/Images/";

                //if (file.FileBase64.StartsWith("data:image/jpeg;base64,"))
                //    file.FileBase64 = file.FileBase64.Replace("data:image/jpeg;base64,", string.Empty);
                //else if (file.FileBase64.StartsWith("data:image/png;base64,"))
                //    file.FileBase64 = file.FileBase64.Replace("data:image/png;base64,", string.Empty);
                //else if (file.FileBase64.StartsWith("data:image/jpg;base64,"))
                //    file.FileBase64 = file.FileBase64.Replace("data:image/jpg;base64,", string.Empty);


                if (string.IsNullOrEmpty(file.Extension))
                    file.Extension = ".jpg";
                else if (!file.Extension.StartsWith("."))
                    file.Extension = "." + file.Extension;

                FileName = "Tageer-Photo-" + Guid.NewGuid().ToString() + file.Extension;

                System.IO.File.WriteAllBytes(HttpContext.Current.Server.MapPath(ServerPath) + FileName, Convert.FromBase64String(file.FileBase64));

                return ServerPath + FileName;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static void DeleteFile(List<string> files)
        {
            try
            {
                foreach (var filePath in files)
                {
                    System.IO.File.Delete(HttpContext.Current.Server.MapPath(filePath));
                }

            }
            catch (Exception)
            {

            }
        }
    }

}
