using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models.ViewModel;
using DAL.Resource;
using DAL.Service;
using DAL.Models;

namespace DAL.BLL
{
    public class MessagesData : BasicBLL
    {
        public object Create(MessageCreateVM message)
        {
            try
            {

                object ObjectReturn = this.CreateS.Messages(message);
                if (ObjectReturn != null)
                    return ObjectReturn;

                db.SaveChanges();

                return new ResponseVM(RequestTypeEnumVM.Success, Token.Sent, db.SelectLastMessage(AccessToken.GetUserId(), message.UserReciveId)
                    .Select(v => GetMessageInformation(v)).ToList());
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }

        }

        public object GetMessages(int lastMessageId, int take, int chatId)
        {
            try
            {
                var Result = db.SelectMessages(lastMessageId, take, chatId)
                .Select(v => GetMessageInformation(v)).OrderBy(x => x.Id).ToList();
                if (Result.Count == 0)
                {
                    if (lastMessageId == 0)
                        return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResult);
                    return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResultMore);
                }

                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, Result);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }
        }

        public object GetUserChats(int skip, int take, string userOutName)
        {
            try
            {
                var Result = new List<ChatVM>();

                Result = db.SelectUserChats(skip, take, AccessToken.GetUserId(), userOutName)
                  .Select(c => new ChatVM
                  {
                      Id = c.Id,
                      UserRecived = new ChatUserInformationVM
                      {
                          Id = c.UserId,
                          Name = c._Name,
                          Image = c.UserImage
                      },
                      Messages = db.SelectMessages(0, 5, c.Id)
                .Select(v => GetMessageInformation(v)).OrderBy(x => x.Id).ToList()
                  }).ToList();

                if (Result.Count == 0)
                {
                    if (skip == 0)
                        return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResult);
                    return new ResponseVM(RequestTypeEnumVM.Info, Token.NoResultMore);
                }
                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, Result);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }

        }

        public object GetChatByUserRecivedName(string userName)
        {

            try
            {
                var Result = db. SeelctChatByUserRecivedName   (userName, AccessToken.GetUserId())
              .Select(c => new ChatVM
              {
                  Id = c.Id.HasValue ? c.Id.Value : 0,
                  UserRecived = new ChatUserInformationVM
                  {
                      Id = c.UserId,
                      Name = c._Name,
                      Image = c.UserImage
                  },
                  Messages = db.SelectMessages(0, 5, c.Id)
                .Select(v => GetMessageInformation(v)).OrderBy(x => x.Id).ToList()

              }).FirstOrDefault();

                if (Result == null)
                    return new ResponseVM(RequestTypeEnumVM.Error, Token.UserNotFound);
                return new ResponseVM(RequestTypeEnumVM.Success, Token.Success, Result);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }

        }


        public ChateMessageVM GetMessageInformation(SelectMessages_Result mess) 
        {
            return new ChateMessageVM
            {
                User = new ChatUserInformationVM
                {
                    Id = mess.FkUser_Id,
                    Name = mess._Name,
                    Image = mess.UserImage
                },
                Id = mess.Id,
                ChatId = mess.FkChat_Id,
                Message = mess.Message,
                SedDateTime = mess._SendDateTime
            };
        }
        public ChateMessageVM GetMessageInformation(SelectLastMessage_Result mess)
        {
            return new ChateMessageVM
            {
                User = new ChatUserInformationVM
                {
                    Id = mess.FkUser_Id,
                    Name = mess._Name,
                    Image = mess.UserImage
                },
                Id = mess.Id,
                ChatId = mess.FkChat_Id,
                Message = mess.Message,
                SedDateTime = mess._SendDateTime
            };
        }

    }//end class
}
