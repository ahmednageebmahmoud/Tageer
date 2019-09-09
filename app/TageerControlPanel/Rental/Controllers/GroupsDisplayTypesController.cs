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
    public class GroupsDisplayTypesController : BaseController
    {
		GroupsDisplayTypesData RentalSectionData = new GroupsDisplayTypesData();
         // GET: RentalMark
         [PagesRoleAtrribute(PageEnum.GroupsDisplayTypes,true,true,true)]
        public ActionResult Index()
        {
            return View();
        }


        //Get Rentel Type GroupsItems
        public JsonResult GetRentelGroupsItems()
        {
            return Json(RentalSectionData.GetRentelGroupsItems(), JsonRequestBehavior.AllowGet);
        }

        //Get Groups 
        public JsonResult GetGroups()
        { 
            return Json(DropDownS.Groups(), JsonRequestBehavior.AllowGet);
        }

        //Get Categories
        public JsonResult GetCategories()
        {
            return Json(DropDownS.Categories(), JsonRequestBehavior.AllowGet);
        }

        //Get Sub Categories
        public JsonResult GetSubCategories()
        {
            return Json(DropDownS.SubCategories(), JsonRequestBehavior.AllowGet);
        }

        //Get Input Types
        public JsonResult GetInputTypes()
        {
            return Json(DropDownS.InputTypes(), JsonRequestBehavior.AllowGet);
        }

        //SaveChenage
        public ActionResult SaveChenage(GroupsDisplayType[] adsGroupsItems)
        {
            return Json(RentalSectionData.SaveChange(adsGroupsItems), JsonRequestBehavior.AllowGet);
        }

        //Dispose
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                RentalSectionData.Dispose();
            }
            base.Dispose(disposing);
        }

    }//End Controller
}