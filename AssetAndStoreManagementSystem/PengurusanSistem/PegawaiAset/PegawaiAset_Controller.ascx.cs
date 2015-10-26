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
using Core.Common;

namespace AssetAndStoreManagementSystem.PengurusanSistem.PegawaiAset
{
    public partial class PegawaiAset_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
                ManageMainRibbon();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }                
        }

        void ManageMainRibbon()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();
                CommonMethods.SP_Common_GetUserGroupRights(ticket.Name, 37, ref Dt);

                if (Dt.Rows.Count == 1)
                {
                    EnableCreate.Text = Dt.Rows[0]["EnableCreate"].ToString();
                    EnableUpdate.Text = Dt.Rows[0]["EnableUpdate"].ToString();
                    EnableDelete.Text = Dt.Rows[0]["EnableDelete"].ToString();

                    var tab = MainRibbon.Tabs.FindByName("Utama");
                    var group = tab.Groups.FindByName("Pengurusan Rekod");
                    var AddBtn = group.Items.FindByName("Tambah") as RibbonButtonItem;
                    var EditBtn = group.Items.FindByName("Kemaskini") as RibbonButtonItem;
                    var DeleteBtn = group.Items.FindByName("Padam") as RibbonButtonItem;

                    if (Convert.ToBoolean(Dt.Rows[0]["EnableCreate"]))
                        AddBtn.ClientEnabled = true;
                    else
                        AddBtn.ClientEnabled = false;

                    if (Convert.ToBoolean(Dt.Rows[0]["EnableUpdate"]))
                        EditBtn.ClientEnabled = true;
                    else
                        EditBtn.ClientEnabled = false;

                    if (Convert.ToBoolean(Dt.Rows[0]["EnableDelete"]))
                        DeleteBtn.ClientEnabled = true;
                    else
                        DeleteBtn.ClientEnabled = false;
                }
            }
        }

        protected void MainGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            MainGrid.DataBind();
        }

        protected void cbp_Report_Callback(object sender, CallbackEventArgsBase e)
        {
            Session["ReportName"] = "PegawaiAset";
        }

        protected void cbp_popupManagement_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_popupManagement.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "NEW": NewMode(); break;
                case "SAVE": SaveDeleteMode(1); break;
                case "DELETE": SaveDeleteMode(2); break;
                case "LOAD": LoadMode(); break;
            }
        }

        void NewMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                PA_UserId.Value = null;
                PA_PtjSagaCode.Value = null;
                PA_FromDate.Value = null;
                PA_ToDate.Value = null;
                User_PTJ.Text = string.Empty;
                User_DesignationAndGrade.Text = string.Empty;

                FormBlankPreviousRecord(ref Dt);
                Grid_Prev.DataSource = Dt;
                Grid_Prev.KeyFieldName = "PA_ToDate";
                Grid_Prev.DataBind();

                cbp_popupManagement.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            { cbp_popupManagement.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose(); }
        }

        void FormBlankPreviousRecord(ref DataTable Dt)
        {
            DataColumn PA_FromDate = Dt.Columns.Add("PA_FromDate", typeof(DateTime));
            DataColumn PA_ToDate = Dt.Columns.Add("PA_ToDate", typeof(DateTime));
            DataColumn PTJ_FullName = Dt.Columns.Add("PTJ_FullName", typeof(String));
            Dt.AcceptChanges();
        }

        void SaveDeleteMode(int Mode)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();

                try
                {
                    FormTVP(ref Dt);
                    PopulateTVP(ref Dt);
                    cbp_popupManagement.JSProperties["cpErrMsg"] = PegawaiAsetMethods.SP_PegawaiAset_SaveDelete(ticket.Name, ref Dt, Mode);
                }
                catch (Exception err)
                { cbp_popupManagement.JSProperties["cpErrMsg"] = err.Message; }
                finally
                { Dt.Dispose(); }
            }
            else
            { cbp_popupManagement.JSProperties["cpErrMsg"] = "Session Expired."; }
        }

        void FormTVP(ref DataTable Dt)
        {
            DataColumn PA_UserId = Dt.Columns.Add("PA_UserId", typeof(Int32));
            DataColumn PA_PtjSagaCode = Dt.Columns.Add("PA_PtjSagaCode", typeof(String));
            DataColumn PA_FromDate = Dt.Columns.Add("PA_FromDate", typeof(DateTime));
            DataColumn PA_ToDate = Dt.Columns.Add("PA_ToDate", typeof(DateTime));
            DataColumn PA_Active = Dt.Columns.Add("PA_Active", typeof(Boolean));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["PA_UserId"] = Convert.ToInt32(PA_UserId.Value);
            Dr["PA_PtjSagaCode"] = PA_PtjSagaCode.Value.ToString();
            Dr["PA_FromDate"] = PA_FromDate.Date;
            Dr["PA_ToDate"] = PA_ToDate.Date;
            Dr["PA_Active"] = true;
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void LoadMode()
        {
            DataSet Ds = new DataSet();
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = PegawaiAsetMethods.SP_PegawaiAset_Load(temp.Text, ref Ds);

                if (DbErr == string.Empty)
                {
                    if (Ds.Tables.Count == 2)
                    {
                        if (Ds.Tables[0].Rows.Count == 1)
                        {
                            PA_UserId.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PA_UserId"]);
                            PA_PtjSagaCode.Value = Ds.Tables[0].Rows[0]["PA_PtjSagaCode"].ToString();
                            PA_FromDate.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["PA_FromDate"]);
                            PA_ToDate.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["PA_ToDate"]);
                            User_PTJ.Text = Ds.Tables[0].Rows[0]["User_PTJ"].ToString();
                            User_DesignationAndGrade.Text = Ds.Tables[0].Rows[0]["User_DesignationAndGrade"].ToString();

                            Dt = Ds.Tables[1].Copy();
                            Grid_Prev.DataSource = Dt;
                            Grid_Prev.KeyFieldName = "PA_ToDate";
                            Grid_Prev.DataBind();

                            cbp_popupManagement.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        { cbp_popupManagement.JSProperties["cpErrMsg"] = "Insufficient row count."; }
                    }
                    else
                    { cbp_popupManagement.JSProperties["cpErrMsg"] = "Insufficient table count."; }
                }
                else
                    cbp_popupManagement.JSProperties["cpErrMsg"] = DbErr;
            }
            catch (Exception err)
            { cbp_popupManagement.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Ds.Dispose(); Dt.Dispose(); }
        }

        protected void MainGrid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "User_Salutation")
            {
                ASPxHyperLink User_Salutation = (ASPxHyperLink)MainGrid.FindRowCellTemplateControl(e.VisibleIndex, MainGrid.DataColumns["User_Salutation"] as GridViewDataColumn, "User_Salutation");

                if (User_Salutation != null)
                {
                    string PA_UserId = MainGrid.GetRowValues(e.VisibleIndex, "PA_UserId").ToString();
                    User_Salutation.Text = e.CellValue.ToString();
                    User_Salutation.ClientInstanceName = "User_Salutation" + e.VisibleIndex.ToString();
                    User_Salutation.NavigateUrl = "javascript: LoadPegawaiAset('" + PA_UserId + "');";
                }
            }
        }

        protected void GridAuditListing_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridAuditListing.DataBind();
        }

        protected void GridAuditListing_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "ModifiedBy")
            {
                ASPxHyperLink ModifiedBy = (ASPxHyperLink)GridAuditListing.FindRowCellTemplateControl(e.VisibleIndex, GridAuditListing.DataColumns["ModifiedBy"] as GridViewDataColumn, "ModifiedBy");

                if (ModifiedBy != null)
                {
                    string ProcessId = GridAuditListing.GetRowValues(e.VisibleIndex, "ProcessId").ToString();
                    ModifiedBy.ClientInstanceName = "ModifiedBy" + e.VisibleIndex.ToString();
                    ModifiedBy.Text = e.CellValue.ToString();
                    ModifiedBy.NavigateUrl = "javascript: ViewAssetOfficerAuditDetail('" + ProcessId + "');";

                }
            }

        }

        protected void AuditHeaderDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (Pid.Text == string.Empty)
                e.Cancel = true;
            else
                e.Command.Parameters["@ProcessId"].Value = Pid.Text;
        }

        protected void GridAuditDetails_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridAuditDetails.DataBind();
        }
    }
}