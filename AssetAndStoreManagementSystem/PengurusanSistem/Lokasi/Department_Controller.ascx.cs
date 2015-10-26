using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Configuration;
using Core.PengurusanSistem;
using System.Web.Security;
using System.Data;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Lokasi
{
    public partial class Department_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_popupPBJ_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_popupPBJ.JSProperties["cpMode"] = e.Parameter;

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
            PBJ_ParentSagaCode.SelectedIndex = -1;
            PBJ_SmpCode.Text = string.Empty;
            PBJ_ShortName.Text = string.Empty;
            PBJ_Name.Text = string.Empty;
            cbp_popupPBJ.JSProperties["cpErrMsg"] = string.Empty;
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
                    cbp_popupPBJ.JSProperties["cpErrMsg"] = DepartmentMethods.SP_PusatBahagianJabatan_SaveDelete(ticket.Name, ref Dt, Mode);
                }
                catch (Exception err)
                { cbp_popupPBJ.JSProperties["cpErrMsg"] = err.Message; }
                finally
                { Dt.Dispose(); }
            }
            else
                cbp_popupPBJ.JSProperties["cpErrMsg"] = "Session Exppired.";
        }

        void LoadMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = DepartmentMethods.LoadDept(PBJ_SmpCode.Text, ref Dt);

                if (DbErr == string.Empty)
                {
                    if (Dt.Rows.Count == 1)
                    {
                        PBJ_ParentSagaCode.Value = Dt.Rows[0]["PBJ_ParentSagaCode"].ToString();
                        PBJ_SmpCode.Text = Dt.Rows[0]["PBJ_SmpCode"].ToString();
                        PBJ_ShortName.Text = Dt.Rows[0]["PBJ_ShortName"].ToString();
                        PBJ_Name.Text = Dt.Rows[0]["PBJ_Name"].ToString();
                        cbp_popupPBJ.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    { cbp_popupPBJ.JSProperties["cpErrMsg"] = "More Than 1 Row Found."; }
                }
                else
                { cbp_popupPBJ.JSProperties["cpErrMsg"] = DbErr; }
            }
            catch (Exception err)
            { cbp_popupPBJ.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose(); }

        }

        protected void Grid_PBJ_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            Grid_PBJ.DataBind();
        }

        void FormTVP(ref DataTable Dt)
        {
            DataColumn PBJ_ParentSagaCode = Dt.Columns.Add("PBJ_ParentSagaCode", typeof(String));
            DataColumn PBJ_SmpCode = Dt.Columns.Add("PBJ_SmpCode", typeof(String));
            DataColumn PBJ_Name = Dt.Columns.Add("PBJ_Name", typeof(String));
            DataColumn PBJ_ShortName = Dt.Columns.Add("PBJ_ShortName", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["PBJ_ParentSagaCode"] = PBJ_ParentSagaCode.Value.ToString();
            Dr["PBJ_SmpCode"] = PBJ_SmpCode.Text.Trim();
            Dr["PBJ_Name"] = PBJ_Name.Text.Trim();
            Dr["PBJ_ShortName"] = PBJ_ShortName.Text.Trim();
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        protected void Grid_PBJ_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "PBJ_SmpCode")
            {
                ASPxHyperLink PBJ_SmpCode = (ASPxHyperLink)Grid_PBJ.FindRowCellTemplateControl(e.VisibleIndex, Grid_PBJ.DataColumns["PBJ_SmpCode"] as GridViewDataColumn, "PBJ_SmpCode");

                if (PBJ_SmpCode != null)
                {
                    PBJ_SmpCode.Text = e.CellValue.ToString();
                    PBJ_SmpCode.ClientInstanceName = "PBJ_SagaCode" + e.VisibleIndex.ToString();
                    PBJ_SmpCode.NavigateUrl = "javascript: PBJ_ViewRecord('" + e.CellValue + "');";
                }
            }
        }
    }
}