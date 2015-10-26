using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class StockRegistration
    {
        public int Id { get; set; }
        public int PtjId { get; set; }
        public int StoreId { get; set; }
        public int LocationId { get; set; }
        public int StockId { get; set; }
        public string NoPkBppsBtb { get; set; }
        public int CurrentBalance { get; set; }
        public int ParasMenokok { get; set; }
        public int TransactionType { get; set; }
        public string TransInFrom { get; set; }
        public int TransInQuantityRequest { get; set; }
        public int TransInQuantity { get; set; }
        public int TransInUnitPrice { get; set; }

        public string TransOutTo { get; set; }
        public int TransOutQuantityRequest { get; set; }
        public int TransOutUnitPrice { get; set; }
        public int TransOutQuantity { get; set; }
        public DateTime DateTime { get; set; }
        public int TotalIn { get; set; }
        public int TotalOut { get; set; }
        public int TotalBalance { get; set; }

        public string StockCode { get; set; }

        public string StockName { get; set; }

    }


}
