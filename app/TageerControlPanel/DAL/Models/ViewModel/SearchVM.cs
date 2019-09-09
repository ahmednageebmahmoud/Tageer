using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
  public  class SearchVM
    {
        public int? UcerCreatedId { get; set; }

        public int? LastAdId { get; set; }
        public int Take { get; set; }
        public int? SortType { get; set; }
        public int? CategoryId { get; set; }
        public int? SubCategoryId { get; set; }
        public int? CountryId { get; set; }
        public int? ProvinceId { get; set; }
        public string Title { get; set; }
    }
}
