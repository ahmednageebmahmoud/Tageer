using ControlPanel.Models;
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
    public class AdsController : BaseController
    {
        AdsData AdData = new AdsData();

         // GET: Ads
         [PagesRoleAtrribute(PageEnum.Ads,true,true,true)]
        public ActionResult Index()
        {
            return View( );
        }
        //Get Ads 
        public JsonResult GetAds(SearchVM search )
        { 
            return Json(AdData.GetAds(search), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetFilterItems(int? userId)
        {
            return Json(new ResponseVM(RequestTypeEnumVM.Success,Token.Success,new {
                Categories=DropDownS.Categories(),
                SubCategories=DropDownS.SubCategories(),
                Countries=DropDownS.Countries(),
                Provinces = DropDownS.Provinces(),
                CurrentUserInformation=DropDownS.UserInformation(userId)
            }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAdDetails(int adId)
        {
            return Json(AdData.GetAdDetails(adId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteAd(int adId)
        {
            return Json(AdData.DeleteAd(adId), JsonRequestBehavior.AllowGet);
        }
        protected override void Dispose(bool disposing)
        {
             
            base.Dispose(disposing);    
        }

    }//End Controller
}