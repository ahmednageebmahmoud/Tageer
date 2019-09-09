using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;

namespace DAL.Service
{
    public class DeleteService:IDisposable
    {
        public TageerEntities db;// = new ControlePanel();
        List<HistoryDetailVM> HistoryDetails = new List<HistoryDetailVM>();
        public int UserId { get { return AccessToken.GetUserId(); } }
        public void Dispose()
        {
         //   db.Dispose();
        }

    }//End Class
}
