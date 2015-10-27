using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.Stor.KategoriSubKategori
{
    public partial class AuditTrail_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridBefore_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridBefore.DataBind();
        }

        protected void GridAfter_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridAfter.DataBind();
        }

        protected void AfterDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@ProcessId"].Value = txtProcessId.Text;
        }

        protected void BeforeDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@ProcessId"].Value = txtProcessId.Text;
        }

        protected void MasterGrid_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "ModifiedBy")
            {
                ASPxHyperLink link = (ASPxHyperLink)MasterGrid.FindRowCellTemplateControl(e.VisibleIndex, MasterGrid.DataColumns["ModifiedBy"] as GridViewDataColumn, "ModifiedBy");

                if (link != null)
                {
                    string ProcessId = MasterGrid.GetRowValues(e.VisibleIndex, "ProcessId").ToString();
                    link.ClientInstanceName = "ModifiedBy" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: AuditTrailSelected('" + ProcessId + "');";
                }
            }
        }

        protected void GridHeader_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridHeader.DataBind();
        }

        protected void HeaderDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@ProcessId"].Value = txtProcessId.Text;
        }
    }
}