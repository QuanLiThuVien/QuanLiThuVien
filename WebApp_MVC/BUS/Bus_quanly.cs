using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;

namespace BUS
{
     public class Bus_quanly
    {
        QuanLiThuVienEntities2 db = new QuanLiThuVienEntities2();
        public List<DocGia> dsdocgia()
        {
            return db.DocGias.ToList();
        }
       public List<DauSach> dsdausach()
        {
            return db.DauSaches.ToList();
        }
       public List<DauSach> timkiemdausach(string ten)
        {
            var query = from b in db.DauSaches
                        where b.Ten.Contains(ten)
                        select b;
            return query.ToList();
        }
       public List<DocGia> timkiemdocgia(string ten)
        {
            var query = from b in db.DocGias
                        where b.HoTen.Contains(ten)
                        select b;
            return query.ToList();
        }
        public List<sp_SoLuongDauSach_Result> sldausach()
        {
            var list = (from n in db.sp_SoLuongDauSach()
                        select new sp_SoLuongDauSach_Result
                        {
                            Ten = n.Ten,
                            Loai = n.Loai,
                            TrangThai = n.TrangThai,
                            MieuTa = n.MieuTa,
                            Soluong = n.Soluong,
                            ID = n.ID
                        }).ToList();
            return list;
        }
        public List<sp_SoLuongMuon_Result> slsmuon(string ngay)
        {
            var list = from n in db.sp_SoLuongMuon(ngay)
                        select n;
            return list.ToList();
        }
        public IEnumerable<sp_SoLuongTra_Result> sltra(string ngay)
        {
            var list1 = from n in db.sp_SoLuongTra(ngay)
                         select n;
            return list1.ToList();
        }
        public List<sp_SoLuongDauSach_Result> thongke(string ngay)
        {
            List<sp_SoLuongDauSach_Result> slds = new List<sp_SoLuongDauSach_Result>();
            slds = sldausach();
            List<sp_SoLuongMuon_Result> slmuon1 = new List<sp_SoLuongMuon_Result>();
            slmuon1 = slsmuon(ngay);
            IEnumerable<sp_SoLuongTra_Result> sltra1 = new List<sp_SoLuongTra_Result>();
            sltra1 = sltra(ngay);
            for (var i = 0; i < slmuon1.Count; i++)
            {
                if (slmuon1[i].ID_DauSach == slds[i].ID)
                {
                    slds[i].Soluong = slds[i].Soluong - slmuon1[i].SoLuong;
                }
            }
            for (var i = 0; i < sltra1.Count(); i++)
            {
                if (sltra1.ElementAt(i).ID_DauSach == slds[i].ID)
                {
                    slds[i].Soluong = slds[i].Soluong + sltra1.ElementAt(i).SoLuong;
                }
            }
            return slds;
        }
    }
}
