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
    
    public partial class Seo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Seo()
        {
            this.PagesManagements = new HashSet<PagesManagement>();
        }
    
        public int Id { get; set; }
        public string TitelAr { get; set; }
        public string TitelEn { get; set; }
        public string KeywordAr { get; set; }
        public string KeywordEn { get; set; }
        public string DescriptionAr { get; set; }
        public string DescriptionEn { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PagesManagement> PagesManagements { get; set; }
    }
}
