using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.BLL
{
    public class GroupsItemsData : IDisposable
    {
        TageerEntities db = new TageerEntities();

        //Get Categorys
        public object GetGroupsItems() {
            var Categorys = db.GroupsItems.ToList();
            if (Categorys.Count == 0)
                return null;
            return Categorys.Select(x => new { x.Id, x.GroupItemName }).ToList();
        }


        public void Dispose()
        {
            db.Dispose();
        }
    }//End Class
}
