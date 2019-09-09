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
    [RoutePrefix("Tageer/api/EmailNewsLetters")]
    public class EmailNewsLettersController : ApiController
    {
        EmailNewsLetterData EmailNewsLetterData = new EmailNewsLetterData();


        /// <summary>
        /// اشترك معنا فى النشرة البريدية
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ResponseVM))] 
        [Route("Create")]
        [HttpPost]
        public IHttpActionResult Create(string  email)
        {
            return Json(EmailNewsLetterData.Create(email));
        }



    }//End Controller 
}
