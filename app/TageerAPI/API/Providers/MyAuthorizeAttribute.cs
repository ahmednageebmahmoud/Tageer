using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Http.Controllers;

namespace API.Providers
{
    public class MyAuthorizeAttribute: AuthorizeAttribute
    {
        protected override bool IsAuthorized(HttpActionContext actionContext)
        {
            return false;
            //return base.IsAuthorized(actionContext);
        }

        public override void OnAuthorization(HttpActionContext actionContext)
        {
          //  base.OnAuthorization(actionContext);
        }
    }
}