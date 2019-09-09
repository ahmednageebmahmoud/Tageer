using DAL.Models;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.BLL
{
    public class BasicBLL : IDisposable
    {
        public TageerEntities db;
        public UpdateService UpdateS;
        public CreateService CreateS;
        public UserService UserService;
        public AdsService AdService;
        public CheckedService CheckedService;
        public readonly long UserLoggadId;
        public readonly bool LangIsEn;

        public BasicBLL()
        {
            this.db = new TageerEntities();
            this.UserService = new UserService();
            this.AdService = new AdsService();
            this.UserLoggadId = AccessToken.GetUserId();
            this.LangIsEn = LanguageService.IsEn;

            this.CheckedService = new CheckedService(db);
            this.UpdateS = new UpdateService(db);
            this.CreateS = new CreateService(db);

        }


        public static string GetValueByLanguage(string valueEn, string valueAr)
        {
            return LanguageService.IsEn ? valueEn : valueAr;
        }

        public void Dispose()
        {
            this.db.Dispose();
        }
    }
}
