using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Core.QRCode;
using System.Configuration;

namespace AssetAndStoreManagementSystem.Shared.TestGenerateQR
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            string ImageFileName = System.IO.Path.Combine(ConfigurationManager.AppSettings["QrCodeLocation"].ToString(), TxtCode.Text.Trim() + ".png");
            string ImagePath = Server.MapPath(ImageFileName);
            
            string err = QrCodeMethods.GenerateBarcode(TxtCode.Text.Trim(), ImagePath);

            if (err != "")
            {
                err = err.Replace('\\',' ');
                err = err.Replace('/',' ');
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "alert('" + err + "');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "QrCodeGenerationSuccess();", true);
            }
        }

        protected void cbp_Print_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string ImageFileName = System.IO.Path.Combine(ConfigurationManager.AppSettings["QrCodeLocation"].ToString(), TxtCode.Text.Trim() + ".png");
            string ImagePath = Server.MapPath(ImageFileName);
            string LabelPathFileName = System.IO.Path.Combine(ConfigurationManager.AppSettings["QrCodeLocation"].ToString(), "Label"+TxtCode.Text.Trim() + ".png");
            string LabelPath = Server.MapPath(LabelPathFileName);

            string LogoFileName = System.IO.Path.Combine(ConfigurationManager.AppSettings["SystemLogoLocation"].ToString(), "System.png");
            string LogoPath = Server.MapPath(LogoFileName);

            Session["ReportName"] = "QrLabel";
            Session["LabelText"] = TxtCode.Text.Trim();
            Session["QrCodeImageURL"] = ImagePath;
            Session["LabelPath"] = LabelPath;
            Session["SystemLogoImageURL"] = LogoPath; 
            DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/Report/Viewer/Index.aspx");
        }
    }
}