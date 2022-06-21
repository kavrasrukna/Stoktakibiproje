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
    public class UrunController : Controller
    {
        // GET: Urun
        StoktakibiEntities db = new StoktakibiEntities();
        public ActionResult Index(int sayfa = 1)
        {
            //var degerler = db.tblurunler.ToList();
            var degerler = db.tblurunler.ToList().ToPagedList(sayfa, 5); /*kategorilerin listesini pagedlist sayfalanmış liste formatında verdiriyoruz topagedlistteki ilkdeğer int pagenumber sayfalama işlemi kaçıncı sayfadan başlasın 1.  sayfadan dedik, 2. değer ise int pagesize her sayfada kaç adet öge olsun genelde 10 olur biz şimdilik 2 dedik bu. sonrasında kategori view içindeki index.cshtml in içindeki model listi PagedList.IpagedList olarak değiştir*/
            return View(degerler);
        }
        [HttpGet]
        public ActionResult YeniUrun()
        {
            List<SelectListItem> degerler = (from i in db.tblkategoriler.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = i.kategoriad,
                                                 Value = i.kategoriid.ToString()

                                             }).ToList();
            ViewBag.dgr = degerler;
            return View();
        }

        [HttpPost]
        public ActionResult YeniUrun(tblurunler p1)
        {
            var ktgr = db.tblkategoriler.Where(m => m.kategoriid == p1.tblkategoriler.kategoriid).FirstOrDefault(); //kategori id si yerine kategori adı geliyor. prosedür ile çektik.ürün satış eklerken ismini id olarak ekliyor
                p1.tblkategoriler = ktgr;

            db.tblurunler.Add(p1);
            db.SaveChanges();
            return RedirectToAction("Index");
            
        }

        public ActionResult SIL(int id) //index @Html.ActionLink içindeki 2.parametre gideceği yer SIL
        {
            var kategori = db.tblurunler.Find(id);
            db.tblurunler.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult UrunGetir(int id)
        {
            var ktgr = db.tblurunler.Find(id);
            return View("UrunGetir", ktgr);
        }
        public ActionResult Guncelle(tblurunler p1)//urungetir cshtml deki using beginform
        {
            var ktgr = db.tblurunler.Find(p1.urunid);
            ktgr.urunid = p1.urunid;
            ktgr.urunad = p1.urunad;
            ktgr.marka = p1.marka;
            ktgr.kategoriid = p1.kategoriid;
            ktgr.fiyat = p1.fiyat;
            ktgr.stok = p1.stok;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}