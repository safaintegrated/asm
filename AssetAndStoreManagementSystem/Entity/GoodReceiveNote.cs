using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entity
{
    public class GoodReceiveNote : EntityBase
    {
        //Maklumat Pembekal
        public string PurchaseOrderId { get; set; }
        public string PurchaseOrderNumber { get; set; }
        public string SupplierId { get; set; }
        public string SupplierName { get; set; }
        public DateTime ReceiveDate { get; set; }

        //Maklumat Penghantaran
        public string PackingDetail { get; set; }
        public string DeliveryDetail { get; set; }
        public string TransportationDetail { get; set; }

        public string LatestStatus { get; set; }
        public string GRNNo { get; set; }
        public string Version { get; set; }
        public DateTime CreatedDate { get; set; }

    }

    public class GoodReceiveNoteItem : EntityBase
    {
        public string GoodReceiveNoteId { get; set; }
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

    //public class PurchaseOrder : EntityBase
    //{
    //    public string PurchaseRequestId { get; set; }
    //    public string PurchaseRequestNumber { get; set; }
    //    public string PoNumber { get; set; }
    //    public DateTime DateTime { get; set; }
    //    public string Description { get; set; }
    //}
}
