﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class StoktakibiEntities : DbContext
    {
        public StoktakibiEntities()
            : base("name=StoktakibiEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<tblkategoriler> tblkategoriler { get; set; }
        public virtual DbSet<tblmusteriler> tblmusteriler { get; set; }
        public virtual DbSet<tblsatislar> tblsatislar { get; set; }
        public virtual DbSet<tblurunler> tblurunler { get; set; }
        public virtual DbSet<tblkullanici> tblkullanicis { get; set; }
    }
}
