using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;

namespace BUS
{
     public class Bus_quanly
    {
        QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        public List<DocGia> dsdocgia()
        {
            return db.DocGias.ToList();
        }
       public List<DauSach> dsdausach()
        {
            return db.DauSaches.ToList();
        }
       public List<DauSach> timkiemdausach(string ten)
        {
            var query = from b in db.DauSaches
                        where b.Ten.Contains(ten)
                        select b;
            return query.ToList();
        }
       public List<DocGia> timkiemdocgia(string ten)
        {
            var query = from b in db.DocGias
                        where b.HoTen.Contains(ten)
                        select b;
            return query.ToList();
        }
       // hàm thống kê.
    }
}
