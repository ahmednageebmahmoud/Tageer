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
    public class TechnicalSupportController : BaseController
    {
        TechnicalSupportData ContactUData = new TechnicalSupportData();
        // GET: ContactU
        public ActionResult Index()
        {
            return View();
        }

        // GET: Read TechnicalSupport
        public ActionResult Read()
        {
            return View();
        }


        //Get Counties 
        public JsonResult GetTechnicalSupport(int skip, int take,  bool? isRead)
        {
            return Json(ContactUData.GetTechnicalSupportForNotifications(skip, take, isRead), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ReadTecSupport(int tecId)
        {
            return Json(ContactUData.ReadTecSupport(tecId), JsonRequestBehavior.AllowGet);
        }
        
    }//End Controller
}