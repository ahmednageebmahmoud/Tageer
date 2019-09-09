using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
 public   class NotificationVM
    {
        public long Id { get; set; }
        public string Title { get; set; }
        public string DateTimeSince { get; set; }
    }//end class
}
