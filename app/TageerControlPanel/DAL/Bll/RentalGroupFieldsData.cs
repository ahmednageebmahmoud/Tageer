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
    public class RentalGroupsItemsData : BasicBLL
    {

        public object GetRentalGroupsItemsByCategoryId(int categoryId)
        {
            var GroupsItems  = db.GroupsItems.ToList();
            if (GroupsItems.Count == 0)
                return null;
            return GroupsItems .Select(x => new {
                FKGroupsItem_Id = x.Id,
                FKCategory_Id = categoryId,
                x.GroupItemName,
                x.Group. GroupName,
                State =x.
                RentalGroupsItems.Any(c=> c.FKCategory_Id==categoryId&&c.FKSubCategory_Id.HasValue==false)?StateEnumVM.Old : 0,
                Id = x.RentalGroupsItems.Any(c=> c.FKCategory_Id==categoryId&& c.FKSubCategory_Id.HasValue == false) ? x.RentalGroupsItems.Single(c => c.FKCategory_Id == categoryId&& c.FKSubCategory_Id.HasValue == false).Id : 0
            }).ToList();
        }


        
             public object GetRentalGroupsItemsBySubCategoryId(int subCategoryId)
        {
            var GroupsItems  = db.GroupsItems .ToList();

            var SubCategory = db.SubCategories.Find(subCategoryId);
            if (GroupsItems .Count == 0)
                return null;
            return GroupsItems.Select(x => new {
                FKGroupsItem_Id = x.Id,
                FKCategory_Id = SubCategory.FKCategory_Id,
                FKSubCategory_Id = subCategoryId,
                x.GroupItemName,
                x.Group. GroupName,
                State = x.RentalGroupsItems.Any(c => c.FKSubCategory_Id == subCategoryId) ? StateEnumVM.Old : 0,
                Id = x.RentalGroupsItems.Any(c => c.FKSubCategory_Id == subCategoryId) ? x.RentalGroupsItems.Single(c => c.FKSubCategory_Id == subCategoryId).Id : 0
            }).ToList();
        }


        public object SaveChenage(RentalGroupsItem[] adsGroupsItems)
        {
            try
            {
                foreach (var adsGroupsItem in adsGroupsItems)
                {
                    if (adsGroupsItem.State == StateEnumVM.Delete)
                    {
                        object ObjectReturn = DeleteS.RentalGroupsItem(adsGroupsItem);
                        if (ObjectReturn != null) return ObjectReturn;

                    }
                    else if (adsGroupsItem.State == StateEnumVM.Create)
                    {
                        object ObjectReturn = CreateS.RentalGroupsItem(adsGroupsItem);
                        if (ObjectReturn != null) return ObjectReturn;
                    }
                }

                db.SaveChanges();

                return new ResponseVM(RequestTypeEnumVM.Success, Token.SaveChange);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.NotSaveChange, ex.Message);
            }
        }

        public void Dispose()
        {
            db.Dispose();
        }
    }//End Class
}
