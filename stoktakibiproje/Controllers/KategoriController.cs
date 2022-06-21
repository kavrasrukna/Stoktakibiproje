using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using stoktakibiproje.Models.Entity;//ekledik
using PagedList;//ekledik pagging sayfalama işlemi için stoktakibiprojemin üzerine gelip manage naget packagesden pagedlist.mvc yi indirdik
using PagedList.Mvc;//ekledik
namespace stoktakibiproje.Controllers
{
   /* [Authorize]*/
    //kullanıcı giriş yapmadan bu sayfya erişemiyor bunu tek tek bütün controlerlara yazmak yerine global.asax a
    //GlobalFilters.Filters.Add(new AuthorizeAttribute()); ekledik
    public class KategoriController : Controller
       
    {
        // GET: Kategori
        StoktakibiEntities db = new StoktakibiEntities();
        public ActionResult Index(int sayfa=1)
        {
            //var degerler = db.tblkategoriler.ToList();
            var degerler = db.tblkategoriler.ToList().ToPagedList(sayfa, 5); /*kategorilerin listesini pagedlist sayfalanmış liste formatında verdiriyoruz topagedlistteki ilkdeğer int pagenumber sayfalama işlemi kaçıncı sayfadan başlasın 1.  sayfadan dedik, 2. değer ise int pagesize her sayfada kaç adet öge olsun genelde 10 olur biz şimdilik 2 dedik. sonrasında kategori view içindeki index.cshtml in içindeki modellisti PagedList.IpagedList olarak değiştir*/         
            return View(degerler);
        }
        [HttpGet]
        public ActionResult YeniKategori()
        {
            return View();
        }
        [HttpPost]
        public ActionResult YeniKategori(tblkategoriler p1)
        {
            db.tblkategoriler.Add(p1);
            db.SaveChanges();
            return View();
        }

        public ActionResult SIL(int id) //index @Html.ActionLink içindeki 2.parametre gideceği yer SIL
        {
            var kategori = db.tblkategoriler.Find(id);
            db.tblkategoriler.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult KategoriGetir(int id)
        {
            var ktgr = db.tblkategoriler.Find(id);
                return View("KategoriGetir", ktgr);
        }
        public ActionResult Guncelle(tblkategoriler p1)//kategorigetir cshtml deki using beginform
        {
            var ktgr = db.tblkategoriler.Find(p1.kategoriid);
            ktgr.kategoriad = p1.kategoriad;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}