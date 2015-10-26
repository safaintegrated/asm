using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using DevExpress.DataAccess.Sql;


//reports
using AssetAndStoreManagementSystem.PengurusanSistem.PenggunaSistem;  //system user report
using AssetAndStoreManagementSystem.PengurusanSistem.Kakitangan;  //staff report
using AssetAndStoreManagementSystem.PengurusanSistem.Pembekal;  //vendor report
using AssetAndStoreManagementSystem.PengurusanSistem.Lokasi;  //lokasi
using AssetAndStoreManagementSystem.PengurusanSistem.PegawaiAset;  //pegawai aset
using AssetAndStoreManagementSystem.PengurusanSistem.Buletin;  //buletin

namespace AssetAndStoreManagementSystem.Report
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            switch (Session["ReportName"].ToString())
            {
                case "SystemUser": GenerateSystemUserReport(); break;
                case "Staff": GenerateStaffReport(); break;
                case "Vendor": GenerateVendorReport(); break;
                case "PTJList": GeneratePTJList(); break;
                case "FPJBList": GenerateFPJBList(); break;
                case "BUILDList": GenerateBUILDList(); break;
                case "FLOORList": GenerateFLOORList(); break;
                case "SPACEList": GenerateSPACEList(); break;
                case "PegawaiAset": GeneratePegawaiAsetList(); break;
                case "Buletin": GenerateBuletinList(); break;
               
            }
        }

        void GenerateSystemUserReport()
        {
            Rpt_PenggunaSistem rpt = new Rpt_PenggunaSistem();
            DocumentViewer.Report = rpt;
            DocumentViewer.DataBind();
        }

        void GenerateStaffReport()
        {
            Rpt_Kakitangan rpt = new Rpt_Kakitangan();
            DocumentViewer.Report = rpt;
            DocumentViewer.DataBind();
        }

        void GenerateVendorReport()
        {
            Rpt_Pembekal report = new Rpt_Pembekal();           

            DevExpress.DataAccess.Sql.SqlDataSource ds = report.DataSource as DevExpress.DataAccess.Sql.SqlDataSource;
            TableQuery tq = ds.Queries[0] as TableQuery;

            if (Session["apsu_lname"] != null)
            {
                report.Parameters.Add(new DevExpress.XtraReports.Parameters.Parameter() { Name = "apsu_lname", Type = typeof(String), Value = "%" + Session["apsu_lname"].ToString() + "%", Description = "apsu_lname" });
                DevExpress.DataAccess.Sql.QueryParameter queryParameter1 = new DevExpress.DataAccess.Sql.QueryParameter();
                queryParameter1.Name = "p1";
                queryParameter1.Type = typeof(DevExpress.DataAccess.Expression);
                queryParameter1.Value = new DevExpress.DataAccess.Expression("[Parameters.apsu_lname]");
                tq.Parameters.Add(queryParameter1);
                tq.FilterString = "apsu_lname LIKE ?p1";
                report.Parameters["apsu_lname"].Visible = false;
            }

            report.RequestParameters = false;
            DocumentViewer.Report = report;
        }

        void GeneratePTJList()
        {
            Rpt_PTJ rpt = new Rpt_PTJ();
            DocumentViewer.Report = rpt;
            DocumentViewer.DataBind();
        }

        void GenerateFPJBList()
        {
            Rpt_FPJB rpt = new Rpt_FPJB();
            DocumentViewer.Report = rpt;
            DocumentViewer.DataBind();
        }

        void GenerateBUILDList()
        {
            Rpt_Building rpt = new Rpt_Building();
            DocumentViewer.Report = rpt;
            DocumentViewer.DataBind();
        }

        void GenerateFLOORList()
        {
            Rpt_Floor rpt = new Rpt_Floor();
            DocumentViewer.Report = rpt;
            DocumentViewer.DataBind();
        }

        void GenerateSPACEList()
        {
            Rpt_Space rpt = new Rpt_Space();
            DocumentViewer.Report = rpt;
            DocumentViewer.DataBind();
        }

        void GeneratePegawaiAsetList()
        {
            Rpt_PegawaiAset rpt = new Rpt_PegawaiAset();
            DocumentViewer.Report = rpt;
            DocumentViewer.DataBind();
        }

        void GenerateBuletinList()
        {
            Rpt_Buletin rpt = new Rpt_Buletin();
            DocumentViewer.Report = rpt;
            DocumentViewer.DataBind();
        }
    }
}