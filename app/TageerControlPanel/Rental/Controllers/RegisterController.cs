using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ControlPanel.Controllers
{
    
    public class RegisterController : BaseController
    {
        // GET: Register
        public ActionResult Index()
        {
            //Check User Login Or Not
            if (User.Identity.IsAuthenticated)
            {
                //user Alredy Login Now Must be return Home Page
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
    }//End Controller
}