using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entity
{
    public class AssetType : EntityBase
    {
        public string Code { get; set; }
        public string CategoryId { get; set; }
        public string CategoryCode { get; set; }
        public string SubCategoryId { get; set; }
        public string SubCategoryCode { get; set; }
        public string Description { get; set; }

    }
}
