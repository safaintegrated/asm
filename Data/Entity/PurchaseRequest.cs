﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class PurchaseRequest : EntityBase
    {
        public virtual Employee Requestor { get; set; }
        public string RequestorId { get; set; }
        [NotMapped]
        public string RequestorUserName { get { return Requestor.UserId; } }
        [NotMapped]
        public string RequestorName { get { return Requestor.FullName; } }

        public string Description { get; set; }
        public string Instruction { get; set; }
        public string ReferenceNumber { get; set; }

        public virtual ProcurementType ProcurementType { get; set; }
        public string ProcurementTypeId { get; set; }

        [NotMapped]
        public string ProcurementTypeName
        {
            get
            {
                if (ProcurementType == null)
                    return "";
                else
                    return ProcurementType.Name;
            }
        }

        public virtual ProcurementCategory ProcurementCategory { get; set; }

        public string ProcurementCategoryId { get; set; }
        
        [NotMapped]
        public string ProcurementCategoryName { get; set; }

        public virtual ProcurementMethod ProcurementMethod { get; set; }
      
        public string ProcurementMethodId { get; set; }

        [NotMapped]
        public string ProcurementMethodName
        {
            get
            {
                if (ProcurementMethod == null)
                    return "";
                else
                    return ProcurementMethod.Name;
            }
        }

        /// <summary>
        /// Penerima Id
        /// </summary>
        public string ReceiverId { get; set; }

        /// <summary>
        /// Pembekal Id
        /// </summary>
        public virtual Supplier Supplier { get; set; }
      
        public string SupplierId { get; set; }

        [NotMapped]
        public string SupplierName
        {
            get
            {
                if (Supplier == null)
                    return "";
                else
                    return Supplier.Name;
            }
        }

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
