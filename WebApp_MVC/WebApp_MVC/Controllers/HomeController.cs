using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApp_MVC.Models;
using Model4;
namespace WebApp_MVC.Controllers
{
    public class HomeController : Controller
    {
        QuanLiThuVienEntities db = new QuanLiThuVienEntities();
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
                              where d.ID == s.ID_DauSach
                              select new Sachinfo
                              {
                                  ten=d.Ten,
                                  id=s.ID }).ToList();
            return View( model);
        }
        public ActionResult TraSach()
        {

            return View();
        }
        public ActionResult ThongKe()
        {
            return View();
        }
    }
}