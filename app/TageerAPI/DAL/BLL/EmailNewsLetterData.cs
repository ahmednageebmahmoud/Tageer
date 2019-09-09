using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models.ViewModel;
using DAL.Resource;

namespace DAL.BLL
{
    public class EmailNewsLetterData : BasicBLL
    {
        public object Create(string email)
        {
            try
            {

                object ObjectReturn = this.CreateS.EmailNewsLetter(email);
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
