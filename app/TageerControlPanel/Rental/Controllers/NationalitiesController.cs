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
    public class NationalitiesController : BaseController
    {
		NationalitiesData NationalitiesData = new NationalitiesData();
         // GET: Country
         [PagesRoleAtrribute(PageEnum.Nationalities,true,true,true)]
        public ActionResult Index()
        {
            return View( );
        }
        //Get Counties 
        public JsonResult GetNationalities()
        { 
            return Json(NationalitiesData.GetNationalities(), JsonRequestBehavior.AllowGet);
        }


        //SaveChenage
        public ActionResult SaveChenage(Nationality[] Nationalities)
        {
            return Json(NationalitiesData.SaveChenage(Nationalities), JsonRequestBehavior.AllowGet);
        }



    }//End Controller
}