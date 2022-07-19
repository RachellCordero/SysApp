using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SysApp.Models
{
    public class AccountsModel
    {
        public User CurrentUser { get; set; }
        public List<Account> Accounts_table { get; set; }
    }
}