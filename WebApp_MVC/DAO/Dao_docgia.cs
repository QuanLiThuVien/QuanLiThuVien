using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;

namespace DAO
{
     public static class Dao_docgia
    {
         static QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        // load ds độc giả
        public static List<DocGiainfo> dsdocgia()
        {
            var list = (from n in db.DocGias
                        select new DocGiainfo
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
        public static List<DocGiainfo> timkiemdocgia(string tendocgia)
        {
            var listtimkiem = (from n in db.DocGias
                               where n.HoTen.Contains(tendocgia)
                               select new DocGiainfo
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
        public static bool them(DocGia dg)
        {
           try
            {
                db.DocGias.Add(dg);
                db.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }
        public static bool Sua(DocGia dg)
        {
            try
            {
                db.Entry(dg).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }

    }
}
