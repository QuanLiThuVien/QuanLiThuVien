using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;

namespace BUS
{
     public class Bus_suadausach
    {
        QuanLiThuVienEntities db = new QuanLiThuVienEntities();
       public bool suadausach(DauSach ds)
        {
            try
            {
                var ds1 = db.DauSaches.Find(ds.ID);
                ds1.Ten = ds.Ten;
                ds1.ID_TacGia = ds.ID_TacGia;
                ds1.Loai = ds.Loai;
                ds1.TrangThai = ds.TrangThai;
                ds1.MieuTa = ds.MieuTa;
                ds1.NgayNhap = ds.NgayNhap;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
