using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Shared.PurchaseRequest
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
            //switch (e.Parameter)
            //{
            //    case "1": cbp_FormNextItemNumber.JSProperties["cpNextItemNumber"] = 1; break;   //Aset Baharu
            //    case "2": cbp_FormNextItemNumber.JSProperties["cpNextItemNumber"] = 2; break;   //Penyelenggaraan
            //    case "3": cbp_FormNextItemNumber.JSProperties["cpNextItemNumber"] = 3; break;   //Alat Ganti
            //    case "4": cbp_FormNextItemNumber.JSProperties["cpNextItemNumber"] = 4; break;   //Tambahan
            //    case "5": cbp_FormNextItemNumber.JSProperties["cpNextItemNumber"] = 5; break;   //Stok
            //    case "6": cbp_FormNextItemNumber.JSProperties["cpNextItemNumber"] = 6; break;   //Lain-lain
            //}
            //cbp_FormNextItemNumber.JSProperties["cpNextItemNumber"] = 1;

        }

        protected void TabItemGrid_CustomCallback1(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            TabItemGrid.DataBind();

        }

        protected void cbpRefreshList_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            TabItemGrid.DataBind();
        }
    }
}