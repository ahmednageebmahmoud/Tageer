using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.Models.ViewModel
{
public    class RequestTypeEnumVM
    {
        public static int Error { get { return Convert.ToInt32(RequestTypeEnum.Error); } }
        public static int Info { get { return Convert.ToInt32(RequestTypeEnum.Info); } }
        public static int Warning { get { return Convert.ToInt32(RequestTypeEnum.Warning); } }
        public static int Success { get { return Convert.ToInt32(RequestTypeEnum.Success); } }

    }
}
