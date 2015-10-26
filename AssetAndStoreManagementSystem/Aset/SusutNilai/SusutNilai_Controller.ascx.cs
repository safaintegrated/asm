using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.Configuration;
using Core.Aset.Susutnilai;
using DevExpress.Web;


namespace AssetAndStoreManagementSystem.Aset.SusutNilai
{
    public partial class SusutNilai_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }
        }

        protected void GridDepreciation_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridDepreciation.DataBind();
            DataView dv = (DataView)SusutNilaiDs.Select(DataSourceSelectArguments.Empty);

            if (dv.ToTable().Rows.Count != 0)
            {
                GridDepreciation.JSProperties["cpRecCount"] = dv.ToTable().Rows.Count;
                GridDepreciation.JSProperties["cpProcessId"] = dv.ToTable().Rows[0]["ProcessId"].ToString();
            }                
            else
            {
                GridDepreciation.JSProperties["cpRecCount"] = 0;
                GridDepreciation.JSProperties["cpProcessId"] = string.Empty;
            }
                
        }

        protected void SusutNilaiDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (txtStopGo.Text == "0")
                e.Cancel = true;
            else
            {
                e.Command.Parameters["@ExecType"].Value = DBNull.Value;
                e.Command.Parameters["@PrevYear"].Value = DBNull.Value;
                e.Command.Parameters["@PrevMonth"].Value = DBNull.Value;
                e.Command.Parameters["@CurrYear"].Value = DBNull.Value;
                e.Command.Parameters["@CurrMonth"].Value = DBNull.Value;

                if (AIDH_ProcessId.Text == "")
                    e.Command.Parameters["@ProcessIdFormScreen"].Value = DBNull.Value;
                else
                    e.Command.Parameters["@ProcessIdFormScreen"].Value = AIDH_ProcessId.Text;

            }                
        }

        protected void SusutNilaiDs_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridDepreciation.JSProperties["cpExecType"] = e.Command.Parameters["@ExecType"].Value.ToString();
            GridDepreciation.JSProperties["cpPrevYear"] = e.Command.Parameters["@PrevYear"].Value.ToString();
            GridDepreciation.JSProperties["cpPrevMonth"] = e.Command.Parameters["@PrevMonth"].Value.ToString();
            GridDepreciation.JSProperties["cpCurrYear"] = e.Command.Parameters["@CurrYear"].Value.ToString();
            GridDepreciation.JSProperties["cpCurrMonth"] = e.Command.Parameters["@CurrMonth"].Value.ToString();       
        }

        protected void cbp_SavePost_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_SavePost.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {
                    case "SAVE": SavePostSusutNilai(ticket.Name, 0); break;
                    case "POST": SavePostSusutNilai(ticket.Name, 1); break;
                }
            }
            else
            {
                cbp_SavePost.JSProperties["cpErrMsg"] = "Session Expired.";
            }
        }

        void SavePostSusutNilai(string CurrUser, int Post)
        {
            DataTable HeaderDt = new DataTable();

            try
            {
                FormHeaderTVP(ref HeaderDt);
                PopulateHeaderTVP(ref HeaderDt, CurrUser, Post);

                string DbErr = SusutnilaiMethods.SP_SusutNilaiSavePost(ref HeaderDt, Post);

                if (DbErr == string.Empty)
                {
                    if (Post == 1)
                    {
                        cbp_SavePost.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                        cbp_SavePost.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_SavePost.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SavePost.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        void FormHeaderTVP(ref DataTable Dt)
        {
            DataColumn AIDH_ProcessId = Dt.Columns.Add("AIDH_ProcessId", typeof(String));
            DataColumn AIDH_ExecutedBy = Dt.Columns.Add("AIDH_ExecutedBy", typeof(Int32));
            DataColumn AIDH_ExecutedDate = Dt.Columns.Add("AIDH_ExecutedDate", typeof(DateTime));
            DataColumn AIDH_Year = Dt.Columns.Add("AIDH_Year", typeof(Int32));
            DataColumn AIDH_Month = Dt.Columns.Add("AIDH_Month", typeof(Int32));
            DataColumn AIDH_Post = Dt.Columns.Add("AIDH_Post", typeof(Int32));
            Dt.AcceptChanges();
        }

        void PopulateHeaderTVP(ref DataTable Dt, string CurrUser, int Post)
        {
            DataRow Dr = Dt.NewRow();
            Dr["AIDH_ProcessId"] = AIDH_ProcessId.Text;
            Dr["AIDH_ExecutedBy"] = Convert.ToInt32(CurrUser);
            Dr["AIDH_ExecutedDate"] = DateTime.Today;
            Dr["AIDH_Year"] = Convert.ToInt32(CurrYear.Value);
            Dr["AIDH_Month"] = Convert.ToInt32(CurrMonth.Value);
            Dr["AIDH_Post"] = Post;
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        protected void GridSearch_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "AIDH_ExecutedBy")
            {
                ASPxHyperLink link = (ASPxHyperLink)GridSearch.FindRowCellTemplateControl(e.VisibleIndex, GridSearch.DataColumns["AIDH_ExecutedBy"] as GridViewDataColumn, "AIDH_ExecutedBy");

                if (link != null)
                {
                    link.ClientInstanceName = "AIDH_ExecutedBy" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    string AIDH_ProcessId = GridSearch.GetRowValues(e.VisibleIndex, "AIDH_ProcessId").ToString();
                    link.NavigateUrl = "javascript: SusutNilaiSelected('" + AIDH_ProcessId + "');";
                }
            }
        }

        protected void GridSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearch.DataBind();
        }
    }
}