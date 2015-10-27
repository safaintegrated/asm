using Core.Stor;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.DaftarStok
{
    public partial class Tab_MaklumatStok : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxFormLayout1_E5_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ASPxFormLayout1_E2_Click(object sender, EventArgs e)
        {

        }

        protected void cbp_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_save.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (ticket.Expired)
            {
                cbp_save.JSProperties["cpErrMsg"] = "Session Expired.";
                return;
            }

            switch (e.Parameter)
            {
                //case "LOAD": LoadStore(); break;
                case "SAVE": SaveMode(ticket.Name); break;
                case "CANCEL": CancelMode(); break;
            }
        }

        private void CancelMode()
        {
            glPtj.Value = null;
            glStore.Value = null;
            glLocation.Value = null;
            glStock.Value = null;
            txtStockDetail.Text = "";
            txtStockGroup.Text = "";
            txtStockMeasurement.Text = "";
            txtStockCategory.Text = "";
            txtStockSubCategory.Text = "";
            //cbTransactionType.Text = "";
            txtNoPkBppsBtb.Text = "";
            //txtCurrentBalance.Text = "";
            txtParasMenokok.Text = "";
            txtInTo.Text = "";
            txtInQuantityRequest.Text = "";
            txtInQuantity.Text = "";
            txtInUnitPrice.Text = "";
            //txtOutTo.Text = "";
            //txtOutQuantityRequest.Text = "";
            //txtOutQuantity.Text = "";

            cbp_save.JSProperties["cpErrMsg"] = string.Empty;
        }

        private void SaveMode(string p)
        {
            try
            {
                Data.StockRegistration sr = new Data.StockRegistration
                {
                    PtjId = Convert.ToInt32(glPtj.Value),
                    StoreId = Convert.ToInt32(glStore.Value),
                    LocationId = Convert.ToInt32(glLocation.Value),
                    StockId = Convert.ToInt32(glStock.Value),
                    TransactionType = 0,// cbTransactionType.SelectedIndex,
                    NoPkBppsBtb = txtNoPkBppsBtb.Text,
                    CurrentBalance = 0,// EnsureNumber(txtCurrentBalance.Text),
                    ParasMenokok = EnsureNumber(txtParasMenokok.Text),
                    TransInFrom = txtInTo.Text,
                    TransInQuantityRequest = EnsureNumber(txtInQuantityRequest.Text),
                    TransInQuantity = EnsureNumber(txtInQuantity.Text),
                    TransInUnitPrice = EnsureNumber(txtInUnitPrice.Text),
                    TransOutTo = "",// txtOutTo.Text,
                    TransOutQuantityRequest = 0,// EnsureNumber(txtOutQuantityRequest.Text),
                    TransOutQuantity = 0,//EnsureNumber(txtOutQuantity.Text),
                    DateTime = DateTime.Now,
                };

                int prevBalance = 0;
                string err = PendaftaranStockMethods.GetCurrentBalance(Convert.ToInt32(glStore.Value), Convert.ToInt32(glStock.Value), out prevBalance);
                if (err != "")
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_save.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    return;
                }

                sr.CurrentBalance = prevBalance + sr.TransInQuantity;

                err = PendaftaranStockMethods.SP_DaftarStockSave(sr);
                if (err != "")
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_save.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    return;
                }

                cbp_save.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_save.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { }
        }

        private int EnsureNumber(string num)
        {
            int i = 0;
            if (!int.TryParse(num, out i))
            {

                i = 0;
            }
            return i;
        }

        protected void ASPxFormLayout1_E15_NumberChanged(object sender, EventArgs e)
        {

        }
    }
}