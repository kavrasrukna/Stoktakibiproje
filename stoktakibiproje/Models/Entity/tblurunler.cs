//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace stoktakibiproje.Models.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblurunler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblurunler()
        {
            this.tblsatislar = new HashSet<tblsatislar>();
        }
    
        public int urunid { get; set; }
        public string urunad { get; set; }
        public string marka { get; set; }
        public Nullable<int> kategoriid { get; set; }
        public Nullable<decimal> fiyat { get; set; }
        public Nullable<int> stok { get; set; }
    
        public virtual tblkategoriler tblkategoriler { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblsatislar> tblsatislar { get; set; }
    }
}
