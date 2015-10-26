using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Configuration;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Kakitangan
{
    public partial class Rpt_Kakitangan : DevExpress.XtraReports.UI.XtraReport
    {
        public Rpt_Kakitangan()
        {
            InitializeComponent();
        }

        private void lblAppName_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lblAppName.Text = ConfigurationManager.AppSettings["ProgramTitle"].ToString();
        }

    }
}
