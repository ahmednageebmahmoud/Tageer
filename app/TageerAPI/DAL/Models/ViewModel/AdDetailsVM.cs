using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class AdDetailsVM
    {

        public IEnumerable<CommentVM> AdComments { get;  set; }
        public string AdPath { get;  set; }
        public string CategoryName { get; internal set; }
        public string Description { get;  set; }
        public List<PostFooterVM> FooterValues { get;  set; }
        public int Id { get;  set; }
        public IEnumerable<string> Images { get;  set; }
        public string PhoneNumbre { get;  set; }
        public string Price { get;  set; }
        public string Province { get;  set; }
        public string RentalTimeTypeName { get; internal set; }
        public string SinceDateTime { get;  set; }
        public string SubCategoryName { get; internal set; }
        public string Title { get;  set; }
        public string UserName { get;  set; }
        public AdDirectFieldDetailsVM AdDirectFieldDetails { get; set; }
        public List<AdGroupsDetailsVM> AdGroupsDetails { get; set; }
        public List<AdIndividualFieldsDetailsVM> AdIndividualFieldsDetails { get; set; }
    }
}
