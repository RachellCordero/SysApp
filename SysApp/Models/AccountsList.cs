using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SysApp.Models
{
    public class AccountsList
    {
        public IEnumerable<List<Account>> accountsList { get; set; }
    }
}