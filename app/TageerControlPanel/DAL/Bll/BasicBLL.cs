using DAL.Models;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.BLL
{
public    class BasicBLL {

        public TageerEntities db=new TageerEntities();

        public List<string> FilesRemove = new List<string>();
        public CheckedService CheckedS = new CheckedService();

        public DeleteService DeleteS;
        public UpdateService UpdateS;
        public CreateService CreateS;
        public BasicBLL()
        {
            this.DeleteS = new DeleteService(db, FilesRemove);
            this.UpdateS = new UpdateService(db, FilesRemove);
            this.CreateS = new CreateService(db);
        }
        public static string GetValueByLanguage(string valueEn, string valueAr)
        {
            return LanguageService.IsEn ? valueEn : valueAr;
        }

        internal void RemoveFiles()
        {
                FileService.RemoveFiles(this.FilesRemove);
        }
        
    }
}
