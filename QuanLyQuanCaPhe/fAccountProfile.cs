using QuanLyQuanCaPhe.DAO;
using QuanLyQuanCaPhe.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyQuanCaPhe
{
    public partial class fAccountProfile : Form
    {
        private Account loginAccount;
        public Account LoginAccount
        {
            get => loginAccount;
            set
            { loginAccount = value; ChangeAccount(loginAccount); }
        }

        public fAccountProfile(Account acc)
        {
            InitializeComponent();
            LoginAccount= acc;
        }
        void ChangeAccount(Account acc)
        {
            txbUserName.Text = acc.UserName;
            txbDisplayName.Text = acc.DisplayName;

        }
        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void fAccountProfile_Load(object sender, EventArgs e)
        {

        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            updateAccount();
        }
        void updateAccount()
        {
            string displayName = txbUserName.Text;
            string password = txbPassWord.Text;
            string newpass =txbNewPass.Text;
            string reenterpass = txbReEnterPass.Text;
            string username = txbUserName.Text;
            if (!newpass.Equals(reenterpass))
            {
                MessageBox.Show("Vui lòng nhập lại mật khẩu đúng với mật khẩu mới");
            }
            else
            {
                if (AccountDAO.Instance.UpdateAccount(username, displayName, password, newpass))
                {
                    MessageBox.Show("Cập nhât thành công !", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Vui lòng điền đúng mật khẩu !", "Thông báo",MessageBoxButtons.OKCancel,MessageBoxIcon.Warning);
                }
            }
        }
    }
}
