using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using DAL.Models.ViewModel;

namespace DAL.Service
{
    public class PageService
    {
        //Get Page Role
        public static PagesRole GetPageRole(int page)
        {
            using (TageerEntities db = new TageerEntities())
            {

                long UserId = CookieService.UserInfo.Id;
                List<int> UserRoles = new UserService().GetCurrentUserRoles();

                //Ceck is Role 
                if (UserId == 1)
                    return new PagesRole()
                    {
                        IsDisplay = true,
                        IsCreate = true,
                        IsDelete = true,
                        IsUpdate = true,
                    };

                /*
                 يمكن ان يكون للمستخدم اكتر من صلاحية فبذالك يجب جلب الكل
                 */
                var PagesRole = db.PagesRoles.Where(c => c.FkPage_Id == page && c.FkUser_Id == UserId
                ).First();
 

                /*
                 هنا نسمح للمستخم بـ اجراء اى شىء بدام لدية موافقة فى احدى الحقول مع احدى الصلاحيات الخاصة بة
                 */
                return new PagesRole()
                {
                    IsDisplay = PagesRole.IsDisplay,
                    IsCreate = PagesRole.IsCreate,
                    IsDelete = PagesRole.IsDelete,
                    IsUpdate = PagesRole.IsUpdate,
                };
            }
        }

    }
}
