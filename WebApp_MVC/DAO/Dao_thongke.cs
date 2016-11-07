using Model4;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public static class Dao_thongke
    {
         static QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        public static List<sp_SoLuongDauSach_Result> sldausach()
        {
            var list = (from n in db.sp_SoLuongDauSach()
                        select new sp_SoLuongDauSach_Result
                        {
                            Ten=n.Ten,
                            Loai=n.Loai,
                            TrangThai=n.TrangThai,
                            MieuTa=n.MieuTa,
                            Soluong=n.Soluong,
                            ID=n.ID
                        }).ToList();
            return list;
        }
        public static List<sp_SoLuongMuon_Result> slsmuon(string ngay)
        {
            var list = (from n in db.sp_SoLuongMuon(ngay)
                        select new sp_SoLuongMuon_Result
                        {
                            SoLuong=n.SoLuong,
                            ID_DauSach=n.ID_DauSach
                        }).ToList();
            return list;
        }
        public static IEnumerable<sp_SoLuongTra_Result> sltra(string ngay)
        {
            var list1 = (from n in db.sp_SoLuongTra(ngay)
                        select new sp_SoLuongTra_Result
                        {
                            SoLuong=n.SoLuong,
                            ID_DauSach=n.ID_DauSach
                        });
            return list1;
        }
    }
}
