using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public enum AuditType
    {
        Insert = 1,
        Update = 2,
        Delete = 3
    }
    
    public class AuditLog
    {
        public AuditLog()
        {
            EventDateUtc = DateTime.UtcNow;
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Username { get; set; }

        [Required]
        public DateTime EventDateUtc { get; set; }

        [Required]
        public AuditType EventType { get; set; }

        [Required]
        [StringLength(50)]
        public string TableName { get; set; }

        [Required]
        [StringLength(128)]
        public string RecordId { get; set; }

        [Required]
        [StringLength(50)]
        public string ColumnName { get; set; }

        [StringLength(4000)]
        public string OriginalValue { get; set; }

        [StringLength(4000)]
        public string NewValue { get; set; }
    }
}
