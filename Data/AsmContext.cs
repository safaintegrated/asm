using Data;
using Data.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Metadata.Edm;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity.Migrations;

namespace Data
{
    public class AsmContext : DbContext
    {
        public AsmContext()
            : base("AsmDbConnectionString")
        {
            InitializeDatabase();
        }

        protected virtual void InitializeDatabase()
        {

            //Database.SetInitializer<AsmContext>(new CreateDatabaseIfNotExists<AsmContext>());
            //Database.SetInitializer<AsmContext>(new DropCreateDatabaseIfModelChanges<AsmContext>());
            //Database.SetInitializer<AsmContext>(new DropCreateDatabaseAlways<AsmContext>());
            Database.SetInitializer<AsmContext>(new AsmContextInitializer());
            //Database
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
        public DbSet<Employee> Employees { get; set; }
        public DbSet<AssetRegistration> AssetRegistrationList { get; set; }
        public DbSet<PurchaseRequestItem> PurchaseRequestItems { get; set; }
        public DbSet<Department> Departments { get; set; }
        public DbSet<PusatTanggungjawab> PusatTanggungjawabList { get; set; }
        public DbSet<ProcessState> ProcessStateList { get; set; }
        public DbSet<PurchaseRequestCheckList> PurchaseRequestCheckListList { get; set; }

        public int SaveChanges(string username)
        {
            var userName = string.IsNullOrEmpty(username) ? "amir@fa-bigdata.com" : username;
            try
            {
                // Get all Added/Deleted/Modified entities (not Unmodified or Detached)
                foreach (var entry in this.ChangeTracker.Entries().Where(p => p.State == EntityState.Added || p.State == EntityState.Deleted || p.State == EntityState.Modified))
                {
                    // For each changed record, get the audit record entries and add them
                    foreach (AuditLog x in GetAuditRecordsForChange(entry, userName))
                    {
                        this.AuditLogs.Add(x);
                    }

                    var entity = entry.Entity as EntityBase;
                    if (entity != null)
                    {
                        if (entry.State == EntityState.Added)
                        {
                            entity.CreatedAt = DateTime.UtcNow;
                            entity.CreatedBy = userName;
                            entity.UpdatedAt = DateTime.UtcNow;
                            entity.UpdatedBy = userName;
                        }
                        else if (entry.State == EntityState.Modified || entry.State == EntityState.Deleted)
                        {
                            entity.UpdatedAt = DateTime.UtcNow;
                            entity.UpdatedBy = userName;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
        
            // Call the original SaveChanges(), which will save both the changes made and the audit records
            return base.SaveChanges();
        }

        private List<AuditLog> GetAuditRecordsForChange(DbEntityEntry dbEntry, string username)
        {
            List<AuditLog> result = new List<AuditLog>();

            var changeTime = DateTime.UtcNow;

            // Get table name (if it has a Table attribute, use that, otherwise get the pluralized name)
            string tableName = GetTableName(dbEntry);

            string keyName = "Id";
            //string keyName = keyNames[0].Name; //dbEntry.Entity.GetType().GetProperties().Single(p => p.GetCustomAttributes(typeof(KeyAttribute), false).Count() > 0).Name;

            if (dbEntry.State == EntityState.Added)
            {
                // For Inserts, just add the whole record
                // If the entity implements IDescribableEntity, use the description from Describe(), otherwise use ToString()

                foreach (string propertyName in dbEntry.CurrentValues.PropertyNames)
                {
                    result.Add(new AuditLog()
                    {
                        Username = username,
                        EventDateUtc = changeTime,
                        EventType = AuditType.Insert, // Added
                        TableName = tableName,
                        RecordId = dbEntry.CurrentValues.GetValue<object>(keyName).ToString(),
                        ColumnName = propertyName,
                        NewValue =
                            dbEntry.CurrentValues.GetValue<object>(propertyName) == null
                                ? null
                                : dbEntry.CurrentValues.GetValue<object>(propertyName).ToString()
                    }
                        );
                }


            }
            else if (dbEntry.State == EntityState.Deleted)
            {
                // Same with deletes, do the whole record, and use either the description from Describe() or ToString()
                result.Add(new AuditLog()
                {
                    Username = username,
                    EventDateUtc = changeTime,
                    EventType = AuditType.Delete, // Deleted
                    TableName = tableName,
                    RecordId = dbEntry.OriginalValues.GetValue<object>(keyName).ToString(),
                    ColumnName = "*ALL",
                    NewValue =
                        (dbEntry.OriginalValues.ToObject() is IDescribableEntity)
                            ? (dbEntry.OriginalValues.ToObject() as IDescribableEntity).Describe()
                            : dbEntry.OriginalValues.ToObject().ToString()
                }
                    );
            }
            else if (dbEntry.State == EntityState.Modified)
            {
                foreach (string propertyName in dbEntry.OriginalValues.PropertyNames)
                {
                    // For updates, we only want to capture the columns that actually changed
                    if (!object.Equals(dbEntry.OriginalValues.GetValue<object>(propertyName), dbEntry.CurrentValues.GetValue<object>(propertyName)))
                    {
                        result.Add(new AuditLog()
                        {
                            Username = username,
                            EventDateUtc = changeTime,
                            EventType = AuditType.Update, // Modified
                            TableName = tableName,
                            RecordId = dbEntry.OriginalValues.GetValue<object>(keyName).ToString(),
                            ColumnName = propertyName,
                            OriginalValue =
                                dbEntry.OriginalValues.GetValue<object>(propertyName) == null
                                    ? null
                                    : dbEntry.OriginalValues.GetValue<object>(propertyName).ToString(),
                            NewValue =
                                dbEntry.CurrentValues.GetValue<object>(propertyName) == null
                                    ? null
                                    : dbEntry.CurrentValues.GetValue<object>(propertyName).ToString()
                        }
                            );
                    }

                }

            }
            // Otherwise, don't do anything, we don't care about Unchanged or Detached entities

            return result;
        }

        private string GetTableName(DbEntityEntry ent)
        {
            ObjectContext objectContext = ((IObjectContextAdapter)this).ObjectContext;
            Type entityType = ent.Entity.GetType();

            if (entityType.BaseType != null && entityType.Namespace == "System.Data.Entity.DynamicProxies")
                entityType = entityType.BaseType;

            string entityTypeName = entityType.Name;

            EntityContainer container =
                objectContext.MetadataWorkspace.GetEntityContainer(objectContext.DefaultContainerName, DataSpace.CSpace);
            string entitySetName = (from meta in container.BaseEntitySets
                                    where meta.ElementType.Name == entityTypeName
                                    select meta.Name).First();
            return entitySetName;
        }


    }
}
