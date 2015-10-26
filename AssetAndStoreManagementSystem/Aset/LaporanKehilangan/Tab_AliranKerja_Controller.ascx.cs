using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Aset.LaporanKehilangan
{
    public partial class Tab_AliranKerja_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void WorkFlowDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (AliranKerja_ProcessId.Text == "")
                e.Cancel = true;
            else
                e.Command.Parameters["@LKH_ProcessId"].Value = AliranKerja_ProcessId.Text; 
        }

        protected void GridAkWorkflow_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridAkWorkflow.DataBind();
        }
    }
}