using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Shared.PurchaseRequest
{
    public partial class Tab_AliranKerja_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridPrWorkflow_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridPRWorkflow.DataBind();
        }

        protected void WorkFlowDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (Wf_ProcessId.Text == "")
                e.Cancel = true;
            else
                e.Command.Parameters["@PRH_ProcessId_ProcessId"].Value = Wf_ProcessId.Text;
        }
    }
}