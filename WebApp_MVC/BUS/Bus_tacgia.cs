using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;
using DAO;

namespace BUS
{
    public static class Bus_tacgia
    {
         static QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        public static List<TacGia> dstacgia()
        {
            return Dao_tacgia.dstacgia();
        }
        public static long idtacgia(string ten)
        {
            return Dao_tacgia.idtacgia(ten);
        }
    }
}
