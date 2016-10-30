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
        public JsonResult thongtinsach()
        {
           var list1 = db.sp_thongtinsach().ToList();
            return new JsonResult { Data = list1, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
        public JsonResult thongtindocgia()
        {
           var list2 = db.sp_thongtindocgia().ToList();
            return new JsonResult { Data = list2, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public ActionResult MuonSach()
        {
            return View();
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