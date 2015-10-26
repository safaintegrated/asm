using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Configuration;
using System.Web.Security;

namespace AssetAndStoreManagementSystem.Aset.Penempatan.Lookup
{
    public partial class Lookup_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridSearchPenempatan_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "PH_StatusText")
            {
                ASPxHyperLink PH_StatusText = (ASPxHyperLink)GridSearchPenempatan.FindRowCellTemplateControl(e.VisibleIndex, GridSearchPenempatan.DataColumns["PH_StatusText"] as GridViewDataColumn, "PH_StatusText");

                if (PH_StatusText != null)
                {
                    string PH_ProcessId = GridSearchPenempatan.GetRowValues(e.VisibleIndex, "PH_ProcessId").ToString();
                    PH_StatusText.ClientInstanceName = "PH_StatusText" + e.VisibleIndex.ToString();
                    PH_StatusText.Text = e.CellValue.ToString();
                    PH_StatusText.NavigateUrl = "javascript: PenempatanSelected('" + PH_ProcessId + "');";
                }
            }
        }

        protected void SearchDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            { e.Command.Parameters["@CurrUser"].Value = Convert.ToInt32(ticket.Name); }
            else
                e.Cancel = true;
        }
    }
}