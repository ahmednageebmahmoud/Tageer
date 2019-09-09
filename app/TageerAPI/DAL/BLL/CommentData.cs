using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Enums;
using DAL.Models.ViewModel;
using DAL.Service;
using System.Web;
using DAL.Resource;

namespace DAL.BLL
{
    public class CommentData : BasicBLL
    {


        public object Create(CommentVM commentVM)
        {
            try
            {
                AdComment Comment = new AdComment();
                object ObjectReturn = CreateS.Comment(commentVM, Comment);
                if (ObjectReturn != null) return ObjectReturn;

                db.SaveChanges();
                db = new TageerEntities();
                Comment = db.AdComments.Find(Comment.Id);
                return new ResponseVM(RequestTypeEnumVM.Success, Token.Created, new CommentVM
                {
                    Id = Comment.Id,
                    AdId = Comment.FKAd_Id,
                    Comment = Comment.Comment,

                    UserImage = Comment.User.Image,
                    UserName = Comment.User.UserName
                });
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }
        }



        public CommentVM GetCommentInfrmation(SelectAdComments_Result comment)
        {
            return new CommentVM
            {
                Id = comment.Id,
                AdId = comment.FKAd_Id,
                Comment = comment.Comment,

                UserImage = comment.UserImage,
                UserName = comment.UserName
            };
        }

        public object GetMoreComments(int adId, int lastCommentId, int takeCount)
        {
            try
            {
                var Comments = db.SelectAdComments(lastCommentId, takeCount ,adId).ToList();

                if (Comments.Count == 0)
                {
                    if (lastCommentId == 0)
                        return new ResponseVM(RequestTypeEnumVM.Error, Token.NoResult);
                    return new ResponseVM(RequestTypeEnumVM.Error, Token.NoResultMore);
                }

                return new ResponseVM(RequestTypeEnumVM.Success, Token.Created, Comments.Select(c => GetCommentInfrmation(c)));
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnumVM.Error, Token.SomeErrorInServer, ex);
            }
        }




    }//end Class
}
