using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Aset.LaporanKEWPA.KEWPA05
{
    public partial class KEWPA05_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (cb_Year.Text == string.Empty || cb_PTJ.Text == string.Empty)
                e.Cancel = true;
            else
            {
                string VarStr = string.Empty;

                VarStr = "AND [RECEIVEYEAR] = " + cb_Year.Value.ToString() + " AND [PTJ_SagaCode] = '" + cb_PTJ.Value.ToString() + "' AND AIRMI_AssetInvType = 2";

                e.Command.CommandText =
                    "select " +
                    "[AIRMI_UniqueId] " +
                    ",ROW_NUMBER() OVER(ORDER BY [AIRMI_RegistrationNumber]) as RowNum " +
                    ",[AIRMI_RegistrationNumber] " +
                    ",[AIRMI_Desc] " +
                    ",[AIRMI_ReceivedDate] " +
                    ",[AIRMI_PurchasePrice] " +
                    "from V_AssetInventoryRegistration_MainInformation " +
                    "where 1=1 " +
                    VarStr;
            }
        }

        protected void MainGrid_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            MainGrid.DataBind();
        }

        protected void cbp_Print_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            Session["ReportName"] = "KEW-PA5";
            Session["ReceiveYear"] = cb_Year.Value.ToString();
            Session["PtjSagaCode"] = cb_PTJ.Value.ToString();
        }
    }
}