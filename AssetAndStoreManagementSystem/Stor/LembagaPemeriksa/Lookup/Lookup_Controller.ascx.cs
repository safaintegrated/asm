using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Web.Security;

namespace AssetAndStoreManagementSystem.Stor.LembagaPemeriksa.Lookup
{
    public partial class Lookup_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridLookupLembagaPemeriksa_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "LPH_LembagaName")
            {
                ASPxHyperLink LPH_LembagaName = (ASPxHyperLink)GridLookupLembagaPemeriksa.FindRowCellTemplateControl(e.VisibleIndex, GridLookupLembagaPemeriksa.DataColumns["LPH_LembagaName"] as GridViewDataColumn, "LPH_LembagaName");

                if (LPH_LembagaName != null)
                {
                    string LPH_UniqueId = string.Empty;
                    LPH_UniqueId = GridLookupLembagaPemeriksa.GetRowValues(e.VisibleIndex, "LPH_UniqueId").ToString();
                    LPH_LembagaName.ClientInstanceName = "LPH_LembagaName" + e.VisibleIndex.ToString();
                    LPH_LembagaName.Text = e.CellValue.ToString();
                    LPH_LembagaName.NavigateUrl = "javascript: LembagaPemeriksaSelected('" + LPH_UniqueId + "');";
                }
            }
        }

        protected void SearchDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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
    }
}