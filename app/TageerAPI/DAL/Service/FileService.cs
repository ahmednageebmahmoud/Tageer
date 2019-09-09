using DAL.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http.Headers;
using DAL.Models;
using System.IO;
using System.Web;

namespace DAL.Service
{
    public class FileService
    {

        public static void RemoveFile(string oldImageUrl)
        {
            try
            {
                HttpService.DeleteImage(oldImageUrl);
            }
            catch (Exception ex)
            {

            }
        }

        public static void RemoveFiles(List<string> imagesRemove)
        {
            try
            {
                HttpService.DeleteImages(imagesRemove);
            }
            catch (Exception ex)
            {

            }

        }

        internal static FileSaveVM SaveFileBase64(FileSaveVM file)
        {
            try
            {

                if (file.FileBase64.StartsWith("data:image/jpeg;base64,"))
                {
                    file.FileBase64 = file.FileBase64.Replace("data:image/jpeg;base64,", string.Empty);
                    file.Extension = ".jpg";
                }
                else if (file.FileBase64.StartsWith("data:image/png;base64,"))
                {
                    file.FileBase64 = file.FileBase64.Replace("data:image/png;base64,", string.Empty);
                    file.Extension = ".png";
                }
                else if (file.FileBase64.StartsWith("data:image/jpg;base64,"))
                {
                    file.FileBase64 = file.FileBase64.Replace("data:image/jpg;base64,", string.Empty);
                    file.Extension = ".jpg";
                }


                file.SavedPath = HttpService.PostFile(file);
                if (string.IsNullOrEmpty(file.SavedPath))
                    file.IsSave = false;
                else
                    file.IsSave = true;

                return file;
            }
            catch (Exception ex)
            {
                file.IsSave = false;
                return file;
            }
        }
    }//End Class
}
