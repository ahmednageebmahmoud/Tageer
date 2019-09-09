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
    public class RentalIndividualFieldsData : BasicBLL
    {

        //نجلب الحقول التى هيا مع الفئات فقط
        //Get RentalIndividualFieldsByCategoryId
        public object GetRentalIndividualFieldsByCategoryId(int categoryId)
        {
            var Inputs = db.IndividualFields.ToList();
            if (Inputs.Count == 0)
                return null;
            return Inputs.Select(x => new
            {
                FkIndividualField_Id = x.Id,
                FKCategory_Id = categoryId,
                x.InputName,
                x.InputsType.InputTypeName,
                x.IsTypeAllowCustom,

                State = x.RentalIndividualFields.Any(c => c.FKCategory_Id == categoryId && !c.FKSubCategory_Id.HasValue) ? StateEnumVM.Old : 0,
                IsRequired = x.RentalIndividualFields.Any(c => c.FKCategory_Id == categoryId && !c.FKSubCategory_Id.HasValue) ? x.RentalIndividualFields.Where(c => c.FKCategory_Id == categoryId && !c.FKSubCategory_Id.HasValue).Single().IsRequired : false,
                IsBar = x.RentalIndividualFields.Any(c => c.FKCategory_Id == categoryId && !c.FKSubCategory_Id.HasValue) ? x.RentalIndividualFields.Where(c => c.FKCategory_Id == categoryId && !c.FKSubCategory_Id.HasValue).Single().IsBar : false,
                Id = x.RentalIndividualFields.Any(c => c.FKCategory_Id == categoryId && !c.FKSubCategory_Id.HasValue) ? x.RentalIndividualFields.Where(c => c.FKCategory_Id == categoryId && !c.FKSubCategory_Id.HasValue).Single().Id : 0
            }).ToList();
        }


        //Get RentalIndividualFieldsBySubCategoryId
        public object GetRentalIndividualFieldsBySubCategoryId(int subCategoryId)
        {
            var Inputs = db.IndividualFields.ToList();
            var SubCategory = db.SubCategories.Find(subCategoryId);
            if (Inputs.Count == 0)
                return null;
            return Inputs.Select(x => new
            {
                FkIndividualField_Id = x.Id,
                FKSubCategory_Id = subCategoryId,
                FKCategory_Id = SubCategory.FKCategory_Id,
                x.InputName,
                x.InputsType.InputTypeName,
                x.IsTypeAllowCustom,
                State = x.RentalIndividualFields.Any(c => c.FKSubCategory_Id == subCategoryId) ? StateEnumVM.Old : 0,
                IsRequired = x.RentalIndividualFields.Any(c => c.FKSubCategory_Id == subCategoryId) ? x.RentalIndividualFields.Where(c => c.FKSubCategory_Id == subCategoryId).Single().IsRequired : false,
                IsBar = x.RentalIndividualFields.Any(c => c.FKSubCategory_Id == subCategoryId) ? x.RentalIndividualFields.Where(c => c.FKSubCategory_Id == subCategoryId).Single().IsBar : false,
                Id = x.RentalIndividualFields.Any(c => c.FKSubCategory_Id == subCategoryId) ? x.RentalIndividualFields.Where(c => c.FKSubCategory_Id == subCategoryId).Single().Id : 0
            }).ToList();
        }

        //Save Chenage
        public object SaveChenage(RentalIndividualField[] rentalInputs)
        {
            try
            {
                foreach (var rentalInput in rentalInputs)
                {
                    if (rentalInput.State == StateEnumVM.Delete)
                    {
                        //Delete
                        var ObjectReturn = DeleteS.RentalIndividualField(rentalInput);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (rentalInput.State == StateEnumVM.Update)
                    {
                        //Update
                        var ObjectReturn = UpdateS.RentalIndividualField(rentalInput);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (rentalInput.State == StateEnumVM.Create)
                    {
                        //Create
                        var ObjectReturn = CreateS.RentalIndividualField(rentalInput);
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
