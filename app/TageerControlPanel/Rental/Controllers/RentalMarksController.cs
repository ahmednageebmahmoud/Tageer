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
    public class RentalMarksController : BaseController
    {
        RentalMarksData RentalMarkData = new RentalMarksData();
        // GET: RentalMark
         [PagesRoleAtrribute(PageEnum.RentalMarks,true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        //Get Rentel Marks By Category 
        public JsonResult GetRentelMarksByCategory(int categoryId)
        {
            return Json(RentalMarkData.GetRentelMarksByCategory(categoryId), JsonRequestBehavior.AllowGet);
        }

        //Get Get Rental Marks By Sub Category
        public JsonResult GetRentalMarksBySubCategory(int subCategoryId)
        {
            return Json(RentalMarkData.GetRentalMarksBySubCategory(subCategoryId), JsonRequestBehavior.AllowGet);
        }


        //Get Catefories
        public ActionResult GetCategories()
        {
            return Json(DropDownS.Categories(), JsonRequestBehavior.AllowGet);
        }

        //Get Sub Catefories
        public ActionResult GetSubCategories()
        {
            return Json(DropDownS.SubCategories(), JsonRequestBehavior.AllowGet);
        }


        //SaveChange
        public ActionResult SaveChange(RentalMark[] rentalMarks)
        {

            return Json(RentalMarkData.SaveChange(rentalMarks), JsonRequestBehavior.AllowGet);
        }

        //Dispose
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                RentalMarkData.Dispose();
                ServiceInsertUpdateDelete.Dispose();

            }
            base.Dispose(disposing);
        }

    }//End Controller
}