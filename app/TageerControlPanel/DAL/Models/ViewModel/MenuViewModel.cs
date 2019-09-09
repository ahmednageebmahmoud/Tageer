using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
   public class MenuViewModel
    {


		public string Name { get; set; }
		public string ClassName { get; set; }

		public List<Privilege> SubMenus { get; set; }
		public int ParentId { get; set; }
		public object PriveOrder { get; set; }
		public string NameEn { get; set; }



	}//end class
}
