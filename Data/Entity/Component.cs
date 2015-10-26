using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class Component : EntityBase
    {
        public string PurchaseRequestItemId { get; set; }
        public string Description { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public int Quantity { get; set; }
        public int PricePerUnit { get; set; }
    }


}
