using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
   public class CompanyInfomrationVM
    {
        public string Description { get; set; }
        public int ActivityId { get; set; }

        public List<CompanyOfficeVM> Officess { get; set; }
        public string ActivityName { get; internal set; }
    }
}
