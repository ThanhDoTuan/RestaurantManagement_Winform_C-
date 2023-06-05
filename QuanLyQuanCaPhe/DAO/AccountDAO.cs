using QuanLyQuanCaPhe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCaPhe.DAO
{
    public class AccountDAO
    {
        private static AccountDAO instance;
        public static AccountDAO Instance
        {
            get { if(instance == null) instance = new AccountDAO(); return instance;}
            private set { instance = value; }
        }
        private AccountDAO() { }
       public bool Login(string username, string password) {
            string query = "USP_Login @username , @password";
            DataTable result = DataProvider.Instance.ExecuteQuery(query, new object[] {username,password});        
            return result.Rows.Count > 0;
                }
        public Account GetAccountByUsername(string username)
        {
            string query = "select *from account where username = '" + username + "'";
          DataTable data=  DataProvider.Instance.ExecuteQuery(query);
            foreach(DataRow item in data.Rows)
            {
                return new Account(item);
            }
            return null;
        }
        public bool UpdateAccount(string userName, string displayName,string pass, string newpass)
        {
           int result = DataProvider.Instance.ExecuteNonQuery("usp_UpdateAccount @username , @displayname , @password , @newpassword ", new object[] {userName,displayName,pass,newpass});
            return result > 0;  
        }

        public DataTable GetListAccount()
        {
            return DataProvider.Instance.ExecuteQuery("Select UserName, DisplayName, Type from Account");
        }

        public bool InsertAccount(string name, string displayName, int type)
        {
            string query = string.Format("Insert dbo.Account (UserName, DisplayName,Type) VALUES (N'{0}',N'{1}',{2})", name, displayName, type);
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool EditAccount(string name, string displayName, int type)
        {
            string query = string.Format("Update dbo.Account SET DisplayName = N'{1}', Type = {2} where UserName = N'{0}'", name, displayName, type);
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool DeleteAccount(string name)
        {

            string query = string.Format("Delete dbo.Account where UserName =  N'{0}'", name);
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool ResetPassword(string name)
        {
            string query = string.Format("Update dbo.Account SET Password = N'0' where UserName =  N'{0}'", name);
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }
    }
}
