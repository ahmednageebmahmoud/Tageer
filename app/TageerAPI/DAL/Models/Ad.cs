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
    
    public partial class Ad
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ad()
        {
            this.AdComments = new HashSet<AdComment>();
            this.AdFavorites = new HashSet<AdFavorite>();
            this.AdGroupsDetails = new HashSet<AdGroupsDetail>();
            this.AdIndividualFieldsDetails = new HashSet<AdIndividualFieldsDetail>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int FkRentalTimesType_Id { get; set; }
        public int FKAlbum_Id { get; set; }
        public long FkUser_Id { get; set; }
        public int FkCategory_Id { get; set; }
        public int FkSubCategory_Id { get; set; }
        public System.DateTime CreateDateTime { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AdComment> AdComments { get; set; }
        public virtual AdDirectFieldDetail AdDirectFieldDetail { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AdFavorite> AdFavorites { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AdGroupsDetail> AdGroupsDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AdIndividualFieldsDetail> AdIndividualFieldsDetails { get; set; }
        public virtual Album Album { get; set; }
        public virtual Category Category { get; set; }
        public virtual RentalTimesType RentalTimesType { get; set; }
        public virtual SubCategory SubCategory { get; set; }
        public virtual User User { get; set; }
    }
}
