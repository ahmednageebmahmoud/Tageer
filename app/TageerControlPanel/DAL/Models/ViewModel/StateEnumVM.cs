using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.Models.ViewModel
{
  public  class StateEnumVM
    {
        public static int Create { get { return Convert.ToInt32(StateEnum.Create); } }
        public static int Update { get { return Convert.ToInt32(StateEnum.Update); } }
        public static int Delete { get { return Convert.ToInt32(StateEnum.Delete); } }
        public static int Old { get { return Convert.ToInt32(StateEnum.Old); } }



    }
}
