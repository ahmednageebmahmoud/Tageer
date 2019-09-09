using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.ModelBinding;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OAuth;
using API.Models;
using API.Providers;
using API.Results;
using DAL.BLL;
using DAL.Models.ViewModel;
using System.Web.Http.Description;
using DAL.Models;
namespace API.Controllers
{
    [Authorize]
    [BaseApiController]
    [RoutePrefix("Tageer/api/Account")]
    public class AccountController : ApiController
    {
        private const string LocalLoginProvider = "Local";
        private ApplicationUserManager _userManager;
        public UsersData UsreData = new UsersData();



        /// <summary>
        /// الحصول على الاشعارات الخاصة بـ المستخدم الحالى 
        /// </summary>
        /// <param name="lastNotifiId">آخر معرف اشعار تم الحصول علية من السيرفر من اجل تخطيق وجلب الذى يلية فقط</param>
        /// <param name="takeCount">العدد المراد الحصول علية</param>
        /// <returns></returns>
        [ResponseType(typeof(List<NotificationVM>))]
        [Route("GetNotifications/{lastNotifiId}/{takeCount}")]
        [HttpGet]
        public IHttpActionResult GetNotifications(long lastNotifiId, int takeCount)
        {
            return Json(UsreData.GetNotifications(lastNotifiId, takeCount));
        }


        /// <summary>
        /// الحصول على الاعلانات الذى فضلها المستخدم الحالى
        /// </summary>
        /// <param name="lastAdId">معرف آخر اعلان لجلب الاعلانات المفضلة الذى يلية</param>
        /// <param name="takeCount">عدد الاعلانات المراد الحصل عليها </param>
        /// <returns></returns>
        [ResponseType(typeof(List<AdInformationVM>))]
        [Route("GetFavorites/{lastAdId}/{takeCount}")]
        [HttpGet]
        public IHttpActionResult GetFavorites(int lastAdId, int takeCount)
        {
            return Json(UsreData.GetFavorites(lastAdId, takeCount));
        }

        /// <summary>
        /// انشاء حساب جديد
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [AllowAnonymous]
        [ResponseType(typeof(ResponseVM))]
        [Route("Register")]
        public async Task<IHttpActionResult> Register(UserVM model)
        {
            return Json(UsreData.SaveChenage(model, false));
        }
        /// <summary>
        /// تفعيل الهاتف
        /// </summary>
        /// <param name="phoneNumber"></param>
        /// <returns></returns>
        [AllowAnonymous]
        [ResponseType(typeof(ResponseVM))]
        [Route("ActivePhoneNumber/{phoneNumber}/{code}")]

        public async Task<IHttpActionResult> ActivePhoneNumber(string phoneNumber, int code)
        {
            return Json(UsreData.ActivePhoneNumber(phoneNumber, code));
        }
        /// <summary>
        ///اعادة ارسال كود التفعيل للهاتف
        /// </summary>
        /// <param name="phoneNumber"></param>
        /// <returns></returns>
        [AllowAnonymous]
        [ResponseType(typeof(ResponseVM))]
        [Route("ResendActiveCodeToPhone/{phoneNumber}")]
        public async Task<IHttpActionResult> ResendActiveCodeToPhone(string phoneNumber)
        {
            return Json(UsreData.ResendActiveCodeToPhone(phoneNumber));
        }

        /// <summary>
        /// جلب معلومات المستخدم الحالى
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("GetCurrentUserInformation")]
        public async Task<IHttpActionResult> GetCurrentUserInformation()
        {
            return Json(UsreData.GetCurrentUserInformation());
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && _userManager != null)
            {
                _userManager.Dispose();
                _userManager = null;
                UsreData.Dispose();
            }

            base.Dispose(disposing);
        }
    }
}
