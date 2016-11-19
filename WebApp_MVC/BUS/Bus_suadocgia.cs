using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;


namespace BUS
{
     public class Bus_suadocgia
    {
        QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        public DocGia timkiemdocgia(string id)
        {
            return db.DocGias.Find(id);
        }
        public bool suadocgia(DocGia docgia)
        {
            try
            {
                string id = docgia.ID;
                var query = from b in db.DocGias
                            where b.ID == id
                            select b;
                DocGia a = query.FirstOrDefault<DocGia>();
                a.HoTen = docgia.HoTen;
                a.DiaChi = docgia.DiaChi;
                a.SDT = docgia.SDT;
                a.Email = docgia.Email;
                a.SLuongGioiHan = docgia.SLuongGioiHan;
                a.NgayGioiHan = docgia.NgayGioiHan;
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
