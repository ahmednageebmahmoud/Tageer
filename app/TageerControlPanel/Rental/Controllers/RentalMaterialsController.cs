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
    public class RentalMaterialsController : BaseController
    {
        RentalMaterialsData RentalMaterialData = new RentalMaterialsData();
        // GET: RentalMaterial
         [PagesRoleAtrribute(PageEnum.RentalMaterials,true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        //Get Rentel Materials By Category 
        public JsonResult GetRentelMaterialsByCategory(int categoryId)
        {
            return Json(RentalMaterialData.GetRentelMaterialsByCategory(categoryId), JsonRequestBehavior.AllowGet);
        }

        //Get Get Rental Materials By Sub Category
        public JsonResult GetRentalMaterialsBySubCategory(int subCategoryId)
        {
            return Json(RentalMaterialData.GetRentalMaterialsBySubCategory(subCategoryId), JsonRequestBehavior.AllowGet);
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
        public ActionResult SaveChange(RentalMaterial[] rentalMaterials)
        {

            return Json(RentalMaterialData.SaveChange(rentalMaterials), JsonRequestBehavior.AllowGet);
        }

        //Dispose
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                RentalMaterialData.Dispose();
                ServiceInsertUpdateDelete.Dispose();

            }
            base.Dispose(disposing);
        }

    }//End Controller
}