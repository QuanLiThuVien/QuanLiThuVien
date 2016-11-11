using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Model4;

namespace BUS
{
     public static class Bus_docgia
    {
        static QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        // load ds độc giả
        public static List<DocGiainfo> dsdocgia()
        {
            return DAO.Dao_docgia.dsdocgia();
        }
        public static List<DocGiainfo> timkiemdocgia(string tendocgia)
        {
            return Dao_docgia.timkiemdocgia(tendocgia);
        }
        public static bool them(DocGia dg)
        {
			try
            {
                long maxdong = db.DocGia.OrderByDescending(n => n.ID).Select(i => i.ID).FirstOrDefault();
                db.DocGia.Add(dg);
                db.SaveChanges();
                for (var i = 0; i < ds.Soluong; i++)
                {
                    string trangthai = "Khả dụng";
                    DocGia dg = new Sach();
                    dg.ID_DocGia = maxdong;
                    dg.TinhTrang = trangthai;
                    db.Saches.Add(dg);
                    db.SaveChanges();
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public static bool Sua(DocGia dg)
        {
			long myId = dg.ID;
            var query = from b in db.DocGia
                        where b.ID == myId
                        select b;
            DocGia a = query.FirstOrDefault<DauSach>();
          
            a.HoTen = dg.HoTen;
            a.DiaChi = dg.DiaChi;
            a.SDT = dg.SDT;
            a.NgayCapThe = dg.NgayCapThe;
            a.NgayHetHan = dg.NgayHetHan;
			a.NamTotNghiep = dg.NamTotNghiep;
			a.Email = dg.Email;
			a.SLuongGioiHan = dg.SLuongGioiHan;
			a.NagyGioiHan = dg.NagyGioiHan;
            db.SaveChanges();

            return true;
            //}
            //catch (Exception)
            //{
              //  return false;
           // }
        }
    }
}
