using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class Department : EntityBase
    {
        public string Code { get; set; }
        public string Name { get; set; }
    }
}
