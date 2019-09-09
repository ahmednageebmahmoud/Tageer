using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.Models.ViewModel
{
    public static class InputsTypeEnumVM
    {
        public static int Checkbox { get {return Convert.ToInt32( InputsTypeEnum.Checkbox); } }
        public static int Text { get { return Convert.ToInt32( InputsTypeEnum.Text); } }
        public static int Date { get {return Convert.ToInt32( InputsTypeEnum.Date); } }
        public static int Time { get { return Convert.ToInt32( InputsTypeEnum.Time); } }
        public static int Number { get {return Convert.ToInt32( InputsTypeEnum.Number); } }
        public static int Radio { get {return Convert.ToInt32( InputsTypeEnum.Radio); } }
        public static int Select { get { return Convert.ToInt32( InputsTypeEnum.Select); } }
        public static int LinkWithTable { get { return Convert.ToInt32( InputsTypeEnum.LinkWithTable); } }
        public static int Decimal { get { return Convert.ToInt32( InputsTypeEnum.Decimal); } }

    }
}
