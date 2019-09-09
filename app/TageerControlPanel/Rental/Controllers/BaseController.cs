using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAL.Models;
using DAL.BLL;
using System.Globalization;
using DAL.Service;
using System.IO;
using DAL.Models.ViewModel;
using System.Net;

namespace ControlPanel.Controllers
{
    public class BaseController : Controller
    {
        public CheckedService CheckedS = new CheckedService();
        public DropDownService DropDownS = new DropDownService();
        public UserService UserS = new UserService();
        public MenuService MenuS = new MenuService();
        public NotificationService NotificationS = new NotificationService();
       public ServiceInsertUpdateDelete ServiceInsertUpdateDelete = new ServiceInsertUpdateDelete();
        
        
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
                   //Now Set Culture 
            LanguageService.SetCulture();
            //      base.OnActionExecuting(filterContext);
        }

         protected override void Dispose(bool disposing)
        {
            CheckedS.Dispose();
            DropDownS.Dispose();
            UserS.Dispose();
            MenuS.Dispose();
        }
    }
}//end class
