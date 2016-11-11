using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;

namespace BUS
{
     public class Bus_xoasach
    {
        QuanLiThuVienEntities2 db = new QuanLiThuVienEntities2();
        public bool xoasach(long id)
        {
            try
            {
                var dausach = db.DauSaches.Find(id);
                var query = from b in db.Saches
                            where b.ID_DauSach == id
                            select b;
                List<Sach> a = query.ToList<Sach>();
                for(int i=0;i<a.Count;i++)
                {
                    db.Saches.Remove(a[i]);
                    db.SaveChanges();
                      
                }
                db.DauSaches.Remove(dausach);
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
