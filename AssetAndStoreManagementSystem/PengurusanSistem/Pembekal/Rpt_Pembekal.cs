using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Configuration;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Pembekal
{
    public partial class Rpt_Pembekal : DevExpress.XtraReports.UI.XtraReport
    {
        public Rpt_Pembekal()
        {
            InitializeComponent();
        }

        private void lblAppName_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lblAppName.Text = ConfigurationManager.AppSettings["ProgramTitle"].ToString();
        }

    }
}
