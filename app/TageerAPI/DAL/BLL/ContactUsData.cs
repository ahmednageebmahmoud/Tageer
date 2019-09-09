using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models.ViewModel;
using DAL.Resource;

namespace DAL.BLL
{
    public class ContactUsData : BasicBLL
    {
        public object Create(ContactUsCreateVM cont)
        {
            try
            {

                object ObjectReturn = this.CreateS.ContactUs(cont);
                if (ObjectReturn != null)
                    return ObjectReturn;

                db.SaveChanges();
                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }

        }


    }//end class
}
