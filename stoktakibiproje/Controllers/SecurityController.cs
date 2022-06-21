using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using stoktakibiproje.Models.Entity;
using System.Web.Security;//ekledim
namespace stoktakibiproje.Controllers
{
    //web config de <system.web> içinde authentication attribute u ekledim. Forms login url : giriş yapılmadığında yönlendirilecek yer
    //<authentication mode = "Forms" >
    //      < forms loginUrl="/Security/Login">
    //</forms>
    
    public class SecurityController : Controller
    {
        // GET: Security
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }
        StoktakibiEntities baglanti = new StoktakibiEntities();

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(tblkullanici kullanici)
        {
            var login = baglanti.tblkullanicis.FirstOrDefault(x => x.kullaniciadi == kullanici.kullaniciadi && x.sifre==kullanici.sifre);

            if (login!=null)
            {
                FormsAuthentication.SetAuthCookie(kullanici.kullaniciadi, false);//login.kullaniciadi,false bu şekilde de yazılabilir
                //sisteme kullanıcıyı tanıttık ve kullanıcının adını tutuyor.
                return RedirectToAction("Index", "Kategori");
            }
            else { 
                ViewBag.uyari = "Kullanıcı adı ya da şifre yanlış";
                return View();
            }
        }
        //[AllowAnonymous] buraya uygulamaya gerek yok çünkü kullanıcı login olmuş zaten çıkış yapmaya çalışıyor.
        public ActionResult Logout()
        {         
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");

        }
    }
}