using DAL.BLL;
using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DAL.Service
{
    public class UserService : IDisposable
    {
        TageerEntities db = new TageerEntities();
        public long GetCurrentUserId()
        {
            return db.Users_CheckFromUserNameIsValid(HttpContext.Current.User.Identity.Name).First().Value;
        }
        public User GetCurrentUser()
        {
            return db.Users.Where(x => x.UserName == HttpContext.Current.User.Identity.Name).Single();
        }

        internal void Culture(out string culture)
        {
            try
            {
                var CurrentUser = GetUser(GetCurrentUserId());
                culture = CurrentUser.LanguageType.Code;
            }
            catch (Exception)
            {
                culture = "ar";
            }
        }

        public static bool CheckIsBlocked()
        {
            using (TageerEntities db = new TageerEntities())
            {
                int UserId = AccessToken.GetUserId();
                return db.Users.Find(UserId).IsBlocked;
            }
        }

   
        public User GetUser(long id)
        {
            return db.Users.Single(c => c.Id == id);
        }

        public void Dispose()
        {
            db.Dispose();
        }

        public User GetUserByUserName(string userName)
        {
            return db.Users.Where(x => x.UserName == userName).Single();
        }
        public User GetUser(string email)
        {
            return db.Users.Where(x => x.Email == email).Single();
        }

        public object Login(string userName, string password, bool isRemmberMe)
        {
            CheckedService CheckedS = new CheckedService(db);
            CreateService CreateS = new CreateService(db);

            UserService UserS = new UserService();
            string Culture = LanguageService.DefaultLangage;

            UserVM UserData = new UserVM
            {
                Id = db.Users_CheckFromUserNameIsValid(userName).First(),
                UserName = userName,
                Password = password
            };

            //Create User Login And Check Is Block
            //Check User Name Used
            if (!UserData.Id.HasValue)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.InvalidData);

            //Add User Login With Statues Login Right Now 
            User User = CreateS.UserLogin(UserData);
            if (User == null)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.InvalidData);


            if (User.IsPhoneActivated == false)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.YouAreNotActive, new
                {
                    IsActivePhone = false,
                    UserInformation=new
                    {
                        PhoneNumber = User.PhoneNumber
                    }
                });             

            //Check last Login is Block
            if (User.IsBlocked)
                //retuen message Account Block 
                return new ResponseVM(RequestTypeEnumVM.Error, Token.YoureAccountIsBlocked);
            else
                //Check last Login Statues 
                if (!User.IsSuccessLogin)
                return new ResponseVM(RequestTypeEnumVM.Error, Token.InvalidData);

            /*
             * Check user role mustbe if Client or Client
             **Notes** any user login in app basically included role client  
            */
            if (!CheckedS.Roles(User.UserRoles, new int[] { RoleEnumVM.Client }))
                return new ResponseVM(RequestTypeEnumVM.Error, Token.YouNotClient);

            Culture = User.LanguageType.Code;

            LanguageService.SetCulture(Culture);
            //Now Create Access Token
            AccessTokenVM AccessToken = CreateS.CreateToken(User, Culture, isRemmberMe);
            ResponseVM Res = new ResponseVM();
            Res.RequestType = RequestTypeEnumVM.Success;
            Res.Data = new
            {
                    IsActivePhone = true,
                UserInformation = new UsersData().GetUserIformation(User.Id),
                AccessToken
            };
            //return the token
            return Res;
        }

    }
}
