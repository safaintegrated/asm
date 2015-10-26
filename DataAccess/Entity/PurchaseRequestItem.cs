using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entity
{
    public class PurchaseRequestItem : EntityBase
    {
        public string Description { get; set; }
        
        public string UnitOfMeasurementId { get; set; }
        public string UnitOfMeasurementName { get; set; }
        public string CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string SubCategoryId { get; set; }
        public string SubCategoryName { get; set; }

        public string AssetTypeId { get; set; }
        public string AssetTypeName { get; set; }
        public string TaxCodeSagaId { get; set; }
        public string TaxCodeSagaName { get; set; }

        //Total
        public string Qty { get; set; }
        public string PricePerUnit { get; set; }
        public string TotalC { get; set; }
        public string TotalD { get; set; }
        public string TotalE { get; set; }
        public string SubTotal { get; set; }

    }
}
