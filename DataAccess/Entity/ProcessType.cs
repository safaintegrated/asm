using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entity
{
    public class ProcessType :EntityBase
    {
        public string Code { get; set; }
        public string Description { get; set; }
    }
}
