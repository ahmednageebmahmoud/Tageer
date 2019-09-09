using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Http;
using DAL.Bll;
using DAL.Models.ViewModel;
using System.Web.Http.Description;
using DAL.Service;
using DAL.BLL;

namespace API.Controllers
{
    [BaseApiController]
    [RoutePrefix("Tageer/api/ContactUs")]
    public class ContactUsController : ApiController
    {
        ContactUsData ContactUsData = new ContactUsData();

        /// <summary>
        /// ارسال رسالة تواصل معنا
        /// </summary>
        /// <param name="cont"></param>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))] 
        [Route("Create")]
        [HttpPost]
        public IHttpActionResult Create(ContactUsCreateVM  cont)
        {
            return Json(ContactUsData.Create(cont));
        }



    }//End Controller 
}
