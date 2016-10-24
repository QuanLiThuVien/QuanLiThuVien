using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp_MVC.Controllers
{
    public class MuonSachController : Controller
    {
        // GET: MuonSach
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult TimKiemDocGia( string ma, string ten)
        {
            return View("/Home/MuonSach");
        }
        [HttpPost]
        public ActionResult LuuPhieuMuon(FormCollection form)
        {
            return View();
        }
        public ActionResult timkiemsach(string ma, string ten)
        {
            return View(); 
        }

    }
}