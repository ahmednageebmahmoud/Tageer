using ControlPanel.Models;
using DAL.BLL;
using DAL.Models;
using DAL.Resource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using static DAL.Enums.Enums;

namespace ControlPanel.Controllers
{
    [Authorize]
    public class PagesRolesController : BaseController
    {
        PagesRolesData PageAllowData = new PagesRolesData();
         // GET: City
         [PagesRoleAtrribute(PageEnum.PagesRoles,true,true,true)]
        public ActionResult Index()
        {
            return View( );
        }
         //Get Menus 
         public JsonResult GetMenus()
        { 
            return Json(DropDownS.Menus(), JsonRequestBehavior.AllowGet);
        }


        //GetUsers
        public JsonResult GetUsers()
        {
            return Json(DropDownS.Admins(), JsonRequestBehavior.AllowGet);
        }


        //Get Pages Allow
        public JsonResult GetPagesRoles(int menuId, int userId)
        {
            return Json(PageAllowData.GetPagesRoles(menuId, userId), JsonRequestBehavior.AllowGet);
        }

        //SaveChenage
        public ActionResult SaveChenage(PagesRole[] pagesRoles)
        {
            return Json(PageAllowData.SaveChenage(pagesRoles), JsonRequestBehavior.AllowGet);
        }


    }//End Controller
}