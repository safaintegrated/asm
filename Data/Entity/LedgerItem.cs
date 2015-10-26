using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class LedgerItem : EntityBase
    {
        public string PurchaseRequestId { get; set; }
        public string GlCode { get; set; }
        public string Description { get; set; }
        public string DrCr { get; set; }
        public int Jumlah { get; set; }

    }
}
