using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;//ekle
using System.Web.Routing;//ekle

namespace stoktakibiproje
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            GlobalFilters.Filters.Add(new AuthorizeAttribute());//kategori müşteri vb tüm controllerlara authorization eklemeye gerek kalmadan tüm sayfalara erişmeyi engelledi. erişime izin vermek istediğim yere securitycontrollera [AllowAnonymous] ekledim  
            AreaRegistration.RegisterAllAreas();         
            RouteConfig.RegisterRoutes(RouteTable.Routes);
          
        }
        
    
    }
}
