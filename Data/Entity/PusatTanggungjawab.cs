using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class PusatTanggungjawab : EntityBase
    {
        public string FullName { get; set; }
        public string SmpCode { get; set; }
        public string SagaCode { get; set; }
        public string MySpartaCode { get; set; }
        public string Code { get; set; }

        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }

    }
}
