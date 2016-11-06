using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;

namespace DAO
{
     public class Dao_docgia
    {
        QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        // load ds độc giả
        public List<DocGia> dsdocgia()
        {
            var list = (from n in db.DocGias
                        select new DocGia
                        {
                            ID=n.ID,
                            HoTen=n.HoTen,
                            DiaChi=n.DiaChi,
                            SDT=n.SDT,
                            NgayHetHan=n.NgayHetHan,
                            SLuongGioiHan=n.SLuongGioiHan,
                            NgayGioiHan=n.NgayGioiHan
                        }).ToList();
            return list;
        }
        public List<DocGia> timkiemdocgia(string tendocgia)
        {
            var listtimkiem = (from n in db.DocGias
                               where n.HoTen.Contains(tendocgia)
                               select new DocGia
                               {
                                   ID = n.ID,
                                   HoTen = n.HoTen,
                                   DiaChi = n.DiaChi,
                                   SDT = n.SDT,
                                   NgayHetHan = n.NgayHetHan,
                                   SLuongGioiHan = n.SLuongGioiHan,
                                   NgayGioiHan = n.NgayGioiHan
                               }).ToList();
            return listtimkiem;
        }
        public bool them(DocGia dg)
        {
           
        }

    }
}
