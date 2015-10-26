using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.Aset.Pendaftaran
{
    public partial class Pendaftaran_Location : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridAssetInvPenempatan_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridAssetInvPenempatan.DataBind();
        }

        protected void PenempatanDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (PenempatanParentType.Text == "" || PenempatanParentUniqueId.Text == "")
                e.Cancel = true;
            else
            {
                e.Command.Parameters["@ParentType"].Value = PenempatanParentType.Text;
                e.Command.Parameters["@ParentId"].Value = PenempatanParentUniqueId.Text;
            }
        }

        protected void GridAssetInvPenempatan_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            GridAssetInvPenempatan.ExpandAll();
        }
    }
}