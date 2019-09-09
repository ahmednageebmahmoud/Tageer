using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using System.Text.RegularExpressions;
using System.Web;
using DAL.Models.ViewModel;

namespace DAL.Service
{
    public class MenuService : IDisposable
    {
        TageerEntities db = new TageerEntities();
        UserService UserS = new UserService();




        public void Dispose()
        {
            db.Dispose();
            UserS.Dispose();
        }

       
 


    }//End Class
}
