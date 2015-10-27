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
    public partial class Tab_HasilPemeriksaan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CsvUpload_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
        }

        protected void cbp_HasilPemeriksaan_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string tempUploadDirectory = "~/PemeriksaanFolder/";
            string directory = Server.MapPath(tempUploadDirectory);
            string fullFileName = Path.Combine(directory, txtFileName.Text);
            string[] details = txtFileName.Text.Split('.');

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
            }

            DataTable dtHeader = new DataTable();
            DbErr = StorLembagaPemeriksaMethods.V_LembagaPemeriksa_Header(lembagaPemeriksaId, ref dtHeader);
            if (!string.IsNullOrEmpty(DbErr))
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");

                throw new Exception(DbErr);
            }
            lblFileStatus.Text = "Berjaya";
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
                    return;
                }
                LoadStock(p);
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
            }
            finally
            { }
        }

        private void LoadStock(Data.Pemeriksaan p)
        {
            List<Data.StockRegistration> srs = new List<Data.StockRegistration>();
            try
            {
                BindSenaraiStok(p.Details);
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
            }
            finally
            { }
        }

        private void BindSenaraiStok(List<Data.PemeriksaanDetail> srs)
        {
            gvSenaraiStok.DataSource = srs;
            gvSenaraiStok.KeyFieldName = "Id";
            gvSenaraiStok.DataBind();
            Session["StockList"] = srs;
        }

        protected void gvSenaraiStok_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "PhysicalBalance": FormPerananCombo(e.DataColumn.FieldName, e.VisibleIndex, e.CellValue, e.GetValue("StockId").ToString()); break;
            }
        }
        void FormPerananCombo(string FieldName, int VisibleIndex, object CellValue, string keyValue)
        {
            Dictionary<string, string> hp = Session["HasilPemeriksaan"] as Dictionary<string, string>;
            ASPxTextBox txt = (ASPxTextBox)gvSenaraiStok.FindRowCellTemplateControl(VisibleIndex, gvSenaraiStok.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (txt != null)
            {
                txt.ClientInstanceName = FieldName + VisibleIndex.ToString();
                txt.Text = hp[keyValue];
            }
        }

        protected void PemeriksaanCsvUpload_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            try
            {
                string tempUploadDirectory = "~/PemeriksaanFolder/";

                if (!e.UploadedFile.IsValid)
                    throw new Exception("Invalid Data");
                string fileName = Path.ChangeExtension(e.UploadedFile.FileName, ".csv");
                string directory = Server.MapPath(tempUploadDirectory);
                if (!Directory.Exists(directory))
                    Directory.CreateDirectory(directory);

                string fullFileName = Path.Combine(directory, fileName);
                PemeriksaanCsvUpload.SaveAs(fullFileName);
                e.CallbackData = fileName;
            }
            catch (Exception err)
            {
            }

        }
    }
}