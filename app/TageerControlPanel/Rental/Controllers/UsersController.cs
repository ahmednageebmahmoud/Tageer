using ControlPanel.Models;
using DAL.BLL;
using DAL.Models;
using DAL.Resource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using static DAL.Enums.Enums;

namespace ControlPanel.Controllers


{
    [Authorize]
    public class UsersController : BaseController
    {
        UsersData UserData = new UsersData();
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }


        // GET: User
         [PagesRoleAtrribute(PageEnum.Users,true,true,true)]
        public ActionResult Index()
        {
            return View();
        }

        //Create And Update
        public ActionResult CreateAndUpdate()
        {
            return View();
        }

        //Get Users 
        public JsonResult GetUsers(int take, int skip, int? countryId, int? accountTypeId, bool? isBlocked,
            DateTime? createDateFrom, DateTime? createDateTo)
        {

            return Json(UserData.GetUsers(take, skip, countryId, accountTypeId, isBlocked, createDateFrom, createDateTo), JsonRequestBehavior.AllowGet);
        }

        //Get User For Update

        public JsonResult GetUserForUpdate(int userId)
        {
            return Json(UserData.GetUserDataForUpdate(userId),   JsonRequestBehavior.AllowGet);
        }
        //Get Countries
        public JsonResult GetCountries()
        {
            return Json(DropDownS.Countries(), JsonRequestBehavior.AllowGet);
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

        //Get Roles
        public JsonResult GetRoles()
        {
            return Json(DropDownS.Roles(), JsonRequestBehavior.AllowGet);
        }

        //SaveChenage
        public ActionResult SaveChanage( Address address, User user, UserRole[] userRoles, HttpPostedFileBase image, bool isUpdate)
        {
            return Json(UserData.SaveChenage( address, user, userRoles, image, isUpdate), JsonRequestBehavior.AllowGet);
        }

        //public ActionResult Delete(int userId)
        //{
        //    return Json(UserData.Delete(userId), JsonRequestBehavior.AllowGet);
        //}

        
    }//End Controller
}