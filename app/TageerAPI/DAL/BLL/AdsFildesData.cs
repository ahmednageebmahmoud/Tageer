using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;
using DAL.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Bll
{
    public class AdsFildesData : IDisposable
    {
        TageerEntities db = new TageerEntities();
        DropDownService DropDown = new DropDownService();


        public void Dispose()
        {
            db.Dispose();
            DropDown.Dispose();
        }

        /// <summary>
        /// جلب الحقول الذى سوف تملىء حين انشاء الاعلاان
        /// </summary>
        /// <param name="subCategoryId"></param>
        /// <returns></returns>
        public object GetAdFields(int subCategoryId)
        {
            //Get Sub Category
            var SubCategory = db.SubCategories.Find(subCategoryId);
            //Check Sub Category
            if (SubCategory == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SubCategoryIsNotFound);

            object Fields = new
            {
                ImagesCount = SubCategory.ImagesCount,
                RentalIndividualFields =  GetRentalIndividualFieldsBySubCategory(SubCategory),
                RentalGroupFields= GetRentalGroupFieldsBySubCategory(SubCategory),
                RentalDirectFields = GetRentalDirectFieldsBySubCategory(SubCategory),
            };
            return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, Fields);
        }

        /// <summary>
        /// جلب الحقول الفردية التى وضعت مع هذة الفئة الفرعية 
        /// واذا لم يكن مع الفئة الفرعية حقول سوف نقوم بجلب الحقول مع الفئة الرئيسية
        /// </summary>
        /// <param name="subCategory"></param>
        /// <returns></returns>
        public List<RentalIndividualFieldVM> GetRentalIndividualFieldsBySubCategory(SubCategory subCategory)
        {
            //نتحقق اذا لم يكن هناك اى حقول مع هذة الفئة الفرعية .. نقوم بارجاع الحقول التى مع الفئة العامة
            if (subCategory.RentalIndividualFields.Count == 0)
                return GetRentalIndividualFieldsByCategory(subCategory.Category);
                

            return
            subCategory.RentalIndividualFields.Select(c => new RentalIndividualFieldVM
            {
                AdInputId = c.IndividualField.Id,
                InputTypeId = c.IndividualField.FKInputType_Id,
                IsRequired=   c.IsRequired
            }).ToList(); ;
        }

        /// <summary>
        /// جلب الحقول الفردية التى وضعت مع الفئة عمتا
        /// ولاكن بشرط ان لا يكون هناك فئة فرعية آخرى
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public List<RentalIndividualFieldVM> GetRentalIndividualFieldsByCategory(Category category)
        {
            return
           category.RentalIndividualFields.Where(c=> c.FKSubCategory_Id.HasValue==false).Select(c => new RentalIndividualFieldVM
           {
               AdInputId = c.IndividualField.Id,
               InputTypeId = c.IndividualField.FKInputType_Id,
               IsRequired = c.IsRequired
           }).ToList();
        }

        /// <summary>
        /// جلب حقول المجموعات التى وضعت مع هذة الفئة الفرعية 
        /// واذا لم يكن مع الفئة الفرعية حقول سوف نقوم بجلب الحقول مع الفئة الرئيسية
        /// </summary>
        /// <param name="subCategory"></param>
        /// <returns></returns>
        public List<RentalGroupFieldVM> GetRentalGroupFieldsBySubCategory(SubCategory subCategory)
        {
            //نتحقق اذا لم يكن هناك اى حقول مع هذة الفئة الفرعية .. نقوم بارجاع الحقول التى مع الفئة العامة
            if (subCategory.GroupsDisplayTypes.Count == 0)
                return GetRentalGroupFieldsByCategory(subCategory.Category,subCategory.Id);
          var Groups=  subCategory.GroupsDisplayTypes.Select(c => c.Group).ToList();

            return Groups.Select(c => new RentalGroupFieldVM
            {
                Id = c.Id,
                ResourceName = c.ResourceName,
                DisplayType = subCategory.GroupsDisplayTypes.Single(v => v.FKGroup_Id == c.Id).FKInputType_Id,
                Fields = GetGroupsItems(subCategory.FKCategory_Id, subCategory.Id,c.Id)
            }).ToList();
        }

        /// <summary>
        /// جلب حقول المجموعات التى وضعت مع الفئة عمتا
        /// ولاكن بشرط ان لا يكون هناك فئة فرعية آخرى
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public List<RentalGroupFieldVM> GetRentalGroupFieldsByCategory(Category category,int subCategoryId)
        {
            var Groups = category.GroupsDisplayTypes.Select(c => c.Group).ToList();

            return Groups.Select(c => new RentalGroupFieldVM
            {
                Id = c.Id,
                ResourceName = c.ResourceName,
                DisplayType = category.GroupsDisplayTypes.Single(v => v.FKGroup_Id == c.Id).FKInputType_Id,
                Fields = GetGroupsItems(category.Id,subCategoryId,c.Id)
            }).ToList();
        }

        /// <summary>
        /// جلب الحقول المباشرة التى وضعت مع هذة الفئة الفرعية 
        /// واذا لم يكن مع الفئة الفرعية حقول سوف نقوم بجلب الحقول مع الفئة الرئيسية
        /// </summary>
        /// <param name="subCategory"></param>
        /// <returns></returns>
        public RentalDirectFieldVM GetRentalDirectFieldsBySubCategory(SubCategory subCategory)
        {
            //نتحقق اذا لم يكن هناك اى حقول مع هذة الفئة الفرعية .. نقوم بارجاع الحقول التى مع الفئة العامة
            if (subCategory.RentalDirectFields.Count == 0)
                return GetRentalDirectFieldsByCategory(subCategory.Category, subCategory.Id);

            RentalDirectFieldVM RentalDirectField = new RentalDirectFieldVM();

            //Get Objects
            var Country = subCategory.RentalDirectFields.SingleOrDefault(c => c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Country);
            var Province = subCategory.RentalDirectFields.SingleOrDefault(c => c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Province);
            var Size = subCategory.RentalDirectFields.SingleOrDefault(c => c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Size);
            var Area = subCategory.RentalDirectFields.SingleOrDefault(c => c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Area);
            var Location = subCategory.RentalDirectFields.SingleOrDefault(c => c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Location);
            var Mark = subCategory.RentalDirectFields.SingleOrDefault(c => c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Mark);
            var Material = subCategory.RentalDirectFields.SingleOrDefault(c => c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Materials);
            var Nationality = subCategory.RentalDirectFields.SingleOrDefault(c => c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Nationality);

            //Country Setting
            if (Country!=null)
            {
                RentalDirectField.IsCountry = true;
                RentalDirectField.IsCountryRequierd = Country.IsRequired;
            }
            //Province Setting
            if (Province != null)
            {
                RentalDirectField.IsProvince = true;
                RentalDirectField.IsProvinceRequierd = Province.IsRequired;
            }
            //Size Setting
            if (Size != null)
            {
                RentalDirectField.IsSize = true;
                RentalDirectField.IsSizeRequierd = Size.IsRequired;
            }
            //Area Setting
            if (Area != null)
            {
                RentalDirectField.IsArea = true;
                RentalDirectField.IsAreaRequierd = Area.IsRequired;
            }
            //Location Setting
            if (Location != null)
            {
                RentalDirectField.IsLocation = true;
                RentalDirectField.IsLocationRequierd = Location.IsRequired;
            }
            //Mark Setting
            if (Mark != null)
            {
                RentalDirectField.IsMark = true;
                RentalDirectField.IsMarkRequierd = Mark.IsRequired;
            }
            //Material Setting
            if (Material != null)
            {
                RentalDirectField.IsMaterial = true;
                RentalDirectField.IsMaterialRequierd = Material.IsRequired;
            }
            //Nationality Setting
            if (Nationality != null)
            {
                RentalDirectField.IsNationality = true;
                RentalDirectField.IsNationalityRequierd = Nationality.IsRequired;
            }


            //Load Items
            if (RentalDirectField.IsSize)
                RentalDirectField.SizeItems = SizesItems();
            if (RentalDirectField.IsMark)
                RentalDirectField.MarkItems = RentalMarksItems(subCategory.FKCategory_Id, subCategory.Id);
            if (RentalDirectField.IsMaterial)
                RentalDirectField.MaterialItems = RentalMaterialsItems(subCategory.FKCategory_Id, subCategory.Id);
            if (RentalDirectField.IsNationality)
                RentalDirectField.NationalityItems = NationalitiesItems();

            return RentalDirectField;
        }

        /// <summary>
        /// جلب الحقول المباشرة التى وضعت مع الفئة عمتا
        /// ولاكن بشرط ان لا يكون هناك فئة فرعية آخرى
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public RentalDirectFieldVM GetRentalDirectFieldsByCategory(Category category,int subCategoryId)
        {
            RentalDirectFieldVM RentalDirectField = new RentalDirectFieldVM();

            //Get Objects
            var Country = category.RentalDirectFields.SingleOrDefault(c => !c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Country);
            var Province = category.RentalDirectFields.SingleOrDefault(c => !c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Province);
            var Size = category.RentalDirectFields.SingleOrDefault(c => !c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Size);
            var Area = category.RentalDirectFields.SingleOrDefault(c => !c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Area);
            var Location = category.RentalDirectFields.SingleOrDefault(c => !c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Location);
            var Mark = category.RentalDirectFields.SingleOrDefault(c => !c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Mark);
            var Material = category.RentalDirectFields.SingleOrDefault(c => !c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Materials);
            var Nationality = category.RentalDirectFields.SingleOrDefault(c => !c.FkSubCategory_Id.HasValue && c.FkDirectField_Id == DirectFieldsEnumVM.Nationality);

            //Country Setting
            if (Country != null)
            {
                RentalDirectField.IsCountry = true;
                RentalDirectField.IsCountryRequierd = Country.IsRequired;
            }
            //Province Setting
            if (Province != null)
            {
                RentalDirectField.IsProvince = true;
                RentalDirectField.IsProvinceRequierd = Province.IsRequired;
            }
            //Size Setting
            if (Size != null)
            {
                RentalDirectField.IsSize = true;
                RentalDirectField.IsSizeRequierd = Size.IsRequired;
            }
            //Area Setting
            if (Area != null)
            {
                RentalDirectField.IsArea = true;
                RentalDirectField.IsAreaRequierd = Area.IsRequired;
            }
            //Location Setting
            if (Location != null)
            {
                RentalDirectField.IsLocation = true;
                RentalDirectField.IsLocationRequierd = Location.IsRequired;
            }
            //Mark Setting
            if (Mark != null)
            {
                RentalDirectField.IsMark = true;
                RentalDirectField.IsMarkRequierd = Mark.IsRequired;
            }
            //Material Setting
            if (Material != null)
            {
                RentalDirectField.IsMaterial = true;
                RentalDirectField.IsMaterialRequierd = Material.IsRequired;
            }
            //Nationality Setting
            if (Nationality != null)
            {
                RentalDirectField.IsNationality = true;
                RentalDirectField.IsNationalityRequierd = Nationality.IsRequired;
            }

            //Load Items
            if (RentalDirectField.IsSize)
                RentalDirectField.SizeItems = SizesItems();
            if (RentalDirectField.IsMark)
                RentalDirectField.MarkItems = RentalMarksItems(category.Id, subCategoryId);
            if (RentalDirectField.IsMaterial)
                RentalDirectField.MaterialItems = RentalMaterialsItems(category.Id, subCategoryId);
            if (RentalDirectField.IsNationality)
                RentalDirectField.NationalityItems = NationalitiesItems();

            return RentalDirectField;
        }


        /// <summary>
        /// الحصول على الماركات سواء كانت مع الفئة الفرعية اومع الفئة العامة
        /// </summary>
        /// <param name="subCategory"></param>
        /// <returns></returns>
        public List<ItemVM> RentalMarksItems(int categoryId, int subCategoryId)
        {
            var RentalMarks = db.RentalMarks.ToList();
          
                 //Get By Sub Category
             if (RentalMarks.Where(c => c.FKSubCategory_Id == subCategoryId).Count() > 0)
            {

                return RentalMarks.Where(c => c.FKSubCategory_Id == subCategoryId)
                  .Select(v => new ItemVM
                  {
                      Id = v.Mark.Id,
                      Name = v.Mark.MarkName,
                  }).ToList();
            }
            //Get By Category
            else if (RentalMarks.Where(c => !c.FKSubCategory_Id.HasValue && c.FKCategory_Id == categoryId).Count() > 0)
            {
                return RentalMarks.Where(c => !c.FKSubCategory_Id.HasValue && c.FKCategory_Id == categoryId)
                  .Select(v => new ItemVM
                  {
                      Id = v.Mark.Id,
                      Name = v.Mark.MarkName,
                  }).ToList();
            }
       
            return new List<ItemVM>();
        }



        /// <summary>
        /// الحصول على الخامات  سواء كانت مع الفئة الفرعية اومع الفئة العامة
        /// </summary>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        public List<ItemVM> RentalMaterialsItems(int categoryId,int subCategoryId)
        {
            var RentalMaterials = db.RentalMaterials.ToList();
            
             //Get By Sub Category
              if (RentalMaterials.Where(c => c.FKSubCategory_Id == subCategoryId).Count() > 0)
            {

                return RentalMaterials.Where(c => c.FKSubCategory_Id == subCategoryId)
                  .Select(v => new ItemVM
                  {
                      Id = v.Material.Id,
                      Name = v.Material.MaterialName,
                  }).ToList();
            }
            //Get By Category
            else  if (RentalMaterials.Where(c => !c.FKSubCategory_Id.HasValue && c.FKCategory_Id == categoryId).Count() > 0)
            {

                return RentalMaterials.Where(c =>!c.FKSubCategory_Id.HasValue && c.FKCategory_Id == categoryId)
                  .Select(v => new ItemVM
                  {
                      Id = v.Material.Id,
                      Name = v.Material.MaterialName,
                  }).ToList();
            }
           
                return new List<ItemVM>();
        }

        /// <summary>
        /// الحصول على كل الجنسيات
        /// </summary>
        /// <returns></returns>
        public List<ItemVM> NationalitiesItems()
        {
            var Nationalities = db.Nationalities.ToList();
            return Nationalities.Select(v => new ItemVM
            {
                Id = v.Id,
                Name = v.NationalityName,
            }).ToList();
        }

        /// <summary>
        /// الحصول على عناصر المجموعات بناء على الفئات الفرعية او على الفئات الاساسية 
        /// </summary>
        /// <param name="categoryId"></param>
        /// <param name="subcategoryId"></param>
        /// <returns></returns>
        public List<GroupFieldVM> GetGroupsItems(int categoryId , int subCategoryId,int groupId)
        {
            var RentalGroupsItems = db.RentalGroupsItems.ToList();

            //Get By Sub Category
            if (RentalGroupsItems.Where(c => c.FKSubCategory_Id == subCategoryId && c.GroupsItem.FKGroup_Id == groupId).Count() > 0)
            {
                return RentalGroupsItems.Where(c => c.FKSubCategory_Id == subCategoryId&&c.GroupsItem.FKGroup_Id==groupId)
                  .Select(v => new GroupFieldVM
                  {
                      Id = v.Id,
                      ResourceName = v.GroupsItem.ResourceName,
                      Name = v.GroupsItem.GroupItemName
                  }).ToList();
            }
            //Get By Category
            else if (RentalGroupsItems.Where(c => !c.FKSubCategory_Id.HasValue && c.FKCategory_Id == categoryId && c.GroupsItem.FKGroup_Id == groupId).Count() > 0)
            {

                return RentalGroupsItems.Where(c => !c.FKSubCategory_Id.HasValue && c.FKCategory_Id == categoryId && c.GroupsItem.FKGroup_Id == groupId)
                  .Select(v => new GroupFieldVM
                  {
                      Id = v.Id,
                      ResourceName = v.GroupsItem.ResourceName,
                      Name = v.GroupsItem.GroupItemName
                  }).ToList();
            }

            return new List<GroupFieldVM>();
        }

        public List<ItemVM> SizesItems()
        {
            var Sizes = db.Sizes.ToList();
            return Sizes.Select(v => new ItemVM
            {
                Id = v.Id,
                Name = v.Name,
            }).ToList();
        }

        
    }//End Class
}
