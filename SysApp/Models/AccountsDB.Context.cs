﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SysApp.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class AccountsDBEntities : DbContext
    {
        public AccountsDBEntities()
            : base("name=AccountsDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tbl_account> tbl_account { get; set; }
        public virtual DbSet<tbl_permissions> tbl_permissions { get; set; }
        public virtual DbSet<tbl_roles> tbl_roles { get; set; }
    }
}
