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
using DevExpress.Web;
using System.Web.Security;
using Core.Aset.Pemeriksaan;


namespace AssetAndStoreManagementSystem.Stor.Verifikasi
{
    public partial class Verifikasi_Controller : System.Web.UI.UserControl
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
            if (e.DataColumn.FieldName == "PEMH_Name")
            {
                ASPxHyperLink link = (ASPxHyperLink)GridSearch.FindRowCellTemplateControl(e.VisibleIndex, GridSearch.DataColumns["PEMH_Name"] as GridViewDataColumn, "PEMH_Name");

                if (link != null)
                {
                    string PEMH_RowId = GridSearch.GetRowValues(e.VisibleIndex, "PEMH_RowId").ToString();
                    link.ClientInstanceName = "PEMH_Name" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: PemeriksaanSelected('" + PEMH_RowId + "');";
                }
            }
        }

        protected void cbp_Ref_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            DataTable Dt = new DataTable();
            PemeriksaanMethods.V_Pemeriksaan_Header(ref Dt, Ref_RowId.Text);

            if (Dt.Rows.Count == 1)
            {
                Ref_Status.Text = Dt.Rows[0]["PEMH_Status"].ToString();
                Ref_RefNumber.Text = Dt.Rows[0]["PEMH_RefNumber"].ToString();
                Ref_LastModDate.Date = Convert.ToDateTime(Dt.Rows[0]["PEMH_LastModDate"]);
            }
        }
    }
}