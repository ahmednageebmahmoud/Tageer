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
    public class ActivitiesController : BaseController
    {
		ActivitiesData ActivityData = new ActivitiesData();
         // GET: Activity
         [PagesRoleAtrribute(PageEnum.Activities,true,true,true)]
        public ActionResult Index()
        {
            return View( );
        }
        //Get Counties 
        public JsonResult GetActivities()
        { 
            return Json(ActivityData.GetActivities(), JsonRequestBehavior.AllowGet);
        }

        //Get Flags 
        public JsonResult GetFlags()
        {
            return Json(ActivityData.GetFlags(), JsonRequestBehavior.AllowGet);
        }


        //SaveChenage
        public ActionResult SaveChenage(Activity[] Activities)
        {
            return Json(ActivityData.SaveChenage(Activities), JsonRequestBehavior.AllowGet);
        }



    }//End Controller
}