using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.Models.ViewModel
{
 public   class SortTypeEnumVM
    {
        public static int ByAmountAsc { get { return Convert.ToInt32(SortType.ByAmountAsc   ); } }
        public static int ByAmountDesc { get { return Convert.ToInt32(SortType.ByAmountDesc); } }
        public static int ByNew { get { return Convert.ToInt32(SortType.ByNew); } }
    }
}
