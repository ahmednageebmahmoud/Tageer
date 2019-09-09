using ControlPanel.Models;
using DAL.BLL;
using DAL.Models;
using DAL.Resource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using static DAL.Enums.Enums;

namespace ControlPanel.Controllers
{
    [Authorize]
    public class RentalDirectFieldsController : BaseController
    {
		RentalDirectFieldsData RentalDirectFieldsData = new RentalDirectFieldsData();
         // GET: RentalMark
         [PagesRoleAtrribute(PageEnum.RentalDirectFields,true,true,true)]
        public ActionResult Index()
        {
            return View();
        }

        //Get Categories 
        public JsonResult GetCategories()
        {
            return Json(DropDownS.Categories(), JsonRequestBehavior.AllowGet);
        }


        //Get RentalDirectFields 
        public JsonResult GetSubCategories()
        {
            return Json(DropDownS.SubCategories(), JsonRequestBehavior.AllowGet);
        }

        //Get RentalDirectFieldsByCategoryId 
        public JsonResult GetRentalDirectFieldsByCategoryId(int categoryId)
        {
            return Json(RentalDirectFieldsData.GetRentalDirectFieldsByCategoryId(categoryId), JsonRequestBehavior.AllowGet);
        }


        //Get RentalDirectFieldsBySubCategoryId
        public JsonResult GetRentalDirectFieldsBySubCategoryId(int subCategoryId)
        {
            return Json(RentalDirectFieldsData.GetRentalDirectFieldsBySubCategoryId(subCategoryId), JsonRequestBehavior.AllowGet);
        }


        //SaveChenage
        public ActionResult SaveChenage(RentalDirectField[] rentalCategoryInputs)
        {
            return Json(RentalDirectFieldsData.SaveChenage(rentalCategoryInputs), JsonRequestBehavior.AllowGet);
        }

        //Dispose
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                RentalDirectFieldsData.Dispose();
                ServiceInsertUpdateDelete.Dispose();

            }
            base.Dispose(disposing);
        }

    }//End Controller
}