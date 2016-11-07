using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;
using DAO;

namespace BUS
{
     public static class Bus_theloai
    {
        public static List<LoaiSach> dsloaisach()
        {
            return Dao_theloai.dstheloai();
        }
        public static List<LoaiSach> timkiemloaisach(string ten)
        {
            return Dao_theloai.timkiemtheloai(ten);
        }
        public static long idtheloai(string ten)
        {
            return Dao_theloai.idtheloai(ten);
        }
    }
}
