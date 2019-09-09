using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using DAL.Models.ViewModel;
using DAL.Resource;

namespace BLL.Services
{
    public static class EmailService
    {


        public static void SendEmail(string toEmail, string alisName, string subjec, string message, bool isHtml)
        {

            var smtp = new SmtpClient(ConfigService.HostMail);
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(ConfigService.BaseEmail, ConfigService.BaseEmailPassword);


            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(ConfigService.BaseEmail, Token.AppName);
            msg.To.Add(new MailAddress(toEmail));
            msg.Subject = subjec;
            msg.BodyEncoding = Encoding.UTF8;
            msg.IsBodyHtml = isHtml;
            msg.Body = message;
            smtp.Send(msg);
            msg.Dispose();
        }





        internal static void SendEmails(SendMailVM message)
        {
            var smtp = new SmtpClient(ConfigService.HostMail);
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(ConfigService.BaseEmail, ConfigService.BaseEmailPassword);

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(ConfigService.BaseEmail, Token.AppName);
            message.Emails.ForEach(c => msg.To.Add(new MailAddress(c)));
            msg.Subject = message.Subject;
            msg.BodyEncoding = Encoding.UTF8;
            msg.IsBodyHtml = true;
            msg.Body = message.Message;
            smtp.Send(msg);
            msg.Dispose();
        }
    }
}
