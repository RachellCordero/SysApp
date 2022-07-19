using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SysApp.Models
{
    public class User
    {
        public int AccountID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Role { get; set; }
        public string UID { get; set; }
    }
}