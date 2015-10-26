using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;
using Core.Aset.Pendaftaran;
using System.Configuration;
using System.Web.Security;

namespace AssetAndStoreManagementSystem.Aset.Pendaftaran
{
    public partial class Pendaftaran_Accessories : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ComponentDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (ComponentParentUniqueId.Text == "" || ComponentParentType.Text == "")
            { e.Cancel = true; }
            else
            {
                e.Command.Parameters["@ParentId"].Value = ComponentParentUniqueId.Text;
                e.Command.Parameters["@ParentType"].Value = ComponentParentType.Text;
            }
        }

        protected void GridComponent_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridComponent.DataBind();
        }

        protected void GridComponent_AfterPerformCallback(object sender, DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            GridComponent.ExpandAll();
        }

        void FormComponentTvp(ref DataTable Dt)
        {
            DataColumn AIC_RowId = Dt.Columns.Add("AIC_RowId", typeof(Int32));
            DataColumn AIC_UniqueId = Dt.Columns.Add("AIC_UniqueId", typeof(String));
            DataColumn AIC_ParentUniqueId = Dt.Columns.Add("AIC_ParentUniqueId", typeof(String));
            DataColumn AIC_ParentType = Dt.Columns.Add("AIC_ParentType", typeof(Int32));
            DataColumn AIC_Desc = Dt.Columns.Add("AIC_Desc", typeof(String));
            DataColumn AIC_TypeId = Dt.Columns.Add("AIC_TypeId", typeof(Int32));
            DataColumn AIC_Brand = Dt.Columns.Add("AIC_Brand", typeof(String));
            DataColumn AIC_Model = Dt.Columns.Add("AIC_Model", typeof(String));
            DataColumn AIC_UnitPrice = Dt.Columns.Add("AIC_UnitPrice", typeof(Decimal));
            DataColumn AIC_WarrantyStart = Dt.Columns.Add("AIC_WarrantyStart", typeof(DateTime));
            DataColumn AIC_WarrantyEnd = Dt.Columns.Add("AIC_WarrantyEnd", typeof(DateTime));
            DataColumn AIC_Status = Dt.Columns.Add("AIC_Status", typeof(Int32));
            DataColumn AIC_InstalledDate = Dt.Columns.Add("AIC_InstalledDate", typeof(DateTime));
            DataColumn AIC_RemoveDate = Dt.Columns.Add("AIC_RemoveDate", typeof(DateTime));
            DataColumn AIC_WriteOffDate = Dt.Columns.Add("AIC_WriteOffDate", typeof(DateTime));
            DataColumn AIC_Note = Dt.Columns.Add("AIC_Note", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateComponentTvp(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if(AIC_RowId.Text == "")
                Dr["AIC_RowId"] = DBNull.Value;
            else
                Dr["AIC_RowId"] = Convert.ToInt32(AIC_RowId.Text);

            if(AIC_UniqueId.Text == "")
                Dr["AIC_UniqueId"] = DBNull.Value;
            else
                Dr["AIC_UniqueId"] = AIC_UniqueId.Text;

            Dr["AIC_ParentUniqueId"] = AIC_ParentUniqueId.Value.ToString();

            Dr["AIC_ParentType"] = Convert.ToInt32(ComponentParentType.Text);
            Dr["AIC_Desc"] = AIC_Desc.Text.Trim();

            if(AIC_TypeId.GridView.FocusedRowIndex == -1)
                Dr["AIC_TypeId"] = DBNull.Value;
            else
                Dr["AIC_TypeId"] = AIC_TypeId.Value;

            Dr["AIC_Brand"] = AIC_Note.Text.Trim();
            Dr["AIC_Model"] = AIC_Note.Text.Trim();
            
            Dr["AIC_UnitPrice"] = Convert.ToDecimal(AIC_UnitPrice.Value);

            if(AIC_WarrantyStart.Value == DBNull.Value)
                Dr["AIC_WarrantyStart"]  = DBNull.Value;
            else
                Dr["AIC_WarrantyStart"] = AIC_WarrantyStart.Date;

            if(AIC_WarrantyEnd.Value == DBNull.Value)
                Dr["AIC_WarrantyEnd"] = DBNull.Value;
            else
                Dr["AIC_WarrantyEnd"] = AIC_WarrantyEnd.Date;

            if(AIC_Status.Value == null)
                Dr["AIC_Status"] = DBNull.Value;
            else
                Dr["AIC_Status"] = Convert.ToInt32(AIC_Status.Value);

            if(AIC_InstalledDate.Value == DBNull.Value)
                Dr["AIC_InstalledDate"] = DBNull.Value;
            else
                Dr["AIC_InstalledDate"] = AIC_InstalledDate.Date;

             if(AIC_RemoveDate.Value == DBNull.Value)
                Dr["AIC_RemoveDate"] = DBNull.Value;
            else
                Dr["AIC_RemoveDate"] = AIC_RemoveDate.Date;

             if(AIC_WriteOffDate.Value == DBNull.Value)
                Dr["AIC_WriteOffDate"] = DBNull.Value;
            else
                Dr["AIC_WriteOffDate"] = AIC_WriteOffDate.Date;

            Dr["AIC_Note"] = AIC_Note.Text.Trim();

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        #region AIC_TypeId Initialize
        protected void AIC_TypeId_Init(object sender, EventArgs e)
        {
            ASPxGridLookup AIC_TypeId = (ASPxGridLookup)sender;
            ASPxGridView AIC_TypeId_GridView = AIC_TypeId.GridView;
            AIC_TypeId_GridView.CustomCallback += AIC_TypeId_GridView_CustomCallback;
        }

        void AIC_TypeId_GridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView AIC_TypeId_GridView = (ASPxGridView)sender;
            AIC_TypeId_GridView.DataBind();
        }
        #endregion

        #region AIC_ParentUniqueId Initialize
        protected void AIC_ParentUniqueId_Init(object sender, EventArgs e)
        {
            ASPxGridLookup AIC_ParentUniqueId = (ASPxGridLookup)sender;
            ASPxGridView AIC_ParentUniqueId_GridView = AIC_ParentUniqueId.GridView;
            AIC_ParentUniqueId_GridView.CustomCallback += AIC_ParentUniqueId_GridView_CustomCallback;
        }

        void AIC_ParentUniqueId_GridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView AIC_ParentUniqueId_GridView = (ASPxGridView)sender;
            AIC_ParentUniqueId_GridView.DataBind();
        }

        protected void ParentDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (ComponentParentUniqueId.Text == "" || ComponentParentType.Text == "")
            { e.Cancel = true; }
            else
            {
                e.Command.Parameters["@ParentId"].Value = ComponentParentUniqueId.Text;
                e.Command.Parameters["@ParentType"].Value = ComponentParentType.Text;
            }
        }
        #endregion

        protected void cbp_ComponentsManagement_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_ComponentsManagement.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "NEW": ComponentsNewMode(); break;
                case "EDIT": ComponentsEditMode(); break;
                case "SAVE": ComponentsSaveMode(); break;
            }
        }
        
        void ComponentsNewMode()
        {
            AIC_RowId.Text = "";
            AIC_UniqueId.Text = "";

            AIC_ParentUniqueId.DataBind();

            if(ComponentParentType.Text == "1")
            {
                AIC_ParentUniqueId.Value = ComponentParentUniqueId.Text;
                AIC_ParentUniqueId.ClientEnabled = false;
            }
            else
            {
                AIC_ParentUniqueId.Value = null;
                AIC_ParentUniqueId.ClientEnabled = true;
            }

            AIC_Desc.Text = "";
            AIC_TypeId.Value = null;
            AIC_Brand.Text = "";
            AIC_Model.Text = "";
            AIC_UnitPrice.Value = 0;
            AIC_WarrantyStart.Value = DBNull.Value;
            AIC_WarrantyEnd.Value = DBNull.Value;
            AIC_Status.Value = DBNull.Value;
            AIC_InstalledDate.Value = DBNull.Value;
            AIC_RemoveDate.Value = DBNull.Value;
            AIC_WriteOffDate.Value = DBNull.Value;
            AIC_Note.Text = "";

            cbp_ComponentsManagement.JSProperties["cpErrMsg"] = string.Empty;
        }

        void ComponentsEditMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = ComponentsMethods.LoadComponent(AIC_UniqueId.Text, ref Dt);

                if (err == "")
                {
                    AIC_ParentUniqueId.DataBind(); 
                   
                    AIC_ParentUniqueId.Value = Dt.Rows[0]["AIC_ParentUniqueId"].ToString();
                    AIC_ParentUniqueId.ClientEnabled = false;                  

                    AIC_Desc.Text = Dt.Rows[0]["AIC_Desc"].ToString();

                    if (Dt.Rows[0]["AIC_TypeId"].ToString() != "")
                        AIC_TypeId.Value = Convert.ToInt32(Dt.Rows[0]["AIC_TypeId"]);
                    else
                        AIC_TypeId.Value = null;

                    AIC_Brand.Text = Dt.Rows[0]["AIC_Brand"].ToString();
                    AIC_Model.Text = Dt.Rows[0]["AIC_Model"].ToString();

                    if (Dt.Rows[0]["AIC_UnitPrice"].ToString() != "")
                        AIC_UnitPrice.Value = Convert.ToDecimal(Dt.Rows[0]["AIC_UnitPrice"]);
                    else
                        AIC_UnitPrice.Value = 0;


                    if (Dt.Rows[0]["AIC_WarrantyStart"].ToString() != "")
                        AIC_WarrantyStart.Date = Convert.ToDateTime(Dt.Rows[0]["AIC_WarrantyStart"]);
                    else
                        AIC_WarrantyStart.Value = DBNull.Value;

                    if (Dt.Rows[0]["AIC_WarrantyEnd"].ToString() != "")
                        AIC_WarrantyEnd.Date = Convert.ToDateTime(Dt.Rows[0]["AIC_WarrantyEnd"]);
                    else
                        AIC_WarrantyEnd.Value = DBNull.Value;

                    if (Dt.Rows[0]["AIC_Status"].ToString() != "")
                        AIC_Status.Value = Convert.ToInt32(Dt.Rows[0]["AIC_Status"]);
                    else
                        AIC_Status.Value = DBNull.Value;

                    if (Dt.Rows[0]["AIC_InstalledDate"].ToString() != "")
                        AIC_InstalledDate.Date = Convert.ToDateTime(Dt.Rows[0]["AIC_InstalledDate"]);
                    else
                        AIC_InstalledDate.Value = DBNull.Value;
                    
                    if (Dt.Rows[0]["AIC_RemoveDate"].ToString() != "")
                        AIC_RemoveDate.Date = Convert.ToDateTime(Dt.Rows[0]["AIC_RemoveDate"]);
                    else
                        AIC_RemoveDate.Value = DBNull.Value;
                    
                    if (Dt.Rows[0]["AIC_WriteOffDate"].ToString() != "")
                        AIC_WriteOffDate.Date = Convert.ToDateTime(Dt.Rows[0]["AIC_WriteOffDate"]);
                    else
                        AIC_WriteOffDate.Value = DBNull.Value;

                    AIC_Note.Text = Dt.Rows[0]["AIC_Note"].ToString();
                    AIC_RowId.Text = Dt.Rows[0]["AIC_RowId"].ToString();

                    cbp_ComponentsManagement.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_ComponentsManagement.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_ComponentsManagement.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { Dt.Dispose(); }            
        }

        void ComponentsSaveMode()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();

                try
                {
                    FormComponentTvp(ref Dt);
                    PopulateComponentTvp(ref Dt);

                    string err = ComponentsMethods.SP_Save_AssetInventoryComponent(ref Dt,ticket.Name);

                    if (err == "")
                    {
                        cbp_ComponentsManagement.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_ComponentsManagement.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_ComponentsManagement.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
                finally
                { Dt.Dispose(); }
            }
            else
                cbp_ComponentsManagement.JSProperties["cpErrMsg"] = "Session Expired.";            
        }

        protected void GridComponent_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "AIC_Desc")
            {
                ASPxHyperLink AIC_Desc = (ASPxHyperLink)GridComponent.FindRowCellTemplateControl(e.VisibleIndex, GridComponent.DataColumns["AIC_Desc"] as GridViewDataColumn, "AIC_Desc");

                if (AIC_Desc != null)
                {
                    string AIC_UniqueId = GridComponent.GetRowValues(e.VisibleIndex, "AIC_UniqueId").ToString();
                    AIC_Desc.ClientInstanceName = "AIC_Desc" + e.VisibleIndex.ToString();
                    AIC_Desc.Text = e.CellValue.ToString();
                    AIC_Desc.NavigateUrl = "javascript: EditComponentMode('" + AIC_UniqueId + "');";
                }
            }
        }
    }
}