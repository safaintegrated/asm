using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Kakitangan
{
    public partial class Kakitangan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }    
        }

        protected void cbp_Report_Callback(object sender, CallbackEventArgsBase e)
        {
            Session["ReportName"] = "Staff";
        }
    }
}