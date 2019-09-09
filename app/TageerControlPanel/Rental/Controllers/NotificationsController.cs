using ControlPanel.Models;
using DAL.BLL;
using DAL.Models;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static DAL.Enums.Enums;

namespace ControlPanel.Controllers

{
    public class NotificationsController : BaseController
    {
        NotificationsData NotificationsData = new NotificationsData();

        // GET: Notifications
        public ActionResult Index()
        {
            return View();
        }


        //Get Notifications
        public JsonResult GetNotifications(int skip, int take,bool? isRead)
        {
            return Json(NotificationsData.GetNotifications(CookieService.UserInfo.Id, skip, take, isRead), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult ReadNotification(int notifyId)
        {
            return Json(NotificationsData.ReadNotify(notifyId), JsonRequestBehavior.AllowGet);
        }


    }//end controller
}