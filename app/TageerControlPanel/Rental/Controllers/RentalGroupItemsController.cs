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
    public class RentalGroupsItemsController : BaseController
    {
		RentalGroupsItemsData RentalGroupsItemsData = new RentalGroupsItemsData();
         // GET: RentalMark
         [PagesRoleAtrribute(PageEnum.RentalGroupsItems,true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        //GetGroups  
        public ActionResult GetGroups()
        {
            return Json(DropDownS.Groups(), JsonRequestBehavior.AllowGet);
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


        //Get RentalGroupsItems 
        public JsonResult GetRentalGroupsItemsByCategory(int categoryId)
        { 
            return Json(RentalGroupsItemsData.GetRentalGroupsItemsByCategoryId(categoryId), JsonRequestBehavior.AllowGet);
        }


        
        //Get  RentalGroupsItems
        
               public JsonResult GetRentalGroupsItemsBySubCategory(int subCategoryId)
        {
            return Json(RentalGroupsItemsData.GetRentalGroupsItemsBySubCategoryId(subCategoryId), JsonRequestBehavior.AllowGet);
        }


        //SaveChenage
        public ActionResult SaveChenage(RentalGroupsItem[] adsGroupsItems)
        {
            return Json(RentalGroupsItemsData.SaveChenage(adsGroupsItems), JsonRequestBehavior.AllowGet);
        }

        //Dispose
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                RentalGroupsItemsData.Dispose();
                ServiceInsertUpdateDelete.Dispose();

            }
            base.Dispose(disposing);
        }

    }//End Controller
}