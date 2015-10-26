using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entity
{
    public class Project : EntityBase
    {
        public string ProjectCode { get; set; }
        public string Description { get; set; }
        public int Jumlah { get; set; }
    }
}
