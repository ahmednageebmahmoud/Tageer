using ControlPanel.Models;
using DAL.BLL;
using DAL.Models;
using DAL.Resource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using static DAL.Enums.Enums;

namespace ControlPanel.Controllers
{
    [Authorize]
    public class MarksController : BaseController
    {
        MarksData MarkData = new MarksData();

         // GET: Marks
         [PagesRoleAtrribute(PageEnum.Marks,true,true,true)]
        public ActionResult Index()
        {
            return View( );
        }
        //Get Marks 
        public JsonResult GetMarks( )
        { 
            return Json(MarkData.GetMarks(), JsonRequestBehavior.AllowGet);
        }
 

        //SaveChenage
        [HttpPost]
        public JsonResult SaveChange(Mark[] marks)
        {
            return Json(MarkData.SaveChange(marks), JsonRequestBehavior.AllowGet);
        }

        //Dispose
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                MarkData.Dispose();
                ServiceInsertUpdateDelete.Dispose();

            }
            base.Dispose(disposing);
        }

    }//End Controller
}