using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.Models.ViewModel
{
 public   class DirectFieldsEnumVM
    {

        public static int Area { get { return Convert.ToInt32(DirectFieldsEnum.Area); } }
        public static int Location { get { return Convert.ToInt32(DirectFieldsEnum.Location); } }
        public static int Mark { get { return Convert.ToInt32(DirectFieldsEnum.Mark); } }
        public static int Materials { get { return Convert.ToInt32(DirectFieldsEnum.Materials); } }
        public static int Nationality { get { return Convert.ToInt32(DirectFieldsEnum.Nationality); } }
        public static int Size { get { return Convert.ToInt32(DirectFieldsEnum.Size); } }
        public static int Country { get { return Convert.ToInt32(DirectFieldsEnum.Country); } }
        public static int Province { get { return Convert.ToInt32(DirectFieldsEnum.Province); } }

    }
}
