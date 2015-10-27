using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.LaporanKehilangan
{
    public partial class LaporanKehilangan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtJenisAset_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtJenamaDanModel_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtKuantiti_TextChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhPerolehan_DateChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhLaporan_DateChanged(object sender, EventArgs e)
        {

        }

        protected void txtStatus_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtJenisAsetAlihStok_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtNoDaftarStok_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtKeterangan_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSubKategori_TextChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhBeli_DateChanged(object sender, EventArgs e)
        {

        }

        protected void txtHargaPerolehanAsal_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtKuantitiKehilangan_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtPuncaKehilangan_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtPegawaiYangBertanggungjawab_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtJawatanPegawaiYangBertanggungjawab_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtTarafJawatan_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtNoLaporanPolis_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtLangkahLangkahSediaAda_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtLangkahLangkahPencegahan_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtTindakanKepadaPegawaiYangBertanggungjawab_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCatatan_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAnggaranNilaiSemasa_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtTempatKehilangan_TextChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhLaporanPolis_DateChanged(object sender, EventArgs e)
        {

        }

        protected void cbpLaporanKehilangan_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbpLaporanKehilangan.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {
                    case "SAVE": Save(ticket.Name); break;
                }
            }
            else
                cbpLaporanKehilangan.JSProperties["cpErrMsg"] = "Session Expired";
        }

        private void Save(string CurrUser)
        {
            try
            {
                Data.LaporanKehilangan LK = new Data.LaporanKehilangan
                {


                    JenisAset = txtJenisAset.Text,
                    JenamaDanModel = txtJenamaDanModel.Text,
                    Kuantiti = txtKuantiti.Text,
                    TarikhPerolehan = deTarikhPerolehan.Date,
                    TarikhLaporan = deTarikhLaporan.Date,
                    Status = txtStatus.Text,
                    JenisAsetAlihStok = txtJenisAsetAlihStok.Text,
                    NoDaftarStok = txtNoDaftarStok.Text,
                    Keterangan = txtKeterangan.Text,
                    SubKategori = txtSubKategori.Text,
                    TarikhBeli = deTarikhBeli.Date,
                    HargaPerolehanAsal = txtHargaPerolehanAsal.Text,
                    KuantitiKehilangan = txtKuantitiKehilangan.Text,
                    AnggaranNilaiSemasa = txtAnggaranNilaiSemasa.Text,
                    TempatKehilangan = txtTempatKehilangan.Text,
                    PuncaKehilangan = txtPuncaKehilangan.Text,
                    PegawaiYangBertanggungjawab = txtPegawaiYangBertanggungjawab.Text,
                    JawatanPegawaiYangBertanggungjawab = txtJawatanPegawaiYangBertanggungjawab.Text,
                    TarafJawatan = txtTarafJawatan.Text,
                    NoLaporanPolis = txtNoLaporanPolis.Text,
                    TarikhLaporanPolis = deTarikhLaporanPolis.Date,
                    LangkahLangkahSediaAda = txtLangkahLangkahSediaAda.Text,
                    LangkahLangkahPencegahan = txtLangkahLangkahPencegahan.Text,
                    TindakanKepadaPegawaiYangBertanggungjawab = txtTindakanKepadaPegawaiYangBertanggungjawab.Text,
                    Catatan = txtCatatan.Text,


                };

                string err = Core.Stor.LaporanKehilangan.LaporanKehilanganMethods.SP_LaporanKehilanganSave(LK);

                if (err == "")
                {
                    cbpLaporanKehilangan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpLaporanKehilangan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpLaporanKehilangan.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { }
        }

        protected void btnPrintReport_Click(object sender, EventArgs e)
        {

        //string userid = Session["sUserID"] + " - " + Session["sName"];
        //Response.Redirect("reportFareTable.aspx?plazaNo=" + plazacodeDropDownList.Text + "&versionNo=" + versionnoDropDownList.Text + "&userID=" + userid);


        }

    }
}