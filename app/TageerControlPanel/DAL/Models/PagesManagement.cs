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
    
    public partial class PagesManagement
    {
        public int Id { get; set; }
        public string ContnetAr { get; set; }
        public string ContentEn { get; set; }
        public Nullable<int> FKSeo_Id { get; set; }
        public int FKPrivilege_Id { get; set; }
    
        public virtual Page Page { get; set; }
        public virtual Seo Seo { get; set; }
    }
}
