using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using DAL.Models.ViewModel;
using DAL.Models;
using DAL.Service;
using DAL.Resource;

namespace API.Controllers
{
    [RoutePrefix("Tageer/api/Login")]
    [BaseApiController]
    public class LoginController : ApiController
    {

        [HttpPost]
        [Route("GetAccessToken/{userName}/{password}/{remmberMe}")]
        public IHttpActionResult AccessToken(string userName, string password,bool  remmberMe)
        {
            UserService UserS = new UserService();
            return Json(UserS.Login(userName, password, remmberMe));
        }


    }
}
