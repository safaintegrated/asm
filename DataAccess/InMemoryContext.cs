using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class InMemoryContext
    {
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

        public void SaveChanges(string user)
        {

        }

        public void SaveChanges()
        {
            
        }
    }
}
