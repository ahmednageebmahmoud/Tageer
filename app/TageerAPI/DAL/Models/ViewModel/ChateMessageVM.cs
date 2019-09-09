using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class ChateMessageVM
    {
        public long Id { get;   set; }
        public int ChatId { get; set; }
        public string Message { get;   set; }
        public string SedDateTime { get;   set; }
        public ChatUserInformationVM User { get;   set; }
    }
}
