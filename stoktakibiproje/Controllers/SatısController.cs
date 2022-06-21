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
    public class SatısController : Controller
    {
        // GET: Satıs
        StoktakibiEntities db = new StoktakibiEntities();
        public ActionResult Index(int sayfa = 1)
        {
            //var degerler = db.tblsatislar.ToList();
            var degerler = db.tblsatislar.ToList().ToPagedList(sayfa, 5); /*satısların listesini pagedlist sayfalanmış liste formatında verdiriyoruz topagedlistteki ilkdeğer int pagenumber sayfalama işlemi kaçıncı sayfadan başlasın 1.  sayfadan dedik, 2. değer ise int pagesize her sayfada kaç adet öge olsun genelde 10 olur biz şimdilik 5 dedik bu. sonrasında kategori view içindeki index.cshtml in içindeki model listi PagedList.IpagedList olarak değiştir*/           
            return View(degerler);
        }
        [HttpGet]
        public ActionResult YeniSatıs()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YeniSatıs(tblsatislar p1)
        {
            db.tblsatislar.Add(p1);
            db.SaveChanges();
            return View();
        }
        public ActionResult SIL(int id) //index @Html.ActionLink içindeki 2.parametre gideceği yer SIL
        {
            var kategori = db.tblsatislar.Find(id);
            db.tblsatislar.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult SatısGetir(int id)
        {
            var ktgr = db.tblsatislar.Find(id);
            return View("SatısGetir", ktgr);
        }
        public ActionResult Guncelle(tblsatislar p1)//satısgetir cshtml deki using beginform
        {
            var ktgr = db.tblsatislar.Find(p1.satisid);
            ktgr.urunid = p1.urunid;
            ktgr.musteriid = p1.musteriid;
            ktgr.adet = p1.adet;
            ktgr.fiyat = p1.fiyat;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}