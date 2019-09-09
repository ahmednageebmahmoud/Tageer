using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class ResponseVM
    {

        public object DevMessage { get;  set; }
        public string InnerException { get;  set; }
        public string Message { get;  set; }
        public int RequestType { get;  set; }
        public object Data { get;  set; }
        public bool IsData { get;  set; }

        public ResponseVM()
        {

        }
        /// <summary>
        /// Response Erro
        /// </summary>
        /// <param name="requestType"></param>
        /// <param name="message"></param>
        /// <param name="DevMessage"></param>
        /// <param name="innerException"></param>
        public ResponseVM(int requestType, string message, object devMessage, Exception innerException)
        {
            this.RequestType = requestType;
            this.Message = message;
            this.DevMessage = devMessage;
            this.InnerException = innerException.InnerException.Message;
            this.IsData =false;
        }
        /// <summary>
        /// Response Success 
        /// </summary>
        /// <param name="requestType"></param>
        /// <param name="message"></param>
        /// <param name="data"></param>
        public ResponseVM(int requestType, string message, object data)
        {
            this.RequestType = requestType;
            this.Message = message;
            this.Data = data;
            this.IsData = this.Data == null ? false : true;
        }

        public ResponseVM(int requestType, string message)
        {
            this.RequestType = requestType;
            this.Message = message;
            this.IsData = false;
        }
    }
}
