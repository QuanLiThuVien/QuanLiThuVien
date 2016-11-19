using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;

namespace BUS
{
     public class Bus_themsach
    {
        QuanLiThuVienEntities db = new QuanLiThuVienEntities();
        public bool themmoi(DauSach ds)
        {
            try
            {
                long maxdong = db.DauSaches.OrderByDescending(n => n.ID).Select(i => i.ID).FirstOrDefault();
                maxdong = maxdong + 1;
                db.DauSaches.Add(ds);
                db.SaveChanges();
                for (var i = 0; i < ds.Soluong; i++)
                {
                    string trangthai = "Khả dụng";
                    Sach s = new Sach();
                    s.ID_DauSach = maxdong;
                    s.TinhTrang = trangthai;
                    db.Saches.Add(s);
                    db.SaveChanges();
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool bosung(DauSach ds)
        {
            try
            {
                var dausach = (from n in db.DauSaches
                               where n.Ten.Equals(ds.Ten)
                               select new DauSach
                               {
                                   Soluong=n.Soluong,
                                   ID_TacGia=n.ID_TacGia,
                                   Loai=n.Loai,
                                   TrangThai=n.TrangThai,
                                   MieuTa=n.MieuTa,     
                               }).FirstOrDefault();

                dausach.Soluong = dausach.Soluong + ds.Soluong;
                dausach.ID_TacGia = ds.ID_TacGia;
                dausach.Loai = ds.Loai;
                dausach.TrangThai = ds.TrangThai;
                dausach.MieuTa = ds.MieuTa;
                db.Entry(dausach).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                for (var i = 0; i < ds.Soluong; i++)
                {
                    string tinhtrang = "Khả dụng";
                    long iddausach = dausach.ID;
                    Sach s = new Sach();
                    s.ID_DauSach = iddausach;
                    s.TinhTrang = tinhtrang;
                    db.Saches.Add(s);
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public List<LoaiSach> dsloaisach()
        {
            var list = db.LoaiSaches.ToList();
            return list;
        }
        public List<TacGia> dstacgia()
        {
            var list = db.TacGias.ToList();
            return list;
        }
    }
}
