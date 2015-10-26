using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class LaporanKehilangan
    {
        public string KehilanganId { get; set; }
        public string JenisAset { get; set; }
        public string JenamaDanModel { get; set; }
        public string Kuantiti { get; set; }
        public DateTime TarikhPerolehan { get; set; }
        public DateTime TarikhLaporan { get; set; }
        public string Status { get; set; }
        public string JenisAsetAlihStok { get; set; }
        public string NoDaftarStok { get; set; }
        public string Keterangan { get; set; }
        public string SubKategori { get; set; }
        public DateTime TarikhBeli { get; set; }
        public string HargaPerolehanAsal { get; set; }
        public string KuantitiKehilangan { get; set; }
        public string AnggaranNilaiSemasa { get; set; }
        public string TempatKehilangan { get; set; }
        public string PuncaKehilangan { get; set; }
        public string PegawaiYangBertanggungjawab { get; set; }
        public string JawatanPegawaiYangBertanggungjawab { get; set; }
        public string TarafJawatan { get; set; }
        public string NoLaporanPolis { get; set; }
        public DateTime TarikhLaporanPolis { get; set; }
        public string LangkahLangkahSediaAda { get; set; }
        public string LangkahLangkahPencegahan { get; set; }
        public string TindakanKepadaPegawaiYangBertanggungjawab { get; set; }
        public string Catatan { get; set; }
        
    }
}
