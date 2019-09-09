using DAL.Models;
using DAL.Resource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.Service
{
    public class Delete : IDisposable
    {
        public TageerEntities db = new TageerEntities();

        public void Dispose()
        {
            db.Dispose();
        }
    }//End class
}
