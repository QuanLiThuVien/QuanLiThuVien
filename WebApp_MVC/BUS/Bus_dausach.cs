using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Model4;

namespace BUS
{
    public class Bus_dausach
    {
        QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        public static List<DauSachInfo> dsdausach()
        {
            return Dao_sach.dssach1();
        }
        public static List<DauSachInfo> dstimkiem(string ten)
        {
            return Dao_sach.timkiemsach(ten);
        }
        public static bool themmoi(DauSach ds)
        {
            return Dao_sach.themmoi(ds);
        }
        public static bool bosung(DauSach ds)
        {
            return Dao_sach.bosung(ds);
        }
        public static bool sua(DauSach ds)
        {
            return Dao_sach.sua(ds);
        }
        public static bool xoa(int id)
        {
            return Dao_sach.xoa(id);
        }
        public static long maxdong()
        {
            return Dao_sach.laydong();
        }
        public static long iddausach(string ten)
        {
            return DAO.Dao_sach.iddausach(ten);
        }

    }
}
