using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Shared.TerimaanBarang
{
    public partial class Tab_AliranKerja_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridGrnWorkflow_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridGrnWorkflow.DataBind();
        }

        protected void WorkFlowDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (Wf_ProcessId.Text == "")
                e.Cancel = true;
            else
                e.Command.Parameters["@GRNH_ProcessId_ProcessId"].Value = Wf_ProcessId.Text;
        }
    }
}