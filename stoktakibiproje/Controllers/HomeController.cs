using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace stoktakibiproje.Controllers
{
    [AllowAnonymous]
    public class HomeController : Controller
    {
        // GET: Home
       /* [Authorize]*/ //anasayfaya yetkisiz bir kullanıcının erişememesi için authorize attribute(nitelik) ekliyoruz
        //sonrasında web. cobfig içinde <system.web> tagları arasına authentication ayarımızı ekliyoruz. Amaç yetkisiz bir kullanıcının
        //Kategori,Urun vb./Index sayfasına erişmek istemesi durumunda Login sayfasına yönlendirmek.
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult KullaniciGirisi()
        {
            return View();
        }
        public ActionResult anasayfa()
        {
            return View();
        }
    }
}

