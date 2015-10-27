using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.DaftarStok
{
    public partial class DaftarStok_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }
        }

        protected void ASPxTextBox16_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ASPxFormLayout1_E31_TextChanged(object sender, EventArgs e)
        {

        }

        protected void gvSearch_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            gvSearch.DataBind();
        }

        protected void cbp_Report_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            Session["ReportName"] = e.Parameter;

            switch (e.Parameter)
            {
                case "STOR-DAFTARSTOK-KEW.PS-3":
                case "STOR-DAFTARSTOK-KEW.PS-3B":
                case "STOR-DAFTARSTOK-KEW.PS-4":
                case "STOR-DAFTARSTOK-KEW.PS-5":
                case "STOR-DAFTARSTOK-KEW.PS-13":
                    Session["LocationId"] = Tab_SenaraiStok1.ReportLocationId;
                    Session["StockId"] = Tab_SenaraiStok1.ReportStockId;
                    break;
                default:
                    break;

            }


        }
    }
}