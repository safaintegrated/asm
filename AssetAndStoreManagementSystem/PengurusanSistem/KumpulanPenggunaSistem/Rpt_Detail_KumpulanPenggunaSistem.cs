using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace AssetAndStoreManagementSystem.PengurusanSistem.KumpulanPenggunaSistem
{
    public partial class Rpt_Detail_KumpulanPenggunaSistem : DevExpress.XtraReports.UI.XtraReport
    {
        public Rpt_Detail_KumpulanPenggunaSistem()
        {
            InitializeComponent();
        }

        private void xrTableCell10_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRTableCell cell = sender as XRTableCell;

            if (Convert.ToBoolean(GetCurrentColumnValue("EnableView")))
                cell.Text = "Ya";
            else
                cell.Text = "Tidak";
        }

        private void xrTableCell14_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRTableCell cell = sender as XRTableCell;

            if (Convert.ToBoolean(GetCurrentColumnValue("EnableCreate")))
                cell.Text = "Ya";
            else
                cell.Text = "Tidak";
        }

        private void xrTableCell16_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRTableCell cell = sender as XRTableCell;

            if (Convert.ToBoolean(GetCurrentColumnValue("EnableUpdate")))
                cell.Text = "Ya";
            else
                cell.Text = "Tidak";
        }

        private void xrTableCell12_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRTableCell cell = sender as XRTableCell;

            if (Convert.ToBoolean(GetCurrentColumnValue("EnableDelete")))
                cell.Text = "Ya";
            else
                cell.Text = "Tidak";
        }

    }
}
