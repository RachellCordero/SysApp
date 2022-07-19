using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SysApp.Models
{
    public class PermissionModel
    {
        public User CurrentUser { get; set; }
        public List<Permission> PermissionList { get; set; }
    }
}