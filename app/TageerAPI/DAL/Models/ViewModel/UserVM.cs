using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
 public   class UserVM
    {
        public Int64? Id { get; set; }
    
        public string Email { get; set; }

       
        public string Password { get; set; }
 
        public string UserName { get; set; }
        public string Image { get; set; }
        public string ImageName { get; set; }
        public bool IsCompany { get; set; }
        public CompanyInfomrationVM CompanyInfomration { get; set; }
        public string PhoneNumber { get;   set; }
    }
}
