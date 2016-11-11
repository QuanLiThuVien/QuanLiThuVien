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
        QuanLiThuVienEntities2 db = new QuanLiThuVienEntities2();
       public sachinfo timkiem(long id)
        {
            var query = from b in db.Saches
                        where b.ID == id
                        select new sachinfo
                        {
                            Id=b.ID,
                            Ten=b.DauSach.Ten,
                            TrangThai=b.TinhTrang,
                            GhiChu=b.GhiChu
                        };
            return query.FirstOrDefault();

        }
        public bool suasach(Sach ds)
        {
            try
            {

                long myId = ds.ID;
                var query = from b in db.Saches
                            where b.ID == myId
                            select b;
                Sach a = query.FirstOrDefault<Sach>();
                a.TinhTrang = ds.TinhTrang;
                a.GhiChu = ds.GhiChu;
                db.SaveChanges();

                return true;
            }
            
            catch (Exception)
            {
                return false;
           }
        }

        


    }
}
