using DAL.BLL;
using DAL.Models;
using DAL.Resource;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using static DAL.Enums.Enums;

namespace ControlPanel.Controllers
{[Authorize]
    public class UserProfileController : BaseController
    {
        UserProfileData UserProfileData = new UserProfileData();
        // GET: UserProfile
        public ActionResult Index()
        {
            return View();
        }

        //Get User Data
        public ActionResult GetUserData()
        { 
            return Json(UserProfileData.GetUserData(CookieService.UserInfo.Id), JsonRequestBehavior.AllowGet);
        }

        //Get User Data For Update
        public ActionResult GetUserDataForUpdate()
        { 
            return Json(UserProfileData.GetUserDataForUpdate(CookieService.UserInfo.Id), JsonRequestBehavior.AllowGet);
        }

     


        //Get Provinces
        public JsonResult GetProvinces()
        {
            return Json(DropDownS.Provinces(), JsonRequestBehavior.AllowGet);
        }

        //Get Languages

        public JsonResult GetLanguages()
        {
            return Json(DropDownS.LanguageTypes(), JsonRequestBehavior.AllowGet);
        }

 

        //Get Genders
        [HttpGet]
        public JsonResult GetGenders()
        {
            return Json(DropDownS.Genders(), JsonRequestBehavior.AllowGet);
        }


        //Get Roles
        [HttpGet]
        public JsonResult GetRoles()
        {
            return Json(DropDownS.Roles(), JsonRequestBehavior.AllowGet);
        }
        
        //Get Jobs
        [HttpGet]
        public JsonResult GetCountries()
        {
            return Json(DropDownS.Countries(),JsonRequestBehavior.AllowGet);
        }

        protected override void Dispose(bool disposing)
        {
           
            base.Dispose(disposing);
        }
    }//end 
}