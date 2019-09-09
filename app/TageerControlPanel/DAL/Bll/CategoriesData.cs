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
    public class CategoriesData : BasicBLL
    {
        //Get Categories
        public object GetCategories() {
            var Categories = db.Categories.ToList();
            if (Categories.Count == 0)
                return null;
            
            return Categories.Select(x => new { x.Id, x.NameAr,x.NameEn,x.CategoryName,Image=x.AllFile.FullFileUrl }).ToList();
        }


        public void Dispose()
        {
            db.Dispose();
        }

        public object SavaChange(Category[] rentalCategories)
        {
            try
            {

                foreach (var rentalCategory in rentalCategories)
                {
                    if (rentalCategory.State == StateEnumVM.Delete)
                    {
                        object ObjectReturn = DeleteS.Category(rentalCategory);
                        if (ObjectReturn != null) return ObjectReturn;

                    }
                    else if (rentalCategory.State == StateEnumVM.Update)
                    {
                        object ObjectReturn = UpdateS.Category(rentalCategory);
                        if (ObjectReturn != null) return ObjectReturn;
                    }
                    else if (rentalCategory.State == StateEnumVM.Create)
                    {
                        object ObjectReturn = CreateS.Category(rentalCategory);
                        if (ObjectReturn != null) return ObjectReturn;
                    }
                }

                db.SaveChanges();
                this.RemoveFiles();

                return new ResponseVM(RequestTypeEnumVM.Success, Token.SaveChange);
            }
            catch (Exception ex)
            {
                this.FilesRemove = new List<string>();
                return new ResponseVM(RequestTypeEnumVM.Error, Token.NotSaveChange, ex.Message, ex);
            }
        }
    }//End Class
}
