//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL.Models
{
    using System;
    
    public partial class SelectMessages_Result
    {
        public long Id { get; set; }
        public System.DateTime DateTime { get; set; }
        public int FkChat_Id { get; set; }
        public string Message { get; set; }
        public long FkUser_Id { get; set; }
        public long UserId { get; set; }
        public string UserName { get; set; }
        public string UserFullName { get; set; }
        public string UserImage { get; set; }
    }
}
