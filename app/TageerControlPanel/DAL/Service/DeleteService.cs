using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;

namespace DAL.Service
{
    public class DeleteService:BasicService
    {
        public DeleteService(TageerEntities db, List<string> filesRemove)
        {
            this.db = db;
            FilesRemove = filesRemove;
        }

        public object RentalIndividualField(RentalIndividualField rentalCategoryInput)
        {
            var RentalInputRemove = db.RentalIndividualFields.Where(x => x.Id == rentalCategoryInput.Id).Single();
            //Delete
            db.RentalIndividualFields.Remove(RentalInputRemove);
            return null;
        }

        internal object Material(Material matrial)
        {
            var MaterialRemove = db.Materials.Where(x => x.Id == matrial.Id).Single();

            if (MaterialRemove == null)
                return new ResponseVM(RequestTypeEnumVM.Error, matrial.MaterialName + " " + Token.NotFound);

            //Can Not Remove
            if (MaterialRemove.AdDirectFieldDetails.Count > 0)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDelete + " " + matrial.MaterialName, Title = Token.Error };

         
            //Delete
            db.Materials.Remove(MaterialRemove);

            return null;
        }

        internal object RentalDirectField(RentalDirectField rentalDirectField)
        {
            var RentalInputRemove = db.RentalIndividualFields.Where(x => x.Id == rentalDirectField.Id).Single();

           
            //Delete
            db.RentalIndividualFields.Remove(RentalInputRemove);
            return null;
        }

        internal object Activity(Activity activity)
        {
            //Delete Now
            var ActivityDelete = db.Activities.Find(activity.Id);

            if (ActivityDelete.Companies.Count > 0 )
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDelete + " >> " + ActivityDelete.ActivityName};

            db.Activities.Remove(ActivityDelete);
            return null;

        }

        internal object Ad(int adId)
        {
            var AdRemove = db.Ads.Find(adId);

            if (AdRemove == null)
                return new ResponseVM(RequestTypeEnumVM.Error,  Token.AdNotFound);

            this.FilesRemove.AddRange(AdRemove.Album.AlbumFiles.Select(c => c.AllFile.FileUrl));
            
            //Delete
            db.Ads.Remove(AdRemove);
            return null;
        }

        internal object RentalMaterial(RentalMaterial rentalMaterial)
        {

            var RentalMaterialRemove = db.RentalMaterials.Where(x => x.Id == rentalMaterial.Id).Single();

            if (RentalMaterialRemove == null)
                return new ResponseVM(RequestTypeEnumVM.Error, RentalMaterialRemove.Material + " " + Token.NotFound);

           
            //Delete
            db.RentalMaterials.Remove(RentalMaterialRemove);
            return null;
        }

        internal object Mark(Mark mark)
        {

            var MarkRemove = db.Marks.Where(x => x.Id == mark.Id).Single();

            if (MarkRemove == null)
                return new ResponseVM(RequestTypeEnumVM.Error, mark.MarkName + " " + Token.NotFound);

            //Can Not Remove
            if (MarkRemove.AdDirectFieldDetails.Count>0)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDelete + " " + mark.MarkName, Title = Token.Error };
      
            //Delete
            db.Marks.Remove(MarkRemove);

            return null;
        }

        internal object RentalMark(RentalMark rentalMark)
        {
            var RentalMarkRemove = db.RentalMarks.Where(x => x.Id == rentalMark.Id).Single();

            if (RentalMarkRemove == null)
                return new ResponseVM(RequestTypeEnumVM.Error, RentalMarkRemove.Mark + " " + Token.NotFound);

            
            //Delete
            db.RentalMarks.Remove(RentalMarkRemove);
            return null;
        }


        //Province Delete
        internal object Province(Province province)
        { 
            //Delete Now
            var ProvinceDelete = db.Provinces.Find(province.Id);

            if (ProvinceDelete.Addresses.Count > 0)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDelete + " >> " + ProvinceDelete.ProvinceName };


            db.Provinces.Remove(ProvinceDelete);
            return null;
        }

        internal object RentalGroupsItem(RentalGroupsItem aGFT)
        {
            var GroupsFieldRemove = db.RentalGroupsItems.Where(x => x.Id == aGFT.Id).Single();
            
            //Delete
            db.RentalGroupsItems.Remove(GroupsFieldRemove);
            return null;
        }

        internal object GroupsDisplayType(GroupsDisplayType groupsFieldsDisplayType)
        {
            var GroupsDisplayTypeRemove = db.GroupsDisplayTypes.Find(groupsFieldsDisplayType.Id);
             
            //Delete
            db.GroupsDisplayTypes.Remove(GroupsDisplayTypeRemove);
            return null;
        }


        internal object SubCategory(SubCategory rentalSubCategory)
        {
            var SubCategoryRemove = db.SubCategories.Find(rentalSubCategory.Id);

            if (
                SubCategoryRemove.RentalIndividualFields.Count > 0 ||
                SubCategoryRemove.RentalMarks.Count > 0 ||
                SubCategoryRemove.RentalMaterials.Count > 0 ||
                SubCategoryRemove.GroupsDisplayTypes.Count > 0 ||
                SubCategoryRemove.RentalGroupsItems.Count > 0 ||
                SubCategoryRemove.RentalMaterials.Count > 0)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.CanNotDelete + " >> " + SubCategoryRemove.SubCategoryName);

            FilesRemove.Add(SubCategoryRemove.AllFile.FileUrl);

            //Delete
            db.SubCategories.Remove(SubCategoryRemove);
            return null;
        }

        internal object Category(Category item)
        {
            var CategoryRemove = db.Categories.Find(item.Id);

            if (CategoryRemove.SubCategories.Count > 0 ||
                CategoryRemove.GroupsDisplayTypes.Count > 0 ||
                CategoryRemove.RentalGroupsItems.Count > 0 ||
                CategoryRemove.RentalMaterials.Count > 0)
            {
                this.FilesRemove = new List<string>();

                return new ResponseVM(RequestTypeEnumVM.Error, Token.CanNotDelete + " >> " + CategoryRemove.CategoryName);
            }

            

            FilesRemove.Add(CategoryRemove.AllFile.FileUrl);
            
            //Delete
            db.Categories.Remove(CategoryRemove);
            return null;
        }

    

        
        //Nationality Delete
        internal object Nationality(Nationality nationality)
        {
            //Delete Now
            var NationalityDelete = db.Nationalities.Find(nationality.Id);
            if (NationalityDelete == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.NationalityNotFound+" >> "+ nationality.NationalityName);

          

            db.Nationalities.Remove(NationalityDelete);
            return null;
        }

        internal object PagesAllow(PagesAllow pagesAllow)
        {
            throw new NotImplementedException();
        }

        //Country Delete
        internal object Country(Country country)
        {
            

            //Delete Now
            var CountryDelete = db.Countries.Find(country.Id);

            if (CountryDelete.Addresses.Count > 0|| CountryDelete.Provinces.Count > 0)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDelete + " >> " + CountryDelete.CountryName };

            db.Countries.Remove(CountryDelete);
            return null;
        }

      

    }//End Class
}
