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
        QuanLiThuVienEntities db = new  QuanLiThuVienEntities();
        public List<DocGia> dsdocgia()
        {
            return db.DocGias.ToList();
        }
       public List<sachinfo> dssach()
        {

            var listsach = (from n in db.Saches
                            select new sachinfo
                            {
                                Id = n.ID,
                                Ten = n.DauSach.Ten,
                                TrangThai = n.TinhTrang,
                                GhiChu = n.GhiChu
                            }).ToList();
            return listsach;
        }
       public List<sachinfo> timkiemdausach(string ten)
        {
            var listsachtimkiem = (from n in db.Saches
                                   where n.DauSach.Ten.Contains(ten)
                                   select new sachinfo
                                   {
                                       Id=n.ID,
                                       Ten=n.DauSach.Ten,
                                       TrangThai=n.TinhTrang,
                                       GhiChu=n.GhiChu

                                   }).ToList();
            return listsachtimkiem;
        }
       public List<DocGia> timkiemdocgia(string ten)
        {
            var query = from b in db.DocGias
                        where b.HoTen.Contains(ten)
                        select b;
            return query.ToList();
        }
        public IEnumerable<DauSach> sldausach(string ngay)
        {
            DateTime ngay1 = Convert.ToDateTime(ngay);

            var list = (from n in db.DauSaches
                        .Where(n => n.NgayNhap < ngay1)
                        select n);
            return list.ToList();
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
        public IEnumerable<DauSach> thongke(string ngay)
        {
            IEnumerable<DauSach> slds = new List<DauSach>();
            slds = sldausach(ngay);
            List<sp_SoLuongMuon_Result> slmuon1 = new List<sp_SoLuongMuon_Result>();
            slmuon1 = slsmuon(ngay);
            IEnumerable<sp_SoLuongTra_Result> sltra1 = new List<sp_SoLuongTra_Result>();
            sltra1 = sltra(ngay);
            if (slds.Count() != 0)
            {
                for (var i = 0; i < slmuon1.Count; i++)
                {
                    if (slmuon1[i].ID_DauSach == slds.ElementAt(i).ID)
                    {
                        slds.ElementAt(i).Soluong = slds.ElementAt(i).Soluong - slmuon1[i].SoLuong;
                    }
                }
                for (var i = 0; i < sltra1.Count(); i++)
                {
                    if (sltra1.ElementAt(i).ID_DauSach == slds.ElementAt(i).ID)
                    {
                        slds.ElementAt(i).Soluong = slds.ElementAt(i).Soluong + sltra1.ElementAt(i).SoLuong;
                    }
                }
                for (var i = 0; i < slds.Count(); i++)
                {
                    if (slds.ElementAt(i).Soluong < 0)
                    {
                        slds.ElementAt(i).Soluong = 0;
                    }
                }
            }

            return slds;
        }
        public List<DauSach> dsdausach()
        {
            var list = db.DauSaches.ToList();
            return list;
        }
        public IEnumerable<DauSach> timkiemthongke(string ngay, string tendausach)
        {
            var list = (from n in thongke(ngay)
                        where n.Ten.Contains(tendausach)
                        select n
                      ).ToList();
            return list;
        }
        public List<DauSach> tkdausach(string tendausach)
        {
            var list = (from n in db.DauSaches
                        where n.Ten.Contains(tendausach)
                        select n).ToList();
            return list;
        }
    }
}
