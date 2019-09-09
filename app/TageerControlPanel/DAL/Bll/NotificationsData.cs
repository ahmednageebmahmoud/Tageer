using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.BLL
{
    public class NotificationsData : BasicBLL
    {
        bool IsLanguageEnglish = LanguageService.IsEn;

        public object GetNotifications(long userId, int skip, int take, bool? isRead)
        {
            var Notifications = db.GetNotificationsByFilter(skip, take, userId, isRead, true).Select(c => new
            {
                c.Id,
                c.NotificationCount,
                c.IsRead,
                Title = LanguageService.IsEn ? c.TitleEn : c.TitleAr,
                Body = LanguageService.IsEn ? c.BodyEn : c.BodyAr,


                DateTimeSince = DateService.CaltDateTimeSince(c.DataTime),
            }).ToList();

            if (Notifications.Count() == 0)
            {
                if (skip == 0)
                    return new ResponseVM(RequestTypeEnumVM.Error, Token.NoResult);
                return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResultMore);
            }
            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, Notifications);
        }

        public object ReadNotify(long notifyId)
        {
            try
            {
                long UserId = CookieService.UserInfo.Id;
                var UserPrivateNotify = db.UsersPrivateNotifies.SingleOrDefault(c => c.FKNotification_Id == notifyId && c.FkUser_Id == UserId);
                if (UserPrivateNotify == null)
                {
                    db.UsersPrivateNotifies.Add(new UsersPrivateNotify()
                    {
                        FKNotification_Id = notifyId,
                        IsRead = true,
                        FkUser_Id = UserId,

                    });
                }
                else
                {
                    UserPrivateNotify.IsRead = true;
                }

                db.SaveChanges();
                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success);
            }
            catch (Exception ex)
            {

                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);

            }

        }



        public void Dispose()
        {
            db.Dispose();
        }
    }//End Class
}
