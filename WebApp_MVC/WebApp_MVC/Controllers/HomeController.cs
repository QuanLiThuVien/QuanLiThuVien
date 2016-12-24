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
        QuanLiThuVienEntities db1 = new QuanLiThuVienEntities();
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult thongtindocgia()
        {
            var list2 = (from n in db1.DocGias
                         select new docgiainfo
                         {
                             ID = n.ID,
                             Hoten = n.HoTen,
                             ngayhethan = (n.NgayHetHan).ToString(),
                             slgioihan = n.SLuongGioiHan,
                             ngaygioihan=n.NgayGioiHan

                         }).ToList();
            return new JsonResult { Data = list2, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
        public JsonResult thongtindocgia1()
        {
            var list2 = db1.sp_thongtindocgia().Where(n=>n.TinhTrang.Contains("Chưa trả")).ToList();
            return new JsonResult { Data = list2, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }
        public ActionResult MuonSach()
        {
            ViewBag.thongtinsach = (from d in db1.DauSaches
                              join s in db1.Saches on d.ID equals s.ID_DauSach
                              where d.ID == s.ID_DauSach && s.TinhTrang=="Khả Dụng"
                              select new Sachinfo
                              {
                                  ten=d.Ten,
                                  id=s.ID,
                                 Id_dausach=d.ID}).ToList();
            var phieumuon = db1.PhieuMuons.ToList(); 
            return View(phieumuon);
        }
        [HttpPost]
        public ActionResult MuonSach(FormCollection form)
        {
           // try
           // {
                var idphieumuon = db1.PhieuMuons.OrderByDescending(i => i.ID).Select(i => i.ID).FirstOrDefault();
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
            PhieuMuon pm = new PhieuMuon();
            pm.ID_DocGia = iddocgia;
            pm.NgayMuon = Convert.ToDateTime(angaymuon[0]);
            pm.NgayGHTra = Convert.ToDateTime(angaytra[0]);
            db1.PhieuMuons.Add(pm);
            db1.SaveChanges();
                // tạo đối tượng chi tiết phiếu mượn và insert vào database
                for (var i = 0; i < aiddausach.Length; i++)
                {
                    var chitietphieumuon = new ChiTietPhieuMuon();
                    chitietphieumuon.ID_PhieuMuon = idphieumuon;
                    chitietphieumuon.ID_DauSach = Convert.ToInt64(aiddausach[i]);
                    chitietphieumuon.ID_Sach = Convert.ToInt64(aidsach[i]);
                    chitietphieumuon.SoLuong = soluong;
                    chitietphieumuon.TinhTrang = tinhtrang;
                    db1.ChiTietPhieuMuons.Add(chitietphieumuon);
                    db1.SaveChanges();
                }
                for (var i = 0; i < aidsach.Length; i++)
                {
                    long myId = Convert.ToInt32(aidsach[i]);
                    var query = from b in db1.Saches
                                where b.ID == myId
                                select b;
                    Sach a = query.FirstOrDefault();
                    a.TinhTrang = "Đã Mượn";
                    db1.SaveChanges();
                }
                ModelState.AddModelError("", "Mượn sách thành công");

            // return RedirectToAction("MuonSach");

            //}
            //catch(Exception)
            //{

            //    ModelState.AddModelError("", "Lỗi");

            //}
            ViewBag.thongtinsach = (from d in db1.DauSaches
                                    join s in db1.Saches on d.ID equals s.ID_DauSach
                                    where d.ID == s.ID_DauSach && s.TinhTrang == "Khả Dụng"
                                    select new Sachinfo
                                    {
                                        ten = d.Ten,
                                        id = s.ID,
                                        Id_dausach = d.ID
                                    }).ToList();
            var phieumuon = db1.PhieuMuons.ToList();
            return View("MuonSach",phieumuon);
        }
        public ActionResult TraSach()
        {
            ViewBag.thongtinsach = (from d in db1.DauSaches
                         join s in db1.Saches on d.ID equals s.ID_DauSach
                         where d.ID == s.ID_DauSach && s.TinhTrang=="Đã Mượn"
                         select new Sachinfo
                         {
                             ten = d.Ten,
                             id = s.ID,
                             Id_dausach=d.ID
                         }).ToList();
            var model=db1.PhieuTras.ToList();
            return View(model);
        }
        [HttpPost]
        public ActionResult TraSach(FormCollection form)
        {
            //try
          //  {
                var idphieutra = db1.PhieuTras.OrderByDescending(i => i.ID).Select(i => i.ID).FirstOrDefault();
                //idphieutra = idphieutra + 1;
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
            PhieuTra pt = new PhieuTra();
            pt.ID_DocGia = iddocgia;
            pt.NgayTra = Convert.ToDateTime(angaytra[0]);
            db1.PhieuTras.Add(pt);
                db1.SaveChanges();
                // tạo đối tượng chi tiết phiếu mượn và insert vào database
                for (var i = 0; i < aiddausach.Length; i++)
                {
                    var chitietphieutra = new ChiTietPhieuTra();
                    chitietphieutra.ID_PhieuTra = idphieutra;
                    chitietphieutra.ID_Sach = Convert.ToInt64(aidsach[i]);
                    chitietphieutra.ID_DauSach = Convert.ToInt64(aiddausach[i]);
                    chitietphieutra.SoLuong = 1;
                    db1.ChiTietPhieuTras.Add(chitietphieutra);
                    db1.SaveChanges();
                }
                for (var i = 0; i < aidsach.Length; i++)
                {
                    long myId = Convert.ToInt32(aidsach[i]);
                    var query = from b in db1.Saches
                                where b.ID == myId
                                select b;
                    Sach a = query.FirstOrDefault();
                    a.TinhTrang = "Khả Dụng";
                    db1.SaveChanges();
                }
                for (var i = 0; i < aidsach.Length; i++)
                {
                    long myId = Convert.ToInt32(aidsach[i]);
                    var query = from b in db1.ChiTietPhieuMuons
                                where b.ID_Sach == myId
                                select b;
                    ChiTietPhieuMuon a = query.FirstOrDefault();
                    a.TinhTrang = "Đã Trả";
                    db1.SaveChanges();
                }
                ModelState.AddModelError("", "Trả sách thành công");
            //  }
            //catch (Exception)
            //{
            //    var model = (from d in db1.DauSaches
            //                 join s in db1.Saches on d.ID equals s.ID_DauSach
            //                 where d.ID == s.ID_DauSach && s.TinhTrang == "Đã Mượn"
            //                 select new Sachinfo
            //                 {
            //                     ten = d.Ten,
            //                     id = s.ID,
            //                     Id_dausach = d.ID
            //                 }).ToList();
            ViewBag.thongtinsach = (from d in db1.DauSaches
                                    join s in db1.Saches on d.ID equals s.ID_DauSach
                                    where d.ID == s.ID_DauSach && s.TinhTrang == "Đã Mượn"
                                    select new Sachinfo
                                    {
                                        ten = d.Ten,
                                        id = s.ID,
                                        Id_dausach = d.ID
                                    }).ToList();
            var model = db1.PhieuTras.ToList();
            return View("TraSach",model);

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
            var ketqua = (from n in db1.sp_DanhSachSachMuon(ngaybatdau1, ngaykethuc1)
                          .OrderBy(n => n.ID)
                          select n).ToList();
            ViewBag.NgayBatDau = ngaybatdau2;
            ViewBag.NgayKetThuc = ngaykethuc2;
            return View("ThongKe",ketqua);
        }
        public ActionResult chitietphieumuon(int id)
        {
            var model = (from n in db1.ChiTietPhieuMuons
                         where n.ID_PhieuMuon == id
                         select n).ToList();
            return View(model);
        }
        public ActionResult chitietphieutra(int id)
        {
            var model = (from n in db1.ChiTietPhieuTras
                         where n.ID_PhieuTra == id
                         select n).ToList();
            return View(model);
        }



    }
}