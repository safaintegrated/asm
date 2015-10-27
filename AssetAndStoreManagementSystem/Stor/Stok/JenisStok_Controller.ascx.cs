using Core.Stor.Stok;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.Stok
{
    public partial class JenisStok_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }

        }

        protected void GridSearch_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearch.DataBind();
        }

        protected void GridSearch_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Stock_RegisterNo")
            {
                GridViewDataColumn gvc = GridSearch.DataColumns["Stock_RegisterNo"] as GridViewDataColumn;

                var obj = GridSearch.FindRowCellTemplateControl(e.VisibleIndex, gvc, "hlStockRegNo");

                ASPxHyperLink link = (ASPxHyperLink)obj;

                if (link != null)
                {
                    string stockId = GridSearch.GetRowValues(e.VisibleIndex, "Stock_Id").ToString();
                    link.ClientInstanceName = "hlStockRegNo" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: StokSelected('" + stockId + "');";
                }
            }
        }

        protected void cbp_save_Callback(object sender, CallbackEventArgsBase e)
        {
   
        }

        protected void cbp_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (ticket.Expired)
            {
                cbp.JSProperties["cpErrMsg"] = "Session Expired.";
                return;
            }

            switch (e.Parameter)
            {
                case "LOAD": LoadStock(); break;
                case "SAVE": SaveMode(ticket.Name); break;
                case "CANCEL": CancelMode(); break;
            }
        }

        void SaveMode(string CurrUser)
        {
            try
            {
                Data.Stock stock = new Data.Stock
                {
                    StockRegisterNo = txtNoPendaftaran.Text.Trim(),
                    StockDetail = txtStockDetails.Text.Trim(),
                    StockGroup = txStockGroup.Text.Trim(),
                    CatId = Convert.ToInt32(glCategory.Value),
                    StockMeasurament = Convert.ToInt32(glMeasurement.Value),
                    SubCatId = Convert.ToInt32(glSubCategory.Value),
                    StockStatusExpiryDate = cbIsHasExpiry.SelectedIndex,

                };

                string DbErr = StockMethods.SP_StockSave(stock);

                if (DbErr == "")
                { cbp.JSProperties["cpErrMsg"] = string.Empty; }
                else
                { cbp.JSProperties["cpErrMsg"] = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString() + " " + DbErr; }
            }
            catch (Exception err)
            { cbp.JSProperties["cpErrMsg"] = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString() + " " + err; }
            finally
            {  }
        }

        private void LoadStock()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = StockMethods.LoadStock(ref Dt, txtStockId.Text);

                if (DbErr != string.Empty)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                    return;
                }

                glCategory.Value = Convert.ToInt32(Dt.Rows[0]["CatId"]);
                glSubCategory.Value = Convert.ToInt32(Dt.Rows[0]["SubCatId"]);

                txtNoPendaftaran.Text = Dt.Rows[0]["Stock_RegisterNo"].ToString();
                //Stock_Picture.Text = Dt.Rows[0]["BLT_Image"].ToString();
                txtStockDetails.Text = Dt.Rows[0]["Stock_Detail"].ToString();
                txStockGroup.Text = Dt.Rows[0]["StockGroup"].ToString();
                glMeasurement.Value= Convert.ToInt32(Dt.Rows[0]["UomId"]);
                
                int isExipry = 0;
                if (!int.TryParse(Dt.Rows[0]["Stock_StatusExpiryDate"].ToString(), out isExipry))
                {
                    isExipry = 0;
                }
                cbIsHasExpiry.SelectedIndex = isExipry;


                cbp.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        void CancelMode()
        {

            txtNoPendaftaran.Text = string.Empty;
            txtStockDetails.Text = string.Empty;
            txStockGroup.Text = string.Empty;
            glCategory.Value = DBNull.Value;
            glMeasurement.Value = DBNull.Value;
            glSubCategory.Value = DBNull.Value;
            cbIsHasExpiry.SelectedIndex = 0;

        }
    }
}