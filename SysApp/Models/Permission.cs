using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SysApp.Models
{
    public class Permission
    {
        public int PID { get; set; }
        public string UID { get; set; }
        public string Pname { get; set; }
        public string Pdesc { get; set; }
    }
}