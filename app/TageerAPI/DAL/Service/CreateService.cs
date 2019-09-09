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
using DAL.Bll;
using System.Web.Configuration;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using static DAL.Enums.Enums;
using System.IO;

namespace DAL.Service
{
    public class CreateService
    {
        TageerEntities db;

        CheckedService CheckedS;
        public int UserId { get { return AccessToken.GetUserId(); } }
        List<HistoryDetailVM> HistoryDetails = new List<HistoryDetailVM>();
        public CreateService(TageerEntities _db)
        {
            this.CheckedS = new CheckedService(_db);
            this.db = _db;
        }

        /// <summary>
        /// Create Access Token 
        /// </summary>
        /// <param name="user"></param>
        /// <param name="culture"></param>
        /// <returns></returns>
        public AccessTokenVM CreateToken(User user, string culture, bool isRemmberMe)
        {
            //Set issued at date
            DateTime issuedAt = DateTime.UtcNow;
            //set the time when it expires
            DateTime expires = isRemmberMe ?

                issuedAt.AddDays(WCMVM.AccessTokenLongDays) :
            issuedAt.AddDays(WCMVM.AccessTokenShortDays);

            //http://stackoverflow.com/questions/18223868/how-to-encrypt-jwt-security-token
            var tokenHandler = new JwtSecurityTokenHandler();

            //create a identity and add claims to the user which we want to log in
            ClaimsIdentity claimsIdentity = new ClaimsIdentity(new[]
            {
                new Claim(ClaimTypes.Name, user.UserName),
          new Claim(ClaimTypes.Name, user.UserName),

            //any user login in app basically included role client  
            new Claim(ClaimTypes.Role, "client"),
            new Claim(ClaimTypes.Email, user.Email),
            new Claim("UserId",user.Id.ToString()),
            });

            const string sec = "401b09eab3c013d4ca54922bb802bec8fd5318192b0a75f201d8b3727429090fb337591abd3e44453b954555b7a0812e1081c39b740293f765eae731f5a65ed1";
            var now = DateTime.UtcNow;
            var securityKey = new Microsoft.IdentityModel.Tokens.SymmetricSecurityKey(System.Text.Encoding.Default.GetBytes(sec));
            var signingCredentials = new Microsoft.IdentityModel.Tokens.SigningCredentials(securityKey, Microsoft.IdentityModel.Tokens.SecurityAlgorithms.HmacSha256Signature);


            //create the jwt
            var token =
                (JwtSecurityToken)
                    tokenHandler.CreateJwtSecurityToken(issuer: "Tageer", audience: "Tageer",
                    subject: claimsIdentity, notBefore: issuedAt, expires: expires, signingCredentials: signingCredentials);

            var TokenString = tokenHandler.WriteToken(token);
            return new AccessTokenVM()
            {
                Token = TokenString,
                Expires = expires,// DateService.GetDateTimeByCulture(expires)
            };
        }

        /// <summary>
        /// Cereate New Ad
        /// </summary>
        /// <param name="adCereateVM"></param>
        /// <param name="pagesAllow"></param>
        /// <returns></returns>
        internal object Ad(AdCreateVM adCereateVM)
        {
            //Check Requierd 
            if (string.IsNullOrEmpty(adCereateVM.Title))
                return ResponseVM.FieldIsRequierd(Token.Title);
            if (string.IsNullOrEmpty(adCereateVM.Description))
                return ResponseVM.FieldIsRequierd(Token.Description);
            if (adCereateVM.Price <= 0)
                return ResponseVM.FieldIsRequierd(Token.Price);
            if (adCereateVM.CategoryId <= 0)
                return ResponseVM.FieldIsRequierd(Token.Category);
            if (adCereateVM.SubCategoryId <= 0)
                return ResponseVM.FieldIsRequierd(Token.SubCategory);
            if (adCereateVM.Images.Count <= 0)
                return ResponseVM.FieldIsRequierd(Token.Images);

            Ad Ad = new Ad();


            //Add Ad Individual Field
            AdsService.ImportAdIndividualField(Ad, adCereateVM.AdIndividualField);
            //Add Ad Groups Field
            AdsService.ImportAdGroupsField(Ad, adCereateVM.AdGroupsField);
            //Add Ad Direct Field
            AdsService.ImportAdDirectField(Ad, adCereateVM.AdDirectField);



            //Save Images 
            Album Album = new Album();
            foreach (var img in adCereateVM.Images)
            {

                FileSaveVM FileSave = FileService.SaveFileBase64(new FileSaveVM()
                {
                    FileBase64 = img.FileBase64,
                    ServerPathSave = "/Files/Images/"
                });

                if (!FileSave.IsSave)
                    return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.CanNotSaveFile} {img.FileName}");

                Album.AlbumFiles.Add(new AlbumFile
                {
                    AllFile = new AllFile
                    {
                        FkFileType_Id = FileTypeEnumVM.Image,
                        FileUrl = FileSave.SavedPath,
                        FKAppInformation_Id = AppInformationEnumVM.ApiFiles
                    }
                });
            }
            Ad.Album = Album;



            Ad.CreateDateTime = DateTime.Now;
            Ad.Title = adCereateVM.Title;
            Ad.Description = adCereateVM.Description;
            Ad.Price = adCereateVM.Price;
            Ad.FkCategory_Id = adCereateVM.CategoryId;
            Ad.FkSubCategory_Id = adCereateVM.SubCategoryId;
            Ad.FkRentalTimesType_Id = adCereateVM.RentalTimeTypeId;
            Ad.FkUser_Id = AccessToken.GetUserId();
            db.Ads.Add(Ad);
            return null;
        }

        /// <summary>
        /// Create User Calling From Api
        /// </summary>
        /// <param name="model"></param>
        /// <param name="pageAllow"></param>
        /// <returns></returns>
        internal object User(UserVM user)
        {
            if (user == null)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.DataNotFound };

            //Check Required
            if (string.IsNullOrEmpty(user.Email))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Email} : {Token.FiledIsRequired}");
            if (string.IsNullOrEmpty(user.UserName))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.UserName} : {Token.FiledIsRequired}");
            if (string.IsNullOrEmpty(user.Password))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Password} : {Token.FiledIsRequired}");
            if (string.IsNullOrEmpty(user.PhoneNumber))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Phone} : {Token.FiledIsRequired}");

            if (user.IsCompany && user.CompanyInfomration == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.CompanyInformationIsRequired);
            if (user.IsCompany && string.IsNullOrEmpty(user.CompanyInfomration.Description))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.CompanyDescription} : {Token.FiledIsRequired}");
            if (user.IsCompany && user.CompanyInfomration.ActivityId == 0)
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.CompanyActivity} : {Token.FiledIsRequired}");
            if (user.IsCompany && !db.Activities.Any(c => c.Id == user.CompanyInfomration.ActivityId))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.CompanyActivity} : {Token.NotFound}");
            if(user.IsCompany && user.CompanyInfomration.Officess.Any(c=> string.IsNullOrEmpty(c.Address)))
                return new ResponseVM(RequestTypeEnumVM.Error, LanguageService.IsEn?"There are some office addresses that don't have data": "هناك بعض عنوانين للمكاتب ليست بها بيانات");
            if (user.IsCompany && user.CompanyInfomration.Officess.Any(c => c.CountryId==0))
                return new ResponseVM(RequestTypeEnumVM.Error, LanguageService.IsEn ? "There are some office countries that don't have data" : "هناك بعض الدول للمكاتب ليست بها بيانات");

            //Check   unic
            if (db.Users.Any(x => x.Email == user.Email))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Email + "  : " + Token.BeforeUsed };
            if (db.Users.Any(x => x.UserName == user.UserName))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.UserName + "  : " + Token.BeforeUsed };
            if (db.Users.Any(x => x.PhoneNumber == user.PhoneNumber))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.Phone + "  : " + Token.BeforeUsed };


            //Check  length
            if (user.Password.Length < 6)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.MinimumLength + "  : " + Token.For + "  : " + Token.Password + " 6" };
            //Check UserName
            if (user.UserName.Length > 30)
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.UserName + "  : " + Token.MaxLength + " 30" };

            //Check Data Is Valid
            if (!CheckedS.EmailIsCorrect(user.Email))
                return new { RequestType = RequestTypeEnumVM.Error, Message = Token.InvalidEmail };

            List<UserRole> UserRoles = new List<UserRole>()
            {
                new UserRole() {
                    FkRole_Id=user.IsCompany?RoleEnumVM.Company:RoleEnumVM.Client,
                }
            };
            FileSaveVM FileSave = new FileSaveVM();
            List<CompanyOffice> CompanyOffices = new List<CompanyOffice>();
            if (!string.IsNullOrEmpty(user.Image))
            {
                FileSave = FileService.SaveFileBase64(new FileSaveVM
                {
                    FileBase64 = user.Image,
                    ServerPathSave = "/Files/Images/Users/",
                    Extension = Path.GetExtension(user.ImageName)
                });

                if(!FileSave.IsSave)
                    return new ResponseVM(RequestTypeEnumVM.Error, Token.CanNotSaveFile);
            }

            User User = new User()
            {
                Email = user.Email,
                Password = user.Password,
                UserName = user.UserName,
                IsBlocked = false,
                UserRoles = UserRoles,
                CreateDate = DateTime.Now,
                FullName = "",
                FKLanguage_Id = (int)LanguageEnum.Arabic,
                PhoneNumber = user.PhoneNumber,
                PhoneActiveCode = 4444,
                IsPhoneActivated=false,
                Address = new Address(),
                AllFile = new AllFile()
                {
                    FkFileType_Id = FileTypeEnumVM.Image,
                    FKAppInformation_Id = AppInformationEnumVM.ApiFiles,
                    FileUrl = FileSave.SavedPath==null?"":FileSave.SavedPath,
                },
            };

            if (user.IsCompany)
            {
                user.CompanyInfomration.Officess.ForEach(c =>
                {
                    CompanyOffices.Add(new CompanyOffice
                    {
                        Address = new Address
                        {
                            Street = c.Address,
                            FKCountry_Id = c.CountryId
                        },
                        Location = new Location
                        {
                            Latitude = "", //c.Latitude,
                            Longitude = "",// c.Longitude
                        }
                    });
                });
               User.Company = new Company
                {
                    Description = user.CompanyInfomration.Description,
                    FKActivity_Id = user.CompanyInfomration.ActivityId,
                    CompanyOffices = CompanyOffices
                };
            }

            db.Users.Add(User);
            return null;
        }

        /// <summary>
        /// User Login
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public User UserLogin(UserVM user)
        {
            try
            {
                UserLogin UserLogin = new UserLogin
                {
                    LoginDate = DateTime.Now,
                    FkUser_Id = user.Id.Value
                };

                var User = db.Users.Find(user.Id.Value);

                //Check Login Valid 
                if (db.Users_CheckFromLoginData(user.UserName, user.Password).First().HasValue)
                {
                    //Login Success
                    UserLogin.IsSuccess = true;
                    User.IsSuccessLogin = true;
                }
                else
                {
                    //Login UnSuccess
                    //Check Last 10 login user If all NotSuccess Or Not
                    int skipCount = db.UserLogins.Where(x => x.FkUser_Id == UserLogin.FkUser_Id).Count() - 10;
                    if (skipCount > 0)
                    {
                        var UserLogins = db.UserLogins.Where(x => x.FkUser_Id == UserLogin.FkUser_Id).ToList();
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
                //التحقق باسم المستخدم وكلمة المرور فقط من اجل لا يجب اظهار هل المستخد بلزك او لاء الا فى حالة اذا كان المستخدم يدخل بيانات صحيحة 
                User.IsBlocked = CheckedS.IsUserBlocked(user.UserName, user.Password);
                return User;
            }
            catch (Exception ex)
            {
                return null;

            }
        }


        internal object Comment(CommentVM commentVM, AdComment comment)
        {
            var Ad = db.Ads.Find(commentVM.AdId);
            var User = db.Users.Find(AccessToken.GetUserId());
            if (Ad == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.AdNotFound);

            if (string.IsNullOrEmpty(commentVM.Comment))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Comment} : {Token.FiledIsRequired}");

            if (commentVM.AdId <= 0)
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.AdId} : {Token.FiledIsRequired}");

            if (commentVM.Comment.Length > 1000)
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Comment} : {Token.MaxLength} = 1000");

            comment.Comment = commentVM.Comment;
            comment.FKAd_Id = commentVM.AdId;
            comment.FkUser_Id = AccessToken.GetUserId();
            comment.DateTime = DateTime.Now;

            db.AdComments.Add(comment);

            //Add Notifify To User Ownar Ad
            if (Ad.FkUser_Id != User.Id)
                db.Notifications.Add(new Notification
                {
                    TitleAr = $"علق {User.UserName} على اعلان {Ad.Title} ",
                    TitleEn = $"{User.UserName} added comment to ad {Ad.Title}",
                    DataTime = DateTime.Now,
                    UsersPrivateNotifies = new List<UsersPrivateNotify>
                {
                    new UsersPrivateNotify
                    {
                        FkUser_Id=Ad.FkUser_Id
                    }
                }
                });
            return null;
        }

        internal object ContactUs(ContactUsCreateVM cont)
        {

            if (string.IsNullOrEmpty(cont.Subject))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Subject} : {Token.FiledIsRequired}");
            if (string.IsNullOrEmpty(cont.Email))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Email} : {Token.FiledIsRequired}");
            if (string.IsNullOrEmpty(cont.UserName))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.UserName} : {Token.FiledIsRequired}");
            if (string.IsNullOrEmpty(cont.Message))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Message} : {Token.FiledIsRequired}");

            if (cont.Subject.Length > 50)
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Subject} : {Token.MaxLength} = 50");
            if (cont.Email.Length > 50)
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Email} : {Token.MaxLength} = 50");
            if (cont.UserName.Length > 50)
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.UserName} : {Token.MaxLength} = 50");
            if (cont.Message.Length > 1000)
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Message} : {Token.MaxLength} = 1000");

            if (!CheckedS.EmailIsCorrect(cont.Email))
                return new ResponseVM(RequestTypeEnumVM.Error, Token.InvalidEmail);


            db.TechnicalSupports.Add(new TechnicalSupport
            {
                UserName = cont.UserName,
                Subject = cont.Subject,
                CreateDateTime = DateTime.Now,
                Email = cont.Email,
                Message = cont.Message,
            });

            return null;
        }

        internal object EmailNewsLetter(string email)
        {
            if (string.IsNullOrEmpty(email))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Email} : {Token.FiledIsRequired}");
            if (email.Length > 50)
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Email} : {Token.MaxLength} = 50");

            if (!CheckedS.EmailIsCorrect(email))
                return new ResponseVM(RequestTypeEnumVM.Error, Token.InvalidEmail);


            if (db.EmailsSubscriptions.Any(c => c.Email == email))
                return null;

            db.EmailsSubscriptions.Add(new EmailsSubscription
            {
                Email = email,
                CreateDateTime = DateTime.Now
            });

            return null;
        }

        internal object Messages(MessageCreateVM message)
        {
            if (string.IsNullOrEmpty(message.Message))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Message} : {Token.FiledIsRequired}");
            if (message.UserReciveId <= 0)
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.UserRecivedId} : {Token.FiledIsRequired}");

            if (message.Message.Length > 500)
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.Message} : {Token.MaxLength} = 500");

            if (!db.Users.Any(c => c.Id == message.UserReciveId))
                return new ResponseVM(RequestTypeEnumVM.Error, $"{Token.UserRecive} : {Token.NotFound} = 500");

            int UserLoggedId = AccessToken.GetUserId();

            var Chat = db.Chats.SingleOrDefault(c =>
              (c.FkUser_Id_Recived == UserLoggedId && c.FkUser_Id_Starting == message.UserReciveId)
              ||
              (c.FkUser_Id_Starting == UserLoggedId && c.FkUser_Id_Recived == message.UserReciveId)
            );

            var Message = new ChatMessage
            {
                Message = message.Message,
                FkUser_Id = UserLoggedId,
                DateTime = DateTime.Now
            };

            if (Chat == null)
            {
                //This Is New Chat
                db.Chats.Add(new Chat
                {
                    FkUser_Id_Starting = UserLoggedId,
                    FkUser_Id_Recived = message.UserReciveId,
                    ChatMessages = new
                    List<ChatMessage>
                    { Message}

                });
            }
            else
            {
                //Save Message To Chat Messaging
                Chat.ChatMessages.Add(Message);
            }


            return null;
        }



    }//End Class
}
