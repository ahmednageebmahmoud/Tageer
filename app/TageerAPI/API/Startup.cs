using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Owin;
using Owin;
using System.Web.Http;
using Microsoft.Owin.Security.DataHandler.Encoder;
using Microsoft.Owin.Security.Jwt;

//[assembly: OwinStartup(typeof(API.Startup))]

namespace API
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            //ConfigureAuth(app);


            ////For Access Token
            //var config = new HttpConfiguration();
            //WebApiConfig.Register(config);
            //app.UseWebApi(config);
        }

    
    }
}
