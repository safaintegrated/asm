using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class Pemeriksaan
    {
        public int Id { get; set; }
        public string LembagaId { get; set; }
        public List<PemeriksaanDetail> Details { get; set; }

        public Pemeriksaan()
        {
            Details = new List<PemeriksaanDetail>();
        }
    }
}
