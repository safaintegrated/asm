using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Web.Security;
using Core.Aset.Pinjaman;
using Core.Common;

namespace AssetAndStoreManagementSystem.Aset.Pinjaman
{
    public partial class Tab_Pengeluaran : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridWithdrawalList_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridWithdrawalList.DataBind();
        }

        protected void WithdrawListDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@PPD_ProcessId"].Value = txtWithdrawProcessId.Text;

            if (txtWithdrawRev.Text != "")
                e.Command.Parameters["@PPD_Revision"].Value = Convert.ToInt32(txtWithdrawRev.Text);
            else
                e.Command.Parameters["@PPD_Revision"].Value = 0;
        }

        protected void cbp_AssetOfficerWithdraw_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_AssetOfficerWithdraw.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "APPROVE": PengeluaranMode(); break;
                case "LOAD": LoadMode(); break;
                case "CHECK": CheckMode(); break;
            }
        }

        void PengeluaranMode()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                try
                {
                    string AssetOfficerName = string.Empty;
                    string WfCount = string.Empty;
                    string DbErr = PinjamanMethods.SP_PermohonanPinjaman_Pengeluaran(ticket.Name, txtWithdrawProcessId.Text, txtWithdrawRev.Text, ref AssetOfficerName);

                    if (DbErr == string.Empty)
                    {
                        PengeluaranAssetOfficerName.Text = AssetOfficerName;
                        PengeluaranDate.Date = DateTime.Today;
                        cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
            }
            else
                cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void LoadMode()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();

                try
                {
                 
                    string DbErr = PinjamanMethods.V_PermohonanPinjaman_Header(txtWithdrawProcessId.Text, txtWithdrawRev.Text, ref Dt);

                    if (DbErr == string.Empty)
                    {
                        if (Dt.Rows.Count == 1)
                        {
                            PengeluaranAssetOfficerName.Text = Dt.Rows[0]["PP_AssetOfficerSystemId_ApprovalName"].ToString();

                            if (Dt.Rows[0]["PP_ApprovalDate"].ToString() != "")
                            { PengeluaranDate.Date = Convert.ToDateTime(Dt.Rows[0]["PP_ApprovalDate"]); }
                            else
                            { PengeluaranDate.Value = DBNull.Value; }

                            chkAssetOfficer.Checked = true;
                            chkAssetOfficer.ClientEnabled = false;
                            btnAssetOfficerWithdraw.ClientEnabled = false;
                            
                            cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        {
                            string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                            errMsg = errMsg.Replace("BR", "<br><br>");
                            cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = errMsg + " Sistem tidak dapat mengenalpasti rekod yang ingin dibuka.";
                        }                       
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
            }
            else
                cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void CheckMode()
        {
             FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                string AssetOfficerCount = string.Empty;
                CommonMethods.SP_Common_IsAssetOfficer(ticket.Name, ref AssetOfficerCount);

                if (AssetOfficerCount == "0")
                {
                    chkAssetOfficer.ClientEnabled = false;
                    btnAssetOfficerWithdraw.ClientEnabled = false;
                }
                else
                {
                    chkAssetOfficer.ClientEnabled = true;
                    btnAssetOfficerWithdraw.ClientEnabled = false;
                }

                DataTable Dt = new DataTable();

                string DbErr = PinjamanMethods.V_PermohonanPinjaman_Header(txtWithdrawProcessId.Text, txtWithdrawRev.Text, ref Dt);

                if (DbErr == string.Empty)
                {
                    if (Dt.Rows.Count == 1)
                    {
                        PengeluaranAssetOfficerName.Text = Dt.Rows[0]["PP_AssetOfficerSystemId_ApprovalName"].ToString();

                        if (Dt.Rows[0]["PP_ApprovalDate"].ToString() != "")
                        { PengeluaranDate.Date = Convert.ToDateTime(Dt.Rows[0]["PP_ApprovalDate"]); }
                        else
                        { PengeluaranDate.Value = DBNull.Value; }

                        chkAssetOfficer.Checked = true;
                        chkAssetOfficer.ClientEnabled = false;
                        btnAssetOfficerWithdraw.ClientEnabled = false;

                        cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = errMsg + " Sistem tidak dapat mengenalpasti rekod yang ingin dibuka.";
                    }
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            else
                cbp_AssetOfficerWithdraw.JSProperties["cpErrMsg"] = "Session Expired.";            
        }

    }
}