using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApp_MVC.Models;
using Model4;
using PagedList;
using PagedList.Mvc;

namespace WebApp_MVC.Controllers
{
    public class HomeController : Controller
    {
        QuanLiThuVienEntities2 db = new QuanLiThuVienEntities2();
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult thongtindocgia()
        {
           var list2 = db.sp_thongtindocgia().ToList();
           return new JsonResult { Data = list2, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
        public ActionResult MuonSach()
        {
            var model = (from d in db.DauSaches
                              join s in db.Saches on d.ID equals s.ID_DauSach
                              where d.ID == s.ID_DauSach && s.TinhTrang=="Khả Dụng"
                              select new Sachinfo
                              {
                                  ten=d.Ten,
                                  id=s.ID,
                                 Id_dausach=d.ID}).ToList();        
            return View( model);
        }
        [HttpPost]
        public ActionResult NhapPhieuMuon(FormCollection form)
        {
            
                var idphieumuon = db.PhieuMuons.OrderByDescending(i => i.ID).Select(i => i.ID).FirstOrDefault();
                idphieumuon = idphieumuon + 1;
                // nhận dữ liệu từ form
                var iddocgia = Request.Form["madocgia"];
                var idsach = Request.Form["ma"];
                string[] aidsach = idsach.Split(new Char[] { ',' });
                var iddausach = Request.Form["iddausach"];
                string[] aiddausach = iddausach.Split(new Char[] { ',' });
                var tensach = Request.Form["ten"];
                string tinhtrang = "Chưa trả";
                int soluong = 1;
                var ngaymuon = Request.Form["ngaymuon"];
                string[] angaymuon = ngaymuon.Split(new Char[] { ',' });
                var ngaytra = Request.Form["ngaytra"];
                string[] angaytra = ngaytra.Split(new Char[] { ',' });
                // tạo đối tượng insert vào database
                // tạo đối tượng phiếu mượn và insert vào database
                db.NhapPhieuMuon(iddocgia, angaymuon[0], angaytra[0]);
                db.SaveChanges();
                // tạo đối tượng chi tiết phiếu mượn và insert vào database
                for (var i = 0; i < aiddausach.Length; i++)
                {
                    var chitietphieumuon = new ChiTietPhieuMuon();
                    chitietphieumuon.ID_PhieuMuon = idphieumuon;
                    chitietphieumuon.ID_DauSach = Convert.ToInt64(aiddausach[i]);
                    chitietphieumuon.ID_Sach = Convert.ToInt64(aidsach[i]);
                    chitietphieumuon.SoLuong = soluong;
                    chitietphieumuon.TinhTrang = tinhtrang;
                    db.ChiTietPhieuMuons.Add(chitietphieumuon);
                    db.SaveChanges();
                }
                for(var i=0;i<aidsach.Length;i++)
                {
                    long myId = Convert.ToInt32(aidsach[i]);
                    var query = from b in db.Saches
                                where b.ID == myId
                                select b;
                    Sach a = query.FirstOrDefault();
                    a.TinhTrang = "Đã Mượn";
                    db.SaveChanges();
            }
            ViewBag.Thongbao = "Thêm phiếu mượn thành công";
            return RedirectToAction("MuonSach");
        }
        public ActionResult TraSach()
        {
            var model = (from d in db.DauSaches
                         join s in db.Saches on d.ID equals s.ID_DauSach
                         where d.ID == s.ID_DauSach && s.TinhTrang=="Đã Mượn"
                         select new Sachinfo
                         {
                             ten = d.Ten,
                             id = s.ID,
                             Id_dausach=d.ID
                         }).ToList();
            return View(model);
        }
        [HttpPost]
        public ActionResult NhapPhieuTra()
        {
            var idphieutra = db.PhieuTras.OrderByDescending(i => i.ID).Select(i => i.ID).FirstOrDefault();
            idphieutra = idphieutra + 1;
            // nhận dữ liệu từ form
            var iddocgia = Request.Form["madocgia"];
            var idsach = Request.Form["ma"];
            string[] aidsach = idsach.Split(new Char[] { ',' });
            var iddausach = Request.Form["iddausach"];
            string[] aiddausach = iddausach.Split(new Char[] { ',' });
            var tensach = Request.Form["ten"];
            var ngaytra = Request.Form["ngaytra"];
            string[] angaytra = ngaytra.Split(new Char[] { ',' });
            // tạo đối tượng insert vào database
            // tạo đối tượng phiếu trả và insert vào database
            db.NhapPhieuTra(iddocgia,angaytra[0]);
            db.SaveChanges();
            // tạo đối tượng chi tiết phiếu mượn và insert vào database
            for (var i = 0; i < aiddausach.Length; i++)
            {
                var chitietphieutra = new ChiTietPhieuTra();
                chitietphieutra.ID_PhieuTra = idphieutra;
                chitietphieutra.ID_Sach = Convert.ToInt64(aidsach[i]);
                chitietphieutra.ID_DauSach = Convert.ToInt64(aiddausach[i]);
                chitietphieutra.SoLuong = 1;
                db.ChiTietPhieuTras.Add(chitietphieutra);
                db.SaveChanges();
            }
            for (var i = 0; i < aidsach.Length; i++)
            {
                long myId = Convert.ToInt32(aidsach[i]);
                var query = from b in db.Saches
                            where b.ID == myId
                            select b;
                Sach a = query.FirstOrDefault();
                a.TinhTrang = "Khả Dụng";
                db.SaveChanges();
            }
            for (var i = 0; i < aidsach.Length; i++)
            {
                long myId = Convert.ToInt32(aidsach[i]);
                var query = from b in db.ChiTietPhieuMuons
                            where b.ID_Sach == myId
                            select b;
                ChiTietPhieuMuon a = query.FirstOrDefault();
                a.TinhTrang = "Đã Trả";
                db.SaveChanges();
            }
            return RedirectToAction("TraSach");
        }
        public ActionResult ThongKe()
        {
            return View();
        }
        [HttpPost]
        public ActionResult NhapThongKe(FormCollection form)
        {
            string ngaybatdau1 = Request.Form["ngaybatdau"];
            string ngaykethuc1 = Request.Form["ngaykethuc"];
            string[] angaybatdau = ngaybatdau1.Split(new Char[] { '-' });
            string[] angaykethuc = ngaykethuc1.Split(new Char[] { '-' });
            string ngaybatdau = angaybatdau[1] +"/"+angaybatdau[2]+"/" + angaybatdau[0];
            string ngaykethuc= angaykethuc[1] + "/" +angaykethuc[2] + "/" + angaykethuc[0];
            string ngaybatdau2 = angaybatdau[2] + "/" + angaybatdau[1] + "/" + angaybatdau[0];
            string ngaykethuc2  = angaykethuc[2] + "/" + angaykethuc[1] + "/" + angaykethuc[0];
            var ketqua = db.sp_DanhSachSachMuon(ngaybatdau, ngaykethuc);
            ViewBag.NgayBatDau = ngaybatdau2;
            ViewBag.NgayKetThuc = ngaykethuc2;
            return View("ThongKe",ketqua);
        }
    }
}