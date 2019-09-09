using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Http;
using DAL.Bll;
using DAL.Models.ViewModel;
using System.Web.Http.Description;
using DAL.Service;
using DAL.BLL;

namespace API.Controllers
{
    [BaseApiController]
    [Authorize]
    [RoutePrefix("Tageer/api/Chats")]
    public class ChatsController : ApiController
    {
        MessagesData MessagesData = new MessagesData();

        /// <summary>
        /// ارسال رسالة الى شخص ما وتضاف الى الشات اذا يوجد واذا لم يوجد فـ تضاف الى شات جديد
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(ChateMessageVM))]
        [Route("SendMessage")]
        [HttpPost]
        public IHttpActionResult Create(MessageCreateVM cont)
        {
            return Json(MessagesData.Create(cont));
        }

        /// <summary>
        /// الصول على مجموعة على الرسالة بين مستخدم والآخر
        /// </summary>
        /// <param name="lastMessageId">آخر رسالة قد حصلت عليها من السيرفر واذا لم يكن فـ ترسل بـ صفر</param>
        /// <param name="take">عدد الرسائل المراد الحصول عليها</param>
        /// <param name="chatId">معرف الشات الذى تريد الرسائل الذى بداخلة</param>
        /// <returns></returns>
        [ResponseType(typeof(List<ChateMessageVM>))]
        [Route("GetMessages")]
        [HttpGet]

        public IHttpActionResult GetMessages(int lastMessageId, int take, int chatId)
        {
            return Json(MessagesData.GetMessages(lastMessageId, take, chatId));
        }

        /// <summary>
        /// الحصول على المحادثات التى شارك بها المستخدم الحالى
        /// </summary>
        /// <param name="lastChatId">آخؤ محاجذة قد حصلت عليها</param>
        /// <param name="take">عدد المحادثات المراد الحصول عليها</param>
        /// <param name="userOutName"> عدم خروج الشات الخاص بهذا اليوز نيم</param>
        /// 
        /// <returns></returns>
        [ResponseType(typeof(List<ChatVM>))]
        [Route("GetUserChats")]
        [HttpGet]
        public IHttpActionResult GetUserChats(int skip, int take,string userOutName)
        {
            return Json(MessagesData.GetUserChats(skip, take, userOutName));
        }
  


        /// <summary>
        /// الحصول على الشات الخاص بـ مستخدم معين بـ الاضافة الى اذا لم يوجد شات سوف يتم الحصول فقط على معلومات المستخدم هذا
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        [ResponseType(typeof(ChatVM))]
        [Route("GetChatByUserRecivedName/{userName}")]
        [HttpGet]
        public IHttpActionResult GetChatByUserRecivedName(string userName)
        {
            return Json(MessagesData.GetChatByUserRecivedName(userName));
        }



    }//End Controller 
}
