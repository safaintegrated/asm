using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.Configuration;
using Core.Aset.Pinjaman;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.Aset.Pinjaman
{
    public partial class Pinjaman_Controller : System.Web.UI.UserControl
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
                    string[] Params = Request.QueryString["ProcessId"].ToString().Split('*');
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "PageLoadWithProcessId('" + Params[0].ToString() + "','" + Params[1].ToString() + "');", true);
                }

            }
        }

        protected void ASPxFormLayout4_E3_TextChanged(object sender, EventArgs e)
        {


        }

        protected void cbp_ProceedWithWorkflow_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {

        }

        protected void cbp_Ref_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (Ref_RefProcessId.Text == "" && Ref_RefRevNumber.Text == "")
            {
                Ref_RefNumber.Text = "";
                Ref_RefDate.Value = DBNull.Value;
                Ref_RefStatusText.Text = "";
            }
            else
            {
                DataTable Dt = new DataTable();
                PinjamanMethods.SP_PermohonanPinjaman_GetRef(Ref_RefProcessId.Text, Ref_RefRevNumber.Text, ref Dt);

                if (Dt.Rows.Count == 1)
                {
                    Ref_RefNumber.Text = Dt.Rows[0]["PP_RefNumber"].ToString();
                    Ref_RefDate.Date = Convert.ToDateTime(Dt.Rows[0]["PP_LastModDate"]);
                    Ref_RefStatusText.Text = Dt.Rows[0]["PP_Status"].ToString();
                }
            }
        }

        protected void SearchDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            e.Command.Parameters["@CurrUser"].Value = Convert.ToInt32(ticket.Name);
        }

        protected void GridSearch_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearch.DataBind();
        }

        protected void GridSearch_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "PP_Purpose")
            {
                ASPxHyperLink link = (ASPxHyperLink)GridSearch.FindRowCellTemplateControl(e.VisibleIndex, GridSearch.DataColumns["PP_Purpose"] as GridViewDataColumn, "PP_Purpose");

                if (link != null)
                {
                    string PP_ProcessId = GridSearch.GetRowValues(e.VisibleIndex, "PP_ProcessId").ToString();
                    string PP_Revision = GridSearch.GetRowValues(e.VisibleIndex, "PP_Revision").ToString();
                    link.ClientInstanceName = "PP_Purpose" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: PP_Selected('" + PP_ProcessId + "','" + PP_Revision + "');";
                }
            }
        }

        protected void cbpPegawaiAssetApproval_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                try
                {
                    string DbErr = PinjamanMethods.SP_PermohonanPinjaman_AssetOfficerApproveReject(ticket.Name, Ref_RefProcessId.Text, Ref_RefRevNumber.Text, Convert.ToInt32(WF_Result.Text), WF_Comment.Text.Trim());

                    if (DbErr == string.Empty)
                    {
                        cbpPegawaiAssetApproval.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbpPegawaiAssetApproval.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpPegawaiAssetApproval.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
            }
            else
                cbpPegawaiAssetApproval.JSProperties["cpErrMsg"] = "Session Expired.";
        }
    }
}