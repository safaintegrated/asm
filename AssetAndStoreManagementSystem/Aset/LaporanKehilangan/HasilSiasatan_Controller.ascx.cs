using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Data;
using Core.Aset.LaporanKehilangan;
using Core.Email;
using Core.PengurusanSistem;

namespace AssetAndStoreManagementSystem.Aset.LaporanKehilangan
{
    public partial class HasilSiasatan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_HPP_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_HPP.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "LOAD": LoadMode(); break;
                case "SAVE": SavePostMode(0); break;
                case "POST": SavePostMode(1); break;
            }
        }

        void LoadMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = LaporanKehilanganMethods.V_LaporanKehilangan_InvestigatorReport(HPP_ProcessId.Text, HPP_Rev.Text, ref Dt);

                if (DbErr == string.Empty)
                {
                    if (Dt.Rows.Count == 1)
                    {
                        EmployeeName.Text = Dt.Rows[0]["EmployeeName"].ToString();
                        PTJ_Name.Text = Dt.Rows[0]["PTJ_Name"].ToString();
                        LKIR_Telephone.Text = Dt.Rows[0]["LKIR_Telephone"].ToString();
                        LKIR_PtjId.Text = Dt.Rows[0]["LKIR_PtjId"].ToString();
                        LKIR_InvestigratorEmpId.Text = Dt.Rows[0]["LKIR_InvestigratorEmpId"].ToString();
                        LKIR_ReportDate.Date = Convert.ToDateTime(Dt.Rows[0]["LKIR_ReportDate"]);
                        LKIR_ReportSummary.Text = Dt.Rows[0]["LKIR_ReportSummary"].ToString();
                        cbp_HPP.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                        cbp_HPP.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_HPP.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_HPP.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void SavePostMode(int Mode)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable DtCurrUser = new DataTable();
                DataTable Dt = new DataTable();
                DataTable DtPegawaiAset = new DataTable();

                try
                {                    
                    PenggunaSistemMethods.GetCurrUserInformation(ticket.Name, ref DtCurrUser);

                    if (DtCurrUser.Rows.Count == 1)
                    {
                        EmployeeName.Text = DtCurrUser.Rows[0]["EmployeeName"].ToString();
                        PTJ_Name.Text = DtCurrUser.Rows[0]["PTJ_Name"].ToString();
                        LKIR_Telephone.Text = DtCurrUser.Rows[0]["EmployeeTelephone"].ToString();
                        LKIR_PtjId.Text = DtCurrUser.Rows[0]["EmpPtjId"].ToString();
                        LKIR_InvestigratorEmpId.Text = DtCurrUser.Rows[0]["EmployeeId"].ToString();

                        FormPpReportTvp(ref Dt);
                        PopulatePpReportTvp(ref Dt);

                        string RefNumber = string.Empty;
                        string DbErr = LaporanKehilanganMethods.SP_LaporanKehilangan_LaporanPegawaiPenyiasat(ticket.Name, ref Dt, Mode, ref RefNumber);

                        if (DbErr == string.Empty)
                        {
                            cbp_HPP.JSProperties["cpErrMsg"] = string.Empty;

                            if (Mode == 1)
                            {
                                LaporanKehilanganMethods.SP_LaporanKerosakan_GetPegawaiAset(HPP_ProcessId.Text, ref DtPegawaiAset, Convert.ToInt32(HPP_Rev.Text));

                                if (DtPegawaiAset.Columns.Count > 0)
                                {
                                    string MailErr = SendMail.LaporanKerosakan_Surcaj(ref DtPegawaiAset, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), DtCurrUser.Rows[0]["EmployeeName"].ToString(), RefNumber);

                                    if (MailErr == string.Empty)
                                        cbp_HPP.JSProperties["cpMailErr"] = string.Empty;
                                    else
                                        cbp_HPP.JSProperties["cpMailErr"] = "Laporan Pegawai Penyiasat berjaya dihantar tetapi sistem menghadapi masalah ketika menghantar emel notifikasi.<br><br>Masalah: " + MailErr;
                                }
                                else
                                    cbp_HPP.JSProperties["cpMailErr"] = "Sistem tidak dapat memperoleh maklumat Pegawai Aset.";
                            }
                        }
                        else
                        {
                            string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                            errMsg = errMsg.Replace("BR", "<br><br>");
                            cbp_HPP.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                        }
                    }
                    else
                        cbp_HPP.JSProperties["cpErrMsg"] = "Sistem gagal mendapatkan maklumat Pegawai Pemeriksa.";
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_HPP.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
                finally
                { Dt.Dispose(); DtCurrUser.Dispose(); }
            }
            else
            { cbp_HPP.JSProperties["cpErrMsg"] = "Session Expired."; }           
        }

        void FormPpReportTvp(ref DataTable Dt)
        {
            DataColumn LKIR_ProcessId = Dt.Columns.Add("LKIR_ProcessId", typeof(String));
            DataColumn LKIR_Revision = Dt.Columns.Add("LKIR_Revision", typeof(Int32));
            DataColumn LKIR_InvestigratorEmpId = Dt.Columns.Add("LKIR_InvestigratorEmpId", typeof(String));
            DataColumn LKIR_PtjId = Dt.Columns.Add("LKIR_PtjId", typeof(Int32));
            DataColumn LKIR_Telephone = Dt.Columns.Add("LKIR_Telephone", typeof(String));
            DataColumn LKIR_ReportDate = Dt.Columns.Add("LKIR_ReportDate", typeof(DateTime));
            DataColumn LKIR_ReportSummary = Dt.Columns.Add("LKIR_ReportSummary", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulatePpReportTvp(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["LKIR_ProcessId"] = HPP_ProcessId.Text;
            Dr["LKIR_Revision"] = Convert.ToInt32(HPP_Rev.Text);
            Dr["LKIR_InvestigratorEmpId"] = LKIR_InvestigratorEmpId.Text;
            Dr["LKIR_PtjId"] = Convert.ToInt32(LKIR_PtjId.Text);
            Dr["LKIR_Telephone"] = LKIR_Telephone.Text;
            Dr["LKIR_ReportDate"] = LKIR_ReportDate.Date;
            Dr["LKIR_ReportSummary"] = LKIR_ReportSummary.Text.Trim();
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        
    }
}