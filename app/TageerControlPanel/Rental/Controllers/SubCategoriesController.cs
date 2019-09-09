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
    public class SubCategoriesController : BaseController
    {
        SubCategoriesData CategoryData = new SubCategoriesData();
         // GET: Rental
         [PagesRoleAtrribute(PageEnum.SubCategories,true,true,true)]
        public ActionResult Index()
        {
            return View( );
        }
         //Get Categories 
         public JsonResult GetSubCategories(int categoryId)
        { 
            return Json(CategoryData.GetSubCategories(categoryId), JsonRequestBehavior.AllowGet);
        }

        //Get Categorys
        public JsonResult GetCategories()
        { 
            return Json(DropDownS.Categories(), JsonRequestBehavior.AllowGet);
        }


        //SaveChenage
        public ActionResult SaveChenage(SubCategory[] rentalSubCategory)
        {
            return Json(CategoryData.SaveChange(rentalSubCategory), JsonRequestBehavior.AllowGet);
        }

        //Dispose
        protected override void Dispose(bool disposing)
        { 
            base.Dispose(disposing);
        }

    }//End Controller
}