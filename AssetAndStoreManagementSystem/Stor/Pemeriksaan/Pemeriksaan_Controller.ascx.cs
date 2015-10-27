using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using Core.Aset.AduanKerosakan;
using System.Configuration;
using System.Web.Security;
using Core.Aset.Pemeriksaan;
using Core.Stor;


namespace AssetAndStoreManagementSystem.Stor.Pemeriksaan
{
    public partial class Pemeriksaan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["ProcessId"] == null)
                {
                    OpenFromMyTask.Text = "0";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoadEvents();", true);
                }
                else
                {
                    OpenFromMyTask.Text = "1";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "PemeriksaanSelected('" + Request.QueryString["ProcessId"].ToString() + "');", true);
                }

            }
        }

        protected void GridSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearch.DataBind();
        }

        protected void GridSearch_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "LPH_LembagaName")
            {
                GridViewDataColumn gvc = GridSearch.DataColumns["LPH_LembagaName"] as GridViewDataColumn;
                var obj = GridSearch.FindRowCellTemplateControl(e.VisibleIndex, gvc, "hlId");
                ASPxHyperLink link = (ASPxHyperLink)obj;
                if (link != null)
                {
                    string pmeriksaanId = GridSearch.GetRowValues(e.VisibleIndex, "Id").ToString();
                    link.ClientInstanceName = "Pemeriksaan" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: PemeriksaanSelected('" + pmeriksaanId + "');";
                }
            }
        }

        protected void cbp_Ref_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            //DataTable Dt = new DataTable();
            //PemeriksaanMethods.V_Pemeriksaan_Header(ref Dt, Ref_RowId.Text);

            //if (Dt.Rows.Count == 1)
            //{
            //    Ref_Status.Text = Dt.Rows[0]["PEMH_Status"].ToString();
            //    Ref_RefNumber.Text = Dt.Rows[0]["PEMH_RefNumber"].ToString();
            //    Ref_LastModDate.Date = Convert.ToDateTime(Dt.Rows[0]["PEMH_LastModDate"]);
            //}
        }

        protected void cbp_Main_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_Main.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (ticket.Expired)
            {
                cbp_Main.JSProperties["cpErrMsg"] = "Session Expired";
                return;
            }

            switch (e.Parameter)
            {
                case "ADD": AddNewPemeriksaan(ticket.Name); break;
                case "LOAD_LEMBAGA_PEMERIKSAAN": LoadLembagaPemeriksaan(); break;
                case "SAVE": Save(ticket.Name); break;
                case "LOAD": LoadExistingPemeriksaan(); break;
                case "ADDSTOCK": AddStock(); break;

            }
        }

        private void AddNewPemeriksaan(string p)
        {
            try
            {
                Tab_Pemeriksaan_Controller1.ResetControlText();
                cbp_Main.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Main.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { }
        }

        private void LoadExistingPemeriksaan()
        {
            try
            {
                Data.Pemeriksaan p;
                var txtPemeriksaanId = FindControlRecursive(Tab_Pemeriksaan_Controller1, "txtPemeriksaanId") as ASPxTextBox;

                string DbErr = Core.Stor.PemeriksaanMethods.SP_FindPemeriksaanById(txtPemeriksaanId.Text, out p);

                if (DbErr != string.Empty)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Main.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                    return;
                }

                var glLembagaName = FindControlRecursive(Tab_Pemeriksaan_Controller1, "glLembagaName") as ASPxGridLookup;
                glLembagaName.Value = p.LembagaId;

                LoadStock(p);

                cbp_Main.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Main.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { }
        }

        private void AddStock()
        {
            List<Data.PemeriksaanDetail> srs = new List<Data.PemeriksaanDetail>();
            try
            {
                var gvSearchStockReg = FindControlRecursive(this, "gvSearchStockReg") as ASPxGridView;

                if (gvSearchStockReg.Selection.Count == 0)
                {
                    cbp_Main.JSProperties["cpErrMsg"] = string.Empty;
                    return;
                }

                for (int x = 0; x < gvSearchStockReg.VisibleRowCount; x++)
                {
                    if (gvSearchStockReg.Selection.IsRowSelected(x))
                    {
                        Data.PemeriksaanDetail sr = new Data.PemeriksaanDetail();

                        sr.Id = int.Parse(gvSearchStockReg.GetRowValues(x, "StockRegId").ToString());
                        sr.StockId = int.Parse(gvSearchStockReg.GetRowValues(x, "StockId").ToString());
                        sr.StockCode = gvSearchStockReg.GetRowValues(x, "StockRegNo").ToString();
                        sr.StockName = gvSearchStockReg.GetRowValues(x, "StockDetail").ToString();
                        sr.CurrentBalance = int.Parse(gvSearchStockReg.GetRowValues(x, "Balance").ToString());
                        sr.ParasMenokok = int.Parse(gvSearchStockReg.GetRowValues(x, "ParasMenokok").ToString());

                        srs.Add(sr);
                    }
                }

                Tab_Pemeriksaan_Controller1.BindSenaraiStok(srs);

                cbp_Main.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Main.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { }
        }

        private void Save(string CurrUser)
        {
            try
            {
                var glLembagaName = FindControlRecursive(this, "glLembagaName") as ASPxGridLookup;
                var gvSenaraiStok = FindControlRecursive(this, "gvSenaraiStok") as ASPxGridView;

                Data.Pemeriksaan p = new Data.Pemeriksaan
                {
                    LembagaId = glLembagaName.Value.ToString(),
                };

                for (int i = 0; i < gvSenaraiStok.VisibleRowCount; i++)
                {
                    Data.PemeriksaanDetail sr = new Data.PemeriksaanDetail();
                    sr.StockRegId = int.Parse(gvSenaraiStok.GetRowValues(i, "Id").ToString());
                    p.Details.Add(sr);
                }

                string err = Core.Stor.PemeriksaanMethods.SP_PemeriksaanSave(int.Parse(CurrUser), p);

                if (err == "")
                {
                    cbp_Main.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Main.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Main.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { }
        }


        private void LoadStock(Data.Pemeriksaan p)
        {
            List<Data.PemeriksaanDetail> srs = new List<Data.PemeriksaanDetail>();
            try
            {

                for (int x = 0; x < p.Details.Count; x++)
                {
                    Data.PemeriksaanDetail sr = new Data.PemeriksaanDetail();

                    sr.Id = p.Details[x].StockRegId;
                    sr.StockId = p.Details[x].StockId;
                    sr.StockCode = p.Details[x].StockCode;
                    sr.StockName = p.Details[x].StockName;
                    sr.CurrentBalance = p.Details[x].CurrentBalance;
                    sr.ParasMenokok = p.Details[x].ParasMenokok;
                    srs.Add(sr);
                }

                Tab_Pemeriksaan_Controller1.BindSenaraiStok(srs);

                cbp_Main.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Main.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { }
        }

        private void LoadLembagaPemeriksaan()
        {

            try
            {
                var glLembagaName = FindControlRecursive(this, "glLembagaName") as ASPxGridLookup;

                DataTable dtDetail = new DataTable();
                string DbErr = StorLembagaPemeriksaMethods.V_LembagaPemeriksa_Detail(glLembagaName.Value.ToString(), ref dtDetail);

                if (!string.IsNullOrEmpty(DbErr))
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Main.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                    return;
                }


                DataTable dtHeader = new DataTable();
                DbErr = StorLembagaPemeriksaMethods.V_LembagaPemeriksa_Header(glLembagaName.Value.ToString(), ref dtHeader);
                if (!string.IsNullOrEmpty(DbErr))
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Main.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                    return;
                }

                Tab_Pemeriksaan_Controller1.UpdateDetails(dtHeader, dtDetail);

                cbp_Main.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Main.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { }
        }



        void ScanInvestigatorGrid(ref DataTable Dt)
        {
            var gvPemeriksaanInvestigator = FindControlRecursive(this, "gvPemeriksaanInvestigator") as ASPxGridView;
            
            DataColumn EmployeeEmail = Dt.Columns.Add("EmployeeEmail", typeof(String));
            DataColumn EmployeeName = Dt.Columns.Add("EmployeeName", typeof(String));
            Dt.AcceptChanges();

            for (int i = 0; i < gvPemeriksaanInvestigator.VisibleRowCount; i++)
            {
                if (gvPemeriksaanInvestigator.GetRowValues(i, "LPD_EmpEmail").ToString() != "" && gvPemeriksaanInvestigator.GetRowValues(i, "LPD_EmpName").ToString() != "")
                {
                    DataRow Dr = Dt.NewRow();
                    Dr["EmployeeEmail"] = gvPemeriksaanInvestigator.GetRowValues(i, "LPD_EmpEmail").ToString();
                    Dr["EmployeeName"] = gvPemeriksaanInvestigator.GetRowValues(i, "LPD_EmpName").ToString();
                    Dt.Rows.Add(Dr);
                }
            }

            Dt.AcceptChanges();
        }

        public Control FindControlRecursive(Control container, string name)
        {
            if (container.ID == name)
                return container;

            foreach (Control ctrl in container.Controls)
            {
                Control foundCtrl = FindControlRecursive(ctrl, name);

                if (foundCtrl != null) return foundCtrl;
            }

            return null;
        }
    }
}



