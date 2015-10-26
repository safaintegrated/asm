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
    public partial class Space_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_popupSpace_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_popupSpace.JSProperties["cpMode"] = e.Parameter;

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
            Space_Code.Text = string.Empty;
            Space_Id.Text = string.Empty;
            Space_Name.Text = string.Empty;
            cbp_popupSpace.JSProperties["cpErrMsg"] = string.Empty;
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
                    cbp_popupSpace.JSProperties["cpErrMsg"] = SpaceMethods.SP_Space_SaveDelete(ticket.Name, ref Dt, Mode);
                }
                catch (Exception err)
                { cbp_popupSpace.JSProperties["cpErrMsg"] = err.Message; }
                finally
                { Dt.Dispose(); }
            }
            else
                cbp_popupSpace.JSProperties["cpErrMsg"] = "Session Exppired.";
        }

        void LoadMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = SpaceMethods.LoadSpace(Space_Id.Text, ref Dt);

                if (DbErr == string.Empty)
                {
                    if (Dt.Rows.Count == 1)
                    {
                        Space_Code.Text = Dt.Rows[0]["Space_Code"].ToString();
                        Space_Name.Text = Dt.Rows[0]["Space_Name"].ToString();
                        cbp_popupSpace.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    { cbp_popupSpace.JSProperties["cpErrMsg"] = "More Than 1 Row Found."; }
                }
                else
                { cbp_popupSpace.JSProperties["cpErrMsg"] = DbErr; }
            }
            catch (Exception err)
            { cbp_popupSpace.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose(); }

        }

        protected void Grid_Space_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            Grid_Space.DataBind();
        }

        void FormTVP(ref DataTable Dt)
        {
            DataColumn Space_Id = Dt.Columns.Add("Space_Id", typeof(Int32));
            DataColumn Space_Name = Dt.Columns.Add("Space_Name", typeof(String));
            DataColumn Space_Code = Dt.Columns.Add("Space_Code", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if(Space_Id.Text == string.Empty)
                Dr["Space_Id"] = DBNull.Value;
            else
                Dr["Space_Id"] = Convert.ToInt32(Space_Id.Text.Trim());

            Dr["Space_Name"] = Space_Name.Text.Trim();
            Dr["Space_Code"] = Space_Code.Text.Trim();
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        protected void Grid_Space_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Space_Code")
            {
                ASPxHyperLink Space_Code = (ASPxHyperLink)Grid_Space.FindRowCellTemplateControl(e.VisibleIndex, Grid_Space.DataColumns["Space_Code"] as GridViewDataColumn, "Space_Code");

                if (Space_Code != null)
                {
                    string SpaceId = Grid_Space.GetRowValues(e.VisibleIndex, "Space_Id").ToString();

                    Space_Code.Text = e.CellValue.ToString();
                    Space_Code.ClientInstanceName = "Space_Code" + e.VisibleIndex.ToString();
                    Space_Code.NavigateUrl = "javascript: Space_ViewRecord('" + SpaceId + "');";
                }
            }
        }
    }
}