using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.Models.ViewModel
{
  public static  class IndividualFieldEnumVM
    {
        public static int Age { get { return Convert.ToInt32(IndividualFieldEnum.Age); } }
        public static int AmountOfInsurance { get { return Convert.ToInt32(IndividualFieldEnum.AmountOfInsurance); } }
        public static int ApartmentCount { get { return Convert.ToInt32(IndividualFieldEnum.ApartmentCount); } }
        public static int BagsBigCount { get { return Convert.ToInt32(IndividualFieldEnum.BagsBigCount); } }
        public static int BagsSmallCount { get { return Convert.ToInt32(IndividualFieldEnum.BagsSmallCount); } }
        public static int BuildingYear { get { return Convert.ToInt32(IndividualFieldEnum.BuildingYear); } }
        public static int Color { get { return Convert.ToInt32(IndividualFieldEnum.Color); } }
        public static int ElevatorCount { get { return Convert.ToInt32(IndividualFieldEnum.ElevatorCount); } }
        public static int FloorNumber { get { return Convert.ToInt32(IndividualFieldEnum.FloorNumber); } }
        public static int Model { get { return Convert.ToInt32(IndividualFieldEnum.Model); } }
        public static int ParkingCount { get { return Convert.ToInt32(IndividualFieldEnum.ParkingCount); } }
        public static int PricePerMeter { get { return Convert.ToInt32(IndividualFieldEnum.PricePerMeter); } }
        public static int RoomsCount { get { return Convert.ToInt32(IndividualFieldEnum.RoomsCount); } }
        public static int SeatsCount { get { return Convert.ToInt32(IndividualFieldEnum.SeatsCount); } }
        public static int StreetWidth { get { return Convert.ToInt32(IndividualFieldEnum.StreetWidth); } }
        public static int ToiletsCount { get { return Convert.ToInt32(IndividualFieldEnum.ToiletsCount); } }
    }
}
