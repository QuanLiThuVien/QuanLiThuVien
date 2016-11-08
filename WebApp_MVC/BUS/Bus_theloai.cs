using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Model4;

namespace BUS
{
     public static class Bus_theloai
    {
         static QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        public static List<LoaiSach> dstheloai()
        {
            return DAO.Dao_theloai.dstheloai();
        }
        public static List<LoaiSach> timkiemtheloai(string ten)
        {
            return Dao_theloai.timkiemtheloai(ten);
        }
        public static long idtheloai(string ten)
        {
            return Dao_theloai.idtheloai(ten);
        }
    }
}
