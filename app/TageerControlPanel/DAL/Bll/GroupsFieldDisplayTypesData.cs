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
    public class GroupsDisplayTypesData : BasicBLL
    {
        //Get GroupsDisplayTypes
        public object GetGroupsDisplayTypes(int categoryId)
        {
            var GroupsItems = db.Groups.ToList();
            if (GroupsItems.Count == 0)
                return null;
            return GroupsItems.Select(x => new {
                FKGroup_Id  = x.Id,
                FKCategory_Id = categoryId,
                x.GroupName,
                State =x.GroupsDisplayTypes.Any(c=> c.FKCategory_Id==categoryId)?"Old":null,
                Id = x.GroupsDisplayTypes.Any(c=> c.FKCategory_Id == categoryId) ? x.GroupsDisplayTypes.Where(c => c.FKCategory_Id == categoryId).Single().Id : 0
            }).ToList();
        }


        //Get Rentel Type GroupsItems
             public object GetRentelGroupsItems()
        {
            var GroupsDisplayTypes = db.GroupsDisplayTypes.ToList();
            if (GroupsDisplayTypes.Count == 0)
                return null;
            return GroupsDisplayTypes.Select(x => new {
                x.Id,
                x.FKInputType_Id,
                x.FKCategory_Id,
                x.FKSubCategory_Id,
                x.FKGroup_Id ,
            }).ToList();
        }
        public void Dispose()
        {
            db.Dispose();
        }

        public object SaveChange(GroupsDisplayType[] adsGroupsItems)
        {
            try
            {
                foreach (var groupsFieldsDisplayType in adsGroupsItems)
                {
                    if (groupsFieldsDisplayType.State == StateEnumVM.Delete)
                    {
                        object ObjectReturn = DeleteS.GroupsDisplayType( groupsFieldsDisplayType);
                        if (ObjectReturn != null) return ObjectReturn;
                    }
                    else if (groupsFieldsDisplayType.State == StateEnumVM.Create)
                    {
                        object ObjectReturn = CreateS.GroupsDisplayType(groupsFieldsDisplayType);
                        if (ObjectReturn != null) return ObjectReturn;
                    }
                }

                db.SaveChanges();

                return new ResponseVM(RequestTypeEnumVM.Success, Token.SaveChange);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.NotSaveChange, ex.Message, ex);
            }
        }



    }//End Class
}
