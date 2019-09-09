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
    public class MaterialsController : BaseController
    {
        MaterialsData MaterialData = new MaterialsData();

         // GET: Materials
         [PagesRoleAtrribute(PageEnum.Materials,true,true,true)]
        public ActionResult Index()
        {
            return View( );
        }
        //Get Materials 
        public JsonResult GetMaterials( )
        { 
            return Json(MaterialData.GetMaterials(), JsonRequestBehavior.AllowGet);
        }
 

        //SaveChenage
        [HttpPost]
        public JsonResult SaveChange(Material[] marks)
        {
            return Json(MaterialData.SaveChange(marks), JsonRequestBehavior.AllowGet);
        }

        //Dispose
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                MaterialData.Dispose();
                ServiceInsertUpdateDelete.Dispose();

            }
            base.Dispose(disposing);
        }

    }//End Controller
}