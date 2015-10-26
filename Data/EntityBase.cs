using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class EntityBase 
    {
        [Required]
        [StringLength(128)]
        [Column("Id")]
        [Key]
        public string Id { get; set; }

        [Required]
        [Column("CreatedAt")]
        //[Index(IsClustered = true)]
        public DateTimeOffset CreatedAt { get; set; }

        [Column("UpdatedAt")]
        public DateTimeOffset? UpdatedAt { get; set; }

        [Column("Version")]
        [Timestamp]
        public byte[] Version { get; set; }

        [Column("Deleted")]
        public bool Deleted { get; set; }

        [Required]
        [StringLength(150)]
        [Column("CreatedBy")]
        public string CreatedBy { get; set; }

        [StringLength(150)]
        [Column("UpdatedBy")]
        public string UpdatedBy { get; set; }

        public EntityBase()
        {
            Id = Guid.NewGuid().ToString("N");
        }

        public virtual string Describe()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}
