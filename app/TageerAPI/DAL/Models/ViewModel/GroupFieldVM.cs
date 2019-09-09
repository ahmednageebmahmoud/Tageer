using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class GroupFieldVM
    {
        /// <summary>
        /// معرف الحقل
        /// </summary>
        public int Id { get;   set; }
        public string Name { get;   set; }

        /// <summary>
        /// اسم الحقل
        /// </summary>
        public string ResourceName { get;   set; }
    }
}
