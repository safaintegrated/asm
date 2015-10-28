using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class PusatTanggungjawab : EntityBase
    {
        //public int PTJId { get; set; }
        public string FullName { get; set; }
        public string SmpCode { get; set; }
        public string SagaCode { get; set; }
        public string MySpartaCode { get; set; }
        public string Code { get; set; }
    }
}
