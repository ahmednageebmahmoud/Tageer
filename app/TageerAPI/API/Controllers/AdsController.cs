using DAL.Bll;
using DAL.BLL;
using DAL.Models.ViewModel;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;

namespace API.Controllers
{
    [Authorize]
    [BaseApiController]
    [RoutePrefix("Tageer/api/Ads")]
    public class AdsController : ApiController
    {

        AdsData AdsData = new AdsData();
        CommentData CommentData = new CommentData();
        

        /// <summary>
        /// انشاء اعلان
        /// </summary>
        /// <param name="adCereateVM"></param>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("Create")]
        [HttpPost]
        public   IHttpActionResult CreateAd(AdCreateVM adCereateVM)
        {
            return Json(AdsData.Create(adCereateVM));
        }


        /// <summary>
        /// الحصول على آخر الاعلانات
        /// </summary>
        /// <param name="search">هنا يتم ارسال الحقول على هيئة كويرى استرينج</param>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        [ResponseType(typeof(List<AdInformationVM>))]
        [Route("GetAds")]
        public IHttpActionResult GetAds([FromUri] SearchVM search)
        {
            return Json(AdsData.GetAds(search));
        }

        /// <summary>
        /// الحصول على جميع تفاصيل الاعلان دفعة واحدة  بـ الاضافة الى آخر 10 تعليقات
        /// </summary>
        /// <param name="adId"></param>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        [ResponseType(typeof(AdDetailsVM))]
        [Route("GetAdDetailsById/{adId}")]
        public IHttpActionResult GetAdDetailsById(int adId)
        {
            return Json(AdsData.GetAdDetailsById(adId));
        }



        /// <summary>
        /// تبديل تفضيل الاعلان
        /// </summary>
        /// <param name="adId"></param>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [HttpPost]
        [Route("AdFavoriteToggle/{adId}")]
        public IHttpActionResult AdFavoriteToggle(int adId)
        {
            return Json(AdsData.AdFavoriteToggle(adId));
        }




        /// <summary>
        /// الحصول على اعلانات مستخدم معين ولاكن بـ مقدار معين
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="lastAdId"></param>
        /// <param name="take"></param>
        /// <returns></returns>
        
        [ResponseType(typeof(List<AdIndividualFieldVM>))]
        [AllowAnonymous]
        [Route("GetUserAds")]
        [HttpGet]
        public IHttpActionResult GetUserAds(string userName, int lastAdId, int take)
        {
            return Json(AdsData.GetUserAds(userName,lastAdId,take));
        }

        /// <summary>
        /// انشاء تعليق 
        /// </summary>
        /// <param name="comment"></param>
        /// <returns></returns>
        [ResponseType(typeof(CommentVM))]
        [Route("CreateComment")]
        [HttpPost]
        public IHttpActionResult CreateComment(CommentVM comment)
        {
            return Json(CommentData.Create(comment));
        }

        /// <summary>
        /// الحصول على مجموعة جديدة من التعليقات
        /// </summary>
        /// <param name="adId">معرف الاعلان</param>
        /// <param name="lastCommentId">معرف آخر تعليق قد حلصت علية من السيرفر فى مثل هذة العمليات من اجل جلب التعليقات الذى تلية</param>
        /// <param name="takeCount">عدد التعليقات المراد الحصول عليها</param>
        /// <returns></returns>
        [ResponseType(typeof(List<CommentVM>))]
        [Route("GetMoreComments/{adId}/{lastCommentId}/{takeCount}")]
        [AllowAnonymous]
        [HttpGet]
        public IHttpActionResult GetMoreComments(int adId,int lastCommentId, int takeCount)
        {
            return Json(CommentData.GetMoreComments(adId, lastCommentId, takeCount));
        }
        

        protected override void Dispose(bool disposing)
       {

            AdsData.Dispose();
        }
    }
    
}
