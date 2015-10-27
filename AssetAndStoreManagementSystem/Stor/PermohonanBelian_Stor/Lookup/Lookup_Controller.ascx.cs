using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.Stor.PermohonanBelian_Stor.Lookup
{
    public partial class Lookup_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchPRHeader_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "PRH_Purpose")
            {
                ASPxHyperLink link = (ASPxHyperLink)SearchPRHeader.FindRowCellTemplateControl(e.VisibleIndex, SearchPRHeader.DataColumns["PRH_Purpose"] as GridViewDataColumn, "PRH_Purpose");

                if (link != null)
                {
                    string ProcessId = SearchPRHeader.GetRowValues(e.VisibleIndex, "PRH_ProcessId").ToString();
                    string Revision = SearchPRHeader.GetRowValues(e.VisibleIndex, "PRH_Revision").ToString();
                    link.Text = e.CellValue.ToString();
                    link.ClientInstanceName = "PRH_Purpose_" + e.VisibleIndex.ToString();
                    link.NavigateUrl = "javascript: PR_HeaderSelected('" + ProcessId + "','"+ Revision +"');";
                }
            }
        }
    }
}