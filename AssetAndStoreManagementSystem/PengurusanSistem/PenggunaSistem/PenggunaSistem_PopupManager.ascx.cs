using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Core.PengurusanSistem;
using System.Data;
using System.Web.Security;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.PengurusanSistem.PenggunaSistem
{
    public partial class PenggunaSistem_PopupManager : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_PopupUserManagement_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_PopupUserManagement.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "LOAD": LoadUser(); break;
                case "SAVE": SaveUser(); break;
            }
        }

        void LoadUser()
        {
            DataSet Ds = new DataSet();
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = PenggunaSistemMethods.LoadSystemUser(ref Ds, User_Id.Text);

                if (DbErr == string.Empty)
                {
                    if (Ds.Tables.Count == 2)
                    {
                        if (Ds.Tables[0].Rows.Count == 1)
                        {
                            //form
                            User_Name.Text = Ds.Tables[0].Rows[0]["User_Name"].ToString();
                            User_EmployeeId.Text = Ds.Tables[0].Rows[0]["User_EmployeeId"].ToString();
                            Dsgt_Name.Text = Ds.Tables[0].Rows[0]["Dsgt_Name"].ToString();
                            PTJ_FullName.Text = Ds.Tables[0].Rows[0]["PTJ_FullName"].ToString();

                            if (Ds.Tables[0].Rows[0]["UserCre_AllPtj"].ToString() != string.Empty)
                            { UserCre_AllPtj.Checked = Convert.ToBoolean(Ds.Tables[0].Rows[0]["UserCre_AllPtj"]); }
                            else
                            { UserCre_AllPtj.Checked = false; }

                            if (Ds.Tables[0].Rows[0]["UserCre_UserGroupId"].ToString() != string.Empty)
                            { UserCre_UserGroupId.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["UserCre_UserGroupId"]); }
                            else
                            { UserCre_UserGroupId.SelectedIndex = -1; }
                            
                            Dt = Ds.Tables[1].Copy();
                            Grid_PopupUserManagement.DataSource = Dt;
                            Grid_PopupUserManagement.KeyFieldName = "RoleId";
                            Grid_PopupUserManagement.DataBind();
                            cbp_PopupUserManagement.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        { cbp_PopupUserManagement.JSProperties["cpErrMsg"] = "More than 1 record found."; }
                    }
                    else
                    { cbp_PopupUserManagement.JSProperties["cpErrMsg"] = "Insufficient number of tables"; }
                }
                else
                { cbp_PopupUserManagement.JSProperties["cpErrMsg"] = DbErr; }
            }
            catch (Exception err)
            { cbp_PopupUserManagement.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Ds.Dispose(); }
        }

        void SaveUser()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if(!ticket.Expired)
            {
                DataTable Dt = new DataTable();

            try
            {
                FormTVP(ref Dt);
                PopulateTVP(ref Dt);
                cbp_PopupUserManagement.JSProperties["cpErrMsg"] = PenggunaSistemMethods.SP_UserRole_Update(ticket.Name, User_Id.Text, Convert.ToInt32(UserCre_UserGroupId.Value), UserCre_AllPtj.Checked, ref Dt);
                
            }
            catch (Exception err)
            { cbp_PopupUserManagement.JSProperties["cpErrMsg"] = "Caught by exceptions.<br>Masalah: "+err.Message; }
            finally
            { Dt.Dispose(); }
            }
            else
            {cbp_PopupUserManagement.JSProperties["cpErrMsg"] = "Session expired.";}
        }

        protected void Grid_PopupUserManagement_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "RoleCount")
            {
                ASPxCheckBox RoleCount = (ASPxCheckBox)Grid_PopupUserManagement.FindRowCellTemplateControl(e.VisibleIndex, Grid_PopupUserManagement.DataColumns["RoleCount"] as GridViewDataCheckColumn, "RoleCount");

                if (RoleCount != null)
                {
                    RoleCount.ClientInstanceName = "RoleCount" + e.VisibleIndex.ToString();

                    if (e.CellValue.ToString() != string.Empty)
                        RoleCount.Checked = Convert.ToBoolean(e.CellValue);
                    else
                        RoleCount.Checked = false;
                }
            }
        }

        void FormTVP(ref DataTable Dt)
        {
            DataColumn User_Id = Dt.Columns.Add("User_Id", typeof(Int32));
            DataColumn User_RoleId = Dt.Columns.Add("User_RoleId", typeof(Int32));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt)
        {
            for (int x = 0; x < Grid_PopupUserManagement.VisibleRowCount; x++)
            {
                ASPxCheckBox RoleCount = (ASPxCheckBox)Grid_PopupUserManagement.FindRowCellTemplateControl(x, Grid_PopupUserManagement.DataColumns["RoleCount"] as GridViewDataCheckColumn, "RoleCount");

                if (RoleCount != null)
                {
                    if (RoleCount.Checked)
                    {
                        DataRow Dr = Dt.NewRow();
                        Dr["User_Id"] = Convert.ToInt32(User_Id.Text);
                        Dr["User_RoleId"] = Convert.ToInt32(Grid_PopupUserManagement.GetRowValues(x, "RoleId"));
                        Dt.Rows.Add(Dr);
                    }
                }
            }

            Dt.AcceptChanges();
        }
    }
}