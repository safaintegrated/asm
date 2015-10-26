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
    public partial class PTJ_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_popupPTJ_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_popupPTJ.JSProperties["cpMode"] = e.Parameter;

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
            PTJ_SagaCode.Text = string.Empty;
            PTJ_SmpCode.Text = string.Empty;
            PTJ_ShortName.Text = string.Empty;
            PTJ_FullName.Text = string.Empty;
            cbp_popupPTJ.JSProperties["cpErrMsg"] = string.Empty;
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
                    cbp_popupPTJ.JSProperties["cpErrMsg"] = PtjMethods.SP_PusatTanggungjawab_SaveDelete(ticket.Name, ref Dt, Mode);
                }
                catch (Exception err)
                { cbp_popupPTJ.JSProperties["cpErrMsg"] = err.Message; }
                finally
                { Dt.Dispose(); }
            }
            else
                cbp_popupPTJ.JSProperties["cpErrMsg"] = "Session Exppired.";
        }

        void LoadMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = PtjMethods.LoadPtj(PTJ_SagaCode.Text, ref Dt);

                if (DbErr == string.Empty)
                {
                    if (Dt.Rows.Count == 1)
                    {
                        PTJ_SmpCode.Text = Dt.Rows[0]["PTJ_SmpCode"].ToString();
                        PTJ_ShortName.Text = Dt.Rows[0]["PTJ_ShortName"].ToString();
                        PTJ_FullName.Text = Dt.Rows[0]["PTJ_FullName"].ToString();
                        cbp_popupPTJ.JSProperties["cpErrMsg"] = string.Empty; 
                    }
                    else
                    { cbp_popupPTJ.JSProperties["cpErrMsg"] = "More Than 1 Row Found."; }
                }
                else
                { cbp_popupPTJ.JSProperties["cpErrMsg"] = DbErr; }
            }
            catch (Exception err)
            { cbp_popupPTJ.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose(); }
            
        }

        protected void Grid_PTJ_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            Grid_PTJ.DataBind();
        }

        void FormTVP(ref DataTable Dt)
        {
            DataColumn PTJ_SagaCode = Dt.Columns.Add("PTJ_SagaCode", typeof(String));
            DataColumn PTJ_MySpartaCode = Dt.Columns.Add("PTJ_MySpartaCode", typeof(String));
            DataColumn PTJ_SmpCode = Dt.Columns.Add("PTJ_SmpCode", typeof(String));
            DataColumn PTJ_ShortName = Dt.Columns.Add("PTJ_ShortName", typeof(String));
            DataColumn PTJ_FullName = Dt.Columns.Add("PTJ_FullName", typeof(String));
            DataColumn PTJ_HeadUserId = Dt.Columns.Add("PTJ_HeadUserId", typeof(Int32));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["PTJ_SagaCode"] = PTJ_SagaCode.Text.Trim();
            Dr["PTJ_MySpartaCode"] = DBNull.Value;
            Dr["PTJ_SmpCode"] = PTJ_SmpCode.Text.Trim();
            Dr["PTJ_ShortName"] = PTJ_ShortName.Text.Trim();
            Dr["PTJ_FullName"] = PTJ_FullName.Text.Trim();
            Dr["PTJ_HeadUserId"] = DBNull.Value;
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        protected void Grid_PTJ_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "PTJ_SagaCode")
            {
                ASPxHyperLink PTJ_SagaCode = (ASPxHyperLink)Grid_PTJ.FindRowCellTemplateControl(e.VisibleIndex, Grid_PTJ.DataColumns["PTJ_SagaCode"] as GridViewDataColumn, "PTJ_SagaCode");

                if (PTJ_SagaCode != null)
                {
                    PTJ_SagaCode.Text = e.CellValue.ToString();
                    PTJ_SagaCode.ClientInstanceName = "PTJ_SagaCode" + e.VisibleIndex.ToString();
                    PTJ_SagaCode.NavigateUrl = "javascript: PTJ_ViewRecord('"+ e.CellValue +"');";
                }
            }
        }
    }
}