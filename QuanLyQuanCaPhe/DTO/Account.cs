using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCaPhe.DTO
{
    public class Account
    {
        private string userName;
        private string displayName;
        private string password;
        private int type;

        public Account(string userName, string displayName,int type,string password = null)
        {
            this.userName = userName;
            this.displayName = displayName;
            this.password = password;
            this.type = type;
        }
        public Account(DataRow row)
        {
            this.userName = row["userName"].ToString();
            this.displayName =  row["displayName"].ToString();
            this.password =  row["password"].ToString();
            this.type = (int) row["type"];
        }
        public string UserName { get => userName; set => userName = value; }
        public string DisplayName { get => displayName; set => displayName = value; }
        public string Password { get => password; set => password = value; }
        public int Type { get => type; set => type = value; }
    }
}
