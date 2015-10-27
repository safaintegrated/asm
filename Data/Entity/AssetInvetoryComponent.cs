using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class AssetInvetoryComponent : EntityBase
    {
        public string AssetInventoryId { get; set; }
        public string ParentType { get; set; }
        public string Desc { get; set; }
        public string TypeId { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public string UnitPrice { get; set; }
        public string WarrantyStart { get; set; }
        public string WarrantyEnd { get; set; }
        public string Status { get; set; }
        public string InstalledDate { get; set; }
        public string RemoveDate { get; set; }
        public string WriteOffDate { get; set; }
        public string Note { get; set; }
    }
}
