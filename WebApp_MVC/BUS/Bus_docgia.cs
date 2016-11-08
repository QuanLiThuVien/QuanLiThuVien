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
            return Dao_docgia.them(dg);
        }
        public static bool Sua(DocGia dg)
        {
            return Dao_docgia.Sua(dg);
        }
    }
}
