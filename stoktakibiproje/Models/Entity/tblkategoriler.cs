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
    
    public partial class tblkategoriler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblkategoriler()
        {
            this.tblurunler = new HashSet<tblurunler>();
        }
    
        public int kategoriid { get; set; }
        public string kategoriad { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblurunler> tblurunler { get; set; }
    }
}
