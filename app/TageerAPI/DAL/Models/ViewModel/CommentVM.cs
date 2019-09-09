using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class CommentVM
    {
        public int Id { get;   set; }
        public int AdId { get;   set; }
        public string Comment { get;   set; }
        public string UserImage { get;   set; }
        public string UserName { get;   set; }
    }
}
