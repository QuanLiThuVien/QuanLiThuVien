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
    
    public partial class DauSach
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DauSach()
        {
            this.ChiTietPhieuMuons = new HashSet<ChiTietPhieuMuon>();
            this.ChiTietPhieuTras = new HashSet<ChiTietPhieuTra>();
            this.Saches = new HashSet<Sach>();
        }
    
        public long ID { get; set; }
        public string Ten { get; set; }
        public long ID_TacGia { get; set; }
        public long Loai { get; set; }
        public string TrangThai { get; set; }
        public string MieuTa { get; set; }
        public System.DateTime NgayNhap { get; set; }
        public double Soluong { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietPhieuMuon> ChiTietPhieuMuons { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietPhieuTra> ChiTietPhieuTras { get; set; }
        public virtual TacGia TacGia { get; set; }
        public virtual LoaiSach LoaiSach { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sach> Saches { get; set; }
    }
}
