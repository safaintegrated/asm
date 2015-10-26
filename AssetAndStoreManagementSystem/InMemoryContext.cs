using DataAccess;
using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AssetAndStoreManagementSystem;

namespace DataAccess
{
    public class InMemoryContext
    {
        public InMemoryContext()
        {
            Categories = new DbSet<Category>();
        AuditLogs  = new DbSet<AuditLog>();
        PurchaseRequests  = new DbSet<PurchaseRequest>();
       UtemInfos  = new DbSet<UtemInfo>();
        ProcurementCategories  = new DbSet<ProcurementCategory>();
       ProcurementMethods  = new DbSet<ProcurementMethod>();
       ProcurementTypes  = new DbSet<ProcurementType>();
       PuDeliveryAddresses  = new DbSet<PuDeliveryAddress>();
       Suppliers  = new DbSet<Supplier>();
        UnitOfMeasurements  = new DbSet<UnitOfMeasurement>();
        Categories  = new DbSet<Category>();
        SubCategories  = new DbSet<SubCategory>();
        AssetTypes  = new DbSet<AssetType>();
        TaxCodesSaga  = new DbSet<TaxCodeSaga>();
        PurchaseTypes  = new DbSet<PurchaseType>();
        Projects  = new DbSet<Project>();
        Components  = new DbSet<Component>();
       Ledgers  = new DbSet<Ledger>();
        ProcessTypes  = new DbSet<ProcessType>();
       RequestorList  = new DbSet<Requestor>();
        LedgerItemList  = new DbSet<LedgerItem>();
        ProjectItemList  = new DbSet<ProjectItem>();
        Workflows  = new DbSet<Workflow>();
      Checklists  = new DbSet<Checklist>();
      PurchaseRequestItems = new DbSet<PurchaseRequestItem>();

           
        }

        public DbSet<AuditLog> AuditLogs { get; set; }
        public DbSet<PurchaseRequest> PurchaseRequests { get; set; }
        public DbSet<UtemInfo> UtemInfos { get; set; }
        public DbSet<ProcurementCategory> ProcurementCategories { get; set; }
        public DbSet<ProcurementMethod> ProcurementMethods { get; set; }
        public DbSet<ProcurementType> ProcurementTypes { get; set; }
        public DbSet<PuDeliveryAddress> PuDeliveryAddresses { get; set; }
        public DbSet<Supplier> Suppliers { get; set; }
        public DbSet<UnitOfMeasurement> UnitOfMeasurements { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<SubCategory> SubCategories { get; set; }
        public DbSet<AssetType> AssetTypes { get; set; }
        public DbSet<TaxCodeSaga> TaxCodesSaga { get; set; }
        public DbSet<PurchaseType> PurchaseTypes { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<Component> Components { get; set; }
        public DbSet<Ledger> Ledgers { get; set; }
        public DbSet<ProcessType> ProcessTypes { get; set; }
        public DbSet<Requestor> RequestorList { get; set; }
        public DbSet<LedgerItem> LedgerItemList { get; set; }
        public DbSet<ProjectItem> ProjectItemList { get; set; }
        public DbSet<Workflow> Workflows { get; set; }
        public DbSet<Checklist> Checklists { get; set; }
        public DbSet<PurchaseRequestItem> PurchaseRequestItems { get; set; }
        public void SaveChanges(string user)
        {

        }

        public void SaveChanges()
        {
            
        }


    }
}
