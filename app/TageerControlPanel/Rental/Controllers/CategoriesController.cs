using ControlPanel.Models;
using DAL.BLL;
using DAL.Models;
using DAL.Resource;
using DAL.Service;
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
    public class CategoriesController : BaseController
    {
        CategoriesData CategoryData = new CategoriesData();

         // GET: Categories
         [PagesRoleAtrribute(PageEnum.Categories,true,true,true)]
        public ActionResult Index()
        {
            return View( );
        }
        //Get Categories 
        public JsonResult GetCategories( )
        { 
            return Json(CategoryData.GetCategories(), JsonRequestBehavior.AllowGet);
        }

        //SaveChenage
        [HttpPost]
        public ActionResult SaveChenage(Category[] rentalCategories)
        {
            return Json(CategoryData.SavaChange(rentalCategories) , JsonRequestBehavior.AllowGet);
        }

        //Dispose
        protected override void Dispose(bool disposing)
        {
           
            base.Dispose(disposing);
        }

    }//End Controller
}