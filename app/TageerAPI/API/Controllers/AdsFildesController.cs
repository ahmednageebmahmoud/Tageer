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
using System.Web.Http.Description;

namespace API.Controllers
{
    [BaseApiController]
    [RoutePrefix("Tageer/api/AdFields")]
    public class AdsFildesController : ApiController
    {

        AdsFildesData AdsFildesData = new AdsFildesData();

        /// <summary>
        /// الحصول على الخقول التى يجب ملىئها لـ اعلان معين
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))]
        [Route("GetAdFields/{subCategoryId}")]
        public   IHttpActionResult GetAdFields(int subCategoryId)
        {
            return Json(AdsFildesData.GetAdFields(subCategoryId));
        }


        protected override void Dispose(bool disposing)
       {

            AdsFildesData.Dispose();
        }
    }
}
