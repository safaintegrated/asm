using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.PenggunaSistem.Tugasan
{
    public partial class Tugasan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MyTaskDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
             FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                e.Command.Parameters["@MT_Receipient"].Value = Convert.ToInt32(ticket.Name);
            }
            else
                e.Cancel = true;
        }

        protected void MyTaskGrid_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            MyTaskGrid.DataBind();
        }

        protected void MyTaskGrid_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "MT_Ref")
            {
                ASPxHyperLink MT_Ref = (ASPxHyperLink)MyTaskGrid.FindRowCellTemplateControl(e.VisibleIndex, MyTaskGrid.DataColumns["MT_Ref"] as GridViewDataColumn, "MT_Ref");

                if (MT_Ref != null)
                {
                    MT_Ref.ClientInstanceName = "MT_Ref_" + e.VisibleIndex.ToString();
                    MT_Ref.Text = e.CellValue.ToString();

                    string MyTaskType = MyTaskGrid.GetRowValues(e.VisibleIndex, "MT_Type").ToString();

                    string ProcessId = MyTaskGrid.GetRowValues(e.VisibleIndex, "MT_ProcessId").ToString();
                    string Revision = MyTaskGrid.GetRowValues(e.VisibleIndex, "MT_Revision").ToString();

                    if (MyTaskType == "1")
                    { MT_Ref.NavigateUrl = "javascript: Pr_Approval('" + ProcessId + "', '" + Revision + "');"; }
                    else if (MyTaskType == "2")
                    { MT_Ref.NavigateUrl = "javascript: GRN_Approval('" + ProcessId + "', '" + Revision + "');"; }
                    else if (MyTaskType == "3")
                    { MT_Ref.NavigateUrl = "javascript: AK_Approval('" + ProcessId + "');"; }
                    else if (MyTaskType == "4")
                    { MT_Ref.NavigateUrl = "javascript: PP_Approval('" + ProcessId + "', '" + Revision + "');"; }
                    else if (MyTaskType == "5")
                    { MT_Ref.NavigateUrl = "javascript: LK_Approval('" + ProcessId + "', '" + Revision + "');"; }

                }
            }
        }
    }
}