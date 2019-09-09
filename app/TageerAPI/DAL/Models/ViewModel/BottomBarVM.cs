using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class PostFooterVM
    {
        public int IndividualFieldId { get; internal set; }
        public string IndividualFieldName { get; internal set; }
        public string Value { get; internal set; }
    }
}
