using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;

namespace BUS
{
     public class Bus_suasach
    {
        QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
       public DauSach timkiem(long id)
        {
            var query = from b in db.DauSaches
                        where b.ID == id
                        select b;
            return query.FirstOrDefault();

        }

        public List<TacGia> dsTacGia()
        {
            return db.TacGias.ToList();
        }

        public List<LoaiSach> dsLoaiSach()
        {
            return db.LoaiSaches.ToList();
        }
        public bool suasach(DauSach ds)
        {
            long myId = ds.ID;
            var query = from b in db.DauSaches
                        where b.ID == myId
                        select b;
            DauSach a = query.FirstOrDefault<DauSach>();
          
            a.MieuTa = ds.MieuTa;
            a.Ten = ds.Ten;
            a.TrangThai = ds.TrangThai;
            a.Loai = ds.Loai;
            a.ID_TacGia = ds.ID_TacGia;
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
