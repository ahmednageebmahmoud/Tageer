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
    
    public partial class Users_SelectByPk_Result
    {
        public long Id { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool IsBlocked { get; set; }
        public System.DateTime CreateDate { get; set; }
        public string FullName { get; set; }
        public Nullable<int> FkImage_Id { get; set; }
        public int FKAddress_Id { get; set; }
        public Nullable<int> FKGender_Id { get; set; }
        public int FKLanguage_Id { get; set; }
        public string PhoneNumber { get; set; }
        public Nullable<int> PhoneActiveCode { get; set; }
        public Nullable<bool> IsPhoneActivated { get; set; }
        public string LanguageCode { get; set; }
        public string Image { get; set; }
        public string CompanyDescription { get; set; }
        public Nullable<int> CompanyActivityNameId { get; set; }
        public string CompanyActivityNameAr { get; set; }
        public string CompanyActivityNameEn { get; set; }
        public Nullable<int> CompanyOffice_Id { get; set; }
        public string CompanyOfficeLocation_Latitude { get; set; }
        public string CompanyOfficeLocation_Longitude { get; set; }
        public string CompanyOffice_Street { get; set; }
        public Nullable<int> CompanyOffice_CountryId { get; set; }
    }
}
