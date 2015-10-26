using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using Core.PengurusanSistem;
using DevExpress.Web;
using Core.Common;

namespace AssetAndStoreManagementSystem.PengurusanSistem.KumpulanPenggunaSistem
{
    public partial class KumpulanPengguna_Controller : System.Web.UI.UserControl
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
                CommonMethods.SP_Common_GetUserGroupRights(ticket.Name, 2, ref Dt);

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

        protected void SysGrpDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (UserGroupId.Text == "")
                e.Command.Parameters["@UserGroupId"].Value = DBNull.Value;
            else
                e.Command.Parameters["@UserGroupId"].Value = Convert.ToInt32(UserGroupId.Text);
        }

        void SaveRecord()
        {
            DataTable Dt_Header = new DataTable();
            DataTable Dt_Detail = new DataTable();

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            try
            {
                FormTVP_HEADER(ref Dt_Header);
                PopulateTVP_HEADER(ref Dt_Header);

                FormTVP_Detail(ref Dt_Detail);
                PopulateTVP_Detail(ref Dt_Detail);

                string err = KumpulanPenggunaSistemMethods.SP_LoadSaveDelete_SystemUserGroup(ref Dt_Header, ref Dt_Detail, UserGroupId.Text.Trim(), ticket.Name, "SAVE");

                if (err == "")
                {
                    cbp_SystemUserGroup.JSProperties["cpErrMsg"] = string.Empty;

                    if (UserGroupId.Text == "")
                    {
                        string UserGroupIdParam = string.Empty;
                        KumpulanPenggunaSistemMethods.GetUserGroupId(ref UserGroupIdParam, UserDefinedId.Text.Trim());
                        cbp_SystemUserGroup.JSProperties["cpUserGroupId"] = UserGroupIdParam;
                    }
                    else
                        cbp_SystemUserGroup.JSProperties["cpUserGroupId"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_SystemUserGroup.JSProperties["cpErrMsg"] = errMsg + " " + err; 
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SystemUserGroup.JSProperties["cpErrMsg"] = errMsg + " " + err; 
            }
            finally
            { Dt_Header.Dispose(); Dt_Detail.Dispose(); }
        }

        void DeleteRecord()
        {
            DataTable Dt_Header = new DataTable();
            DataTable Dt_Detail = new DataTable();

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            try
            {
                FormTVP_HEADER(ref Dt_Header);
                FormTVP_Detail(ref Dt_Detail);

                string err = KumpulanPenggunaSistemMethods.SP_LoadSaveDelete_SystemUserGroup(ref Dt_Header, ref Dt_Detail, UserGroupId.Text.Trim(), ticket.Name, "DELETE");

                if (err == "")
                { cbp_SystemUserGroup.JSProperties["cpErrMsg"] = string.Empty; }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_SystemUserGroup.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SystemUserGroup.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { Dt_Header.Dispose(); Dt_Detail.Dispose(); }
        }

        void FormTVP_HEADER(ref DataTable Dt)
        {
            DataColumn Org_Id = Dt.Columns.Add("Org_Id", typeof(Int32));
            DataColumn UserGroupId = Dt.Columns.Add("UserGroupId", typeof(Int32));;
            DataColumn UserDefinedId = Dt.Columns.Add("UserDefinedId", typeof(String));
            DataColumn UserGroupName = Dt.Columns.Add("UserGroupName", typeof(String));
            DataColumn ActiveIndicator = Dt.Columns.Add("ActiveIndicator", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTVP_HEADER(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["Org_Id"] = Convert.ToInt32(ConfigurationManager.AppSettings["OrgId"].ToString());

            if (UserGroupId.Text.Trim() == "")
                Dr["UserGroupId"] = DBNull.Value;
            else
                Dr["UserGroupId"] = Convert.ToInt32(UserGroupId.Text.Trim());

            Dr["UserDefinedId"] =UserDefinedId.Text.Trim();
            Dr["UserGroupName"] = UserGroupName.Text.Trim();
            Dr["ActiveIndicator"] = Convert.ToBoolean(ActiveIndicator.Value);
          
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void FormTVP_Detail(ref DataTable Dt)
        {
            DataColumn UserGroupId = Dt.Columns.Add("UserGroupId", typeof(Int32));
            DataColumn MenuId = Dt.Columns.Add("MenuId", typeof(Int32)); ;
            DataColumn EnableCreate = Dt.Columns.Add("EnableCreate", typeof(Boolean));
            DataColumn EnableUpdate = Dt.Columns.Add("EnableUpdate", typeof(Boolean));
            DataColumn EnableDelete = Dt.Columns.Add("EnableDelete", typeof(Boolean));
            DataColumn EnableView = Dt.Columns.Add("EnableView", typeof(Boolean));
            Dt.AcceptChanges();
        }

        void PopulateTVP_Detail(ref DataTable Dt)
        {
            for (int i = 0; i < GridSysUserCredentials.VisibleRowCount; i++)
            {
                if (!GridSysUserCredentials.IsGroupRow(i))
                {
                    DataRow Dr = Dt.NewRow();

                    if (UserGroupId.Text.Trim() == "")
                        Dr["UserGroupId"] = DBNull.Value;
                    else
                        Dr["UserGroupId"] = Convert.ToInt32(UserGroupId.Text.Trim());

                    Dr["MenuId"] = Convert.ToInt32(GridSysUserCredentials.GetRowValues(i, "MenuId"));
                    Dr["EnableCreate"] = GetCheckBoxValue(i, "EnableCreate");
                    Dr["EnableUpdate"] = GetCheckBoxValue(i, "EnableUpdate");
                    Dr["EnableDelete"] = GetCheckBoxValue(i, "EnableDelete");
                    Dr["EnableView"] = GetCheckBoxValue(i, "EnableView");
                    Dt.Rows.Add(Dr);
                }
            }

            Dt.AcceptChanges();
        }

        protected void cbp_SystemUserGroup_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_SystemUserGroup.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "NEW": NewRecord(); break;
                case "LOAD": LoadRecord(); break;
                case "SAVE": SaveRecord(); break;
                case "DELETE": DeleteRecord(); break;
            }
        }

        void NewRecord()
        {
            UserGroupId.Text = string.Empty;
            UserDefinedId.Text = string.Empty;
            UserGroupName.Text = string.Empty;
            ActiveIndicator.Value = null;

            DataTable Dt = new DataTable();
            KumpulanPenggunaSistemMethods.SP_SystemUserGroup_NewCredentials(ref Dt);

            GridSysUserCredentials.DataSource = Dt;
            GridSysUserCredentials.DataBind();
            Dt.Dispose();
            cbp_SystemUserGroup.JSProperties["cpErrMsg"] = string.Empty;
        }

        void LoadRecord()
        {
            DataSet Ds = new DataSet();
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = KumpulanPenggunaSistemMethods.SP_SystemUserGroup_LoadRecord(UserGroupId.Text, ref Ds);

                if (DbErr == string.Empty)
                {   
                    UserDefinedId.Text = Ds.Tables[0].Rows[0]["UserDefinedId"].ToString();
                    UserGroupName.Text = Ds.Tables[0].Rows[0]["UserGroupName"].ToString();
                    ActiveIndicator.Value = Convert.ToBoolean(Ds.Tables[0].Rows[0]["ActiveIndicator"]);

                    Dt = Ds.Tables[1].Copy();
                    GridSysUserCredentials.DataSource = Dt;
                    GridSysUserCredentials.DataBind();

                    cbp_SystemUserGroup.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    cbp_SystemUserGroup.JSProperties["cpErrMsg"] = DbErr;
                }
            }
            catch (Exception err)
            {
                cbp_SystemUserGroup.JSProperties["cpErrMsg"] = err.Message;
            }
            finally
            { Ds.Dispose(); Dt.Dispose(); }
        }

        protected void GridSysUserCredentials_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "EnableCreate": SetCheckBoxValue(e.VisibleIndex, "EnableCreate", e.CellValue); break;
                case "EnableUpdate": SetCheckBoxValue(e.VisibleIndex, "EnableUpdate", e.CellValue); break;
                case "EnableDelete": SetCheckBoxValue(e.VisibleIndex, "EnableDelete", e.CellValue); break;
                case "EnableView": SetCheckBoxValue(e.VisibleIndex, "EnableView", e.CellValue); break;
            }
        }

        void SetCheckBoxValue(int VisibleIndex, string FieldName, object CellValue)
        {
            ASPxCheckBox check = (ASPxCheckBox)GridSysUserCredentials.FindRowCellTemplateControl(VisibleIndex, GridSysUserCredentials.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (check != null)
            {
                check.ClientInstanceName = FieldName + "_" + VisibleIndex.ToString();

                if (CellValue.ToString() != "")
                    check.Checked = Convert.ToBoolean(CellValue);
                else
                    check.Checked = false;
            }
            
        }

        bool GetCheckBoxValue(int VisibleIndex, string FieldName)
        {
            ASPxCheckBox check = (ASPxCheckBox)GridSysUserCredentials.FindRowCellTemplateControl(VisibleIndex, GridSysUserCredentials.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (check != null)
                return check.Checked;
            else
                return false;
        }

        protected void cbp_Report_Callback(object sender, CallbackEventArgsBase e)
        {
            Session["ReportName"] = "KUMPULAN-PENGGUNA-SISTEM";
        }

        protected void MainGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            MainGrid.DataBind();
        }

        protected void MainGrid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "UserDefinedId")
            {
                ASPxHyperLink UserDefinedId = (ASPxHyperLink)MainGrid.FindRowCellTemplateControl(e.VisibleIndex, MainGrid.DataColumns["UserDefinedId"] as GridViewDataColumn, "UserDefinedId");

                if (UserDefinedId != null)
                {
                    string UserGroupId = MainGrid.GetRowValues(e.VisibleIndex, "UserGroupId").ToString();
                    UserDefinedId.Text = e.CellValue.ToString();
                    UserDefinedId.ClientInstanceName = "UserDefinedId" + e.VisibleIndex.ToString();
                    UserDefinedId.NavigateUrl = "javascript: ViewSUG('" + UserGroupId + "');";
                }
            }

        }


    }
 }
    
