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
    
    public partial class AppsInformation
    {
        public int Id { get; set; }
        public string ResourceName { get; set; }
        public string Value { get; set; }
        public Nullable<int> FkFile_Id { get; set; }
    
        public virtual AllFile AllFile { get; set; }
    }
}
