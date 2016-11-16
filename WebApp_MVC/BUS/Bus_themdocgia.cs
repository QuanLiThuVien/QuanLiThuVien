using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;

namespace BUS
{
     public class Bus_themdocgia
    {
        QuanLiThuVienEntities2 db = new QuanLiThuVienEntities2();
        public bool themdocgia(DocGia dg)
        {
           try
            {
                db.DocGias.Add(dg);
                db.SaveChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
            }



        }
        

    }
}
