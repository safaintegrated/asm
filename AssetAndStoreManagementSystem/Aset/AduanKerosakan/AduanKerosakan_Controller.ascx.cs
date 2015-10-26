using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using Core.Aset.AduanKerosakan;
using System.Configuration;
using DevExpress;
using System.Web.Security;

namespace AssetAndStoreManagementSystem.Aset.AduanKerosakan
{
    public partial class AduanKerosakan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "AduanKerosakanSelected('" + Request.QueryString["ProcessId"].ToString() + "');", true);
                }
                
            }
        }

        protected void GridSearchAduanKerosakan_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearchAduanKerosakan.DataBind();
        }

        protected void GridSearchAduanKerosakan_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "CreatorName": CreateHyperLink(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "AK_RefNumber": CreateHyperLink(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
            }
        }

        void CreateHyperLink(int VisibleIndex, string Fieldname, object CellValue)
        {
            ASPxHyperLink link = (ASPxHyperLink)GridSearchAduanKerosakan.FindRowCellTemplateControl(VisibleIndex, GridSearchAduanKerosakan.DataColumns[Fieldname] as GridViewDataColumn, Fieldname);

            if (link != null)
            {
                string AK_ProcessId = GridSearchAduanKerosakan.GetRowValues(VisibleIndex, "AK_ProcessId").ToString();

                link.Text = CellValue.ToString();
                link.ClientInstanceName = Fieldname + VisibleIndex.ToString();
                link.NavigateUrl = "javascript: AduanKerosakanSelected('" + AK_ProcessId + "');";
            }
        }

        protected void cbp_AKRef_Callback(object sender, CallbackEventArgsBase e)
        {
            DataTable Dt = new DataTable();
            AduanKerosakanMethods.V_AduanKerosakan(ref Dt, Ref_RefProcessId.Text);

            if (Dt.Rows.Count == 1)
            {
                Ref_RefNumber.Text = Dt.Rows[0]["AK_RefNumber"].ToString();
                Ref_RefDate.Date = Convert.ToDateTime(Dt.Rows[0]["AK_CreatedDate"]);
                Ref_RefStatus.Text = Dt.Rows[0]["StatusName"].ToString();
            }
        }

        protected void cbp_AKworkflow_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                string WfCount = string.Empty;

                try
                {
                    string err = AduanKerosakanMethods.SP_AduanKerosakan_CheckWorkflowAvailability(Ref_RefProcessId.Text, ticket.Name, "1", ref WfCount);

                    if (err == string.Empty)
                    {
                        cbp_AKworkflow.JSProperties["cpErrMsg"] = string.Empty;
                        cbp_AKworkflow.JSProperties["cpWorkflowCount"] = WfCount;

                        if (WfCount != "0")
                        {
                            string WfType = string.Empty;
                            AduanKerosakanMethods.SP_AduanKerosakan_CheckWorkflowAvailability(Ref_RefProcessId.Text, ticket.Name, "2", ref WfType);
                            MT_WorkflowType.Text = WfType;
                        }
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_AKworkflow.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_AKworkflow.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
            }
            else
                cbp_AKworkflow.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        protected void cbp_ProceedWithWorkflow_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                string WfCount = string.Empty;

                try
                {
                    string err = AduanKerosakanMethods.SP_AduanKerosakan_KetuaPtjConfirmation(Ref_RefProcessId.Text, ticket.Name, Convert.ToInt32(WF_Result.Text), WF_Comment.Text.Trim());

                    if (err == string.Empty)
                    {
                        cbp_ProceedWithWorkflow.JSProperties["cpErrMsg"] = string.Empty;
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
            else
                cbp_ProceedWithWorkflow.JSProperties["cpErrMsg"] = "Session Expired.";
        }
    }
}