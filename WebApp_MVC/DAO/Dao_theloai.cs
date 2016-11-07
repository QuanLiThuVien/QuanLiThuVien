using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;

namespace DAO
{
     public static class Dao_theloai
    {
        static QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        public static List<LoaiSach> dstheloai()
        {
            var list = db.LoaiSaches.ToList();
            return list;
        } 
        public static List<LoaiSach> timkiemtheloai(string ten)
        {
            var listtimkiem = (from n in db.LoaiSaches
                               where n.Ten.Contains(ten)
                               select new LoaiSach
                               {
                                   ID=n.ID,
                                   Ten=n.Ten
                               }).ToList();
            return listtimkiem;
        }
        public static long idtheloai(string ten)
        {
            long idtheloai = db.LoaiSaches.Where(n => n.Ten.Equals(ten)).Select(i => i.ID).FirstOrDefault();
            return idtheloai;
        }
    }
}
