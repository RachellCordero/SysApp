//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class tbl_roles
    {
        public int RID { get; set; }
        public string RoleName { get; set; }
        public Nullable<int> Permissions { get; set; }
        public Nullable<System.Guid> UID { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string CreatedBy { get; set; }
    }
}
