using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using DevExpress.Web;
using Core.Aset.Tender;

namespace AssetAndStoreManagementSystem.Aset.Tender
{
    public partial class Tender_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoadEvents();", true);
            }
        }

        protected void GridSearch_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearch.DataBind();
        }

        protected void GridSearch_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "TH_NoTender")
            {
                ASPxHyperLink TH_NoTender = (ASPxHyperLink)GridSearch.FindRowCellTemplateControl(e.VisibleIndex, GridSearch.DataColumns["TH_NoTender"] as GridViewDataColumn, "TH_NoTender");

                if (TH_NoTender != null)
                {
                    string TSH_ProcessID = GridSearch.GetRowValues(e.VisibleIndex, "TH_ProcessID").ToString();
                    TH_NoTender.Text = e.CellValue.ToString();
                    TH_NoTender.NavigateUrl = "javascript: TenderSelected('" + TSH_ProcessID + "');";
                }
            }
        }

        protected void cbp_Ref_Callback(object sender, CallbackEventArgsBase e)
        {
            if (Ref_RefProcessId.Text == "")
            {
                Ref_RefNumber.Text = "";
                Ref_RefDate.Value = DBNull.Value;
                Ref_RefEmpName.Text = "";
            }
            else
            {
                DataTable Dt = new DataTable();
                TenderMethods.SP_Tender_GetReference(Ref_RefProcessId.Text, ref Dt);

                if (Dt.Rows.Count == 1)
                {
                    Ref_RefNumber.Text = Dt.Rows[0]["TH_RefNumber"].ToString();
                    Ref_RefDate.Date = Convert.ToDateTime(Dt.Rows[0]["ModifiedDate"]);
                    Ref_RefEmpName.Text = Dt.Rows[0]["ModifiedBy"].ToString();
                }
            }
        }
    }
}