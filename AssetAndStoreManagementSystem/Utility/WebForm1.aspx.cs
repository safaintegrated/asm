using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Core.Utility;

namespace AssetAndStoreManagementSystem.Utility
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxTextBox1.Text = NumberToWordsMethod.Convert(Convert.ToDecimal(ASPxSpinEdit1.Value));
        }
    }
}