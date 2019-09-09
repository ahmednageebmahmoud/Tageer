using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.Models.ViewModel
{
public static	class RoleEnumVM
	{
		public static int Client { get { return Convert.ToInt32(RolesEnum.Client); } }
		public static int Manager { get { return Convert.ToInt32(RolesEnum.Manager); } }
		public static int Supervisor { get { return Convert.ToInt32(RolesEnum.Supervisor); } }
		public static int Company { get { return Convert.ToInt32(RolesEnum.Company); } }

        
    }
}
