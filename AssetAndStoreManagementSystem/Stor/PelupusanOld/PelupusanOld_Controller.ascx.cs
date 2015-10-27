using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.PelupusanOld
{
    public partial class PelupusanOld_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxPageControl1_ActiveTabChanged(object source, DevExpress.Web.TabControlEventArgs e)
        {

        }

        protected void GridSearchPelupusan_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearchPelupusan.DataBind();
        }

        protected void GridSearchPelupusan_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "PelupusanStatus")
            {
                GridViewDataColumn gvc = GridSearchPelupusan.DataColumns["PelupusanStatus"] as GridViewDataColumn;

                var obj = GridSearchPelupusan.FindRowCellTemplateControl(e.VisibleIndex, gvc, "PelupusanStatus");

                ASPxHyperLink link = (ASPxHyperLink)obj;

                //ASPxHyperLink link = (ASPxHyperLink)GridSearch.FindRowCellTemplateControl(e.VisibleIndex, GridSearch.DataColumns["Nama Pemeriksaan"] as GridViewDataColumn, "Nama Pemeriksaan");

                if (link != null)
                {
                    string PelupusanId = GridSearchPelupusan.GetRowValues(e.VisibleIndex, "PelupusanId").ToString();
                    link.ClientInstanceName = "PelupusanStatus" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: PelupusanSelected('" + PelupusanId + "');";
                }
            }
        }

    }
}