using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entity
{
    public class TaxCodeSaga : EntityBase
    {
        public string Company { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public string Percentage { get; set; }
        public string GlCode { get; set; }

    }
}
