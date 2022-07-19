using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SysApp.Models
{
    public class RoleModel
    {
        public User CurrentUser { get; set; }
        public List<Role> RoleList { get; set; }
    }
}