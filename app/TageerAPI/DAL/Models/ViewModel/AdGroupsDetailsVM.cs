using System.Collections.Generic;

namespace DAL.Models.ViewModel

{
    public class AdGroupsDetailsVM
    {
        public int GroupId { get;   set; }
        public string GroupName { get; set; }
        public IEnumerable<string> Values { get; set; }
    }
}