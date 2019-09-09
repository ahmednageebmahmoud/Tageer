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
    public class ProvincesData : BasicBLL
    {

        //Get provinces
        public object GetProvinces(int countryId)
        {
            var Provinces = db.Provinces.Where(x => x.FKCountry_Id == countryId).ToList();
            if (Provinces.Count == 0)
                return null;
            return Provinces.Select(x => new { x.Id, x.NameAr, x.NameEn, x.ProvinceName }).ToList();
        }



        //Save Chenage
        public object SaveChenage(Province[] provinces)
        {
            try
            {
                foreach (Province province in provinces)
                {
                    if (province.State == StateEnumVM.Delete )
                    {
                        //Delete
                        var ObjectReturn = DeleteS.Province(province);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (province.State == StateEnumVM.Update )
                    {
                        //Update
                        var ObjectReturn = UpdateS.Province(province);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (province.State == StateEnumVM.Create )
                    {
                        //Create
                        var ObjectReturn = CreateS.Province(province);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                }
                db.SaveChanges();
                return new { RequestType = RequestTypeEnumVM.Success, Message = Token.Saved};
            }
            catch (Exception ex)
            {
                return new { RequestType = RequestTypeEnumVM.Error, Message =Token.NotSaveChange };
            }
        }

        public void Dispose()
        {
            db.Dispose();
               }
    }//End Class
}
