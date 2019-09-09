using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using DAL.Service;
using DAL.Models.ViewModel;
using DAL.Resource;
using System.Web;
using DAL.BLL;

namespace DAL.Service
{
    public class CreateService : BasicService
    {
        public CreateService(TageerEntities db)
        {
            this.db = db;
        }

        public object RentalIndividualField(RentalIndividualField rentalInput)
        {
            //New
            if (rentalInput.FKCategory_Id <= 0 && rentalInput.FKSubCategory_Id <= 0)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.Category + " " + Token.Or + " " + Token.SubCategory };

            //التحقق من عندم تكرار الفئنة الفعرية والفشة الرئيسية
            if (rentalInput.FKSubCategory_Id > 0)
            {
                if (db.RentalIndividualFields.Any(x => x.FkIndividualField_Id == rentalInput.FkIndividualField_Id && x.FKSubCategory_Id == rentalInput.FKSubCategory_Id))
                {
                    var Dupl = db.RentalIndividualFields.Where(c => c.FKSubCategory_Id == rentalInput.FKSubCategory_Id && c.FkIndividualField_Id == rentalInput.FkIndividualField_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicateRow + " : " + Dupl.SubCategory.SubCategoryName + " " + Token.With + " : " + Dupl.IndividualField.InputName };
                }

                //لم تملىء الا من هنا
                rentalInput.FKCategory_Id = db.SubCategories.Find(rentalInput.FKSubCategory_Id).FKCategory_Id;
            }
            else
            {
                if (db.RentalIndividualFields.Any(x => x.FkIndividualField_Id == rentalInput.FkIndividualField_Id && x.FKCategory_Id == rentalInput.FKCategory_Id&&!x.FKSubCategory_Id.HasValue))
                {
                    var Dupl = db.RentalIndividualFields.Where(c => c.FKCategory_Id == rentalInput.FKCategory_Id && c.FkIndividualField_Id == rentalInput.FkIndividualField_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicateRow + " : " + Dupl.Category.CategoryName + " " + Token.With + " : " + Dupl.IndividualField.InputName, Title = Token.Warning };
                }
            }

            var Category = db.Categories.Find(rentalInput.FKCategory_Id);
            var Input = db.IndividualFields.Find(rentalInput.FkIndividualField_Id);
          
            db.RentalIndividualFields.Add(rentalInput);

            return null;
        }

        internal object Activity(Activity activity)
        {
            //Check NameAr Duplicated
            if (db.Activities.Any(c => c.NameAr == activity.NameAr))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " : " + activity.NameAr };

            //Check NameEn Duplicated                                                                                          
            if (db.Activities.Any(c => c.NameEn == activity.NameEn))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " : " + activity.NameEn };

            db.Activities.Add(activity);
            return null;
        }

        internal object RentalMaterial(RentalMaterial rentalMaterial)
        {
            //New
            if (rentalMaterial.FKCategory_Id <= 0 && rentalMaterial.FKSubCategory_Id <= 0)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.Category + " " + Token.Or + " " + Token.SubCategory };

            //التحقق من عندم تكرار الفئنة الفعرية والفشة الرئيسية
            if (rentalMaterial.FKSubCategory_Id > 0)
            {
                if (db.RentalMaterials.Any(x => x.FKMaterial_Id == rentalMaterial.FKMaterial_Id && x.FKSubCategory_Id == rentalMaterial.FKSubCategory_Id))
                {
                    var Dupl = db.RentalMaterials.Where(c => c.FKSubCategory_Id == rentalMaterial.FKSubCategory_Id && c.FKMaterial_Id == rentalMaterial.FKMaterial_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicateRow + " : " + Dupl.SubCategory.SubCategoryName + " " + Token.With + " : " + Dupl.Material.MaterialName };
                }
                //لم تملىء الا من هنا
                rentalMaterial.FKCategory_Id = db.SubCategories.Find(rentalMaterial.FKSubCategory_Id).FKCategory_Id;
            }
            else
            {
                if (db.RentalMaterials.Any(x => x.FKMaterial_Id == rentalMaterial.FKMaterial_Id && x.FKCategory_Id == rentalMaterial.FKCategory_Id && !x.FKSubCategory_Id.HasValue))
                {
                    var Dupl = db.RentalIndividualFields.Where(c => c.FKCategory_Id == rentalMaterial.FKCategory_Id && c.FkIndividualField_Id == rentalMaterial.FKMaterial_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicateRow + " : " + Dupl.Category.CategoryName + " " + Token.With + " : " + Dupl.IndividualField.InputName, Title = Token.Warning };
                }
            }

            var Category = db.Categories.Find(rentalMaterial.FKCategory_Id);
            var Material = db.Materials.Find(rentalMaterial.FKMaterial_Id);
          
            db.RentalMaterials.Add(rentalMaterial);
            return null;
        }

        internal object RentalDirectField(RentalDirectField rentalDirectField)
        {

            //New
            if (rentalDirectField.FkCategory_Id <= 0 && rentalDirectField.FkSubCategory_Id <= 0)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.Category + " " + Token.Or + " " + Token.SubCategory };

            //التحقق من عندم تكرار الفئنة الفعرية والفشة الرئيسية
            if (rentalDirectField.FkSubCategory_Id > 0)
            {
                if (db.RentalDirectFields.Any(x => x.FkDirectField_Id == rentalDirectField.FkDirectField_Id && x.FkSubCategory_Id == rentalDirectField.FkSubCategory_Id))
                {
                    var Dupl = db.RentalIndividualFields.Where(c => c.FKSubCategory_Id == rentalDirectField.FkDirectField_Id && c.FkIndividualField_Id == rentalDirectField.FkDirectField_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicateRow + " : " + Dupl.SubCategory.SubCategoryName + " " + Token.With + " : " + Dupl.IndividualField.InputName };
                }

                //لم تملىء الا من هنا
                rentalDirectField.FkCategory_Id = db.SubCategories.Find(rentalDirectField.FkSubCategory_Id).FKCategory_Id;
            }
            else
            {
                if (db.RentalIndividualFields.Any(x => x.FkIndividualField_Id == rentalDirectField.FkDirectField_Id && x.FKCategory_Id == rentalDirectField.FkCategory_Id && !x.FKSubCategory_Id.HasValue))
                {
                    var Dupl = db.RentalIndividualFields.Where(c => c.FKCategory_Id == rentalDirectField.FkCategory_Id && c.FkIndividualField_Id == rentalDirectField.FkDirectField_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicateRow + " : " + Dupl.Category.CategoryName + " " + Token.With + " : " + Dupl.IndividualField.InputName, Title = Token.Warning };
                }
            }

            var Category = db.Categories.Find(rentalDirectField.FkCategory_Id);
            var Input = db.DirectFields.Find(rentalDirectField.FkDirectField_Id);
            
            db.RentalDirectFields.Add(rentalDirectField);

            return null;
        }

        internal object Material(Material matrial)
        {
            //New
            if (db.Materials.Any(x => x.NameAr == matrial.NameAr))
                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " : " + matrial.NameAr };
            if (db.Materials.Any(x => x.NameEn == matrial.NameEn))
                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " : " + matrial.NameEn };
           
            db.Materials.Add(matrial);
            return null;
        }

        internal object RentalMark(RentalMark rentalMark)
        {
            //New
            if (rentalMark.FKCategory_Id <= 0 && rentalMark.FKSubCategory_Id <= 0)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.Category + " " + Token.Or + " " + Token.SubCategory };

            //التحقق من عندم تكرار الفئنة الفعرية والفشة الرئيسية
            if (rentalMark.FKSubCategory_Id > 0)
            {
                if (db.RentalMarks.Any(x => x.FKMark_Id == rentalMark.FKMark_Id && x.FKSubCategory_Id == rentalMark.FKSubCategory_Id))
                {
                    var Dupl = db.RentalMarks.Where(c => c.FKSubCategory_Id == rentalMark.FKSubCategory_Id && c.FKMark_Id == rentalMark.FKMark_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicateRow + " : " + Dupl.SubCategory.SubCategoryName + " " + Token.With + " : " + Dupl.Mark.MarkName };
                }
                //لم تملىء الا من هنا
                rentalMark.FKCategory_Id = db.SubCategories.Find(rentalMark.FKSubCategory_Id).FKCategory_Id;
            }
            else
            {
                if (db.RentalMarks.Any(x => x.FKMark_Id == rentalMark.FKMark_Id && x.FKCategory_Id == rentalMark.FKCategory_Id && !x.FKSubCategory_Id.HasValue))
                {
                    var Dupl = db.RentalIndividualFields.Where(c => c.FKCategory_Id == rentalMark.FKCategory_Id && c.FkIndividualField_Id == rentalMark.FKMark_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicateRow + " : " + Dupl.Category.CategoryName + " " + Token.With + " : " + Dupl.IndividualField.InputName, Title = Token.Warning };
                }
            }

            var Category = db.Categories.Find(rentalMark.FKCategory_Id);
            var Mark = db.Marks.Find(rentalMark.FKMark_Id);
         
            db.RentalMarks.Add(rentalMark);
            return null;
        }

        internal object Mark(Mark mark)
        {
            //New
            if (db.Marks.Any(x => x.NameAr == mark.NameAr))
                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " : " + mark.NameAr };
            if (db.Marks.Any(x => x.NameEn == mark.NameEn))
                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " : " + mark.NameEn };
        
            db.Marks.Add(mark);
            return null;
        }

        internal object RentalGroupsItem(RentalGroupsItem aGFT)
        {
            //New
            if (aGFT.FKCategory_Id <= 0)
                return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.FiledIsRequired + " : " + Token.Category + " " + Token.Or + " " + Token.Category, Title = Token.Warning };

            //just add FKCategory_Id or FKCategory_Id
            if (aGFT.FKSubCategory_Id.HasValue)
            {
                var SubCategory = db.Categories.Find(aGFT.FKCategory_Id);
                if (db.RentalGroupsItems.Any(x => x.FKGroupsItem_Id == aGFT.FKGroupsItem_Id && x.FKSubCategory_Id == aGFT.FKSubCategory_Id))
                {
                    var Dupl = db.RentalGroupsItems.Where(c => c.FKSubCategory_Id == aGFT.FKSubCategory_Id && c.FKGroupsItem_Id == aGFT.FKGroupsItem_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " : " + Dupl.SubCategory.SubCategoryName + " " + Token.With + " : " + Dupl.GroupsItem.GroupItemName, Title = Token.Warning };
                }
            }
            else
            {
                var Category = db.Categories.Find(aGFT.FKCategory_Id);
                if (db.RentalGroupsItems.Any(x => x.FKGroupsItem_Id == aGFT.FKGroupsItem_Id && x.FKCategory_Id == aGFT.FKCategory_Id))
                {
                    var Dupl = db.RentalGroupsItems.Where(c => c.FKCategory_Id == aGFT.FKCategory_Id && c.FKGroupsItem_Id == aGFT.FKGroupsItem_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Warning, Message = Token.CanNotDuplicateRow + " : " + Dupl.Category.CategoryName + " " + Token.With + " : " + Dupl.GroupsItem.GroupItemName, Title = Token.Warning };
                }
            }

            var GroupsField = db.GroupsItems.Find(aGFT.FKGroupsItem_Id);
            db.RentalGroupsItems.Add(aGFT);
            return null;
        }

        internal object GroupsDisplayType(GroupsDisplayType grf)
        {
            //Check Duplicate For Sub Category
            if (grf.FKSubCategory_Id.HasValue)
            {
                if (db.GroupsDisplayTypes.Any(c => c.FKGroup_Id == grf.FKGroup_Id && c.FKSubCategory_Id == grf.FKSubCategory_Id))
                {
                    var Dupl = db.GroupsDisplayTypes.Where(c => c.FKGroup_Id == grf.FKGroup_Id && c.FKSubCategory_Id == grf.FKSubCategory_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicateRow + " : " + Dupl.Group.GroupName + " " + Token.With + " : " + Dupl.SubCategory.SubCategoryName, Title = Token.Warning };
                }
            }
            else
            { 
                //Check Dublicate For Category
                if (db.GroupsDisplayTypes.Any(c => c.FKGroup_Id == grf.FKGroup_Id && c.FKCategory_Id == grf.FKCategory_Id && c.FKCategory_Id == grf.FKCategory_Id))
                {
                    var Dupl = db.GroupsDisplayTypes.Where(c => c.FKGroup_Id == grf.FKGroup_Id && c.FKCategory_Id == grf.FKCategory_Id && c.FKCategory_Id == grf.FKCategory_Id).Single();
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicateRow + " : " + Dupl.Group.GroupName + " " + Token.With + " : " + Dupl.Category.CategoryName, Title = Token.Warning };
                }
            }

            var Category = db.Categories.Find(grf.FKCategory_Id);
            var GroupsItems = db.GroupsItems.Find(grf.FKGroup_Id);
        
            db.GroupsDisplayTypes.Add(grf);
            return null;
        }

        //Create Technical Support
        internal object CreateTechnicalSupport(TechnicalSupportVM technicalSupport)
        {
            if (string.IsNullOrEmpty(technicalSupport.UserName))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.UserName };
            if (string.IsNullOrEmpty(technicalSupport.Email))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.Email };
            if (string.IsNullOrEmpty(technicalSupport.Phone))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.Phone };
            if (string.IsNullOrEmpty(technicalSupport.Message))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.Message };

            if (!CheckedS.EmailIsCorrect (technicalSupport.Email))
                return new { RequestType = RequestTypeEnumVM.Error, Message= Token.InvalidEmail};
            if (!CheckedS.NumberValid(technicalSupport.Phone))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.InvalidNumber };



            db.TechnicalSupports.Add(new TechnicalSupport() {
                CreateDateTime = DateTime.Now,
                Email = technicalSupport.Email,
                UserName=technicalSupport.UserName,
                Message=technicalSupport.Message,
            });

            return null;
        }

        internal object Category(Category rentalCategory)
        {
            //New
            if (db.Categories.Any(x => x.NameAr == rentalCategory.NameAr))
                return new ResponseVM(RequestTypeEnumVM.Error, Token.CanNotDuplicateRow + " : " + rentalCategory.NameAr);
            if (db.Categories.Any(x => x.NameEn == rentalCategory.NameEn))
                return new ResponseVM(RequestTypeEnumVM.Warning, Token.CanNotDuplicateRow + " : " + rentalCategory.NameEn);
            if (string.IsNullOrEmpty(rentalCategory.Image64))
                return new ResponseVM(RequestTypeEnumVM.Error, Token.FiledIsRequired + " : " + "Image");


            //Uplaod Image
            FileSaveVM ImageSaved = FileService.SaveFileBase64(new FileSaveVM
            {
                
                FileBase64 = rentalCategory.Image64,
               
            });

            //Check Image Saved
            if (!ImageSaved.IsSave)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.CanNotSaveImage);

            //Insert Image Url
            rentalCategory.AllFile = new AllFile()
            {
                FileUrl = ImageSaved.SavedPath,
                FKAppInformation_Id = AppInformationEnumVM.ApiFiles,
                FkFileType_Id = FileTypeEnumVM.Image
            };

           
                db.Categories.Add(rentalCategory);
                return null;
        }

        internal object SubCategory(SubCategory rentalSubCategory)
        {
            //New
            if (db.SubCategories.Any(x => x.NameAr == rentalSubCategory.NameAr))
                return new ResponseVM(RequestTypeEnumVM.Error, Token.CanNotDuplicateRow + " : " + rentalSubCategory.NameAr);
            if (db.SubCategories.Any(x => x.NameEn == rentalSubCategory.NameEn))
                return new ResponseVM(RequestTypeEnumVM.Warning, Token.CanNotDuplicateRow + " : " + rentalSubCategory.NameEn);
            if (string.IsNullOrEmpty(rentalSubCategory.Image64))
                return new ResponseVM(RequestTypeEnumVM.Error, Token.FiledIsRequired + " : " + "Image");


            //Uplaod Image
            FileSaveVM ImageSaved = FileService.SaveFileBase64(new FileSaveVM
            {
                FileBase64 = rentalSubCategory.Image64,
            });

            //Check Image Saved
            if (!ImageSaved.IsSave)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.CanNotSaveImage);

            //Insert Image Url
            rentalSubCategory.AllFile = new AllFile()
            {
                FileUrl = ImageSaved.SavedPath,
                FKAppInformation_Id = AppInformationEnumVM.ApiFiles,
                FkFileType_Id = FileTypeEnumVM.Image
            };

            db.SubCategories.Add(rentalSubCategory);
            return null;
        }



        //Nationality Create
        internal object Nationality(Nationality nationality)
        {

            //Check Fildes Is Reqierd
            if (string.IsNullOrEmpty(nationality.NameAr))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.NameAr };
            if (string.IsNullOrEmpty(nationality.NameEn))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.NameEn };



            //Check NameAr Duplicated
            if (db.Nationalities.Any(c => c.NameAr == nationality.NameAr ))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " : " + nationality.NameAr };

            //Check NameEn Duplicated
            if (db.Nationalities.Any(c => c.NameEn == nationality.NameEn  ))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " : " + nationality.NameEn };

 

            db.Nationalities.Add(nationality);
            return null;
        }

        //Province Create
        internal object Province(Province province)
        {
            Country Country = db.Countries.Find(province.FKCountry_Id);

            //Check Fildes Is Reqierd
            if (string.IsNullOrEmpty(province.NameAr))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.NameAr };
            if (string.IsNullOrEmpty(province.NameEn))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.NameEn };
            if (province.FKCountry_Id == 0)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.Country };



            //Check NameAr Duplicated
            if (db.Provinces.Any(c => c.NameAr == province.NameAr && c.FKCountry_Id == province.FKCountry_Id))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " : " + province.NameAr + " " + Token.With + Token.Country + " : " + Country.CountryName };

            //Check NameEn Duplicated
            if (db.Provinces.Any(c => c.NameEn == province.NameEn && c.FKCountry_Id == province.FKCountry_Id))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " : " + province.NameEn + " " + Token.With + Token.Country + " : " + Country.CountryName };


     

            db.Provinces.Add(province);
            return null;
        }

        internal object User(Address address, User user, UserRole[] userRoles, HttpPostedFileBase image)
        {
            if (db.Users.Any(x => x.UserName == user.UserName))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.UserName + " :" + Token.BeforeUsed };
            if (db.Users.Any(x => x.Email == user.Email))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Email + " :" + Token.BeforeUsed };
            
            //Add Another Data
            user.CreateDate = DateTime.Now;
            user.Password = user.NewPassword;

            //Add Address
            if (address != null)
                user.Address = address;
            //Add Role
            if (userRoles != null)
            {

                foreach (UserRole uRole in userRoles)
                {
                    if (!user.UserRoles.Any(c => c.FkRole_Id == uRole.FkRole_Id))
                        user.UserRoles.Add(uRole);
                }
            }
            else
                user.UserRoles.Add(new UserRole() { FkRole_Id = RoleEnumVM.Client });

            //Add Image 
            if (image == null)
                user.AllFile = new AllFile()
                {
                    FKAppInformation_Id = AppInformationEnumVM.ControllPanelLink,
                    FkFileType_Id = FileTypeEnumVM.Image,
                    FileUrl = DefaultsVM.ImageDefult,
                };
            else
            {
                //Save Image
                FileSaveVM FileSave = FileService.SaveFile(new FileSaveVM()
                {
                    File = image,
                    ServerPathSave = "~/Files/Images/Users/Profile/",
                    Extensions = DefaultsVM.ExtensionsImage,
                });

                if (!FileSave.IsSave)
                    return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotSaveFile };

                user.AllFile = new AllFile()
                {
                    FKAppInformation_Id = AppInformationEnumVM.ControllPanelLink,
                    FkFileType_Id = FileTypeEnumVM.Image,
                    FileUrl = FileSave.SavedPath,
                };
            }


            db.Users.Add(user);
            return null;
        }

        //Country Create
        internal object Country(Country country)
        {
            //Check Fildes Is Reqierd
            if (string.IsNullOrEmpty(country.NameAr))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.NameAr };
            if (string.IsNullOrEmpty(country.NameEn))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.FiledIsRequired + " : " + Token.NameEn };

            //Check NameAr Duplicated
            if (db.Countries.Any(c => c.NameAr == country.NameAr))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " : " + country.NameAr   };
                                                                                                                               
            //Check NameEn Duplicated                                                                                          
            if (db.Countries.Any(c => c.NameEn == country.NameEn ))                                                            
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.CanNotDuplicate + " : " + country.NameEn   };


            country.AllFile = new AllFile()
            {
                FileUrl= country.FlagUrl,
                FkFileType_Id=FileTypeEnumVM.Image,
               FKAppInformation_Id=AppInformationEnumVM.ControllPanelLink
            };

            db.Countries.Add(country);

            return null;
        }

        /// <summary>
        /// User Login
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public User UserLogin(User user)
        {
            try
            {
                UserLogin UserLogin = new UserLogin();

                long userId = db.Users.Single(v => v.UserName == user.UserName).Id;
                var User = db.Users.Find(userId);

                //Check User If Clinet 
                if (CheckedS.IsUserNotOnlyClinet(user))
                    return null;
                UserLogin.LoginDate = DateTime.Now;
                UserLogin.FkUser_Id = userId;

                //Check Login Valid 
                if (CheckedS.UserNameAndPasswordIsValid(user.UserName, user.Password))
                {
                    //Login Success
                    UserLogin.IsSuccess = true;
                    User.IsSuccessLogin = true;
                }
                else
                {
                    //Login not Success
                    //Check Last 10 login user If all NotSuccess Or Not
                    int skipCount = db.UserLogins.Where(x => x.FkUser_Id == userId).Count() - 10;
                    if (skipCount > 0)
                    {
                        var UserLogins = db.UserLogins.Where(x => x.FkUser_Id == userId).ToList();
                        if (!UserLogins.Skip(skipCount).Any(x => x.IsSuccess == true))
                        {
                            User.IsBlocked = true;
                        }
                    }
                    UserLogin.IsSuccess = false;
                    User.IsSuccessLogin = false;
                }

                db.UserLogins.Add(UserLogin);
                db.SaveChanges();
                User.IsBlocked = CheckedS.IsUserBlocked(user.UserName, user.Password);

                return User;
            }
            catch (Exception ex)
            {
                return null;

            }
        }

    }//End Class
}
