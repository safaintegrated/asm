using Core;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.PermohonanStok
{
    public partial class PermohonanStok_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }
 
        }

        protected void ASPxFormLayout4_E3_TextChanged(object sender, EventArgs e)
        {

        }


        protected void cbp_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                cbp.JSProperties["cpMode"] = e.Parameter;

                switch (e.Parameter)
                {
                   // case "LOAD": LoadHeader(); break;
                }
            }
            else
            {
                cbp.JSProperties["cpErrMsg"] = "Session Expired.";
            }
        }

   

        protected void gvSearchPermohonanStok_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "ProcessId")
            {
                GridViewDataColumn gvc = gvSearchPermohonanStok.DataColumns["ProcessId"] as GridViewDataColumn;

                var obj = gvSearchPermohonanStok.FindRowCellTemplateControl(e.VisibleIndex, gvc, "hlProcessId");

                ASPxHyperLink link = (ASPxHyperLink)obj;

                if (link != null)
                {
                    string pId = gvSearchPermohonanStok.GetRowValues(e.VisibleIndex, "ProcessId").ToString();
                    link.ClientInstanceName = "ProcessId" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: PermohonanSelected('" + pId + "');";
                }
            }
        }

        protected void cbp_Report_Callback(object sender, CallbackEventArgsBase e)
        {
            Session["ReportName"] = e.Parameter;

            switch (e.Parameter)
            {
                case "STOK-PERMOHONAN-KEW.PS-10":

                    //Session["ProcessId"] = txtNoPemohon.Text;
                    Session["ProcessId"] = Tab_Permohonan1.ReportProcessId;
                    break;

                case "STOK-PERMOHONAN-KEW.PS-11":

                    //Session["ProcessId"] = txtNoPemohon.Text;
                    Session["ProcessId"] = Tab_Permohonan1.ReportProcessId;
                    break;
                default:
                    break;

            }
        }
    }
}