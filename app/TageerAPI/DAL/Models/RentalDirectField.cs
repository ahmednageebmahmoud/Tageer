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
    
    public partial class RentalDirectField
    {
        public int Id { get; set; }
        public bool IsRequired { get; set; }
        public Nullable<int> FkSubCategory_Id { get; set; }
        public int FkCategory_Id { get; set; }
        public int FkDirectField_Id { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual DirectField DirectField { get; set; }
        public virtual SubCategory SubCategory { get; set; }
    }
}
