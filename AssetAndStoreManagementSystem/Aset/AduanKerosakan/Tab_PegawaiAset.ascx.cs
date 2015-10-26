using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;
using Core.Aset.AduanKerosakan;
using System.Configuration;
using System.Web.Security;
using Core.PengurusanSistem;
using Core.Email;

namespace AssetAndStoreManagementSystem.Aset.AduanKerosakan
{
    public partial class Tab_PegawaiAset : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_PA_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (e.Parameter == "")
            {
                DataTable Dt = new DataTable();
                AduanKerosakanMethods.V_AduanKerosakan(ref Dt, TabPA_ProcessId.Text);

                if (Dt.Rows.Count == 1)
                {
                    TabPA_PegawaiAssetName.Text = Dt.Rows[0]["AssetOfficerName"].ToString();
                    TabPA_PegawaiAssetComments.Text = Dt.Rows[0]["AK_AssetOfficerNotes"].ToString();

                    if (Dt.Rows[0]["AK_AssetOfficerConfirmationId"].ToString() != "")
                        TabPA_PegawaiAssetConfirmation.Value = Convert.ToInt32(Dt.Rows[0]["AK_AssetOfficerConfirmationId"]);
                    else
                        TabPA_PegawaiAssetConfirmation.Value = DBNull.Value;

                    if (Dt.Rows[0]["AK_AssetOfficerRecommendationId"].ToString() != "")
                        TabPA_PegawaiAssetRecommendation.Value = Convert.ToInt32(Dt.Rows[0]["AK_AssetOfficerRecommendationId"]);
                    else
                        TabPA_PegawaiAssetRecommendation.Value = DBNull.Value;
                }
            }
            else
            {
                FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
                FormsAuthenticationTicket ticket = id.Ticket;

                string PegawaiAsetNameString = string.Empty;
                PenggunaSistemMethods.GetSystemUserName(ref PegawaiAsetNameString, ticket.Name);

                TabPA_PegawaiAssetName.Text = PegawaiAsetNameString;
            }
        }

        protected void cbp_PegawaiAsetPosting_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {                
                DataTable PostDt = new DataTable();

                try
                {
                    string err = AduanKerosakanMethods.SP_AduanKerosakan_PegawaiAssetConfirmation(TabPA_ProcessId.Text, ticket.Name, Convert.ToInt32(TabPA_PegawaiAssetConfirmation.Value), Convert.ToInt32(TabPA_PegawaiAssetRecommendation.Value), TabPA_PegawaiAssetComments.Text.Trim());

                    if (err == "")
                    {
                        string PegawaiAsetNameString = string.Empty;
                        PenggunaSistemMethods.GetSystemUserName(ref PegawaiAsetNameString, ticket.Name);

                        string RefNumber = string.Empty;
                        AduanKerosakanMethods.GetAduanKerosakanRefNumber(ref RefNumber, TabPA_ProcessId.Text);

                        if (Convert.ToInt32(TabPA_PegawaiAssetConfirmation.Value) == 1)
                        {
                            //rosak
                            AduanKerosakanMethods.SP_AduanKerosakan_GetKetuaPtjDetails(TabPA_ProcessId.Text, ref PostDt);

                            string EmailError = SendMail.AduanKerosakan_NotifyKetuaPtj(ref PostDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), RefNumber, PegawaiAsetNameString);

                            if (EmailError == string.Empty)
                            {                                
                                cbp_PegawaiAsetPosting.JSProperties["cpMailError"] = string.Empty;
                            }
                            else
                                cbp_PegawaiAsetPosting.JSProperties["cpMailError"] = EmailError;
                        }
                        else
                        {
                            //tidak rosak
                            AduanKerosakanMethods.SP_AduanKerosakan_GetSenderDetails(TabPA_ProcessId.Text, ref PostDt);

                            string EmailError = SendMail.AduanKerosakan_NotifyKetuaPtj(ref PostDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), RefNumber, PegawaiAsetNameString);

                            if (EmailError == string.Empty)
                            {
                                cbp_PegawaiAsetPosting.JSProperties["cpMailError"] = string.Empty;
                            }
                            else
                                cbp_PegawaiAsetPosting.JSProperties["cpMailError"] = EmailError;
                        }

                        cbp_PegawaiAsetPosting.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_PegawaiAsetPosting.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_PegawaiAsetPosting.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
                finally
                { PostDt.Dispose(); }           
                
            }
            else
            {
                cbp_PegawaiAsetPosting.JSProperties["cpErrMsg"] = "Session Expired.";
            }
        }
    }
}