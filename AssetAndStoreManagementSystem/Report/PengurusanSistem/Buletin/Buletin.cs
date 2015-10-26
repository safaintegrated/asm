using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.IO;
using System.Configuration;

namespace AssetAndStoreManagementSystem.Report.PengurusanSistem.Buletin
{
    public partial class Buletin : DevExpress.XtraReports.UI.XtraReport
    {
        public Buletin()
        {
            InitializeComponent();
        }

        private void xrPictureBox1_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            string FileName = GetCurrentColumnValue("BLT_Image").ToString();

            string ImagePath = Path.Combine(ConfigurationManager.AppSettings["ImageUploadFolder"].ToString(), FileName);

            if (File.Exists(System.Web.HttpContext.Current.Server.MapPath(ImagePath)))
                xrPictureBox1.ImageUrl = ImagePath;
            else
            {
                xrPictureBox1.ImageUrl = "~/Public/Images/Others/BuletinDefaulImage.png";
                xrPictureBox1.Sizing = DevExpress.XtraPrinting.ImageSizeMode.StretchImage;
            }
                
        }

    }
}
