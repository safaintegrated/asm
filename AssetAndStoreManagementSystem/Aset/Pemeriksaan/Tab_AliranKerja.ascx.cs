using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Aset.Pemeriksaan
{
    public partial class Tab_AliranKerja : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void WorkFlowDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (PEM_WFD_PEMH_RowId.Text == "")
                e.Cancel = true;
            else
                e.Command.Parameters["@PEM_WFD_PEMH_RowId"].Value = Convert.ToInt32(PEM_WFD_PEMH_RowId.Text);
        }

        protected void GridWorkflow_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridWorkflow.DataBind();
        }
    }
}