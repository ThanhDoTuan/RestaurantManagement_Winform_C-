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
    public partial class fTableManager : Form
    {
        private Account loginAccount;
        public Account LoginAccount { get => loginAccount;
            set
            { loginAccount= value;ChangeAccount(loginAccount.Type);}  
        }

        public fTableManager(Account acc)
        {
            InitializeComponent();

            this.LoginAccount = acc;
            LoadTable();
            LoadCategory();
        }
            
        void ChangeAccount(int type)
        {
            adminToolStripMenuItem.Enabled = type == 1 ;
            thôngTinToolStripMenuItem.Text += " (" + loginAccount.DisplayName +")";
        }
        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void thôngTinCáNhânToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fAccountProfile f = new fAccountProfile(loginAccount);
            f.ShowDialog();
        }

        private void adminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fAdmin f = new fAdmin();
            f.loginAccount= loginAccount;
            f.ShowDialog();
        }

        private void flpTable_Paint(object sender, PaintEventArgs e)
        {

        }
        void LoadCategory()
        {
            List<Category> list = CategoryDAO.Instance.getListCategory();
            cbCategory.DataSource= list;
            cbCategory.DisplayMember= "Name";

        }
        void LoadFoodByCategoryId(int id)
        {
            List<Food> listFood = FoodDAO.Instance.getListFoodByCategoryID(id);
            cbFood.DataSource= listFood;
            cbFood.DisplayMember= "name";

        }
        void LoadTable()
        {
                flpTable.Controls.Clear();
            List<Table> tableList = TableDAO.Instance.LoadTableList(); 
            foreach(Table item in tableList)
            {
                Button btn = new Button()
                {
                    Width = TableDAO.TableWidth,
                    Height = TableDAO.TableHeight
                };
                btn.Text = item.name+ Environment.NewLine + item.status;
                btn.Click += Btn_Click;
                btn.Tag= item;
                switch (item.status)
                {
                    case "Trống":
                        btn.BackColor= Color.Aqua;
                        break;
                    default: btn.BackColor= Color.LightPink; break;
                }
                flpTable.Controls.Add(btn); 
            }
        }

        private void Btn_Click(object sender, EventArgs e)
        {
            int tableID = ((sender as Button).Tag as Table).iD;
            lsvBill.Tag = (sender as Button).Tag;
            ShowBill(tableID);
        }
        void ShowBill(int id)
        {
                lsvBill.Items.Clear();
            List<QuanLyQuanCaPhe.DTO.Menu> listBillInfo = MenuDAO.Instance.GetListMenuByTable(id);
            float totalPrice = 0;
            foreach(QuanLyQuanCaPhe.DTO.Menu item in listBillInfo)
            {
                ListViewItem lsvItem = new ListViewItem(item.FoodName.ToString());
                lsvItem.SubItems.Add(item.Count.ToString());
                lsvItem.SubItems.Add(item.Price.ToString());
                lsvItem.SubItems.Add(item.TotalPrice.ToString());
                totalPrice+= item.TotalPrice;
                lsvBill.Items.Add(lsvItem);
            }
            txbTotalPrice.Text = totalPrice.ToString();

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void cbCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = 0;
            ComboBox cb = sender as ComboBox;
            if (cb.SelectedItem == null)
            {
                return;
            } 
            Category selected =  cb.SelectedItem as Category;
            id = selected.Id;
            LoadFoodByCategoryId(id);
        }

        private void btnAddFood_Click(object sender, EventArgs e)
        {
            Table table = lsvBill.Tag as Table;
            int idBill = BillDAO.Instance.GetUncheckBillByIdByTableId(table.iD);
            int foodID = (cbFood.SelectedItem as Food).Id;
            int count = (int)nmFoodCount.Value;
            if(idBill == -1)
            {
                BillDAO.Instance.InsertBill(table.iD);
                BillInfoDAO.Instance.InsertBillInfo(BillDAO.Instance.GetMaxIdBill(),foodID,count);
            }
            else
            {

                BillInfoDAO.Instance.InsertBillInfo(idBill, foodID, count);
            }
            ShowBill(table.iD);
            LoadTable();
        }

        private void btnCheckOut_Click(object sender, EventArgs e)
        {
            Table table = lsvBill.Tag as Table;
                int idBill = BillDAO.Instance.GetUncheckBillByIdByTableId(table.iD);
            int discount = (int)nmDiscount.Value;
            double totalPrice = Convert.ToDouble(txbTotalPrice.Text);
            double finalTotalPrice = totalPrice - totalPrice * discount/100;
            if(idBill != -1)
            {
                if(MessageBox.Show(string.Format("Bạn có chắc muốn thanh toán hóa đơn cho bàn {0}\n Tổng tiền -(Tổng tiền /100) x Giảm giá = {1} - {1} / 100 x {2} = {3} ",table.name,totalPrice,discount,finalTotalPrice),"Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    BillDAO.Instance.CheckOut(idBill,discount,(float)finalTotalPrice);
                    ShowBill(table.iD);
                    LoadTable();
                }
            }
           
        }

        private void fTableManager_Load(object sender, EventArgs e)
        {

        }

        private void thanhToánToolStripMenuItem_Click(object sender, EventArgs e)
        {
            btnCheckOut_Click(this, new EventArgs());
        }

        private void thêmMónToolStripMenuItem_Click(object sender, EventArgs e)
        {
            btnAddFood_Click(this, new EventArgs());

        }
    }
}
