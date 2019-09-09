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
    public class MaterialsData : BasicBLL
    {
        //Get Materials
        public object GetMaterials() {
            var Materials = db.Materials.ToList();
            if (Materials.Count == 0)
                return null;
            return Materials.Select(x => new { x.Id, x.NameAr,x.NameEn,x.MaterialName }).ToList();
        }


        public void Dispose()
        {
            db.Dispose();
        }

        public object SaveChange(Material[] marks)
        {
            try
            {
                foreach (Material mark in marks)
                {
                    if (mark.State == StateEnumVM.Delete)
                    {
                        //Delete
                        var ObjectReturn = DeleteS.Material(mark);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (mark.State == StateEnumVM.Update)
                    {
                        //Update
                        var ObjectReturn = UpdateS.Material(mark);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (mark.State == StateEnumVM.Create)
                    {
                        //Create
                        var ObjectReturn = CreateS.Material(mark);
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
    }//End Class
}
