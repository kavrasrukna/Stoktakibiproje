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
    public class MusteriController : Controller
    {
        // GET: Musteri

        StoktakibiEntities db = new StoktakibiEntities();
        //List ile Arama işleminde pagedlist olmadan
        //public ActionResult Index(string p)
        //{
        //    var degerler = from d in db.tblmusteriler select d; /*değerleri tblmusterilerden çekip d ye at oradan okut*/
        //    if(!string.IsNullOrEmpty(p))
        //    {
        //        degerler = degerler.Where(m => m.musteriad.Contains(p));
        //    }
        //    return View(degerler.ToList()); /*geriye degerleri döndürür*/
        //    //var degerler = db.tblmusteriler.ToList();
        //    //return View(degerler); /*listeleme işlemi*/
        //}

        public ActionResult Index(int sayfa = 1)
        {
            //var degerler = db.tblmusteriler.ToList();
            var degerler = db.tblmusteriler.ToList().ToPagedList(sayfa, 5); /*müşterilerin listesini pagedlist sayfalanmış liste formatında verdiriyoruz topagedlistteki ilkdeğer int pagenumber sayfalama işlemi kaçıncı sayfadan başlasın 1.  sayfadan dedik, 2. değer ise int pagesize her sayfada kaç adet öge olsun genelde 10 olur biz şimdilik 2 dedik bu. sonrasında kategori view içindeki index.cshtml in içindeki model listi PagedList.IpagedList olarak değiştir*/          
            return View(degerler);
        }

        [HttpGet]
        public ActionResult YeniMusteri()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YeniMusteri(tblmusteriler p1)
        {
            db.tblmusteriler.Add(p1);
            db.SaveChanges();
            return View();
        }

        public ActionResult SIL(int id) //index @Html.ActionLink içindeki 2.parametre gideceği yer SIL
        {
            var kategori = db.tblmusteriler.Find(id);
            db.tblmusteriler.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult MusteriGetir(int id)
        {
            var ktgr = db.tblmusteriler.Find(id);
            return View("MusteriGetir", ktgr);
        }
        public ActionResult Guncelle(tblmusteriler p1)//musterigetir cshtml deki using beginform
        {
            var ktgr = db.tblmusteriler.Find(p1.musteriid);
            ktgr.musteriad = p1.musteriad;
            ktgr.musterisoyad = p1.musterisoyad;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}