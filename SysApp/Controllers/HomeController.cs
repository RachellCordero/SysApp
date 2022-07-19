using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SysApp.Repository;
using Newtonsoft.Json;
using SysApp.Models;
using System.Data;

namespace SysApp.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public User getuser(string id) {
            AccountsRepository Accounts_List = new AccountsRepository();
            DataTable dt = new DataTable();
            dt = Accounts_List.GetCurrentUser(id);

            User user = new User();
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                user.AccountID = Convert.ToInt32(row["AccountID"]);
                user.FirstName = Convert.ToString(row["FirstName"]);
                user.LastName = Convert.ToString(row["LastName"]);
                user.Role = Convert.ToString(row["Role"]);
                user.UID = Convert.ToString(row["UID"]);
            }
            else
            {
                RedirectToAction("Login", "Home"); // return to login if account is not existing in the database
            }
            return user;
        }

        public ActionResult Accounts(string id)
        {
            if(id==null || id == "") return RedirectToAction("Login", "Home"); // return to log in if there is no id

            AccountsRepository Accounts_List = new AccountsRepository();
            List<Account> AccountsList = new List<Account>();
            AccountsList = Accounts_List.GetAccounts();

            User user = new User();
            user = getuser(id);

            if (user.AccountID == 0) return RedirectToAction("Login", "Home");

            AccountsModel account_model = new AccountsModel();

            account_model.CurrentUser= user;
            account_model.Accounts_table = AccountsList;


            return View(account_model);
        }
        public ActionResult SignUp() { 
            return View();
        }

        public ActionResult Permission(string id)
        {
            if (id == null || id=="") return RedirectToAction("Login", "Home"); // return to login if there is no id

            AccountsRepository Permissions_List = new AccountsRepository();
            PermissionModel Permission_Model = new PermissionModel();
            List<Permission> Permission = new List<Permission>();
            Permission = Permissions_List.GetPermissions();
            User user = new User();
            user = getuser(id);
            if (user.AccountID == 0) return RedirectToAction("Login", "Home");

            Permission_Model.CurrentUser= user;
            Permission_Model.PermissionList = Permission;

            return View(Permission_Model);
        }

        public ActionResult Role(string id)
        {
            if (id == null || id == "") return RedirectToAction("Login", "Home"); // return to login if there is no id

            AccountsRepository Role_Repo = new AccountsRepository();
            List<Role> Role_List = new List<Role> ();
            Role_List = Role_Repo.GetRole();

            User user = new User();
            user = getuser(id);
            if (user.AccountID == 0) return RedirectToAction("Login", "Home");

            RoleModel Role_Model = new RoleModel();
            Role_Model.RoleList = Role_List;
            Role_Model.CurrentUser = user;


            return View(Role_Model);
        }
        [HttpPost]
        public string UpdateUserRole(string AccountID, string Role)
        {
            AccountsRepository Role_cmd = new AccountsRepository();
            return Role_cmd.UpdateUserRole(AccountID, Role);
        }

        public string GetRole() {
            AccountsRepository Role_List = new AccountsRepository();
            return JsonConvert.SerializeObject(Role_List.GetRole());
        }
        [HttpPost]
        public string Login_account(string username, string password) {
            AccountsRepository Login_cmd = new AccountsRepository();
            return Login_cmd.Login(username,password);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [HttpPost]
        public string InsertPermission(string Pname, string Pdesc) {
            AccountsRepository Permission_cmd = new AccountsRepository();

            //var Detail = JsonConvert.DeserializeObject<InsertPermissionInput>(Json);

            string result = Permission_cmd.AddPermission(Pname, Pdesc);

            return result;
        }
        [HttpPost]
        public string DeletePermission(string UID)
        {
            AccountsRepository Permission_cmd = new AccountsRepository();

            //var Detail = JsonConvert.DeserializeObject<InsertPermissionInput>(Json);

            string result = Permission_cmd.DeletePermission(UID);

            return result;
        }

        [HttpPost]
        public string DeleteRole(string RoleName)
        {
            AccountsRepository Role_cmd = new AccountsRepository();

            //var Detail = JsonConvert.DeserializeObject<InsertPermissionInput>(Json);

            string result = Role_cmd.DeleteRole(RoleName);

            return result;
        }

        [HttpPost]
        public string DeleteUser(string AccountID)
        {
            AccountsRepository User_cmd = new AccountsRepository();

            //var Detail = JsonConvert.DeserializeObject<InsertPermissionInput>(Json);

            string result = User_cmd.DeleteUser(AccountID);

            return result;
        }
        public string GetPermission()
        {
            AccountsRepository Permissions_List = new AccountsRepository();
            return JsonConvert.SerializeObject(Permissions_List.GetPermissions());
        }

        public string CreateRole(string role, List<permission> permission) {
            try
            {
                foreach (permission item in permission)
                {
                    AccountsRepository Role_cmd = new AccountsRepository();
                    string result = Role_cmd.insertRole(role, item.item.ToString());
                }
                return "success";

            }
            catch (OutOfMemoryException )
            {
                return "Failed";
            }
        }
        [HttpPost]
        public string SignUp_cmd(string username, string password, string FirstName, string LastName, string Email) {
            AccountsRepository Account_Repo = new AccountsRepository();
            return Account_Repo.proc_signup(username, password, FirstName, LastName, Email);
        }
        public class permission
        {
            public string item { get; set; }
        }
    }
}