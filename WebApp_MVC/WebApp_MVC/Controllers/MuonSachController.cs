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
        [HttpPost]
        public ActionResult LuuPhieuMuon(FormCollection form)
        {
            return View();
        }

    }
}