using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
  public  class RentalGroupFieldVM
    {
        /// <summary>
        /// معرف المجموعة
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// من اجل تحديد طريقة العرض لـ المجموعة
        /// </summary>
        public int DisplayType { get;   set; }
        /// <summary>
        /// الحقول التى سوف تعرض فى المجموعة
        /// </summary>
        public List<GroupFieldVM> Fields { get;   set; }
     /// <summary>
     /// اسم المجموعة
     /// </summary>
        public string ResourceName { get;   set; }


    }
}
