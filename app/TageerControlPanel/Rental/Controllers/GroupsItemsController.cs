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
    ///not working
    public class GroupsItemsController : BaseController
    {
        GroupsItemsData GroupsFieldData = new GroupsItemsData();

         // GET: GroupsItems
         [PagesRoleAtrribute(PageEnum.RentalGroupsItems,true,true,true)]
        public ActionResult Index()
        {
            return View( );
        }
        //Get GroupsItems 
        public JsonResult GetGroupsItems( )
        { 
            return Json(GroupsFieldData.GetGroupsItems(), JsonRequestBehavior.AllowGet);
        }

        
        //Dispose
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                GroupsFieldData.Dispose();
            }
            base.Dispose(disposing);
        }

    }//End Controller
}