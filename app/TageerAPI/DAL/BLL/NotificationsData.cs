using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DAL.Enums.Enums;

namespace DAL.Bll
{
    public class NotificationsData : IDisposable
    {
        TageerEntities db = new TageerEntities();
        bool IsLanguageEnglish = LanguageService.IsEn;


        public void Dispose()
        {
            db.Dispose();
        }
    }//End Class
}
