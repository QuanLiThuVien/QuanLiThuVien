//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Model4
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public partial class sp_DanhSachSachMuon_Result
    {
        public string ID { get; set; }
        public string HoTen { get; set; }
        public string Ten { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}")]
        public Nullable<System.DateTime> NgayMuon { get; set; }
        public Nullable<double> SoLuong { get; set; }
    }
}
