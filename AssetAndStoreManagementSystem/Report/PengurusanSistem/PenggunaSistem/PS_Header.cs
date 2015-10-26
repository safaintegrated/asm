using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using Core.PengurusanSistem;

namespace AssetAndStoreManagementSystem.Report.PengurusanSistem.PenggunaSistem
{
    public partial class PS_Header : DevExpress.XtraReports.UI.XtraReport
    {
        public PS_Header()
        {
            InitializeComponent();
        }

        private void xrSubreport1_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            int RoleCount = 0;

            PenggunaSistemMethods.CountSystemUserRole(ref RoleCount, GetCurrentColumnValue("UserSystemId").ToString());

            if (RoleCount == 0)
                xrSubreport1.Visible = false;
            else
            { 
                xrSubreport1.Visible = true;
                ((XRSubreport)sender).ReportSource.Parameters["PARAM_UserSystemId"].Value = Convert.ToInt32(GetCurrentColumnValue("UserSystemId"));
            }                
        }

    }
}
