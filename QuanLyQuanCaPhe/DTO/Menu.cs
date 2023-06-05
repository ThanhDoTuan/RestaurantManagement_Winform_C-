using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCaPhe.DTO
{
    public class Menu
    {
        private int count;
        private string foodName;
        private float price;
        private float totalPrice;

        public Menu(int count, string foodName, float price, float totalPrice =0)
        {
            this.count = count;
            this.foodName = foodName;
            this.price = price;
            this.TotalPrice = totalPrice;
        }
        public Menu(DataRow row)
        {
            this.count = (int)row["count"];
            this.foodName = row["name"].ToString();
            this.price = (float) Convert.ToDouble(row[ "price" ].ToString());
            this.TotalPrice = (float)Convert.ToDouble(row["totalprice"].ToString());
        }   

        public int Count { get => count; set => count = value; }
        public string FoodName { get => foodName; set => foodName = value; }
        public float Price { get => price; set => price = value; }
        public float TotalPrice { get => totalPrice; set => totalPrice = value; }
    }
}
