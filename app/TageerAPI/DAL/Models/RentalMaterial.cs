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
    
    public partial class RentalMaterial
    {
        public int Id { get; set; }
        public int FKMaterial_Id { get; set; }
        public Nullable<int> FKSubCategory_Id { get; set; }
        public Nullable<int> FKCategory_Id { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual SubCategory SubCategory { get; set; }
        public virtual Material Material { get; set; }
    }
}
