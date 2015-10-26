using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class PermohonanStok
    {
        public int ProcessId { get; set; }
        public string ProcessIdTemp { get; set; }
        public int PemohonEmpSysId { get; set; }
        public int PtjId { get; set; }
        public string PermohonanTujuan { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime PermohonanTarikhDiKehendaki { get; set; }
        public int Status { get; set; }

        public string PemohonNama { get; set; }

        public string PemohonNoKakitangan { get; set; }

        public int PtjDiPohon { get; set; }

        public int StorDiPohon { get; set; }

        public int StokDiPohon { get; set; }

        public int PermohonanKuantitiDiPohon { get; set; }

        #region Info Kelulusan
        public int PegawaiKelulusanEmpSysId { get; set; }

        public int KuantitiDiluluskan { get; set; }

        public DateTime TarikhDiluluskan { get; set; }

        #endregion

        #region Info Pengeluaran

        public int PengeluaranKuantiti { get; set; }

        public DateTime PengeluaranTarikh { get; set; }

        public int PengeluaranEmpSysId { get; set; }

        #endregion

        public string PengeluaranCatatan { get; set; }

        public string PermohonanPtjDipohonNama { get; set; }

        public string PermohonanStokDiPohonNama { get; set; }

        public string PermohonanStorDiPohonNama { get; set; }

        public string PemohonJabatan { get; set; }

        public string PemohonJawatan { get; set; }

        public int PermohonanToPtj { get; set; }

        public int PermohonanToStor { get; set; }

        public int PermohonanToNama { get; set; }

        public int PermohonanToJenis { get; set; }
    }
}
