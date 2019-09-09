using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using System.Text.RegularExpressions;
using System.Net.Mail;
using DAL.Models.ViewModel;

namespace DAL.Service
{
    public class CheckedService : IDisposable
    {
        TageerEntities db = new TageerEntities();





        public void Dispose()
        {
            db.Dispose();
        }

        public bool UserNameValid(string userName)
        {
            return db.Users.Any(c => c.UserName == userName);
        }

       
        /// <summary>
        /// for login
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns>bool</returns>
        internal bool UserNameAndPasswordIsValid(string userName, string password)
        {
            return db.Users.Any(c => c.UserName == userName&&c.Password==password);

        }

        /// <summary>
        /// for login
        /// </summary>
        /// <param name="Email"></param>
        /// <param name="password"></param>
        /// <returns>bool</returns>
        public bool EmailPasswordIsValid(string email, string password)
        {
            return db.Users.Any(c => c.Email == email && c.Password == password);

        }

        public bool Roles(ICollection<UserRole> userRoles, int[] rolesId)
        {
                bool Checked = false;
                foreach (var roleId in rolesId)
                {
                    bool IsRole = userRoles.Any(c => c.FkRole_Id == roleId);
                    if (IsRole)
                        Checked = true;
                }

                return Checked;
        }


    /// <summary>
    /// For Confirm if User Blocked
    /// </summary>
    /// <param name="userName"></param>
    /// <param name="password"></param>
    /// <returns></returns>
    internal bool IsUserBlocked(string userName, string password)
        {
            return db.Users.Where(c => c.UserName == userName && c.Password == password).Single().IsBlocked;

        }

        public bool ConfirmNewPassword(long userId,string newPassword)
        {
            return db.Users.Where(x => x.Id == userId).Any(x => x.Password == newPassword);
        }

        /// <summary>
        /// Number Valid By Regx
        /// </summary>
        /// <param name="number"></param>
        /// <returns></returns>
        internal bool NumberValid(string number)
        {
            return Regex.IsMatch(number, @"\d{11,11}");
        }

        internal bool EmailIsCorrect(string email)
        {

            try
            {
                MailAddress m = new MailAddress(email);

                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }


        /// <summary>
        /// نتححق بان المستخدم ليس مجرد عميل فقط
            /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        internal bool IsUserNotOnlyClinet(User user)
        {
            return user.UserRoles.Any(c => c.FkRole_Id == RoleEnumVM.Manager || c.FkRole_Id == RoleEnumVM.Supervisor);
        }
    }//End Class
}
