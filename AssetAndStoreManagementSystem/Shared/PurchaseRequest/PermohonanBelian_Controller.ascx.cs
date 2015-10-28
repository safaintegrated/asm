using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.Shared.PurchaseRequest
{
    public partial class PermohonanBelian_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                UpdateUserInfo();
            }
        }

        private void UpdateUserInfo()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;
            var employee = Data.Models.EmployeeModel.FindByUserId(ticket.Name);
            txtOfficerName.Text = employee.FullName;
            txtPtjName.Text = employee.PtjName;
            txtPtjId.Text = employee.PtjCode;

        }

        protected void MainGridDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
                e.Command.Parameters["@CurrUser"].Value = Convert.ToInt32(ticket.Name);
            else
                e.Cancel = true;
        }

        protected void MainGrid_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            MainGrid.DataBind();
        }

        protected void MainGrid_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Description")
            {
                ASPxHyperLink PRH_Purpose = (ASPxHyperLink)MainGrid.FindRowCellTemplateControl(e.VisibleIndex, MainGrid.DataColumns["Description"] as GridViewDataColumn, "ASPxHyperLink2");

                if (PRH_Purpose != null)
                {
                    string PRH_ProcessId = MainGrid.GetRowValues(e.VisibleIndex, "ProcessId").ToString();
                    string PRH_Revision = MainGrid.GetRowValues(e.VisibleIndex, "RevisionNumber").ToString();
                    PRH_Purpose.Text = e.CellValue.ToString();
                    PRH_Purpose.NavigateUrl = "javascript: ViewPr('" + PRH_ProcessId + "','" + PRH_Revision + "');";
                }
            }
        }
    }
}