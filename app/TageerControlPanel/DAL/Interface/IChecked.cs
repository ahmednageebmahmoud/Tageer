using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interface
{
 public    interface IChecked
    {
        
      bool UserNameValid(string userName);
        bool Login(string userName, string password);
    }
}
