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
    using System.Collections.Generic;
    
    public partial class PagesRole
    {
        public int Id { get; set; }
        public bool IsCreate { get; set; }
        public bool IsUpdate { get; set; }
        public bool IsDelete { get; set; }
        public int FkPage_Id { get; set; }
        public bool IsDisplay { get; set; }
        public long FkUser_Id { get; set; }
    
        public virtual Page Page { get; set; }
        public virtual User User { get; set; }
    }
}
