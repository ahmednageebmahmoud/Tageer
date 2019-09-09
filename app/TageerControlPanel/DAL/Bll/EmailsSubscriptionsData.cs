using BLL.Services;
using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.BLL
{
    public class EmailsSubscriptionsData : BasicBLL
    {
        //Get EmailsSubscriptions
        public object GetEmailsSubscriptions(int skip, int take , DateTime? from ,DateTime? to ,string emailSearch)
        {
            var EmailsSubscriptions = db.SelectEmailsSubscriptionsByFilter(skip,take,from,to,emailSearch).ToList();

            if (EmailsSubscriptions.Count() == 0)
            {
                if (skip==0)
                    return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResult);
                return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResultMore);
            }

            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, EmailsSubscriptions.Select(c => GetSampleEmailsSubscriptionInformation(c)));
        }

        public object GetSampleEmailsSubscriptionInformation(SelectEmailsSubscriptionsByFilter_Result c)
        {
            return new
            {
                Id = c.Id,
                Email = c.Email,
                CreatedDate = DateService.GetDateTimeByCulture(c.CreateDateTime),
            };
        }

        public object SendMessage(SendMailVM message)
        {
            try
            {
                EmailService.SendEmails(message);
                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }

        }
    }//End Class
}
