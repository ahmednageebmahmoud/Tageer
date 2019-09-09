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
    public class RentalMaterialsData : BasicBLL
    {

        //Get Rentel Materials By Category
        public object GetRentelMaterialsByCategory(int categoryId)
        {
            var Materials = db.Materials.ToList();
            if (Materials.Count == 0)
                return null;
            return Materials.Select(x => new {
                Id = x.RentalMaterials.Any(c => c.FKCategory_Id == categoryId&&!c.FKSubCategory_Id.HasValue) ? x.RentalMaterials.Where(c => c.FKCategory_Id == categoryId&& !c.FKSubCategory_Id.HasValue).Single().Id : 0,
                FKMaterial_Id = x.Id,
                FKCategory_Id = categoryId,
                x.MaterialName,
                State = x.RentalMaterials.Any(c => c.FKCategory_Id == categoryId&& !c.FKSubCategory_Id.HasValue) ? StateEnumVM.Old : 0
            }).ToList();
        }


        /// <summary>
        /// Get Materials With Rental Type only 
        /// </summary>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        public object GetRentalMaterialsBySubCategory(int subcategoryId)
        {
            var Materials = db.Materials.ToList();
            if (Materials.Count == 0)
                return null;
            var SubCategory = db.SubCategories.Find(subcategoryId);
            return Materials.Select(x => new
            {
                Id = x.RentalMaterials.Any(c => c.FKSubCategory_Id == subcategoryId) ? x.RentalMaterials.Where(c => c.FKSubCategory_Id == subcategoryId).Single().Id : 0,
                FKMaterial_Id = x.Id,
                FKCategory_Id = SubCategory.FKCategory_Id,
                FKSubCategory_Id = subcategoryId,
                x.MaterialName,
                State = x.RentalMaterials.Any(c => c.FKSubCategory_Id == subcategoryId ) ? StateEnumVM.Old : 0
            }).ToList();
        }




        public object SaveChange(RentalMaterial[] rentalMaterials)
        {
            try
            {
                foreach (var rentalMaterial in rentalMaterials)
                {
                    if (rentalMaterial.State == StateEnumVM.Delete)
                    {
                        //Delete
                        var ObjectReturn = DeleteS.RentalMaterial(rentalMaterial);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (rentalMaterial.State == StateEnumVM.Update)
                    {
                        //Update
                        var ObjectReturn = UpdateS.RentalMaterial(rentalMaterial);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (rentalMaterial.State == StateEnumVM.Create)
                    {
                        //Create
                        var ObjectReturn = CreateS.RentalMaterial(rentalMaterial);
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
