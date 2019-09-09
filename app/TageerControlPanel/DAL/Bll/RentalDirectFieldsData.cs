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
    public class RentalDirectFieldsData : BasicBLL
    {

        //نجلب الحقول التى هيا مع الفئات فقط
        //Get RentalDirectFieldsByCategoryId
        public object GetRentalDirectFieldsByCategoryId(int categoryId)
        {
            var Fiedls = db.DirectFields.ToList();
            if (Fiedls.Count == 0)
                return null;
            return Fiedls.Select(x => new
            {
                FkDirectField_Id = x.Id,
                FkCategory_Id = categoryId,
                x.FieldName,
            

                State = x.RentalDirectFields.Any(c => c.FkCategory_Id == categoryId && !c.FkSubCategory_Id.HasValue) ? StateEnumVM.Old : 0,
                IsRequired = x.RentalDirectFields.Any(c => c.FkCategory_Id == categoryId && !c.FkSubCategory_Id.HasValue) ? x.RentalDirectFields.Where(c => c.FkCategory_Id == categoryId && !c.FkSubCategory_Id.HasValue).Single().IsRequired : false,
                Id = x.RentalDirectFields.Any(c => c.FkCategory_Id == categoryId && !c.FkSubCategory_Id.HasValue) ? x.RentalDirectFields.Where(c => c.FkCategory_Id == categoryId && !c.FkSubCategory_Id.HasValue).Single().Id : 0
            }).ToList();
        }


        //Get RentalDirectFieldsBySubCategoryId
        public object GetRentalDirectFieldsBySubCategoryId(int subCategoryId)
        {
            var Fiedls = db.DirectFields.ToList();
            var SubCategory = db.SubCategories.Find(subCategoryId);
            if (Fiedls.Count == 0)
                return null;
            return Fiedls.Select(x => new
            {
                FkDirectField_Id = x.Id,
                FkSubCategory_Id = subCategoryId,
                FkCategory_Id = SubCategory.FKCategory_Id,
                x.FieldName,
                State = x.RentalDirectFields.Any(c => c.FkSubCategory_Id == subCategoryId) ? StateEnumVM.Old : 0,
                IsRequired = x.RentalDirectFields.Any(c => c.FkSubCategory_Id == subCategoryId) ? x.RentalDirectFields.Where(c => c.FkSubCategory_Id == subCategoryId).Single().IsRequired : false,
                Id = x.RentalDirectFields.Any(c => c.FkSubCategory_Id == subCategoryId) ? x.RentalDirectFields.Where(c => c.FkSubCategory_Id == subCategoryId).Single().Id : 0
            }).ToList();
        }

        //Save Chenage
        public object SaveChenage(RentalDirectField[] rentalInputs)
        {
            try
            {
                foreach (var rentalInput in rentalInputs)
                {
                    if (rentalInput.State == StateEnumVM.Delete)
                    {
                        //Delete
                        var ObjectReturn = DeleteS.RentalDirectField(rentalInput);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (rentalInput.State == StateEnumVM.Update)
                    {
                        //Update
                        var ObjectReturn = UpdateS.RentalDirectField(rentalInput);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (rentalInput.State == StateEnumVM.Create)
                    {
                        //Create
                        var ObjectReturn = CreateS.RentalDirectField(rentalInput);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                }
                db.SaveChanges();
                return new { RequestType = RequestTypeEnumVM.Success, Message = Token.Saved };
            }
            catch (Exception ex)
            {
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange };
            }
        }

        public void Dispose()
        {
            db.Dispose();
        }
    }//End Class
}
