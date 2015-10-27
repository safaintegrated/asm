using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class PurchaseRequest : EntityBase
    {
        public string Description { get; set; }
        public string Instruction { get; set; }
        public string ReferenceNumber { get; set; }


        public string RequesterId { get; set; }
        public UtemInfo Requestor { get; set; }
        public string RequestorName { get; set; }
        public string ProcurementTypeId { get; set; }
        public string ProcurementTypeName { get; set; }
        public string ProcurementCategoryId { get; set; }
        public string ProcurementCategory { get; set; }
        public string ProcurementMethodId { get; set; }
        public string ProcurementMethod { get; set; }

        /// <summary>
        /// Penerima Id
        /// </summary>
        public string ReceiverId { get; set; }

        /// <summary>
        /// Pembekal Id
        /// </summary>
        public string SupplierId { get; set; }
        public Supplier Supplier { get; set; }
        public string SupplierName { get; set; }
        public int RevisionNumber { get; set; }
        public string ProcessId { get; set; }

        public string PrNumber { get; set; }
        public ProcessStatus Status { get; set; }

        public string StatusName { get; set; }
        public PurchaseRequest()
        {
            RevisionNumber = 1;
            ProcessId = DateTime.Now.ToString("yyMMdd-HHmmss");
            Status = ProcessStatus.New;
            StatusName = "Baru";
        }

    }
}
