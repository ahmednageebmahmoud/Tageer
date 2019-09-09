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
    public class TechnicalSupportData : BasicBLL
    {

        //Get TechnicalSupport
        public object GetTechnicalSupport(int take, int skip)
        {
            var TechnicalSupports = db.TechnicalSupports.OrderByDescending(c => c.Id).Skip(skip).Take(take).ToList();

            if (TechnicalSupports.Count == 0)
                return new ResponseVM { RequestType = RequestTypeEnumVM.Info, Message = Token.DataNotFound };
            return TechnicalSupports.Select(x => new
            {
                x.Id,
                Date = DateService.GetDateTimeByCulture(x.CreateDateTime),
                x.Message,
                x.Email,
                x.Subject,
                x.UserName
            }).ToList();
        }

        public object CreateTechnicalSupport(TechnicalSupportVM technicalSupport)
        {
            try
            {

                var ObjectReturn = CreateS.CreateTechnicalSupport(technicalSupport);
                if (ObjectReturn != null)
                    return ObjectReturn;

                db.SaveChanges();
                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = Token.Created };
            }
            catch (Exception ex)
            {
                return new ResponseVM { RequestType = RequestTypeEnumVM.Success, Message = Token.NotCreated, InnerException = ex.InnerException.Message };

            }
        }

        public object ReadTecSupport(int tecId)
        {
            try
            {

                var Tec = db.TechnicalSupports.Find(tecId);
                if (Tec == null)
                    return new ResponseVM(RequestTypeEnumVM.Error, Token.TechnicalSupportFound);


                Tec.IsRead = true;
                db.SaveChanges();

                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }
        }

        //Get   Technical Support Notifications
        public object GetTechnicalSupportForNotifications(int skip, int take, bool? isRead)
        {
            var TechnicalSupports = db.GetTechnicalSupports(skip, take, isRead).Select(c => new
            {
                c.Id,
                c.Message,
                c.Email,
                c.IsRead,
                c.UserName,
                c.Subject,
                DateTimeSince = DateService.CaltDateTimeSince(c.CreateDateTime)

            }).ToList();

            if (TechnicalSupports.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(RequestTypeEnumVM.Error, Token.NoResult);
                return new ResponseVM(RequestTypeEnumVM.Error, Token.NoResultMore);
            }
            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, TechnicalSupports);
        }

    }//End Class
}
