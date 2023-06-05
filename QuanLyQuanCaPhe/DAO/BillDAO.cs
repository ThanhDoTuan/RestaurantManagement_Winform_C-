using QuanLyQuanCaPhe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCaPhe.DAO
{
    public class BillDAO
    {
        private static BillDAO instance;
        public static BillDAO Instance
        {
            get { if (instance == null) instance = new BillDAO(); return instance; }
            private set { instance = value; }
        }
        private BillDAO() { }
        public int GetUncheckBillByIdByTableId(int id)
        {
            DataTable data = DataProvider.Instance.ExecuteQuery("select * from bill where idTable = "+ id +" and status =0");
            if (data.Rows.Count > 0)
            {
                Bill bill = new Bill(data.Rows[0]);
                return bill.Id;

            }
            return -1;
        }


        public void CheckOut(int id,int discount, float totalPrice)
        {
            string query = "update bill set dateCheckOut = Getdate() , status=1, discount = " + discount+", totalprice = " +totalPrice + " where id= "+id;
            DataProvider.Instance.ExecuteNonQuery(query);       
        }
        public void InsertBill(int id)
        {
            DataProvider.Instance.ExecuteNonQuery("USP_InsertBill @idTable",new object[] {id});

        }
        public int GetMaxIdBill()
        {
            try
            {
                 return  (int)DataProvider.Instance.ExecuteScalar("select max(id) from bill");
            }
            catch
            {   
                return 1;
            }
        }
        public DataTable GetBillListByDate(DateTime checkIn,DateTime checkOut)
        {
          return  DataProvider.Instance.ExecuteQuery("usp_getlistbillbydate  @checkIn , @checkOut",new object[] {checkIn,checkOut});
        }

    }
}
