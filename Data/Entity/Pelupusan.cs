using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class Pelupusan
    {
        public string StoreId { get; set; }
        //public DateTime TarikhPelupusan { get; set; }
        public string Status { get; set; }
        public string PelupusanDaftarStok { get; set; }
        public string KeteranganStok { get; set; }
        public string HargaSeunit { get; set; }
        public string KuantitiDilupuskan { get; set; }
        public string NilaiPerolehan { get; set; }
        public string HasilPerolehan { get; set; }
        public string KaedahDanNilai { get; set; }
        public string PelupusanId { get; set; }
        public string PTJ_Id { get; set; }
        public DateTime TarikhPelupusan { get; set; }
        public string KategoriStok { get; set; }

        List<PelupusanDetail> PelupusanDetails { get; set; }

        public Pelupusan()
        {
            PelupusanDetails = new List<PelupusanDetail>();
        }
    }
}
