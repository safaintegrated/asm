using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Configuration;
using System.Data;
using System.Web.Security;


namespace AssetAndStoreManagementSystem.Shared.TerimaanBarang.Lookup
{
    public partial class Lookup_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridGrnLookup_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridGrnLookup.DataBind();
        }

        protected void GrnLookupDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {

                e.Command.Parameters["@CurrUser"].Value = Convert.ToInt32(ticket.Name);
            }
            else
                e.Cancel = true;
        }

        protected void GridGrnLookup_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "GRNH_PrNumber")
            {
                ASPxHyperLink link = (ASPxHyperLink)GridGrnLookup.FindRowCellTemplateControl(e.VisibleIndex, GridGrnLookup.DataColumns["GRNH_PrNumber"] as GridViewDataColumn, "GRNH_PrNumber");

                if (link != null)
                {
                    string ProcessId = GridGrnLookup.GetRowValues(e.VisibleIndex, "GRNH_ProcessId").ToString();
                    string Revision = GridGrnLookup.GetRowValues(e.VisibleIndex, "GRNH_Revision").ToString();

                    link.ClientInstanceName = "GRNH_PrNumber" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: SelectGrn('" + ProcessId + "','" + Revision + "');";
                }
            }
        }
    }
}