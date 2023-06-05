using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCaPhe.DTO
{
    public class Bill
    {
        private DateTime? datecheckOut;
        private DateTime? dateCheckIn;
        private int status;
        private int id;
        private int discount;
        public int Id { get => id; set => id = value; }
        public DateTime? DateCheckin { get => dateCheckIn; set => dateCheckIn = value; }
        public DateTime? DatecheckOut { get => datecheckOut; set => datecheckOut = value; }
        public int Status { get => status; set => status = value; }
        public int Discount { get => discount; set => discount = value; }

        public Bill (int id, DateTime? dateCheckIn, DateTime? datecheckOut,  int status , int discount=0)
        {
            this.datecheckOut = datecheckOut;
            this.dateCheckIn = dateCheckIn;
            this.status = status;
            this.id = id;
            this.discount = discount;
        }
        public Bill(DataRow row)
        {
            this.id = (int)row["id"];
            this.dateCheckIn = (DateTime?)row["DateCheckIn"];
            var dateCheckOutTemp = row["DateCheckOut"];
            if(dateCheckOutTemp.ToString() != "")
                this.datecheckOut = (DateTime?)dateCheckOutTemp;
            this.status = (int)row["status"];
            this.discount = (int)row["discount"];
        }
    }
}
