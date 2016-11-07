using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Model4;

namespace BUS
{
     public class Bus_thongke
    {
        QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        public static List<sp_SoLuongDauSach_Result> sldausach()
        {
            return Dao_thongke.sldausach();
        }
        public static List<sp_SoLuongMuon_Result> slmuon(string ngay)
        {
            return Dao_thongke.slsmuon(ngay);
        }
        public static IEnumerable<sp_SoLuongTra_Result> sltra(string ngay)
        {
            return Dao_thongke.sltra(ngay);
        }
    }
}
