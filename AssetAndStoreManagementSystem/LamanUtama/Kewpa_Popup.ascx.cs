﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.LamanUtama
{
    public partial class Kewpa_Popup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_KewpaRpt_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            Session["ReportName"] = e.Parameter;
        }
    }
}