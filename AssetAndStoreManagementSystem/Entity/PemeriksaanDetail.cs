using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class PemeriksaanDetail
    {
        public int Id { get; set; }
        public int StockRegId { get; set; }
        public int PhysicalBalance { get; set; }

        public int StockId { get; set; }
        public string StockCode { get; set; }
        public string StockName { get; set; }
        public int CurrentBalance { get; set; }
        public int ParasMenokok { get; set; }
    }
}
