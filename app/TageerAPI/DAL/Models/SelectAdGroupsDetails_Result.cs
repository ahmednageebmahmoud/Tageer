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
    
    public partial class SelectAdGroupsDetails_Result
    {
        public int Id { get; set; }
        public int FKAd_Id { get; set; }
        public int FKGroup_Id { get; set; }
        public Nullable<int> FKGroupItem_Id { get; set; }
        public string CustomValue { get; set; }
        public bool IsCustomValue { get; set; }
        public string GroupResourceName { get; set; }
        public string GroupsItemName { get; set; }
    }
}
