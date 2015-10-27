using Core.Stor;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.Pemeriksaan
{
    public partial class Tab_HasilVerifikasi_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_CheckInvestigatorRights_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {

        }

        protected void cbp_ResultGrid_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {

        }

        protected void CsvUpload_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            try
            {
                string tempUploadDirectory = "~/PemeriksaanFolder/";

                if (!e.UploadedFile.IsValid)
                    throw new Exception("Invalid Data");
                    //return string.Empty;
                string fileName = Path.ChangeExtension(e.UploadedFile.FileName, ".csv");
                string directory = Server.MapPath(tempUploadDirectory);
                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }

                string fullFileName = Path.Combine(directory, fileName);
                VerifikasiCsvUpload.SaveAs(fullFileName);

                e.CallbackData = fileName;
  
            }
            catch (Exception err)
            {
                lblFileStatusVerifikasi.Text = "Gagal";
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                lblFileStatusVerifikasi.Text = errMsg + " " + err.Message;

            }
        }

        //void BindInvestigatorGrid(ref DataTable Dt)
        //{

        //    gvPegawaiPemeriksa.DataSource = Dt;
        //    gvPegawaiPemeriksa.KeyFieldName = "LPD_EmpId";
        //    gvPegawaiPemeriksa.DataBind();
        //}

        protected void cbp_HasilPemeriksaan_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string tempUploadDirectory = "~/PemeriksaanFolder/";
            string directory = Server.MapPath(tempUploadDirectory);
            string fullFileName = Path.Combine(directory, txtFileNameVerifikasi.Text);
            string[] details = txtFileNameVerifikasi.Text.Split('.');

            string lembagaPemeriksaId = details[1];
            string pemeriksaId = details[3];

            var reader = new StreamReader(File.OpenRead(fullFileName));
            Dictionary<string, string> hasilPemeriksaan = new Dictionary<string, string>();
            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine();
                var values = line.Split(',');
                hasilPemeriksaan.Add(values[1], values[5]);
            }
            Session["HasilPemeriksaan"] = hasilPemeriksaan;

            DataTable dtDetail = new DataTable();
            string DbErr = StorLembagaPemeriksaMethods.V_LembagaPemeriksa_Detail(lembagaPemeriksaId, ref dtDetail);
            if (!string.IsNullOrEmpty(DbErr))
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                throw new Exception(DbErr);
                //cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                //return;
            }

            DataTable dtHeader = new DataTable();
            DbErr = StorLembagaPemeriksaMethods.V_LembagaPemeriksa_Header(lembagaPemeriksaId, ref dtHeader);
            if (!string.IsNullOrEmpty(DbErr))
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");

                throw new Exception(DbErr);
                //cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                //return;
            }

            //BindInvestigatorGrid(ref dtDetail);
            //txtNamaPemeriksaan.Text = "";
            //txtTahun.Text = dtHeader.Rows[0]["LPH_AssignYear"].ToString();
            //txtTarikhMula.Text = DateTime.Parse(dtHeader.Rows[0]["LPH_StartDate"].ToString()).ToString();
            //txtTarikhTamat.Text = DateTime.Parse(dtHeader.Rows[0]["LPH_EndDate"].ToString()).ToString();
            //txtLokasiPtj.Text = dtHeader.Rows[0]["PtjName"].ToString();
            //txtLokasiStor.Text = dtHeader.Rows[0]["StoreName"].ToString();
            ////txtStoreId.Text = dtHeader.Rows[0]["LPH_Stor"].ToString();
            ////cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = string.Empty;

            lblFileStatusVerifikasi.Text = "Berjaya";

            //e.CallbackData = fileName;
            //txtTahun.Text = "1234";

            LoadPemeriksaan(pemeriksaId);

        }

        private void LoadPemeriksaan(string id)
        {
            try
            {
                Data.Pemeriksaan p;
                string DbErr = Core.Stor.PemeriksaanMethods.SP_FindPemeriksaanById(id, out p);

                if (DbErr != string.Empty)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    //cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                    return;
                }
                //glLembagaName.Value = p.LembagaId;

                LoadStock(p);

                //cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                //cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { }
        }

        private void LoadStock(Data.Pemeriksaan p)
        {
            List<Data.StockRegistration> srs = new List<Data.StockRegistration>();
            try
            {

                //for (int x = 0; x < p.Details.Count; x++)
                //{
                //    Data.StockRegistration sr = new Data.StockRegistration();

                //    sr.Id = p.Details[x].StockRegId;
                //    sr.StockId = p.Details[x].StockId;
                //    sr.StockCode = p.Details[x].StockCode;
                //    sr.StockName = p.Details[x].StockName;
                //    sr.CurrentBalance = p.Details[x].CurrentBalance;
                //    sr.ParasMenokok = p.Details[x].ParasMenokok;
                //    srs.Add(sr);
                //}

                BindSenaraiStok(p.Details);

                //cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                //cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { }
        }

        private void BindSenaraiStok(List<Data.PemeriksaanDetail> srs)
        {
            gvSenaraiStokVerifikasi.DataSource = srs;
            gvSenaraiStokVerifikasi.KeyFieldName = "Id";
            gvSenaraiStokVerifikasi.DataBind();
            Session["StockList"] = srs;
        }

        protected void gvSenaraiStok_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                //case "LPD_EmpId": FormDeleteLink(e.DataColumn.FieldName, e.VisibleIndex, e.CellValue); break;
                case "PhysicalBalance": FormPerananCombo(e.DataColumn.FieldName, e.VisibleIndex, e.CellValue, e.GetValue("StockId").ToString()); break;
            }
        }
        void FormPerananCombo(string FieldName, int VisibleIndex, object CellValue, string keyValue)
        {
            Dictionary<string, string> hp = Session["HasilPemeriksaan"] as Dictionary<string, string>;
            ASPxTextBox txt = (ASPxTextBox)gvSenaraiStokVerifikasi.FindRowCellTemplateControl(VisibleIndex, gvSenaraiStokVerifikasi.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (txt != null)
            {
                txt.ClientInstanceName = FieldName + VisibleIndex.ToString();
                txt.Text = hp[keyValue];
                //if (CellValue.ToString() != "")
                //    cmb.Value = Convert.ToInt32(CellValue);
                //else
                //    cmb.Value = DBNull.Value;
            }
        }
    }
}