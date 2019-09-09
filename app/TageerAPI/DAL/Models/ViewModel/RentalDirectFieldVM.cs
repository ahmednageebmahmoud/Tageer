using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class RentalDirectFieldVM
    {
        public bool IsNationality { get; set; }
        public bool IsArea { get; set; }
        public bool IsMark { get; set; }
        public bool IsLocation { get; set; }
        public bool IsMaterial { get; set; }
        public bool IsSize { get; set; }
        public bool IsCountry { get; set; }
        public bool IsProvince { get; set; }

        public bool IsCountryRequierd { get; set; }
        public bool IsProvinceRequierd { get; set; }
        public bool IsSizeRequierd { get; set; }
        public bool IsAreaRequierd { get; set; }
        public bool IsLocationRequierd { get; set; }
        public bool IsMarkRequierd { get; set; }
        public bool IsMaterialRequierd { get; set; }
        public bool IsNationalityRequierd { get; set; }

        public List<ItemVM> NationalityItems { get; set; }
        public List<ItemVM> MarkItems { get; set; }
        public List<ItemVM> MaterialItems { get; set; }
        public List<ItemVM> SizeItems { get; set; }
    }
}
