using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using System.Text.RegularExpressions;
using System.Web;
using DAL.Models.ViewModel;

namespace DAL.Service
{
    public class MenuService : IDisposable
    {
        TageerEntities db = new TageerEntities();
        UserService UserS = new UserService();




        public void Dispose()
        {
            db.Dispose();
            UserS.Dispose();
        }


        public object GetControlPanelMenu()
        {
            long UserId = CookieService.UserInfo.Id;
           var Menus = UserId == 1 ? db.Menus.ToList().Select(c => new
            {
                MenuName = c.TokenValue,
                OrderNumber = c.OrderNumber,
                ClassIcon = c.ClassIcon,
                SubMenus = c.SubMenus.Select(v => new
                {
                    v.OrderNumber,
                    SubMenuName = v.Page.TokenValue,
                    Url = v.Page.Url,
                    v.ClassIcon
                }).ToList()
            }).ToList() : db.Menus.ToList().Select(c => new
            {
                MenuName = c.TokenValue,
                OrderNumber = c.OrderNumber,
                ClassIcon = c.ClassIcon,
                //Fill Sub Menu
                SubMenus = c.SubMenus.Where(v => v.Page.PagesRoles.Any(b => b.FkUser_Id == UserId)).Select(v => new
                {
                    v.OrderNumber,
                    SubMenuName = v.Page.TokenValue,
                    Url = v.Page.Url,
                    v.ClassIcon
                }).ToList()
            }).ToList();

            return Menus;
        }



    }//End Class
}
