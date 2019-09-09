using DAL.Models.ViewModel;
using DAL.Resource;
using DAL.Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Configuration;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace API.Controllers
{
    public class BaseApiController : ActionFilterAttribute
    {


        // as open request 
        public override void OnActionExecuting(HttpActionContext actionContext)
        {


            //Code ...


            //Now Set Culture 
            //Check User Is Login
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                LanguageService.SetCulture();

                //Check User Is Not Blocked
                if (UserService.CheckIsBlocked())
                {
                    var ResponseObject = new { RequestType = RequestTypeEnumVM.Error, Message = Token.YouBlocked, IsData = false };
                    var response = new HttpResponseMessage
                    {
                        Content = new StringContent(JsonConvert.SerializeObject(ResponseObject))
                    };
                    throw new HttpResponseException(response);
                }

            }
            else
            {
                LanguageService.SetCulture(LanguageService.DefaultLangage);
            }
        }

    }
}
