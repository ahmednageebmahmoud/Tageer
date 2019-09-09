using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class CompanyOfficeVM
    {
        public string Address { get; set; }
        public int CountryId { get; set; }
        /// <summary>
        /// خط الطول
        /// </summary>
        public string Longitude { get; set; }
        /// <summary>
        /// خط العرض
        /// </summary>
        public string Latitude { get; set; }
    }
}
