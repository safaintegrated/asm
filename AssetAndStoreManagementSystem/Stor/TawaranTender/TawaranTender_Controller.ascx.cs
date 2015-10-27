using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.TawaranTender
{
    public partial class TawaranTender_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }
        }


        protected void ASPxPageControl1_ActiveTabChanged(object source, DevExpress.Web.TabControlEventArgs e)
        {

        }

        protected void GridSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearch.DataBind();
        }

        protected void GridSearch_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "NoTender")
            {
                GridViewDataColumn gvc = GridSearch.DataColumns["NoTender"] as GridViewDataColumn;

                var obj = GridSearch.FindRowCellTemplateControl(e.VisibleIndex, gvc, "NoTender");

                ASPxHyperLink link = (ASPxHyperLink)obj;

                //ASPxHyperLink link = (ASPxHyperLink)GridSearch.FindRowCellTemplateControl(e.VisibleIndex, GridSearch.DataColumns["Nama Pemeriksaan"] as GridViewDataColumn, "Nama Pemeriksaan");

                if (link != null)
                {
                    string TawaranTenderId = GridSearch.GetRowValues(e.VisibleIndex, "TawaranTenderId").ToString();
                    link.ClientInstanceName = "NoTender" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: TawaranTenderSelected('" + TawaranTenderId + "');";
                }
            }
        }
    }
}