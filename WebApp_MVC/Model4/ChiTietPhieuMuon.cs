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
    using System.Collections.Generic;
    
    public partial class ChiTietPhieuMuon
    {
        public long ID { get; set; }
        public long ID_PhieuMuon { get; set; }
        public long ID_DauSach { get; set; }
        public long ID_Sach { get; set; }
        public double SoLuong { get; set; }
        public string TinhTrang { get; set; }
    
        public virtual DauSach DauSach { get; set; }
        public virtual PhieuMuon PhieuMuon { get; set; }
        public virtual Sach Sach { get; set; }
    }
}
