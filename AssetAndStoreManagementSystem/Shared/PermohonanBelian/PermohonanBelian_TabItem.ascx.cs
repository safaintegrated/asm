using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Shared.PermohonanBelian
{
    public partial class PermohonanBelian_TabItem : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TabItemGrid_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            TabItemGrid.DataBind();
        }

        protected void cbp_FormNextItemNumber_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_FormNextItemNumber.JSProperties["cpPurchaseType"] = e.Parameter;
            cbp_FormNextItemNumber.JSProperties["cpNextItemNumber"] = 1;

        }
    }
}