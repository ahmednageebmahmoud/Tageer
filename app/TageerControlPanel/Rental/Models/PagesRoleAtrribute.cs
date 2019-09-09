using DAL.BLL;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static DAL.Enums.Enums;

namespace ControlPanel.Models
{
    public class PagesRoleAtrribute : ActionFilterAttribute
    {
        public PageEnum Page{ get; set; }
        public bool Display { get; set; }
        public bool Delete { get; set; }
        public bool Create { get; set; }
        public bool Edit { get; set; }
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            var PageRole = PageService.GetPageRole((int)this.Page);

            if(
                (!PageRole.IsDisplay&&this.Display) &&
                (!PageRole.IsDisplay&&this.Delete) &&
                (!PageRole.IsUpdate&&this.Edit) &&
                (!PageRole.IsCreate&&this.Create) 
                )

            filterContext.Result = new HttpNotFoundResult();
        }

        public PagesRoleAtrribute(PageEnum page, bool disPlay, bool delete, bool createandEdit = false)
        {
            this.Page = page;
            this.Display = disPlay;
            this.Delete = delete;
            this.Create = createandEdit;
            this.Edit = createandEdit;
        }

    }
}