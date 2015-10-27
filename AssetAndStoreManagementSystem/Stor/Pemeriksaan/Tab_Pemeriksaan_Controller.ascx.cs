using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using System.Data;
using DevExpress.Web;
using Core.Aset.Pemeriksaan;
using Core.Email;
using Core.Stor;
using System.Text;
using System.IO;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace AssetAndStoreManagementSystem.Stor.Pemeriksaan
{
    public partial class Tab_Pemeriksaan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvSearchStockReg_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            gvSearchStockReg.DataBind();
        }

        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            string fileName = string.Format("{0}.{1}.{2}.{3}", DateTime.Now.ToString("yyyyMMddHHmmss"), glLembagaName.Value.ToString(), glLembagaName.Text, txtPemeriksaanId.Text);
            gvePemeriksaanStok.WriteCsvToResponse(fileName, true, new CsvExportOptionsEx { ExportType = DevExpress.Export.ExportType.WYSIWYG });
        }

        protected void gvSenaraiStok_DataBinding(object sender, EventArgs e)
        {
            if (Session["StockList"] != null)
            {
                gvSenaraiStok.DataSource = Session["StockList"];
            }
        }


        public void ResetControlText()
        {
            glLembagaName.Value = null;
            gvPemeriksaanInvestigator.DataSource = null;
            gvPemeriksaanInvestigator.DataBind();

            gvSenaraiStok.DataSource = null;
            gvSenaraiStok.DataBind();

            txtTahun.Text = "";
            deTarikhMula.Date = DateTime.MinValue;
            deTarikhTamat.Date = DateTime.MinValue;
            txtLokasiPtj.Text = "";
            txtLokasiStor.Text = "";
            txtStoreId.Text = "";
        }

        internal void BindSenaraiStok(List<Data.PemeriksaanDetail> srs)
        {
            gvSenaraiStok.DataSource = srs;
            gvSenaraiStok.KeyFieldName = "Id";
            gvSenaraiStok.DataBind();
            Session["StockList"] = srs;
        }

        internal void UpdateDetails(DataTable dtHeader, DataTable dtDetail)
        {
            BindAhliLembagaGrid(ref dtDetail);

            txtTahun.Text = dtHeader.Rows[0]["LPH_AssignYear"].ToString();
            deTarikhMula.Date = DateTime.Parse(dtHeader.Rows[0]["LPH_StartDate"].ToString());
            deTarikhTamat.Date = DateTime.Parse(dtHeader.Rows[0]["LPH_EndDate"].ToString());
            txtLokasiPtj.Text = dtHeader.Rows[0]["PtjName"].ToString();
            txtLokasiStor.Text = dtHeader.Rows[0]["StoreName"].ToString();
            txtStoreId.Text = dtHeader.Rows[0]["LPH_Stor"].ToString();
        }

        void BindAhliLembagaGrid(ref DataTable Dt)
        {
            gvPemeriksaanInvestigator.DataSource = Dt;
            gvPemeriksaanInvestigator.KeyFieldName = "LPD_EmpId";
            gvPemeriksaanInvestigator.DataBind();
        }

    }

}