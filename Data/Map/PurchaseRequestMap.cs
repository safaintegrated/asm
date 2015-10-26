using Data.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Map
{
    public class PurchaseRequestMap : EntityTypeConfiguration<PurchaseRequest>
    {
        public PurchaseRequestMap()
        {
            ToTable("PurchaseRequest");
            //Property(x => x.Details)
            //    .HasColumnName("Details")
            //    .HasMaxLength(500)
            //    .IsRequired();
        }
    }
}
