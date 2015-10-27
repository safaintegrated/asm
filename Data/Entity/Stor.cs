using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class Stor
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int PtjId { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string Address4 { get; set; }

        public List<Employee> Employee { get; set; }
        public List<Location> Location { get; set; }
    }


}
