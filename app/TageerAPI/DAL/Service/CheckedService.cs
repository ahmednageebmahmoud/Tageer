using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using System.Text.RegularExpressions;
using System.Net.Mail;

namespace DAL.Service
{
    public class CheckedService 
    {
        TageerEntities db;
        public CheckedService(TageerEntities _db)
        {
            this.db = _db;
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

        public bool UserNamePasswordIsValid(string userName, string password)
        {
            return db.Users.Any(c => c.UserName == userName && c.Password == password);

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
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        internal bool IsUserBlocked(string userName, string password)
        {
            return db.Users.Where(c => c.UserName == userName && c.Password == password).Single().IsBlocked;

        }

        public bool ConfirmNewPassword(int userId,string newPassword)
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

        /// <summary>
        /// return false if email is npt valid
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
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
    }//End Class
}
