using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class AssetInventory : EntityBase
    {
        public string Desc { get; set; }
        public string Cat { get; set; }
        public string SubCat { get; set; }
        public string Type { get; set; }
        public string Make { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public string ManufacturerSerialNumber { get; set; }
        public string WarrantyStart { get; set; }
        public string WarrantyEnd { get; set; }
        public string SetVen_SAGACode { get; set; }
        public string SetVen_Address { get; set; }
        public string ProcurementMethod { get; set; }
        public string PoNumber { get; set; }
        public string PoDate { get; set; }
        public string ReceivedDate { get; set; }
        public string InvoiceNumber { get; set; }
        public string VoucherNumber { get; set; }
        public string VoucherDate { get; set; }
        public string GRNnumber { get; set; }
        public string SupplierRefNumber { get; set; }
        public string UomId { get; set; }
        public string Qty { get; set; }
        public string PurchasePrice { get; set; }
        public string AssetInvType { get; set; }
        public string RegistrationNumber { get; set; }
        public string NasionalCode { get; set; }
        public string Status { get; set; }
        public string MaintenanceRequired { get; set; }
        public string LoanApplicable { get; set; }
        public string owId { get; set; }
        public string PtjPurchaser { get; set; }
        public string Vot { get; set; }
        public string ProjectCode { get; set; }
        public string SpecNote { get; set; }
    }
  
}
