using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using DAL.BLL;
using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;

namespace DAL.Service
{
    public class UpdateService : BasicService
    {
        public UpdateService(TageerEntities db, List<string> filesRemove)
        {
            this.db = db;
            FilesRemove = filesRemove;
        }

        public object RentalIndividualField(RentalIndividualField rentalCategoryInput)
        {

            var RentalInputEdit = db.RentalIndividualFields.Where(x => x.Id == rentalCategoryInput.Id).Single();
            var Category = RentalInputEdit.Category;

            RentalInputEdit.IsRequired = rentalCategoryInput.IsRequired;
            RentalInputEdit.IsBar = rentalCategoryInput.IsBar;


            return null;
        }

        internal object Material(Material material)
        {
            if (db.Materials.Where(x => x.Id != material.Id).Any(x => x.NameAr == material.NameAr))
                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + material.NameAr, Title = Token.Warning };
            if (db.Materials.Where(x => x.Id != material.Id).Any(x => x.NameEn == material.NameEn))
                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + material.NameEn, Title = Token.Warning };

            var MaterialUpdate = db.Materials.Find(material.Id);

            if (MaterialUpdate == null)
                return new ResponseVM(RequestTypeEnumVM.Error, material.MaterialName + " " + Token.NotFound);


            //For Update 
            MaterialUpdate.NameAr = material.NameAr;
            MaterialUpdate.NameEn = material.NameEn;
            return null;
        }

        internal object RentalDirectField(RentalDirectField rentalDirectField)
        {


            var RentalDirectFieldUpdate = db.RentalDirectFields.Where(x => x.Id == rentalDirectField.Id).Single();
            var Category = RentalDirectFieldUpdate.Category;

            RentalDirectFieldUpdate.IsRequired = rentalDirectField.IsRequired;


            return null;
        }

        internal object Activity(Activity activity)
        {
            var Activity = db.Activities.Find(activity.Id);

            //Check NameAr Duplicated
            if (db.Activities.Where(c => c.Id != activity.Id).Any(c => c.NameAr == activity.NameAr))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " >> " + activity.NameAr };

            //Check NameEn Duplicated                                                                                          
            if (db.Activities.Where(c => c.Id != activity.Id).Any(c => c.NameEn == activity.NameEn))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " >> " + activity.NameEn };

            //Update Now 
            Activity.NameAr = activity.NameAr;
            Activity.NameEn = activity.NameEn;
             
            return null;
        }

        internal object RentalMaterial(RentalMaterial rentalMaterial)
        {

            var RentaMaterialEdit = db.RentalMaterials.Where(x => x.Id == rentalMaterial.Id).Single();
            var Category = RentaMaterialEdit.Category;

            return null;
        }

        internal object Mark(Mark mark)
        {
            if (db.Marks.Where(x => x.Id != mark.Id).Any(x => x.NameAr == mark.NameAr))
                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + mark.NameAr, Title = Token.Warning };
            if (db.Marks.Where(x => x.Id != mark.Id).Any(x => x.NameEn == mark.NameEn))
                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " >> " + mark.NameEn, Title = Token.Warning };

            var MarkEdit = db.Marks.Where(x => x.Id == mark.Id).Single();

            if (MarkEdit == null)
                return new ResponseVM(RequestTypeEnumVM.Error, mark.MarkName + " " + Token.NotFound);



            //For Update 
            MarkEdit.NameAr = mark.NameAr;
            MarkEdit.NameEn = mark.NameEn;
            return null;
        }

        internal object RentalMark(RentalMark rentalMark)
        {

            var RentaMarkEdit = db.RentalMarks.Where(x => x.Id == rentalMark.Id).Single();
            var Category = RentaMarkEdit.Category;

            return null;
        }

        internal object Category(Category rentalCategory)
        {


            if (db.Categories.Where(x => x.Id != rentalCategory.Id).Any(x => x.NameAr == rentalCategory.NameAr))
                return new ResponseVM(RequestTypeEnumVM.Warning, Token.CanNotDuplicateRow + " >> " + rentalCategory.NameAr);
            if (db.Categories.Where(x => x.Id != rentalCategory.Id).Any(x => x.NameEn == rentalCategory.NameEn))
                return new ResponseVM(RequestTypeEnumVM.Warning, Token.CanNotDuplicateRow + " >> " + rentalCategory.NameEn);

            var CategoryEdit = db.Categories.Find(rentalCategory.Id);

            //Upload New Image
            if (!string.IsNullOrEmpty(rentalCategory.Image64))
            {
                FileSaveVM ImageUpdate = FileService.SaveFileBase64(new FileSaveVM()
                {
                    FileBase64 = rentalCategory.Image64,
                });


                if (!ImageUpdate.IsSave)
                    return new ResponseVM(RequestTypeEnumVM.Error, Token.CanNotSaveImage);

                FilesRemove.Add(CategoryEdit.AllFile.FileUrl);

                //Add New Image Url
                CategoryEdit.AllFile.FileUrl = ImageUpdate.SavedPath;
            }


            //Update Now

            CategoryEdit.NameAr = rentalCategory.NameAr;
            CategoryEdit.NameEn = rentalCategory.NameEn;
            return null;
        }

        internal object RentalGroupsItem(RentalGroupsItem adsGroupsItem)
        {
            throw new NotImplementedException();
        }

        internal object GroupsDisplayType(GroupsDisplayType groupsFieldsDisplayType)
        {
            throw new NotImplementedException();
        }

        internal object GroupsDisplayType(object rentalCategory, GroupsDisplayType groupsFieldsDisplayType)
        {
            throw new NotImplementedException();
        }

        internal object SubCategory(SubCategory rentalSubCategory)
        {


            if (db.SubCategories.Where(x => x.Id != rentalSubCategory.Id).Any(x => x.NameAr == rentalSubCategory.NameAr))
                return new ResponseVM(RequestTypeEnumVM.Warning, Token.CanNotDuplicateRow + " >> " + rentalSubCategory.NameAr);
            if (db.SubCategories.Where(x => x.Id != rentalSubCategory.Id).Any(x => x.NameEn == rentalSubCategory.NameEn))
                return new ResponseVM(RequestTypeEnumVM.Warning, Token.CanNotDuplicateRow + " >> " + rentalSubCategory.NameEn);

            var SubCategoryEdit = db.SubCategories.Find(rentalSubCategory.Id);

            //Upload New Image
            if (!string.IsNullOrEmpty(rentalSubCategory.Image64))
            {
                FileSaveVM ImageUpdate = FileService.SaveFileBase64(new FileSaveVM()
                {
                    FileBase64 = rentalSubCategory.Image64,
                });

                if (!ImageUpdate.IsSave)
                    return new ResponseVM(RequestTypeEnumVM.Error, Token.CanNotSaveImage);

                FilesRemove.Add(SubCategoryEdit.AllFile.FileUrl);

                //Add New Image Url
                SubCategoryEdit.AllFile.FileUrl = ImageUpdate.SavedPath;
            }




            //Update Now

            SubCategoryEdit.NameAr = rentalSubCategory.NameAr;
            SubCategoryEdit.NameEn = rentalSubCategory.NameEn;
            return null;
        }

        internal object AppsInformation(AppsInformation appConfig)
        {


            var AppsInformationUpdate = db.AppsInformations.Find(appConfig.Id);



            AppsInformationUpdate.Value = appConfig.Value;

            return null;
        }


        //Province Update
        internal object Province(Province province)
        {
            //Check Fildes Is Reqierd
            if (string.IsNullOrEmpty(province.NameAr))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " >> " + Token.NameAr };
            if (string.IsNullOrEmpty(province.NameEn))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " >> " + Token.NameEn };



            var ProvinceUpdate = db.Provinces.Find(province.Id);

            //Check NameAr Duplicated
            if (db.Provinces.Where(c => c.Id != province.Id).Any(c => c.NameAr == province.NameAr && c.FKCountry_Id == province.FKCountry_Id))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " >> " + province.NameAr + " " + Token.With + Token.Country + " >> " + ProvinceUpdate.Country.CountryName };

            //Check NameEn Duplicated
            if (db.Provinces.Where(c => c.Id != province.Id).Any(c => c.NameEn == province.NameEn && c.FKCountry_Id == province.FKCountry_Id))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " >> " + province.NameEn + " " + Token.With + Token.Country + " >> " + ProvinceUpdate.Country.CountryName };

            ProvinceUpdate.NameAr = province.NameAr;
            ProvinceUpdate.NameEn = province.NameEn;
            return null;
        }

        internal object SubMenu(SubMenu subMenu)
        {
            var SubMenu = db.SubMenus.Find(subMenu.Id);
            SubMenu.ClassIcon = subMenu.ClassIcon;
            SubMenu.OrderNumber = subMenu.OrderNumber;
            SubMenu.FkMenu_Id = subMenu.FkMenu_Id;

            return null;
        }

        //Update Menu
        internal object Menu(Menu menu)
        {
            var Menu = db.Menus.Find(menu.Id);
            Menu.ClassIcon = menu.ClassIcon;
            Menu.OrderNumber = menu.OrderNumber;

            return null;
        }






        //Nationality Update
        internal object Nationality(Nationality nationality)
        {

            //Check Fildes Is Reqierd
            if (string.IsNullOrEmpty(nationality.NameAr))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " >> " + Token.NameAr };
            if (string.IsNullOrEmpty(nationality.NameEn))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " >> " + Token.NameEn };



            var Nationality = db.Nationalities.Find(nationality.Id);

            //Check NameAr Duplicated
            if (db.Nationalities.Where(c => c.Id != nationality.Id).Any(c => c.NameAr == nationality.NameAr))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " >> " + nationality.NameAr };

            //Check NameEn Duplicated                                                                                            
            if (db.Nationalities.Where(c => c.Id != nationality.Id).Any(c => c.NameEn == nationality.NameEn))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " >> " + nationality.NameEn };
            //Update Now 
            Nationality.NameAr = nationality.NameAr;
            Nationality.NameEn = nationality.NameEn;


            return null;
        }



        //Pages Role
        internal object PagesRole(PagesRole[] pagesRoles)
        {
            var PageFirst = pagesRoles.First();
            db.PagesRoles.RemoveRange(db.PagesRoles.Where(c => c.FkPage_Id == PageFirst.FkPage_Id && c.FkUser_Id == PageFirst.FkUser_Id));

            db.PagesRoles.AddRange(pagesRoles);

            return null;
        }

        //Country Update
        internal object Country(Country country)
        {
            //Check Fildes Is Reqierd
            if (string.IsNullOrEmpty(country.NameAr))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " >> " + Token.NameAr };
            if (string.IsNullOrEmpty(country.NameEn))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " >> " + Token.NameEn };
            if (string.IsNullOrEmpty(country.CountryKey))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " >> " + Token.CountryKey };



            var Country = db.Countries.Find(country.Id);

            //Check NameAr Duplicated
            if (db.Countries.Where(c => c.Id != country.Id).Any(c => c.NameAr == country.NameAr))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " >> " + country.NameAr };

            //Check NameEn Duplicated                                                                                          
            if (db.Countries.Where(c => c.Id != country.Id).Any(c => c.NameEn == country.NameEn))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " >> " + country.NameEn };


            //Check CountryKey Duplicated                                                                                          
            if (db.Countries.Where(c => c.Id != country.Id).Any(c => c.CountryKey == country.CountryKey))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " >> " + country.CountryKey };

            //Update Now 
            Country.NameAr = country.NameAr;
            Country.NameEn = country.NameEn;
            Country.CountryKey = country.CountryKey;

            Country.AllFile.FileUrl = country.FlagUrl;
            return null;
        }

        /// <summary>
        /// User Current User
        /// </summary>
        /// <param name="userInformation"></param>
        /// <param name="address"></param>
        /// <param name="user"></param>
        /// <param name="image"></param>
        /// <returns></returns>
        internal object User(Address address, User user, HttpPostedFileBase image)

        {
            /*
             -- language
            */

            User User = db.Users.Find(user.Id);

            //Check Email unic
            if (string.IsNullOrEmpty(user.Email))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Email + " " + Token.FiledIsRequired };
            if (db.Users.Where(x => x.Id != user.Id).Any(x => x.Email == user.Email))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Email + " " + Token.BeforeUsed };


            //Password
            if (!string.IsNullOrEmpty(user.NewPassword))
                User.Password = user.NewPassword;

            //user
            User.Email = user.Email;

            User.FullName = user.FullName;
            User.FKGender_Id = user.FKGender_Id;
            User.FKLanguage_Id = user.FKLanguage_Id;



            //Address
            if (User.Address == null)
            {
                var NewAddress = new Models.Address();
                if (address.FKCountry_Id > 0)
                    NewAddress.FKCountry_Id = address.FKCountry_Id;
                NewAddress.Street = address.Street;
                NewAddress.PostalCode = address.PostalCode;
                NewAddress.City = address.City;

                User.Address = NewAddress;
            }
            else
            {
                if (address.FKCountry_Id > 0)
                    User.Address.FKCountry_Id = address.FKCountry_Id;
                if (address.FkProvince_Id > 0)
                    User.Address.FkProvince_Id = address.FkProvince_Id;
                User.Address.Street = address.Street;
                User.Address.City = address.City;
                User.Address.PostalCode = address.PostalCode;
            }

            if (User.PhoneNumber != user.PhoneNumber)
            {
                if (db.Users.Where(c => c.Id != user.Id).Any(c => c.PhoneNumber == user.PhoneNumber))
                    return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Phone} : {Token.Duplicate}");
                User.PhoneNumber = user.PhoneNumber;
            }




            //Update Image 
            if (image != null)
            {
                //Save Image
                FileSaveVM FileSave = FileService.SaveFile(new FileSaveVM()
                {
                    File = image,
                    ServerPathSave = "/Files/Images/Users/Profile/",
                    Extensions = DefaultsVM.ExtensionsImage,
                });

                if (!FileSave.IsSave)

                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotSaveFile };

                if (User.AllFile == null)
                {
                    User.AllFile = new AllFile()
                    {
                        FKAppInformation_Id = AppInformationEnumVM.ApiFiles,
                        FkFileType_Id = FileTypeEnumVM.Image,
                        FileUrl = FileSave.SavedPath,
                    };
                }
                else
                {
                    User.OldImageUrl = User.AllFile.FileUrl;
                    User.AllFile.FileUrl = FileSave.SavedPath;
                }
            }


            return null;
        }




    }//End Class
}
