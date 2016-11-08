using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Model4;

namespace BUS
{
     public static class Bus_sach
    {
        static QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        public static List<DauSachInfo> dssach1()
        {
            return DAO.Dao_sach.dssach1();
        }
        public static List<DauSachInfo> timkiemsach(string ten)
        {
            return DAO.Dao_sach.timkiemsach(ten);
        }
        public static bool sua(DauSach ds)
        {
            return DAO.Dao_sach.sua(ds);
        }
        public static bool xoa(int id)
        {
            return DAO.Dao_sach.xoa(id);
        }
        public static bool themmoi(DauSach ds)
        {
            return DAO.Dao_sach.themmoi(ds);
        }
        public static bool bosung(DauSach ds)
        {
            return DAO.Dao_sach.bosung(ds);
        }
        public static List<DauSach> timkiemsach1(string ten)
        {
            return DAO.Dao_sach.timkiemsach1(ten);
        }
        public static long laydong()
        {
            return DAO.Dao_sach.laydong();
        }
        public static long iddausach(string ten)
        {
            return DAO.Dao_sach.iddausach(ten);
        }

    }
}
