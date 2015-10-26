using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Aset.Pelupusan
{
    public partial class Pelupusan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoadEvents();", true);
            }
        }
    }
}