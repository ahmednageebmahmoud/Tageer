using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using static DAL.Enums.Enums;
using DAL.Resource;
using System.ComponentModel;
using System.Data.Entity.Validation;
using System.Globalization;
using System.Data.SqlClient;
using System.Web;
using DAL.Models.ViewModel;

namespace DAL.Service
{
	public partial class ServiceInsertUpdateDelete : IDisposable
	{

		TageerEntities db = new TageerEntities();
		Checked isChecked = new Checked();

        public object RentalMark(RentalMark[] rentalCategoryMarks)
        {
            try
            {
                //Get All RentalMark For Check form It
                var AllRentalMark = db.RentalMarks.ToList();
                var Marks = db.Marks.ToList();
                var Categories = db.Categories.ToList();



                foreach (RentalMark rT in rentalCategoryMarks)
                {
                    if (rT.State == StateEnumVM.Delete)
                    {
                        var RentalMarkRemove = db.RentalMarks.Find(rT.Id);

                      
                        //Delete
                        db.RentalMarks.Remove(RentalMarkRemove);

                    }
                    else if (rT.State == StateEnumVM.Create)
                    {
                        //New
                        if (rT.FKCategory_Id == 0 || rT.FKCategory_Id == 0)
                            return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.FiledIsRequired + " >> " + Token.Category + " " + Token.Or + " " + Token.Category, Title = Token.Warning };

                        //just add FKCategory_Id or FKCategory_Id
                        if (rT.FKCategory_Id > 0)
                        {
                            var Category = db.Categories.Find(rT.FKCategory_Id);
                            //Set History Details For Log

                            if (AllRentalMark.Any(x => x.FKMark_Id == rT.FKMark_Id && x.FKCategory_Id == rT.FKCategory_Id))
                            {
                                
                                    var Dupl = AllRentalMark.Where(c => c.FKCategory_Id == rT.FKCategory_Id && c.FKMark_Id == rT.FKMark_Id).Single();
                                    return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + Dupl.Category.CategoryName + " " + Token.With + " >> " + Dupl.Mark.MarkName, Title = Token.Warning };
                                
                                rT.FKCategory_Id = null;
                            }
                        }
                        else
                        {
                            var Category = db.Categories.Find(rT.FKCategory_Id);

                            if (AllRentalMark.Any(x => x.FKMark_Id == rT.FKMark_Id && x.FKCategory_Id == rT.FKCategory_Id))
                            {
                                var Dupl = AllRentalMark.Where(c => c.FKCategory_Id == rT.FKCategory_Id && c.FKMark_Id == rT.FKMark_Id).Single();
                                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + Dupl.Category.CategoryName + " " + Token.With + " >> " + Dupl.Mark.MarkName, Title = Token.Warning };
                            }
                        }

                        var Mark = db.Marks.Find(rT.FKMark_Id);


                            db.RentalMarks.Add(rT);
                    }
                }
                    db.SaveChanges();
                    return new { RequestType = RequestTypeEnumVM.Success, Message = Token.SaveChange, Title = Token.Success };
                           }
            catch (Exception ex)
            {
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange, Title = Token.Error };
            }
        }

        public object RentalGroupsItem(RentalGroupsItem[] adsGroupsItem)
        {
            try
            {
                //Get All GroupsField For Check form It
                var AllGroupsField = db.RentalGroupsItems.ToList();
                var Categories = db.Categories.ToList();



                foreach (RentalGroupsItem rT in adsGroupsItem)
                {


                    if (rT.State == StateEnumVM.Delete)
                    {
                  

                    }
                    else if (rT.State == StateEnumVM.Update)
                    {

                    }
                    else if (rT.State == StateEnumVM.Create)
                    {

                    }
                }

                db.SaveChanges();
                return new { RequestType = RequestTypeEnumVM.Success, Message = Token.SaveChange, Title = Token.Success };
            }
            catch (Exception ex)
            {
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange, Title = Token.Error };
            }
        }


        public object RentalMaterial(RentalMaterial[] rentalCategoryMaterials)
        {
            try
            {
                //Get All RentalMaterial For Check form It
                var AllRentalMaterial = db.RentalMaterials.ToList();
                var Materials = db.Materials.ToList();
                var Categories = db.Categories.ToList();



                foreach (RentalMaterial rT in rentalCategoryMaterials)
                {
                    if (rT.State == StateEnumVM.Delete)
                    {

                        var RentalMaterialRemove = AllRentalMaterial.Where(x => x.Id == rT.Id).Single();



                        //Delete
                        db.RentalMaterials.Remove(RentalMaterialRemove);

                    }
                    else if (rT.State == StateEnumVM.Create)
                    {
                        //New
                        if (rT.FKCategory_Id == 0 || rT.FKCategory_Id == 0)
                            return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.FiledIsRequired + " >> " + Token.Category + " " + Token.Or + " " + Token.Category, Title = Token.Warning };

                        //just add FKCategory_Id or FKCategory_Id
                        if (rT.FKCategory_Id > 0)
                        {
                            //Set History Details For Log
                            var Category = db.Categories.Find(rT.FKCategory_Id);

                            if (AllRentalMaterial.Any(x => x.FKMaterial_Id == rT.FKMaterial_Id && x.FKCategory_Id == rT.FKCategory_Id))
                            {
                                var Dupl = AllRentalMaterial.Where(c => c.FKCategory_Id == rT.FKCategory_Id && c.FKMaterial_Id == rT.FKMaterial_Id).Single();
                                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + Dupl.Category.CategoryName + " " + Token.With + " >> " + Dupl.Material.MaterialName, Title = Token.Warning };
                            }
                            rT.FKCategory_Id = null;
                        }
                        else
                        {
                            //Set History Details For Log
                            var Category = db.Categories.Find(rT.FKCategory_Id);

                            if (AllRentalMaterial.Any(x => x.FKMaterial_Id == rT.FKMaterial_Id && x.FKCategory_Id == rT.FKCategory_Id))
                            {
                                var Dupl = AllRentalMaterial.Where(c => c.FKCategory_Id == rT.FKCategory_Id && c.FKMaterial_Id == rT.FKMaterial_Id).Single();
                                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + Dupl.Category.CategoryName + " " + Token.With + " >> " + Dupl.Material.MaterialName, Title = Token.Warning };
                            }
                        }


                        var Material = db.Materials.Find(rT.FKMaterial_Id);

                      
                            db.RentalMaterials.Add(rT);
                    }
                }
                db.SaveChanges();

                return new { RequestType = RequestTypeEnumVM.Success, Message = Token.SaveChange, Title = Token.Success };
            }
            catch (Exception ex)
            {
                             return new { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange, Title = Token.Error };
            }
        }

        public object Material(Material[] materials)
        {

            try
            {
                //Get All citie For Check form It
                var AllMaterials = db.Materials.ToList();


                foreach (var material in materials)
                {

                    if (material.State == StateEnumVM.Delete)
                    {

                        //Can Not Remove
                        if (AllMaterials.Where(x => x.Id == material.Id).Single().AdDirectFieldDetails.Count > 0)
                            return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDelete + " " + material.MaterialName, Title = Token.Error };

                        var MaterialRemove = AllMaterials.Where(x => x.Id == material.Id).Single();
                        //Delete
                        db.Materials.Remove(MaterialRemove);
                    }

                    else if (material.State == StateEnumVM.Update)
                    {
                        //Edit
                        if (AllMaterials.Where(x => x.Id != material.Id).Any(x => x.NameAr == material.NameAr))
                            return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + material.NameAr, Title = Token.Warning };
                        if (AllMaterials.Where(x => x.Id != material.Id).Any(x => x.NameEn == material.NameEn))
                            return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + material.NameEn, Title = Token.Warning };

                        var MaterialEdit = AllMaterials.Where(x => x.Id == material.Id).Single();



                        

                        //For Update 
                        MaterialEdit.NameAr = material.NameAr;
                        MaterialEdit.NameEn = material.NameEn;

                    }

                    else if (material.State == StateEnumVM.Create)
                    {
                        //New
                        if (AllMaterials.Any(x => x.NameAr == material.NameAr))
                            return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + material.NameAr, Title = Token.Warning };
                        if (AllMaterials.Any(x => x.NameEn == material.NameEn))
                            return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + material.NameEn, Title = Token.Warning };

                            db.Materials.Add(material);
                    }
                }
                db.SaveChanges();

               
                return new { RequestType = RequestTypeEnumVM.Success, Message = Token.SaveChange, Title = Token.Success };
            }
            catch (Exception ex)
            {
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange, Title = Token.Error };
            }
        }


      




        public object Mark(Mark[] marks)
        {
            try
            {
                //Get All citie For Check form It
                var AllMarks = db.Marks.ToList();
                foreach (var mark in marks)
                {

                        if (mark.State == StateEnumVM.Delete)
                            {
                                //Can Not Remove
                                if (AllMarks.Where(x => x.Id == mark.Id).Single().AdDirectFieldDetails.Count > 0)
                                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDelete + " " + mark.MarkName, Title = Token.Error };

                                var MarkRemove = AllMarks.Where(x => x.Id == mark.Id).Single();


                                //Delete
                                db.Marks.Remove(MarkRemove);

                            }
                            
                        else if (mark.State == StateEnumVM.Update)
                            {
                                //Edit
                                
                            }
                            
                        else if (mark.State == StateEnumVM.Create)
                            {
                               
                    }
                }

                db.SaveChanges();
                return new  { RequestType = RequestTypeEnumVM.Success, Message = Token.SaveChange, Title = Token.Success };
            }
            catch (Exception ex)
            {
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.NotSaveChange, Title = Token.Error };
            }
        }




	 

		public void Dispose()
		{
			db.Dispose();
			isChecked.Dispose();
		}
	}//End
}
