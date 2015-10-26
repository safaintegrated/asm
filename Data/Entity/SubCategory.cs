using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class SubCategory : EntityBase
    {
        public string CategoryId { get; set; }
        public string CategoryCode { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string GlAsset { get; set; }
        public string GlInventory { get; set; }

        public string GlMaintenance { get; set; }
        public string GlSpareParts { get; set; }

    }
}
