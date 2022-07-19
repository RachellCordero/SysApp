using SysApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SysApp.Repository
{
    public class AccountsRepository
    {
        string constr = ConfigurationManager.ConnectionStrings["AccountsDBEntities"].ConnectionString;
        public List<Account> GetAccounts() {
            DataTable dt = new DataTable();
            List<Account> AccountList = new List<Account>();
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand com = new SqlCommand("GetAccounts", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(com);
                con.Open();
                da.Fill(dt);
                con.Close();
            }
            //Bind AccountModel generic list using dataRow     
            foreach (DataRow dr in dt.Rows)
            {
                AccountList.Add(
                    new Account
                    {
                        AccountID = Convert.ToInt32(dr["AccountID"]),
                        FirstName = Convert.ToString(dr["FirstName"]),
                        LastName = Convert.ToString(dr["LastName"]),
                        Role = Convert.ToString(dr["Role"]),
                        UID = Convert.ToString(dr["UID"])
                    }
                );
            }
            return AccountList;
        }

        public List<Permission> GetPermissions() {
            DataTable dt = new DataTable();
            List<Permission> PermissionList = new List<Permission>();
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand com = new SqlCommand("GetPermission", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(com);
                con.Open();
                da.Fill(dt);
                con.Close();
            }
            //Bind AccountModel generic list using dataRow     
            foreach (DataRow dr in dt.Rows)
            {
                PermissionList.Add(
                    new Permission
                    {
                        PID = Convert.ToInt32(dr["PID"]),
                        UID = Convert.ToString(dr["UID"]),
                        Pname = Convert.ToString(dr["Pname"]),
                        Pdesc = Convert.ToString(dr["Pdesc"])
                    }
                );
            }
            return PermissionList;
        }

        public List<Role> GetRole()
        {
            DataTable dt = new DataTable();
            List<Role> RoleList = new List<Role>();
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand com = new SqlCommand("GetRole", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(com);
                con.Open();
                da.Fill(dt);
                con.Close();
            }
            //Bind AccountModel generic list using dataRow     
            foreach (DataRow dr in dt.Rows)
            {
                RoleList.Add(
                    new Role
                    {
                        RoleName = Convert.ToString(dr["RoleName"]).Trim(),
                        Permission= Convert.ToString(dr["Permission"])
                    }
                );
            }
            return RoleList;
        }

        public string AddPermission(string Permission, string Desc) {
            string Result = string.Empty;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand com = new SqlCommand("InsertPermission", con);
                    com.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    con.Open();
                    com.Parameters.AddWithValue("@Permission", Permission);
                    com.Parameters.AddWithValue("@Pdesc", Desc);
                    com.ExecuteNonQuery();
                    con.Close();
                    return "Success";
                }
            }
            catch (Exception ex)
            {
                return "Failed";
            }
        }
        public string DeletePermission(string UID)
        {
            string Result = string.Empty;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand com = new SqlCommand("DeletePermission", con);
                    com.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    con.Open();
                    com.Parameters.AddWithValue("@UID", UID);
                    com.ExecuteNonQuery();
                    con.Close();
                    return "Success";
                }
            }
            catch (Exception ex)
            {
                return "Failed";
            }
        }


        public string DeleteRole(string RoleName)
        {
            string Result = string.Empty;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand com = new SqlCommand("DeleteRole", con);
                    com.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    con.Open();
                    com.Parameters.AddWithValue("@RoleName", RoleName);
                    com.ExecuteNonQuery();
                    con.Close();
                    return "Success";
                }
            }
            catch (Exception ex)
            {
                return "Failed";
            }
        }

        public string DeleteUser(string AccountID)
        {
            string Result = string.Empty;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand com = new SqlCommand("DeleteUser", con);
                    com.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    con.Open();
                    com.Parameters.AddWithValue("@AccountID", AccountID);
                    com.ExecuteNonQuery();
                    con.Close();
                    return "Success";
                }
            }
            catch (Exception ex)
            {
                return "Failed";
            }
        }

        public string insertRole(string Rolename, string Permissions)
        {
            string Result = string.Empty;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand com = new SqlCommand("insertRole", con);
                    com.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    con.Open();
                    com.Parameters.AddWithValue("@Rolename", Rolename);
                    com.Parameters.AddWithValue("@Permissions", Permissions);
                    com.ExecuteNonQuery();
                    con.Close();
                    return "Success";
                }
            }
            catch (Exception ex)
            {
                return "Failed";
            }
        }
        public string UpdateUserRole(string AccountID, string Role)
        {
            string Result = string.Empty;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand com = new SqlCommand("UpdateUserRole", con);
                    com.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    con.Open();
                    com.Parameters.AddWithValue("@Role", Role);
                    com.Parameters.AddWithValue("@AccountID", AccountID);
                    com.ExecuteNonQuery();
                    con.Close();
                    return "Success";
                }
            }
            catch (Exception ex)
            {
                return "Failed";
            }
        }
        public string Login(string username, string password)
        {
            DataTable dt = new DataTable();
            List<Role> RoleList = new List<Role>();
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand com = new SqlCommand("SignIn", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(com);
                con.Open();
                com.Parameters.AddWithValue("@Username", username);
                com.Parameters.AddWithValue("@Password", password);
                da.Fill(dt);
                con.Close();
            }
            string Account_UID = string.Empty;
            foreach (DataRow dr in dt.Rows)
            {
                Account_UID = Convert.ToString(dr["UID"]).Trim();
            }
            return Account_UID;
        }
        public DataTable GetCurrentUser(string UID) {
            DataTable dt = new DataTable();
            try {
                List<Role> RoleList = new List<Role>();
                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand com = new SqlCommand("GetCurrentUser", con);
                    com.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    con.Open();
                    com.Parameters.AddWithValue("@UID", UID);
                    da.Fill(dt);
                    con.Close();
                }
            }
            catch (Exception ex) { }

            return dt;
        }
        public string proc_signup(string username, string password, string FirstName, string LastName, string Email) {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand com = new SqlCommand("proc_signup", con);
                    com.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    con.Open();
                    com.Parameters.AddWithValue("@username", username);
                    com.Parameters.AddWithValue("@password", password);
                    com.Parameters.AddWithValue("@FirstName", FirstName);
                    com.Parameters.AddWithValue("@LastName", LastName);
                    com.Parameters.AddWithValue("@Email", Email);
                    com.ExecuteNonQuery();
                    con.Close();
                    return "Success";
                }
            }
            catch (Exception ex)
            {
                return "Failed";
            }
        }
    }
}