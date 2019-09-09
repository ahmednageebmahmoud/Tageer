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
    public class RentalIndividualFieldsController : BaseController
    {
		RentalIndividualFieldsData RentalIndividualFieldsData = new RentalIndividualFieldsData();
         // GET: RentalMark
         [PagesRoleAtrribute(PageEnum.RentalIndividualFields,true,true,true)]
        public ActionResult Index()
        {
            return View();
        }

        //Get Categories 
        public JsonResult GetCategories()
        {
            return Json(DropDownS.Categories(), JsonRequestBehavior.AllowGet);
        }


        //Get RentalIndividualFields 
        public JsonResult GetSubCategories()
        {
            return Json(DropDownS.SubCategories(), JsonRequestBehavior.AllowGet);
        }

        //Get RentalIndividualFieldsByCategoryId 
        public JsonResult GetRentalIndividualFieldsByCategoryId(int categoryId)
        {
            return Json(RentalIndividualFieldsData.GetRentalIndividualFieldsByCategoryId(categoryId), JsonRequestBehavior.AllowGet);
        }


        //Get RentalIndividualFieldsBySubCategoryId
        public JsonResult GetRentalIndividualFieldsBySubCategoryId(int subCategoryId)
        {
            return Json(RentalIndividualFieldsData.GetRentalIndividualFieldsBySubCategoryId(subCategoryId), JsonRequestBehavior.AllowGet);
        }


        //SaveChenage
        public ActionResult SaveChenage(RentalIndividualField[] rentalCategoryInputs)
        {
            return Json(RentalIndividualFieldsData.SaveChenage(rentalCategoryInputs), JsonRequestBehavior.AllowGet);
        }

        //Dispose
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                RentalIndividualFieldsData.Dispose();
                ServiceInsertUpdateDelete.Dispose();

            }
            base.Dispose(disposing);
        }

    }//End Controller
}