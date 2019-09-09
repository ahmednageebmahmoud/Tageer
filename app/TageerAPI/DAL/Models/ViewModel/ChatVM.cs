using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
 public   class ChatVM
    {
        public int Id { get;   set; }
        public ChatUserInformationVM UserRecived { get; set; }
        public List<ChateMessageVM> Messages { get; set; }
    }
}
