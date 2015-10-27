using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;
using Core.PengurusanSistem;
using System.Configuration;
using System.Web.Security;
using System.IO;
using Core.Shared;
using Core.Email;

namespace AssetAndStoreManagementSystem.Stor.PermohonanBelian_Stor
{
    public partial class PermohonanBelian_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["ProcessId"] == null)
                {
                    OpenFromMyTask.Text = "0";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "BlankStart();", true);
                }
                else
                {
                    OpenFromMyTask.Text = "1";
                    string[] Params = Request.QueryString["ProcessId"].ToString().Split('*');
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "LoadSelectedPr('" + Params[0].ToString() + "','" + Params[1].ToString() + "');", true);
                }
            }
        }

        protected void PageControl_ActiveTabChanged(object source, DevExpress.Web.TabControlEventArgs e)
        {

        }

        protected void cbp_AddNewPR_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                try
                {
                    string ProcessId = DateTime.Now.ToString("yyMMdd-HHmmss");
                    string err = PermohonanBelianMethods.SP_PermohonanBelian_CreateNewEntry(ticket.Name, ProcessId);

                    if (err == "")
                    {
                        string StatusDesc = string.Empty;
                        PermohonanBelianMethods.GetStatusDescription(ref StatusDesc, "2");
                        cbp_AddNewPR.JSProperties["cpErrMsg"] = string.Empty;
                        cbp_AddNewPR.JSProperties["cpProcessId"] = ProcessId;
                        cbp_AddNewPR.JSProperties["cpRevision"] = 1;
                        cbp_AddNewPR.JSProperties["cpStatusText"] = StatusDesc;
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_AddNewPR.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_AddNewPR.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
            }
            else
            {
                cbp_AddNewPR.JSProperties["cpErrMsg"] = "Session Expired.";
            }
        }

        protected void UploadManagerDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (PRH_ProcessId.Text == "")
                e.Cancel = true;
            else
            {
                e.Command.Parameters["@ProcessId"].Value = PRH_ProcessId.Text;
                e.Command.Parameters["@TransId"].Value = 1;
            }
        }

        protected void PRUpload_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                try
                {
                    string UploadLocation = ConfigurationManager.AppSettings["DocumentUploadPath"].ToString();
                    string NewFileName = DateTime.Now.ToString("ddMMyyHHmmss") + e.UploadedFile.FileName;
                    string FileFullPath = Path.Combine(Server.MapPath(UploadLocation), NewFileName);
                    e.UploadedFile.SaveAs(FileFullPath);



                    PRUpload.JSProperties["cpErrMsg"] = string.Empty;
                }
                catch (Exception err)
                {
                    PRUpload.JSProperties["cpErrMsg"] = err.Message;
                }
            }
            else
            { PRUpload.JSProperties["cpErrMsg"] = e.ErrorText; }
        }

        protected void cbp_PrRef_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            try
            {
                DataTable Dt = new DataTable();
                PermohonanBelianMethods.SP_PermohonanBelian_LoadHeader_GetRef(ref Dt, PRH_ProcessId.Text, PRH_Revision.Text);

                PRH_PRnumber.Text = Dt.Rows[0]["PRH_PRnumber"].ToString();
                PRH_Revision.Text = Dt.Rows[0]["PRH_Revision"].ToString();
                PRH_SubmissionDate.Date = Convert.ToDateTime(Dt.Rows[0]["PRH_CreationDate"]);
                //PRH_StatusText.Text = Dt.Rows[0]["PRH_StatusText"].ToString();
                //PRH_Status.Text = Dt.Rows[0]["PRH_Status"].ToString();
            }
            catch (Exception err)
            {
                Console.WriteLine(err.Message);
            }
        }

        protected void cbp_Workflow_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                string WfCount = string.Empty;

                try
                {
                    string err = PermohonanBelianMethods.SP_PermohonanBelian_CheckWorkflowAvailability(PRH_ProcessId.Text, PRH_Revision.Text, ticket.Name, "1", ref WfCount);

                    if (err == string.Empty)
                    {
                        cbp_Workflow.JSProperties["cpErrMsg"] = string.Empty;
                        cbp_Workflow.JSProperties["cpWorkflowCount"] = WfCount;

                        if (WfCount != "0")
                        {
                            string WfType = string.Empty;
                            PermohonanBelianMethods.SP_PermohonanBelian_CheckWorkflowAvailability(PRH_ProcessId.Text, PRH_Revision.Text, ticket.Name, "2", ref WfType);
                            MT_WorkflowType.Text = WfType; 
                        }
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_Workflow.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Workflow.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
            }
            else
                cbp_Workflow.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        protected void cbp_ProceedWithWorkflow_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
             FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable WfDt = new DataTable();

                try
                {
                    string ApproverName = string.Empty;
                    PenggunaSistemMethods.GetSystemUserNamePelupusan(ref ApproverName, ticket.Name);

                    string PRNumber = string.Empty;
                    PermohonanBelianMethods.GetPrNumber(ref PRNumber, PRH_ProcessId.Text, PRH_Revision.Text);

                    string err = PermohonanBelianMethods.SP_PermohonanBelian_WorkflowProcessing(PRH_ProcessId.Text, PRH_Revision.Text, ticket.Name, WF_Result.Text, WF_Comment.Text, MT_WorkflowType.Text, ref WfDt);

                    if (err == string.Empty)
                    {
                        if (WF_Result.Text == "1")
                        {
                            if (MT_WorkflowType.Text == "3")
                            {
                                SendMail.PermohonanPembelian_BendahariOneAndTwo(ref WfDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), ApproverName, PRNumber);
                            }
                            else if (MT_WorkflowType.Text == "5")
                            { SendMail.PermohonanPembelian_BendahariOneAndTwo(ref WfDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), ApproverName, PRNumber); }
                            else if (MT_WorkflowType.Text == "7")
                            { SendMail.PermohonanPembelian_LulusStatus(ref WfDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), ApproverName, PRNumber); }

                            cbp_ProceedWithWorkflow.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        {
                            SendMail.PermohonanPembelian_KuiriStatus(ref WfDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), ApproverName, PRNumber);
                            cbp_ProceedWithWorkflow.JSProperties["cpErrMsg"] = string.Empty;
                        }
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_ProceedWithWorkflow.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_ProceedWithWorkflow.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
            }
        }

        protected void cbp_EditPr_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                try
                {

                    string err = PermohonanBelianMethods.SP_PermohonanBelian_EditPesananBelian(ticket.Name, PRH_ProcessId.Text, PRH_Revision.Text);

                    if (err == string.Empty)
                    {
                        cbp_EditPr.JSProperties["cpErrMsg"] = string.Empty;
                        cbp_EditPr.JSProperties["cpRev"] = Convert.ToInt32(PRH_Revision.Text) + 1;
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_EditPr.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_EditPr.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
            }
            else
                cbp_EditPr.JSProperties["cpErrMsg"] = "Session Expired.";
        }
    }
}