using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCaPhe.DTO
{
    public class BillInfo
    {
        
        private int count;
        private int foodID;
        private int billID;
        private int iD;

        public int ID { get => iD; set => iD = value; }
        public int BillID { get => billID; set => billID = value; }
        public int FoodID { get => foodID; set => foodID = value; }
        public int Count { get => count; set => count = value; }

        public BillInfo(int count, int foodID, int billID, int iD)
        {
            this.count = count;
            this.foodID = foodID;
            this.billID = billID;
            this.iD = iD;
        }
        public BillInfo(DataRow row) {
            this.count = (int)row["count"];
            this.foodID =(int)row["idFood"];
            this.billID = (int)row["idBill"];
            this.iD = (int)row["id"];
        }
    }
}
