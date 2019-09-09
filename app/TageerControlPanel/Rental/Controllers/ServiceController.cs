using DAL.BLL;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ControlPanel.Controllers
{
    public class ServiceController : BaseController
    {

        NotificationsData NotificationsData = new NotificationsData();
        TechnicalSupportData TechnicalSupportData = new TechnicalSupportData();

        //Gat User Data
        public JsonResult FillUserData()
        {
            var User = UserS.GetCurrentUser();
            return Json(new {User.Id,User.UserName,ImageUrl= User.ImageUrl }, JsonRequestBehavior.AllowGet);
        }
      
        //Get Notifications
        public JsonResult GetNotifications(int skip, int take)
        {
            return Json(NotificationsData.GetNotifications(CookieService.UserInfo.Id, skip,take,false), JsonRequestBehavior.AllowGet);
        }

        //Get Technical Support
        public JsonResult GetTechnicalSupport(int skip, int take)
        {
            return Json(  TechnicalSupportData.GetTechnicalSupportForNotifications( skip, take,false), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ReadNotification(int notifyId)
        {
            return Json(NotificationsData.ReadNotify(notifyId), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ReadTecSupport(int tecId)
        {
            return Json(TechnicalSupportData.ReadTecSupport(tecId), JsonRequestBehavior.AllowGet);
        }

        public object GetControlPanelMenu()
        {
            return Json(MenuS.GetControlPanelMenu(), JsonRequestBehavior.AllowGet);


        }
    }
}