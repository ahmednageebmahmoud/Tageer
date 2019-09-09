using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class AdGroupFieldVM
    {
        /// <summary> 
        /// Group Id
        /// </summary>
        public int GroupId { get; set; }
        /// <summary>
        /// Group One More Values As Select One Moro Items With Input Type CheckBox
        /// </summary>
        public List<int> Values { get; set; }
        /// <summary>
        /// Group Value String  As Enter Value With Input Type Radio
        /// </summary>
        public string ValueString { get; set; }
    }
}
