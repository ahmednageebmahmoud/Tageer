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
    public class RentalMarksData : BasicBLL
    {

        //Get Rentel Marks By Category
        public object GetRentelMarksByCategory(int categoryId)
        {
            var Marks = db.Marks.ToList();
            if (Marks.Count == 0)
                return null;
            return Marks.Select(x => new {
                Id = x.RentalMarks.Any(c => c.FKCategory_Id == categoryId&&!c.FKSubCategory_Id.HasValue) ? x.RentalMarks.Where(c => c.FKCategory_Id == categoryId&& !c.FKSubCategory_Id.HasValue).Single().Id : 0,
                FKMark_Id = x.Id,
                FKCategory_Id = categoryId,
                x.MarkName,
                State = x.RentalMarks.Any(c => c.FKCategory_Id == categoryId&& !c.FKSubCategory_Id.HasValue) ? StateEnumVM.Old : 0
            }).ToList();
        }


        /// <summary>
        /// Get Marks With Rental Type only 
        /// </summary>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        public object GetRentalMarksBySubCategory(int subcategoryId)
        {
            var Marks = db.Marks.ToList();
            if (Marks.Count == 0)
                return null;
            var SubCategory = db.SubCategories.Find(subcategoryId);
            return Marks.Select(x => new
            {
                Id = x.RentalMarks.Any(c => c.FKSubCategory_Id == subcategoryId) ? x.RentalMarks.Where(c => c.FKSubCategory_Id == subcategoryId).Single().Id : 0,
                FKMark_Id = x.Id,
                FKCategory_Id = SubCategory.FKCategory_Id,
                FKSubCategory_Id = subcategoryId,
                x.MarkName,
                State = x.RentalMarks.Any(c => c.FKSubCategory_Id == subcategoryId ) ? StateEnumVM.Old : 0
            }).ToList();
        }




        public object SaveChange(RentalMark[] rentalMarks)
        {
            try
            {
                foreach (var rentalMark in rentalMarks)
                {
                    if (rentalMark.State == StateEnumVM.Delete)
                    {
                        //Delete
                        var ObjectReturn = DeleteS.RentalMark(rentalMark);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (rentalMark.State == StateEnumVM.Update)
                    {
                        //Update
                        var ObjectReturn = UpdateS.RentalMark(rentalMark);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (rentalMark.State == StateEnumVM.Create)
                    {
                        //Create
                        var ObjectReturn = CreateS.RentalMark(rentalMark);
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
