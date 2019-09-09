using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DAL.Service
{
   public class UserService:IDisposable
    {
        TageerEntities db = new TageerEntities();
        public   long GetCurrentUserId()
        {

           
                return db.Users.Where(x => x.UserName == HttpContext.Current.User.Identity.Name).Single().Id;
        }
        public   User GetCurrentUser()
        {
                return db.Users.Where(x => x.UserName == HttpContext.Current.User.Identity.Name).Single();
        }

       

        public List<int> GetCurrentUserRoles()
        {
            if (!HttpContext.Current.Request.IsAuthenticated) return new List<int>();

                                return db.Users.Find(CookieService.UserInfo.Id).UserRoles.Select(c=> c.FkRole_Id).ToList();
        }

        public   User GetUser(long id)
        {
                return db.Users.Single(c=> c.Id== id);
        }

        public void Dispose()
        {
            db.Dispose();
        }

        public User GetUser(string emial)
        {
            return db.Users.Where(x => x.Email == emial).Single();
        }
    }
}
