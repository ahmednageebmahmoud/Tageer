using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.BLL
{
    public class PagesRolesData : BasicBLL
    {
        //Get Pages Allow
        public object GetPagesRoles(int menuId, int userId)
        {
            var Menu = db.Menus.Find(menuId);

            return Menu.SubMenus.Select(c => new
            {
                c.ClassIcon,
                PageName = c.Page.TokenValue,
                PageId = c.FKPage_Id,
                PagesRole = c.Page.PagesRoles.Where(f => f.FkUser_Id == userId).Select(v => new
                {
                    PageRoleId = v.Id,
                    v.IsDisplay,
                    v.IsCreate,
                    v.IsDelete,
                    v.IsUpdate
                }).FirstOrDefault()
            });

        }

        //Save Chenage
        public object SaveChenage(PagesRole[] paesRoles)
        {
            try
            {
              
                        //Update
                        var ObjectReturn = UpdateS.PagesRole(paesRoles);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    
                db.SaveChanges();
                return new { RequestType = RequestTypeEnumVM.Success, Message = Token.Saved };
            }
            catch (Exception ex)
            {
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange };
            }
        }

        public void Dispose()
        {
            db.Dispose();
        }
    }//End Class
}
