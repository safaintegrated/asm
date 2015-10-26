using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Core.Shared;
using Core.PengurusanSistem;
using Core.Email;
using System.Data;
using System.Configuration;
using System.Web.Security;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.Shared.TerimaanBarang
{
    public partial class TerimaanBarang_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoadEvents();", true);
            //}

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["ProcessId"] == null)
                {
                    OpenFromMyTask.Text = "0";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoadEvents();", true);
                }
                else
                {
                    OpenFromMyTask.Text = "1";
                    string[] Params = Request.QueryString["ProcessId"].ToString().Split('*');
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "LoadSelectedGrn('" + Params[0].ToString() + "','" + Params[1].ToString() + "');", true);
                }
            }
        }

        protected void cbp_GrnRef_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            DataTable Dt = new DataTable();
            string err = TerimaanBarangMethods.SP_GRN_LoadHeader_GetRef(Ref_GrnProcessId.Text, Ref_GrnVersion.Text, ref Dt);

            if (err == string.Empty)
            {
                Ref_GrnNumber.Text = Dt.Rows[0]["GRNH_GrnNumber"].ToString();
                Ref_GrnCreateDate.Date = Convert.ToDateTime(Dt.Rows[0]["GRNH_CreatedDate"]);
                Ref_GrnStatusText.Text = Dt.Rows[0]["GRN_StatusText"].ToString();
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
                    string err = TerimaanBarangMethods.SP_CheckWorkflowAvailability(Ref_GrnProcessId.Text, Ref_GrnVersion.Text, ticket.Name, "1", ref WfCount);

                    if (err == string.Empty)
                    {
                        cbp_Workflow.JSProperties["cpErrMsg"] = string.Empty;
                        cbp_Workflow.JSProperties["cpWorkflowCount"] = WfCount;

                        if (WfCount != "0")
                        {
                            string WfType = string.Empty;
                            TerimaanBarangMethods.SP_CheckWorkflowAvailability(Ref_GrnProcessId.Text, Ref_GrnVersion.Text, ticket.Name, "2", ref WfType);
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
                    PenggunaSistemMethods.GetSystemUserName(ref ApproverName, ticket.Name);

                    string GrnNumber = string.Empty;
                    TerimaanBarangMethods.GetGrnNumber(ref GrnNumber, Ref_GrnProcessId.Text, Ref_GrnVersion.Text);

                    string err = TerimaanBarangMethods.SP_GRN_WorkflowProcessing(Ref_GrnProcessId.Text, Ref_GrnVersion.Text, ticket.Name, WF_Result.Text, WF_Comment.Text, MT_WorkflowType.Text, ref WfDt);

                    if (err == string.Empty)
                    {
                        if (WF_Result.Text == "1")
                        {
                            if (MT_WorkflowType.Text == "9")
                            {
                                SendMail.GRN_LulusStatus(ref WfDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), ApproverName, GrnNumber);
                            }

                            cbp_ProceedWithWorkflow.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        {
                            SendMail.GRN_KuiriStatus(ref WfDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), ApproverName, GrnNumber);
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

        protected void cbp_BeforeApproval_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_BeforeApproval.JSProperties["cpErrMsg"] = TerimaanBarangMethods.SP_GRN_BeforeApproval(Ref_GrnProcessId.Text);
        }

        protected void GridGrnLookup_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridGrnLookup.DataBind();
        }

        protected void GrnLookupDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {

                e.Command.Parameters["@CurrUser"].Value = Convert.ToInt32(ticket.Name);
            }
            else
                e.Cancel = true;
        }

        protected void GridGrnLookup_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "GRNH_PrNumber")
            {
                ASPxHyperLink link = (ASPxHyperLink)GridGrnLookup.FindRowCellTemplateControl(e.VisibleIndex, GridGrnLookup.DataColumns["GRNH_PrNumber"] as GridViewDataColumn, "GRNH_PrNumber");

                if (link != null)
                {
                    string ProcessId = GridGrnLookup.GetRowValues(e.VisibleIndex, "GRNH_ProcessId").ToString();
                    string Revision = GridGrnLookup.GetRowValues(e.VisibleIndex, "GRNH_Revision").ToString();

                    link.ClientInstanceName = "GRNH_PrNumber" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: SelectGrn('" + ProcessId + "','" + Revision + "');";
                }
            }
        }
    }
}