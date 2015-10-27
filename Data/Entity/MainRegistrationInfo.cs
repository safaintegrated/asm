using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class MainRegistrationInfo : EntityBase
    {
        //Maklumat Aset Alih
        public string Description { get; set; }
        public string Specification { get; set; }

        public string CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string SubCategoryId { get; set; }
        public string SubCategoryName { get; set; }

        public string Type { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public string Made { get; set; }
        public string ManufacturingSerialNumber { get; set; }
        public DateTime WarrantyStart { get; set; }
        public DateTime WarrantyEnd { get; set; }

        //Pendaftaran
        public string AssetTypeId { get; set; }
        public string AssetTypeName { get; set; }
        public string RegistrationNumber { get; set; }
        public string Status { get; set; }
        public string NasionalCode { get; set; }
        public string MaintenanceRequired { get; set; }
        public string LoanApplicable { get; set; }

        //Maklumat Perolehan
        public string SupplierId { get; set; }
        public string SupplierName { get; set; }
        public string SupplierAddress { get; set; }
        public string ProcurementMethodId { get; set; }
        public string ProcurementMethodName { get; set; }
        public string PONumber { get; set; }
        public DateTime PODate { get; set; }
        public string InvoiceNumber { get; set; }
        public string VoucherNumber { get; set; }
        public DateTime VoucherDate { get; set; }
        public string GRNNumber { get; set; }
        public DateTime GRNDate { get; set; }
        public string DeliveryNumber { get; set; }
        public string UnitOfMeasurementId { get; set; }
        public string UnitOfMeasurementName { get; set; }
        public string Qty { get; set; }
        public string PurchasePrice { get; set; }
    }
    
}
