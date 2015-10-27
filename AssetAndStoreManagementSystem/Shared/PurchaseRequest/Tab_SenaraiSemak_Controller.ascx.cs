using Core.PengurusanSistem;
using Core.Shared;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Shared.PurchaseRequest
{
    public partial class Tab_SenaraiSemak_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_Checklist_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {
                    case "LOAD": LoadCheckList(); break;
                    case "SAVE": SaveChecklist(ticket.Name); break;
                }
            }
            else
            {
                cbp_Checklist.JSProperties["cpErrMsg"] = "Session Expired.";
            }
        }

        private void LoadCheckList()
        {
            DataSet Ds = new DataSet();

            try
            {
                string err = PermohonanBelianMethods.SP_PR_GetChecklist(chkList_ProcessId.Text, ref Ds);

                if (err == string.Empty)
                {
                    CHK_CheckedBy.Text = Ds.Tables[0].Rows[0]["CHK_CheckedBy"].ToString();

                    if (Ds.Tables[0].Rows[0]["CHK_CheckedDate"].ToString() != "")
                    {
                        CHK_CheckedDate.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["CHK_CheckedDate"]);
                        GridChecklist.Enabled = false;
                        btnDeclare.ClientEnabled = false;
                        chkDeclare.ClientEnabled = false;
                        chkDeclare.Checked = true;
                    }
                    else
                    {
                        CHK_CheckedDate.Value = null;
                        GridChecklist.Enabled = true;
                        btnDeclare.ClientEnabled = false;
                        chkDeclare.ClientEnabled = true;
                        chkDeclare.Checked = false;
                    }

                    GridChecklist.DataSource = Ds.Tables[1];
                    GridChecklist.KeyFieldName = "DC_RowId";
                    GridChecklist.DataBind();

                    cbp_Checklist.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Checklist.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Checklist.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Ds.Dispose(); }
        }

        private void SaveChecklist(string CurrUser)
        {
            DataTable Dt = new DataTable();
            DataSet Ds = new DataSet();

            try
            {
                string Username = string.Empty;
                PenggunaSistemMethods.GetSystemUserName(ref Username, CurrUser);

                FormDetailTVP(ref Dt);
                PopulateDetailTvp(ref Dt);

                string err = PermohonanBelianMethods.SP_PR_SaveChecklist(chkList_ProcessId.Text, Username, ref Dt);

                if (err == string.Empty)
                {
                    chkDeclare.ClientEnabled = false;
                    btnDeclare.ClientEnabled = false;
                    CHK_CheckedBy.Text = Username;
                    CHK_CheckedDate.Date = DateTime.Today;

                    PermohonanBelianMethods.SP_PR_GetChecklist(chkList_ProcessId.Text, ref Ds);
                    GridChecklist.DataSource = Ds.Tables[1];
                    GridChecklist.KeyFieldName = "DC_RowId";
                    GridChecklist.DataBind();
                    GridChecklist.Enabled = false;

                    cbp_Checklist.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Checklist.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Checklist.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); Ds.Dispose(); }
        }

        private void FormDetailTVP(ref DataTable Dt)
        {
            DataColumn CHKD_ProcessId = Dt.Columns.Add("CHKD_ProcessId", typeof(String));
            DataColumn CHKD_RowId = Dt.Columns.Add("CHKD_RowId", typeof(Int32));
            DataColumn CHKD_Checked = Dt.Columns.Add("CHKD_Checked", typeof(Boolean));
            Dt.AcceptChanges();
        }

        private void PopulateDetailTvp(ref DataTable Dt)
        {
            for (int i = 0; i < GridChecklist.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["CHKD_ProcessId"] = chkList_ProcessId.Text;
                Dr["CHKD_RowId"] = Convert.ToInt32(GridChecklist.GetRowValues(i, "DC_RowId"));

                ASPxCheckBox chk = (ASPxCheckBox)GridChecklist.FindRowCellTemplateControl(i, GridChecklist.DataColumns["Checked"] as GridViewDataColumn, "Checked");

                if (chk != null)
                {
                    Dr["CHKD_Checked"] = chk.Checked;
                }
                else
                    Dr["CHKD_Checked"] = false;

                Dt.Rows.Add(Dr);
            }

            Dt.AcceptChanges();
        }

        protected void GridChecklist_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "Checked": FormCheckBox(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "DC_Mandatory": FormCheckBox(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
            }

        }

        void FormCheckBox(int VisibleIndex, string FieldName, object CellValue)
        {
            ASPxCheckBox chk = (ASPxCheckBox)GridChecklist.FindRowCellTemplateControl(VisibleIndex, GridChecklist.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (chk != null)
            {
                chk.ClientInstanceName = FieldName + "_" + VisibleIndex.ToString();
                chk.Checked = Convert.ToBoolean(CellValue);
            }
        }

    }
}