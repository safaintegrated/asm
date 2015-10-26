using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Configuration;

namespace AssetAndStoreManagementSystem.PengurusanSistem.PenggunaSistem
{
    public partial class Rpt_PenggunaSistem : DevExpress.XtraReports.UI.XtraReport
    {
        public Rpt_PenggunaSistem()
        {
            InitializeComponent();
        }

        private void lblAppName_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lblAppName.Text = ConfigurationManager.AppSettings["ProgramTitle"].ToString();
        }     

    }
}
