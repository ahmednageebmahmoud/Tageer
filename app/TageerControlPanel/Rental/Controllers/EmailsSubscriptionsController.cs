using ControlPanel.Models;
using DAL.BLL;
using DAL.Models;
using DAL.Models.ViewModel;
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
{
    [Authorize]
    public class EmailsSubscriptionsController : BaseController
    {
        EmailsSubscriptionsData EmailsSubscriptionData = new EmailsSubscriptionsData();

        // GET: EmailsSubscriptions
        [PagesRoleAtrribute(PageEnum.EmailsSubscriptions, true, true, true)]
        public ActionResult Index()
        {
            return View();
        }
        //Get EmailsSubscriptions 
        public JsonResult GetEmailsSubscriptions(int skip, int take, DateTime? from, DateTime? to, string emailSearch)
        {
            return Json(EmailsSubscriptionData.GetEmailsSubscriptions(skip, take, from, to, emailSearch), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetFilterItems(int? userId)
        {
            return Json(new ResponseVM(RequestTypeEnumVM.Success, Token.Success, new
            {
                Categories = DropDownS.Categories(),
                SubCategories = DropDownS.SubCategories(),
                Countries = DropDownS.Countries(),
                Provinces = DropDownS.Provinces(),
                CurrentUserInformation = DropDownS.UserInformation(userId)
            }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SendMessage(SendMailVM obj)
        {
            return Json(EmailsSubscriptionData.SendMessage(obj), JsonRequestBehavior.AllowGet);
        }

    }//End Controller
}