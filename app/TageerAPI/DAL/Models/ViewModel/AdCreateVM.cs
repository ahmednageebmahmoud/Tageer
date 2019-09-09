using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
  public  class AdCreateVM
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }

        /// <summary>
        /// Rental Time Type   
        /// </summary>
        public int RentalTimeTypeId { get; set; }
        /// <summary>
        /// Category
       /// </summary>
        public int CategoryId { get; set; }
        /// <summary> 
        /// Sub Category   
        /// </summary>
        public int SubCategoryId { get; set; }
        /// <summary>
        /// Individual Field   
        /// </summary>
        public AdIndividualFieldVM AdIndividualField { get; set; }
        /// <summary> 
        /// Group Field   
        /// </summary>
        public List<AdGroupFieldVM> AdGroupsField { get; set; }

        /// <summary>
        /// Direct Field   
        /// </summary>
        public AdDirectFieldVM AdDirectField { get; set; }

    /// <summary>  
    /// Images Ad   
    /// </summary>
        public List<FileVM> Images { get; set; }

    }
}
