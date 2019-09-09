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
    public class MarksData : BasicBLL
    {

        //Get Marks
        public object GetMarks() {
            var Marks = db.Marks.ToList();
            if (Marks.Count == 0)
                return null;
            return Marks.Select(x => new { x.Id, x.NameAr,x.NameEn,x.MarkName }).ToList();
        }


        public void Dispose()
        {
            db.Dispose();
        }

        public object SaveChange(Mark[] marks)
        {
            try
            {
                foreach (Mark mark in marks)
                {
                    if (mark.State == StateEnumVM.Delete)
                    {
                        //Delete
                        var ObjectReturn = DeleteS.Mark(mark);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (mark.State == StateEnumVM.Update)
                    {
                        //Update
                        var ObjectReturn = UpdateS.Mark(mark);
                        if (ObjectReturn != null)
                            return ObjectReturn;
                    }
                    else if (mark.State == StateEnumVM.Create)
                    {
                        //Create
                        var ObjectReturn = CreateS.Mark(mark);
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
