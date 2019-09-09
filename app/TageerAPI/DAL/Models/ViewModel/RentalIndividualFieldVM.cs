using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
  public  class RentalIndividualFieldVM
    {
        /// <summary>
        /// من اجل تحديد الداتا التى سوف تعرض او التى سوف تاخذ
        /// </summary>
        public int AdInputId { get; set; }
        /// <summary>
        /// لتحديد نوع عرض الداتا
        /// </summary>
        public int InputTypeId { get; set; }
        /// <summary>
        /// لتحديد هل هذا النوع مطلوب ام ليس مطلوب
        /// </summary>
        public bool IsRequired { get; set; }

    }
}
