using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Configuration;

namespace AssetAndStoreManagementSystem.PengurusanSistem.KumpulanPenggunaSistem
{
    public partial class Rpt_KumpulanPenggunaSistem : DevExpress.XtraReports.UI.XtraReport
    {
        public Rpt_KumpulanPenggunaSistem()
        {
            InitializeComponent();
        }

        private void lblAppName_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lblAppName.Text = ConfigurationManager.AppSettings["ProgramTitle"].ToString();
        }

        private void xrSubreport1_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            ((XRSubreport)sender).ReportSource.Parameters["UserGroupId"].Value = Convert.ToInt32(GetCurrentColumnValue("UserGroupId"));
        }

    }
}
