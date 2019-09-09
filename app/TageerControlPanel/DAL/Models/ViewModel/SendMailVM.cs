using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
 public   class SendMailVM
    {
        public string Subject { get; set; }
        public string Message { get; set; }
        public List<string> Emails { get; set; }
    }
}
