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
    public partial class Floor_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_popupFloor_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_popupFloor.JSProperties["cpMode"] = e.Parameter;

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
            Floor_Code.Text = string.Empty;
            Floor_Id.Text = string.Empty;
            Floor_Name.Text = string.Empty;
            cbp_popupFloor.JSProperties["cpErrMsg"] = string.Empty;
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
                    cbp_popupFloor.JSProperties["cpErrMsg"] = FloorMethods.SP_Floor_SaveDelete(ticket.Name, ref Dt, Mode);
                }
                catch (Exception err)
                { cbp_popupFloor.JSProperties["cpErrMsg"] = err.Message; }
                finally
                { Dt.Dispose(); }
            }
            else
                cbp_popupFloor.JSProperties["cpErrMsg"] = "Session Exppired.";
        }

        void LoadMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = FloorMethods.LoadFloor(Floor_Id.Text, ref Dt);

                if (DbErr == string.Empty)
                {
                    if (Dt.Rows.Count == 1)
                    {
                        Floor_Code.Text = Dt.Rows[0]["Floor_Code"].ToString();
                        Floor_Name.Text = Dt.Rows[0]["Floor_Name"].ToString();
                        cbp_popupFloor.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    { cbp_popupFloor.JSProperties["cpErrMsg"] = "More Than 1 Row Found."; }
                }
                else
                { cbp_popupFloor.JSProperties["cpErrMsg"] = DbErr; }
            }
            catch (Exception err)
            { cbp_popupFloor.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose(); }

        }

        protected void Grid_Floor_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            Grid_Floor.DataBind();
        }

        void FormTVP(ref DataTable Dt)
        {
            DataColumn Floor_Id = Dt.Columns.Add("Floor_Id", typeof(Int32));
            DataColumn Floor_Name = Dt.Columns.Add("Floor_Name", typeof(String));
            DataColumn Floor_Code = Dt.Columns.Add("Floor_Code", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (Floor_Id.Text == string.Empty)
                Dr["Floor_Id"] = DBNull.Value;
            else
                Dr["Floor_Id"] = Convert.ToInt32(Floor_Id.Text.Trim());

            Dr["Floor_Name"] = Floor_Name.Text.Trim();
            Dr["Floor_Code"] = Floor_Code.Text.Trim();
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        protected void Grid_Floor_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Floor_Code")
            {
                ASPxHyperLink Floor_Code = (ASPxHyperLink)Grid_Floor.FindRowCellTemplateControl(e.VisibleIndex, Grid_Floor.DataColumns["Floor_Code"] as GridViewDataColumn, "Floor_Code");

                if (Floor_Code != null)
                {
                    string FloorId = Grid_Floor.GetRowValues(e.VisibleIndex, "Floor_Id").ToString();
                    Floor_Code.Text = e.CellValue.ToString();
                    Floor_Code.ClientInstanceName = "Floor_Code" + e.VisibleIndex.ToString();
                    Floor_Code.NavigateUrl = "javascript: Floor_ViewRecord('" + FloorId + "');";
                }
            }
        }
    }
}