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
    public class SubCategoriesData : BasicBLL
    {
        //Get SubCategories
        public object GetSubCategories(int categoryId) {
            var SubCategories = db.SubCategories.Where(x=> x.FKCategory_Id== categoryId).ToList();
            if (SubCategories.Count == 0)
                return null;
            return SubCategories.Select(x => new {
                x.Id,
                x.NameAr,
                x.NameEn,
                x.SubCategoryName,
                x.FKCategory_Id ,
                Image=    x.AllFile.FullFileUrl,
                x.ImagesCount
            }).ToList();
        }


        public void Dispose()
        {
            db.Dispose();
        }

        public object SaveChange(SubCategory[] rentalSubCategories)
        {
            try
            {
                foreach (var rentalSubCategory in rentalSubCategories)
                {
                    if (rentalSubCategory.State == StateEnumVM.Delete)
                    {
                        object ObjectReturn = DeleteS.SubCategory(rentalSubCategory);
                        if (ObjectReturn != null) return ObjectReturn;

                    }
                    else if (rentalSubCategory.State == StateEnumVM.Update)
                    {
                        object ObjectReturn = UpdateS.SubCategory(rentalSubCategory);
                        if (ObjectReturn != null) return ObjectReturn;
                    }
                    else if (rentalSubCategory.State == StateEnumVM.Create)
                    {
                        object ObjectReturn = CreateS.SubCategory(rentalSubCategory);
                        if (ObjectReturn != null) return ObjectReturn;
                    }
                }


                db.SaveChanges();
                this.RemoveFiles();
                return new ResponseVM(RequestTypeEnumVM.Success, Token.SaveChange);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.NotSaveChange, ex.Message, ex);
            }
        }

    }//End Class
}
