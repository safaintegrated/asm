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
    public partial class Building_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_popupBuild_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_popupBuild.JSProperties["cpMode"] = e.Parameter;

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
            Build_Code.Text = string.Empty;
            Build_Id.Text = string.Empty;
            Build_Name.Text = string.Empty;
            cbp_popupBuild.JSProperties["cpErrMsg"] = string.Empty;
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
                    cbp_popupBuild.JSProperties["cpErrMsg"] = BuildingMethods.SP_Building_SaveDelete(ticket.Name, ref Dt, Mode);
                }
                catch (Exception err)
                { cbp_popupBuild.JSProperties["cpErrMsg"] = err.Message; }
                finally
                { Dt.Dispose(); }
            }
            else
                cbp_popupBuild.JSProperties["cpErrMsg"] = "Session Exppired.";
        }

        void LoadMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = BuildingMethods.LoadBuilding(Build_Id.Text, ref Dt);

                if (DbErr == string.Empty)
                {
                    if (Dt.Rows.Count == 1)
                    {
                        Build_Code.Text = Dt.Rows[0]["Build_Code"].ToString();
                        Build_Name.Text = Dt.Rows[0]["Build_Name"].ToString();
                        cbp_popupBuild.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    { cbp_popupBuild.JSProperties["cpErrMsg"] = "More Than 1 Row Found."; }
                }
                else
                { cbp_popupBuild.JSProperties["cpErrMsg"] = DbErr; }
            }
            catch (Exception err)
            { cbp_popupBuild.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose(); }

        }

        protected void Grid_Build_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            Grid_Build.DataBind();
        }

        void FormTVP(ref DataTable Dt)
        {  
            DataColumn Build_Id = Dt.Columns.Add("Build_Id", typeof(Int32));
            DataColumn Build_Name = Dt.Columns.Add("Build_Name", typeof(String));
            DataColumn Build_Code = Dt.Columns.Add("Build_Code", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (Build_Id.Text != string.Empty)
                Dr["Build_Id"] = Convert.ToInt32(Build_Id.Text.Trim());
            else
                Dr["Build_Id"] = DBNull.Value;

            Dr["Build_Name"] = Build_Name.Text.Trim();
            Dr["Build_Code"] = Build_Code.Text.Trim();
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        protected void Grid_Build_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Build_Code")
            {
                ASPxHyperLink Build_Code = (ASPxHyperLink)Grid_Build.FindRowCellTemplateControl(e.VisibleIndex, Grid_Build.DataColumns["Build_Code"] as GridViewDataColumn, "Build_Code");

                if (Build_Code != null)
                {
                    string BuildId = Grid_Build.GetRowValues(e.VisibleIndex, "Build_Id").ToString();
                    Build_Code.Text = e.CellValue.ToString();
                    Build_Code.ClientInstanceName = "Build_Code" + e.VisibleIndex.ToString();
                    Build_Code.NavigateUrl = "javascript: Build_ViewRecord('" + BuildId + "');";
                }
            }
        }
    }
}