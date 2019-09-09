using DAL.Resource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class ResponseVM
    {

        public object DevMessage { get;   set; }
        public Exception InnerException { get;   set; }
        public string Message { get;   set; }
        public int RequestType { get;   set; }
        public object Data { get;   set; }
        public bool IsData { get;   set; }


        public ResponseVM()
        {

        }
        public ResponseVM(int requestType, string message)
        {
            this.RequestType = requestType;
            this.Message = message;
        }
        public ResponseVM(int requestType,string message,object data)
        {
            this.RequestType = requestType;
            this.Message = message;
            this.Data = data;
            this.IsData = true;
        }

        public ResponseVM(int requestType, string message, Exception ex)
        {
            this.RequestType = requestType;
            this.Message = message;
            this.DevMessage = ex.Message;
            this.InnerException = ex.InnerException;
        }

        /// <summary>
        /// return ResponseVM With Field IsRequierd Message
        /// </summary>
        /// <param name="fieldName"></param>
        /// <returns></returns>
        public static ResponseVM FieldIsRequierd(string fieldName)
        {
            return new ResponseVM(RequestTypeEnumVM.Error,string.Format("{0} : {1}",fieldName,Token.FiledIsRequired));
        }
    }
}
