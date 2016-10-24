using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp_MVC.Controllers
{
    public class TraSachController : Controller
    {
        // GET: TraSach
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LuuPhieuTra(FormCollection form)
        {
            return View();
        }
        [HttpPost]
        public ActionResult Thongke(string ngaybatdau,string ngayketthuc)
        {
            return View();
        }
    }
}