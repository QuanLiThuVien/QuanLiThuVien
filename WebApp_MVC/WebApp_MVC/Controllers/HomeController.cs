using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp_MVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
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