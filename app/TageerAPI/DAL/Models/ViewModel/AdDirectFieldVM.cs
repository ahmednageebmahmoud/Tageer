using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class AdDirectFieldVM
    {
        /// <summary>
        /// معرف الجنسية
        /// </summary>
        public int NationalityId { get; set; }
        /// <summary>
        /// الطول 
        /// </summary>
        public int AreaLength { get; set; }
        /// <summary>
        /// العرض 
        /// </summary>
        public int AreaWidth { get; set; }
        /// <summary>
        /// الارتفاع 
        /// </summary>
        public int AreaHeight { get; set; }
        /// <summary>
        /// معرف الماركة
        /// </summary>
        public int MarkId { get; set; }
        /// <summary>
        /// خط الطول من الخريطة
        /// </summary>
        public string LocationLatitude { get; set; }
        /// <summary>
        /// خط العرض من الخريطة
        /// </summary>
        public string LocationLongitude { get; set; }
        /// <summary>
        /// معرف الخامة 
        /// </summary>
        public int MaterialId { get; set; }
        /// <summary>
        /// معرف الحجم 
        /// </summary>
        public int SizeId { get; set; }
        /// <summary>
        /// معرف الدولة 
        /// </summary>
        public int CountryId { get; set; }
        /// <summary>
        /// معرف المقاطعة 
        /// </summary>
        public int ProvinceId { get; set; }
    }
}
