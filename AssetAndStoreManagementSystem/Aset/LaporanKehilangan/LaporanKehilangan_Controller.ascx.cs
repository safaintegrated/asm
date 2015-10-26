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
using Core.Aset.LaporanKehilangan;
using Core.Email;

namespace AssetAndStoreManagementSystem.Aset.LaporanKehilangan
{
    public partial class LaporanKehilangan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["MissingItemDt"] != null)
                    Session.Remove("MissingItemDt");

                if (Request.QueryString["ProcessId"] == null)
                {
                    OpenFromMyTask.Text = "0";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoadEvents();", true);
                }
                else
                {
                    OpenFromMyTask.Text = "1";
                    string[] Params = Request.QueryString["ProcessId"].ToString().Split('*');
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad_LaporanKehilanganSelected('" + Params[0].ToString() + "','" + Params[1].ToString() + "');", true);
                }
            }
        }

        protected void GridMainSearch_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "EmployeeName")
            {
                ASPxHyperLink EmployeeName = (ASPxHyperLink)GridMainSearch.FindRowCellTemplateControl(e.VisibleIndex, GridMainSearch.DataColumns["EmployeeName"] as GridViewDataColumn, "EmployeeName");

                if (EmployeeName != null)
                {
                    string ProcessID = GridMainSearch.GetRowValues(e.VisibleIndex, "LKH_ProcessId").ToString();
                    string Rev = GridMainSearch.GetRowValues(e.VisibleIndex, "LKH_RevNumber").ToString();
                    EmployeeName.ClientInstanceName = "EmployeeName" + e.VisibleIndex.ToString();
                    EmployeeName.Text = e.CellValue.ToString();
                    EmployeeName.NavigateUrl = "javascript: OnPageLoad_LaporanKehilanganSelected('" + ProcessID + "','" + Rev + "');";
                }
            }
        }

        protected void GridMainSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridMainSearch.DataBind();
        }

        protected void SearchDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            e.Command.Parameters["@CurrUser"].Value = Convert.ToInt32(ticket.Name);
        }

        protected void cbp_Ref_Callback(object sender, CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "REF": LoadLkRef(); break;
                case "IMG": LoadSlider(); break;
            }
        }

        void LoadLkRef()
        {
            DataTable Dt = new DataTable();
            LaporanKehilanganMethods.SP_LaporanKerosakan_GetRef(Ref_ProcessId.Text, Ref_RevNumber.Text, ref Dt);

            if (Dt.Rows.Count == 1)
            {
                Ref_RefNumber.Text = Dt.Rows[0]["LKH_REfNumber"].ToString();
                Ref_Date.Date = Convert.ToDateTime(Dt.Rows[0]["LKH_CreatedDate"]);
                Ref_Status.Text = Dt.Rows[0]["StatusName"].ToString();
                Ref_StatusInt.Text = Dt.Rows[0]["LKH_Status"].ToString();
            }

            LoadSlider();
        }

        void LoadSlider()
        { }

        protected void cbp_ProceedWithWorkflow_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();
                DataTable DetailDt = new DataTable();

                try
                {
                    if (Ref_StatusInt.Text == "3")
                    {

                        DetailDt = Session["MissingItemDt"] as DataTable;

                        string LkRefNumber = string.Empty;
                        string KetuaPtjName = string.Empty;
                        string DbErr = LaporanKehilanganMethods.SP_LaporanKehilangan_KetuaPTJ_FirstApproval(ticket.Name, Ref_ProcessId.Text, Ref_RevNumber.Text, Convert.ToInt32(WF_Result.Text), WF_Comment.Text.Trim(), ref LkRefNumber, ref DetailDt, ref Dt, ref KetuaPtjName);

                        if (DbErr == string.Empty)
                        {
                            string EmailErr = SendMail.LaporanKerosakan_LantikanPegawaiPenyiasat(ref Dt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), KetuaPtjName, LkRefNumber);
                            cbp_ProceedWithWorkflow.JSProperties["cpMailError"] = EmailErr;
                            cbp_ProceedWithWorkflow.JSProperties["cpErrMsg"] = string.Empty; }
                        else
                        {
                            string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                            errMsg = errMsg.Replace("BR", "<br><br>");
                            cbp_ProceedWithWorkflow.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                        }
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_ProceedWithWorkflow.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
                finally
                { Dt.Dispose(); }
            }
            else
                cbp_ProceedWithWorkflow.JSProperties["cpErrMsg"] = "Session Expired.";           
        }
    }
}