using DAL.Models;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Service
{
    public class BasicService
    {
        protected TageerEntities db;

        public List<string> FilesRemove;

       public CheckedService CheckedS = new CheckedService();

    }
}


