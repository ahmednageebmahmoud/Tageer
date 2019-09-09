using DAL.Bll;
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
using System.Web.Http.Cors;
using System.Web.Http.Description;

namespace API.Controllers
{
    [BaseApiController]
    [RoutePrefix("Tageer/api/Service")]

    public class ServiceController : ApiController
    {
        DropDownService DropDownS = new DropDownService();

        /// <summary>
        /// الحصول على جميع الدول دفعة ااحدة
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("GetCountries")]
        public   IHttpActionResult GetCountries()
        {
            var re = Request;
            return Json(DropDownS.Countries());
        }

       


        /// <summary>
        /// الحصول على المقاطعات بناء على الدولة
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("GetProvinces")]
        public IHttpActionResult GetProvinces(int countryId)
        {
            return Json(DropDownS.Provinces(countryId));
        }

        /// <summary>
        /// الحصول على المقاطعات
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("GetProvinces")]
        public IHttpActionResult GetProvinces()
        {
            return Json(DropDownS.Provinces());
        }
 
        /// <summary>
        /// الصول على جميع الفئات
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("GetCategories")]
        public IHttpActionResult GetCategories()
        {
            return Json(DropDownS.Categories());
        }


        /// <summary>
        /// الحصول على الفئات الفرعية بناء على الفئة الاساسية
        /// </summary>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("GetSubCategories")]
        public IHttpActionResult GetSubCategories(int categoryId)
        {
            return Json(DropDownS.SubCategories(categoryId));
        }

        /// <summary>
        /// الخصول على الفئات الفرعية
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("GetSubCategories")]
        public IHttpActionResult GetSubCategories()
        {
            return Json(DropDownS.SubCategories());
        }


        /// <summary>
        /// الحصول على جميع الانواع البشرية 
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("GetGenders")]
        public IHttpActionResult GetGenders()
        {
            return Json(DropDownS.Genders());
        }



        /// <summary>
        /// الحصول على انواع وقت الايجار
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("GetRentalTimeTypes")]
        public IHttpActionResult GetRentalTimeTypes()
        {
            return Json(DropDownS.RentalTimeTypes());
        }
        


 
        /// <summary>
        /// الحصول على معلومات التطبيق
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("GetAppInformation")]
        public IHttpActionResult GetAppInformation()
        {
            return Json(DropDownS.GetAppInformation());
        }

        [ResponseType(typeof(ResponseVM))]
        [Route("GetActivities")]
        public IHttpActionResult GetActivities()
        {
            return Json(DropDownS.GetActivities());
        }
        
        protected override void Dispose(bool disposing)
       {
            DropDownS.Dispose();
        }
    }
}
