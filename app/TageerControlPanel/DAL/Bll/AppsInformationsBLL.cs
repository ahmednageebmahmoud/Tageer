using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using DAL.Models.ViewModel;
using static DAL.Enums.Enums;
using DAL.Resource;
using DAL.Service;

namespace DAL.BLL
{
    public class AppsInformationsBLL : BasicBLL
    {
        public object GetAppsInformations()
        {
            try
            {
                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, db.AppsInformations.ToList().Select(c => new
                {
                    c.Id,
                    c.Value,
                    Name = c.TokenValue,
                }));
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }
        }

        public object SaveChenage(AppsInformation[] appsInformations)
        {
            try
            {

                foreach (var item in appsInformations)
                {
                    var App = db.AppsInformations.Find(item.Id);
                    if (App.Id == AppInformationEnumVM.AboutUsImage && !string.IsNullOrEmpty(App.NewFile))
                    {
                        //remove old image
                        this.FilesRemove.Add(App.AllFile.FileUrl);

                        //added new image 
                        var FileSave = FileService.SaveFileBase64(new FileSaveVM
                        {
                            FileBase64 = App.NewFile
                        });
                        if (!FileSave.IsSave)
                        {
                            this.FilesRemove = new List<string>();
                            return new ResponseVM(RequestTypeEnumVM.Error, Token.CanNotSaveImage);
                        }

                        App.AllFile.FileUrl = FileSave.SavedPath;

                    }
                    else
                    {
                        App.Value = item.Value;
                    }

                }
                db.SaveChanges();
                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.Success, ex);
            }
        }

    }//end
}
