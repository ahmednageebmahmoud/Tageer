using DAL.BLL;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace ControlPanel.Controllers

{
    [Authorize]
    public class AppInformationsController : BaseController
    {
        AppsInformationsBLL AppsInformationData = new AppsInformationsBLL();

         // GET: AppsInformation
        public ActionResult Index()
        {
            return View( );
        }

         //Get AppsInformations 
         public JsonResult GetAppsInformations()
        {  
            return Json(AppsInformationData.GetAppsInformations(), JsonRequestBehavior.AllowGet);
        }


        //SaveChenage
        public ActionResult SaveChenage(AppsInformation[] appsInformations)
        {
            return Json(AppsInformationData.SaveChenage(appsInformations), JsonRequestBehavior.AllowGet);
        }


    }//End Controller
}