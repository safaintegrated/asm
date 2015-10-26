using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Configuration;
using System.IO;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Buletin
{
    public partial class Rpt_Buletin : DevExpress.XtraReports.UI.XtraReport
    {
        public Rpt_Buletin()
        {
            InitializeComponent();
        }

        private void lblAppName_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lblAppName.Text = ConfigurationManager.AppSettings["ProgramTitle"].ToString();
        }

        private void xrPictureBox2_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            string ImagePath = Path.Combine(ConfigurationManager.AppSettings["ImageUploadFolder"].ToString(), GetCurrentColumnValue("BLT_Image").ToString());

            if (File.Exists(System.Web.HttpContext.Current.Server.MapPath(ImagePath)))
                xrPictureBox2.ImageUrl = ImagePath;
            else
                xrPictureBox2.ImageUrl = "~/Public/Images/Others/BuletinDefaulImage.png";
        }

    }
}
