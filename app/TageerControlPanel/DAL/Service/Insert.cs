using DAL.Models;
using DAL.Models.ViewModel;
using DAL.Resource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using static DAL.Enums.Enums;

namespace DAL.Service
{
    public class Insert : IDisposable
    {
        TageerEntities db = new TageerEntities();
        Checked isChecked = new Checked();

        //Insert User Login
        public UserLogin InsertUserLogin(User user)
        {

            try
            {
                UserLogin userLogin = new UserLogin();
                long userId = db.Users.Single(v => v.UserName == user.UserName).Id;

                userLogin.LoginDate = DateTime.Now;
                userLogin.FkUser_Id = userId;

                //Check Login Valid 
                if (isChecked.Login(user.UserName, user.Password))
                {
                    //Login Success
                    userLogin.IsSuccess = true;
                    //Insert last IsBlock
                    if (db.UserLogins.Where(x => x.FkUser_Id == userId).Count()>0)
                        user.IsBlocked = db.Users.Find(userId).IsBlocked;
                }
                else
                {
                    //Login not Success
                    //Check Last 10 login user If all NotSuccess Or Not
                    int skipCount = db.UserLogins.Where(x => x.FkUser_Id == userId).Count() - 10;
                    if (skipCount > 0)
                    {
                        var userLogins = db.UserLogins.Where(x => x.FkUser_Id == userId).ToList();
                        if (!userLogins.Skip(skipCount).Any(x => x.IsSuccess == true))
                        {
                            user.IsBlocked= true;
                        }
                    }
                   
                    userLogin.IsSuccess = false;

                }

				//التحقق اذا كان المستخدم محظور من قبل الاآدارة
				var User = db.Users.Find(userId);
				//اذا كان محظر من قبل ال
						user.IsBlocked = User.IsBlocked;

				db.UserLogins.Add(userLogin);
                db.SaveChanges();
                return userLogin;
            }
            catch (Exception ex)
            {
                return null;

            }
        }



        public void Dispose()
    {
        db.Dispose();
            isChecked.Dispose();
    }
}//End Classs
}
