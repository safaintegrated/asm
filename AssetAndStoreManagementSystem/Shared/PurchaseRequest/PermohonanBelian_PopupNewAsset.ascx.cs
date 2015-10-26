using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using System.Data;
using Core.Shared;
using DevExpress.Web;
using Core.Informix;
using System.Data.SqlClient;
using Core.Utility;
using Core.Common;
using DataAccess.Entity;

namespace AssetAndStoreManagementSystem.Shared.PurchaseRequest
{
    public partial class PermohonanBelian_PopupNewAsset : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //NewAsset_GLAC_Account
            //ASPxGridLookup Lookup = (ASPxGridLookup)NewAsset_GLAC_Account;
            //ASPxGridView GV_Vot = Lookup.GridView;
            //GV_Vot.CustomCallback += GV_Vot_CustomCallback;

            //NewAsset_PRI_SubCatId
            ASPxGridLookup Lookup2 = (ASPxGridLookup)NewAsset_PRI_SubCatId;
            ASPxGridView GV = Lookup2.GridView;
            GV.CustomCallback += GV_CustomCallback;

        }

        protected void cbp_LineItem_NewAsset_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_LineItem_NewAsset.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "NEW": NewMode(); break;
                case "SAVE": SaveMode(1); break;
                case "DELETE": SaveMode(2); break;
                case "ADDCOMPONENT": AddComponent(); break;
                case "REMOVECOMPONENT": RemoveComponent(); break;
            }
        }

        void NewMode()
        {
            NewAsset_PRI_Desc.Text = string.Empty;
            NewAsset_PRI_CatId.Value = DBNull.Value;
            NewAsset_PRI_SubCatId.Value = DBNull.Value;
            NewAsset_PRI_SubCatId.ClientEnabled = false;
            NewAsset_PRI_UomId.Value = DBNull.Value;
            NewAsset_PRI_TypeId.Value = DBNull.Value;
            NewAsset_PRI_Qty.Value = 0;
            NewAsset_PRI_UnitPrice.Value = 0;
            NewAsset_C.Value = 0;
            NewAsset_PRI_TaxRate.Value = 0;
            NewAsset_E.Value = 0;
            NewAsset_F.Value = 0;
            cbp_LineItem_NewAsset.JSProperties["cpErrMsg"] = string.Empty;
        }

        void SaveMode(int Action)
        {
            DataTable Dt = new DataTable();
            DataTable Dtc = new DataTable();

            try
            {
                FormTVP(ref Dt);
                PopulateTVP(ref Dt);
                FormComponentTVP(ref Dtc);
                PopulateComponentTVP(ref Dtc);
                cbp_LineItem_NewAsset.JSProperties["cpErrMsg"] = PermohonanBelianMethods.SP_PR_Items_NewAsset_SaveDelete(NewAsset_PRI_ProcessId.Text, NewAsset_PRI_ItemNumber.Text, NewAsset_PRI_Revision.Text, ref Dt, ref Dtc); ;
            }
            catch (Exception err)
            { cbp_LineItem_NewAsset.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose(); }
        }

        void AddComponent()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormComponentTVP(ref Dt);
                PopulateComponentTVP(ref Dt);

                DataRow Dr = Dt.NewRow();
                Dr["PRIC_ProcessId"] = NewAsset_PRI_ProcessId.Text;
                Dr["PRIC_Revision"] = Convert.ToInt32(NewAsset_PRI_Revision.Text);
                Dr["PRIC_ItemNumber"] = Convert.ToInt32(NewAsset_PRI_ItemNumber.Text);
                Dr["PRIC_ComponentNumber"] = UtilityMethods.FormNextSortingId(ref Dt, "PRIC_ComponentNumber");
                Dr["PRIC_Desc"] = DBNull.Value;
                Dr["PRIC_Brand"] = DBNull.Value;
                Dr["PRIC_Model"] = DBNull.Value;
                Dr["PRIC_Qty"] = 0;
                Dr["PRIC_UnitCost"] = 0;

                Dt.Rows.Add(Dr);
                Dt.AcceptChanges();

                BindComponentGrid(ref Dt);
                cbp_LineItem_NewAsset.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            { cbp_LineItem_NewAsset.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose(); }
        }

        void RemoveComponent()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormComponentTVP(ref Dt);
                PopulateComponentTVP(ref Dt);

                DataRow[] Drs = Dt.Select("PRIC_ComponentNumber = " + NewAsset_TempDeleteComponent.Text);

                if (Drs.Length == 1)
                    Dt.Rows.Remove(Drs[0]);

                Dt.AcceptChanges();

                BindComponentGrid(ref Dt);
                cbp_LineItem_NewAsset.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            { cbp_LineItem_NewAsset.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose(); }
        }

        void FormComponentTVP(ref DataTable Dt)
        {
            DataColumn PRIC_ProcessId = Dt.Columns.Add("PRIC_ProcessId", typeof(String));
            DataColumn PRIC_Revision = Dt.Columns.Add("PRIC_Revision", typeof(Int32));
            DataColumn PRIC_ItemNumber = Dt.Columns.Add("PRIC_ItemNumber", typeof(Int32));
            DataColumn PRIC_ComponentNumber = Dt.Columns.Add("PRIC_ComponentNumber", typeof(Int32));
            DataColumn PRIC_Desc = Dt.Columns.Add("PRIC_Desc", typeof(String));
            DataColumn PRIC_Brand = Dt.Columns.Add("PRIC_Brand", typeof(String));
            DataColumn PRIC_Model = Dt.Columns.Add("PRIC_Model", typeof(String));
            DataColumn PRIC_Qty = Dt.Columns.Add("PRIC_Qty", typeof(Int32));
            DataColumn PRIC_UnitCost = Dt.Columns.Add("PRIC_UnitCost", typeof(Decimal));
            Dt.AcceptChanges();
        }

        void PopulateComponentTVP(ref DataTable Dt)
        {
            for (int i = 0; i < NewAsset_ComponentGrid.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["PRIC_ProcessId"] = NewAsset_ComponentGrid.GetRowValues(i, "PRIC_ProcessId").ToString();
                Dr["PRIC_Revision"] = Convert.ToInt32(NewAsset_ComponentGrid.GetRowValues(i, "PRIC_Revision"));
                Dr["PRIC_ItemNumber"] = Convert.ToInt32(NewAsset_ComponentGrid.GetRowValues(i, "PRIC_ItemNumber"));
                Dr["PRIC_ComponentNumber"] = Convert.ToInt32(NewAsset_ComponentGrid.GetRowValues(i, "PRIC_ComponentNumber"));

                ASPxTextBox PRIC_Desc = (ASPxTextBox)NewAsset_ComponentGrid.FindRowCellTemplateControl(i, NewAsset_ComponentGrid.DataColumns["PRIC_Desc"] as GridViewDataColumn, "PRIC_Desc");

                if (PRIC_Desc != null)
                    Dr["PRIC_Desc"] = PRIC_Desc.Text.Trim();
                else
                    Dr["PRIC_Desc"] = DBNull.Value;

                ASPxTextBox PRIC_Brand = (ASPxTextBox)NewAsset_ComponentGrid.FindRowCellTemplateControl(i, NewAsset_ComponentGrid.DataColumns["PRIC_Brand"] as GridViewDataColumn, "PRIC_Brand");

                if (PRIC_Brand != null)
                    Dr["PRIC_Brand"] = PRIC_Brand.Text.Trim();
                else
                    Dr["PRIC_Brand"] = DBNull.Value;

                ASPxTextBox PRIC_Model = (ASPxTextBox)NewAsset_ComponentGrid.FindRowCellTemplateControl(i, NewAsset_ComponentGrid.DataColumns["PRIC_Model"] as GridViewDataColumn, "PRIC_Model");

                if (PRIC_Model != null)
                    Dr["PRIC_Model"] = PRIC_Model.Text.Trim();
                else
                    Dr["PRIC_Model"] = DBNull.Value;

                ASPxSpinEdit PRIC_Qty = (ASPxSpinEdit)NewAsset_ComponentGrid.FindRowCellTemplateControl(i, NewAsset_ComponentGrid.DataColumns["PRIC_Qty"] as GridViewDataColumn, "PRIC_Qty");

                if (PRIC_Qty != null)
                    Dr["PRIC_Qty"] = Convert.ToInt32(PRIC_Qty.Value);
                else
                    Dr["PRIC_Qty"] = 0;

                ASPxSpinEdit PRIC_UnitCost = (ASPxSpinEdit)NewAsset_ComponentGrid.FindRowCellTemplateControl(i, NewAsset_ComponentGrid.DataColumns["PRIC_UnitCost"] as GridViewDataColumn, "PRIC_UnitCost");

                if (PRIC_UnitCost != null)
                    Dr["PRIC_UnitCost"] = Convert.ToDecimal(PRIC_UnitCost.Value);
                else
                    Dr["PRIC_UnitCost"] = 0;

                Dt.Rows.Add(Dr);
            }

            Dt.AcceptChanges();
        }

        void BindComponentGrid(ref DataTable Dt)
        {
            NewAsset_ComponentGrid.DataSource = Dt;
            NewAsset_ComponentGrid.KeyFieldName = "PRIC_ComponentNumber";
            NewAsset_ComponentGrid.DataBind();
        }

        void FormTVP(ref DataTable Dt)
        {
            DataColumn PRI_ProcessId = Dt.Columns.Add("PRI_ProcessId", typeof(String));
            DataColumn PRI_ItemNumber = Dt.Columns.Add("PRI_ItemNumber", typeof(Int32));
            DataColumn PRI_PurchaseType = Dt.Columns.Add("PRI_PurchaseType", typeof(Int32));
            DataColumn PRI_ParentId = Dt.Columns.Add("PRI_ParentId", typeof(String));
            DataColumn PRI_CatId = Dt.Columns.Add("PRI_CatId", typeof(Int32));
            DataColumn PRI_SubCatId = Dt.Columns.Add("PRI_SubCatId", typeof(Int32));
            DataColumn PRI_TypeId = Dt.Columns.Add("PRI_TypeId", typeof(Int32));
            DataColumn PRI_Desc = Dt.Columns.Add("PRI_Desc", typeof(String));
            DataColumn PRI_UomId = Dt.Columns.Add("PRI_UomId", typeof(Int32));
            DataColumn PRI_Qty = Dt.Columns.Add("PRI_Qty", typeof(Int32));
            DataColumn PRI_UnitPrice = Dt.Columns.Add("PRI_UnitPrice", typeof(Decimal));
            DataColumn PRI_TaxCode = Dt.Columns.Add("PRI_TaxCode", typeof(String));
            DataColumn PRI_TaxRate = Dt.Columns.Add("PRI_TaxRate", typeof(Decimal));
            DataColumn PRI_ProjectCode = Dt.Columns.Add("PRI_ProjectCode", typeof(String));
            DataColumn PRI_GLcode = Dt.Columns.Add("PRI_GLcode", typeof(String));
            DataColumn PRI_Revision = Dt.Columns.Add("PRI_Revision", typeof(Int32));
            DataColumn PRI_GLCodeDesc = Dt.Columns.Add("PRI_GLCodeDesc", typeof(String));
            DataColumn PRI_ProjectCodeDesc = Dt.Columns.Add("PRI_ProjectCodeDesc", typeof(String));
            DataColumn PRI_TaxCodeDesc = Dt.Columns.Add("PRI_TaxCodeDesc", typeof(String));
            DataColumn PRI_TaxGL = Dt.Columns.Add("PRI_TaxGL", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["PRI_ProcessId"] = NewAsset_PRI_ProcessId.Text;
            Dr["PRI_ItemNumber"] = Convert.ToInt32(NewAsset_PRI_ItemNumber.Text);
            Dr["PRI_PurchaseType"] = 1;
            Dr["PRI_ParentId"] = DBNull.Value;

            if (NewAsset_PRI_CatId.Value != null)
                Dr["PRI_CatId"] = Convert.ToInt32(NewAsset_PRI_CatId.Value);
            else
                Dr["PRI_CatId"] = DBNull.Value;

            if (NewAsset_PRI_SubCatId.Value != null)
                Dr["PRI_SubCatId"] = Convert.ToInt32(NewAsset_PRI_SubCatId.Value);
            else
                Dr["PRI_SubCatId"] = DBNull.Value;

            if (NewAsset_PRI_TypeId.Value != null)
                Dr["PRI_TypeId"] = Convert.ToInt32(NewAsset_PRI_TypeId.Value);
            else
                Dr["PRI_TypeId"] = DBNull.Value;

            Dr["PRI_Desc"] = NewAsset_PRI_Desc.Text.Trim();

            if (NewAsset_PRI_UomId.Value != null)
                Dr["PRI_UomId"] = Convert.ToInt32(NewAsset_PRI_UomId.Value);
            else
                Dr["PRI_UomId"] = DBNull.Value;

            Dr["PRI_Qty"] = Convert.ToInt32(NewAsset_PRI_Qty.Value);
            Dr["PRI_UnitPrice"] = Convert.ToDecimal(NewAsset_PRI_UnitPrice.Value);

            if (NewAsset_PRI_TaxCode.Value != null)
            {
                Dr["PRI_TaxCode"] = NewAsset_PRI_TaxCode.GridView.GetRowValues(NewAsset_PRI_TaxCode.GridView.FocusedRowIndex, "uttxl_code").ToString();
                Dr["PRI_TaxCodeDesc"] = NewAsset_PRI_TaxCode.GridView.GetRowValues(NewAsset_PRI_TaxCode.GridView.FocusedRowIndex, "uttxl_shortdesc").ToString();
                Dr["PRI_TaxGL"] = NewAsset_PRI_TaxCode.GridView.GetRowValues(NewAsset_PRI_TaxCode.GridView.FocusedRowIndex, "apcd_vatglac").ToString();
            }
            else
            {
                Dr["PRI_TaxCode"] = DBNull.Value;
                Dr["PRI_TaxCodeDesc"] = DBNull.Value;
                Dr["PRI_TaxGL"] = DBNull.Value;
            }

            //if (NewAsset_PRI_ProjectCode.Value != null)
            //{
            //    Dr["PRI_ProjectCode"] = NewAsset_PRI_ProjectCode.Value.ToString();
            //    Dr["PRI_ProjectCodeDesc"] = NewAsset_PRI_ProjectCode.Text;
            //}
            //else
            //{
            //    Dr["PRI_ProjectCode"] = DBNull.Value;
            //    Dr["PRI_ProjectCodeDesc"] = DBNull.Value;
            //}

            Dr["PRI_TaxRate"] = Convert.ToDecimal(NewAsset_PRI_TaxRate.Value);

            //if (NewAsset_PRI_GLcode.Value != null)
            //{
            //    Dr["PRI_GLcode"] = NewAsset_PRI_GLcode.GridView.GetRowValues(NewAsset_PRI_GLcode.GridView.FocusedRowIndex, "glac_account").ToString();
            //    Dr["PRI_GLCodeDesc"] = NewAsset_PRI_GLcode.GridView.GetRowValues(NewAsset_PRI_GLcode.GridView.FocusedRowIndex, "glac_desc").ToString();
            //}
            //else
            //{
            //    Dr["PRI_GLcode"] = DBNull.Value;
            //    Dr["PRI_GLCodeDesc"] = DBNull.Value;
            //}

            Dr["PRI_Revision"] = Convert.ToInt32(NewAsset_PRI_Revision.Text);
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        protected void SubCatDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (NewAsset_PRI_CatId.Value == null)
                e.Cancel = true;
            else
                e.Command.Parameters["@CatId"].Value = Convert.ToInt32(NewAsset_PRI_CatId.Value);
        }

        string GetVots(ref DataTable ReturnDt, string CurrUser)
        {
            string InformixXmlPhysicalPath = Server.MapPath(ConfigurationManager.AppSettings["SagaXmlFilePath"].ToString());
            string SagaCommandText = string.Empty;
            bool AccessToAllPtj = false;
            string CurrentUserPtjCode = string.Empty;

            if (Convert.ToBoolean(ConfigurationManager.AppSettings["PR_VOT_Based_On_CurrPtj"]))
            {
                CommonMethods.GetUserViewAllPtjRights(CurrUser, ref AccessToAllPtj);

                if (AccessToAllPtj)
                {
                    SagaCommandText = "select glac_account,glac_desc from gl_account where glac_account matches '*" + NewAsset_PRI_SubCatId.GridView.GetRowValues(NewAsset_PRI_SubCatId.GridView.FocusedRowIndex, "SubCatGLAsset").ToString() + "*'";
                }
                else
                {
                    CommonMethods.CurrentUserPtjCode(CurrUser, ref CurrentUserPtjCode);
                    SagaCommandText = "select glac_account,glac_desc from gl_account where glac_account matches '*" + NewAsset_PRI_SubCatId.GridView.GetRowValues(NewAsset_PRI_SubCatId.GridView.FocusedRowIndex, "SubCatGLAsset").ToString() + "*' and glac_account[6,7] = '" + CurrentUserPtjCode + "'";
                }
            }
            else
            { SagaCommandText = "select glac_account,glac_desc from gl_account where glac_account matches '*" + NewAsset_PRI_SubCatId.GridView.GetRowValues(NewAsset_PRI_SubCatId.GridView.FocusedRowIndex, "SubCatGLAsset").ToString() + "*'"; }

            return InformixMethods.FetchTable(SagaCommandText, InformixXmlPhysicalPath, ref ReturnDt);
            //try
            //{
            //    string SagaCommandText = "select glac_account,glac_desc from gl_account where glac_account matches '*" + NewAsset_PRI_SubCatId.GridView.GetRowValues(NewAsset_PRI_SubCatId.GridView.FocusedRowIndex, "SubCatGLAsset").ToString() + "*'";
            //    return InformixMethods.FetchTable(SagaCommandText, InformixXmlPhysicalPath, ref ReturnDt);
            //}
            //catch (Exception err)
            //{
            //    return err.Message;
            //}
        }

        protected void PRI_GLcodeDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                if (NewAsset_PRI_SubCatId.Value != null)
                {
                    DataTable Dt = new DataTable();

                    try
                    {
                        string DbErr = GetVots(ref Dt, ticket.Name);

                        if (DbErr == string.Empty)
                        {
                            SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                            parm1.Value = Dt;
                            parm1.Direction = ParameterDirection.Input;
                            e.Command.Parameters.Add(parm1);

                            //NewAsset_PRI_GLcode.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        {
                            e.Cancel = true;
                            //NewAsset_PRI_GLcode.JSProperties["cpErrMsg"] = "Pangkalan data SAGA tidak dapat dicapai (Database Error).<br>Masalah: " + DbErr;
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "SagaError", "alert('Pangkalan data SAGA tidak dapat dicapai.\nDatabase Error.');", true);
                        }
                    }
                    catch (Exception err)
                    {
                        e.Cancel = true;
                        Console.WriteLine(err.Message);
                        //NewAsset_PRI_GLcode.JSProperties["cpErrMsg"] = "Pangkalan data SAGA tidak dapat dicapai (Caught by Exceptions).<br>Masalah: " + err.Message;
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "SagaError", "alert('Pangkalan data SAGA tidak dapat dicapai.\nCaught by Exceptions.');", true);
                    }
                }
                else
                {
                    e.Cancel = true;
                    //NewAsset_PRI_GLcode.JSProperties["cpErrMsg"] = string.Empty;
                }
            }
        }

        void GV_Vot_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView gridView = (ASPxGridView)sender;
            gridView.DataBind();
        }

        void GV_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView gridView = (ASPxGridView)sender;
            gridView.DataBind();
        }

        protected void NewAsset_ComponentGrid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "PRIC_Desc": FormComponentGridTextBox(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "PRIC_Brand": FormComponentGridTextBox(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "PRIC_Model": FormComponentGridTextBox(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "PRIC_Qty": FormComponentGridSpinEdit(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue, "I"); break;
                case "PRIC_UnitCost": FormComponentGridSpinEdit(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue, "D"); break;
                case "PRIC_ComponentNumber": FormComponentGridHyperLink(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
            }
        }

        void FormComponentGridTextBox(int VisibleIndex, string FieldName, object CellValue)
        {
            ASPxTextBox txtBox = (ASPxTextBox)NewAsset_ComponentGrid.FindRowCellTemplateControl(VisibleIndex, NewAsset_ComponentGrid.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (txtBox != null)
            {
                txtBox.ClientInstanceName = FieldName + VisibleIndex.ToString();
                txtBox.Text = CellValue.ToString();
            }
        }

        void FormComponentGridSpinEdit(int VisibleIndex, string FieldName, object CellValue, string ValueType)
        {
            ASPxSpinEdit spinEdit = (ASPxSpinEdit)NewAsset_ComponentGrid.FindRowCellTemplateControl(VisibleIndex, NewAsset_ComponentGrid.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (spinEdit != null)
            {
                spinEdit.ClientInstanceName = FieldName + VisibleIndex.ToString();

                if (ValueType == "I")
                    spinEdit.Value = Convert.ToInt32(CellValue);
                else
                    spinEdit.Value = Convert.ToDecimal(CellValue);
            }
        }

        void FormComponentGridHyperLink(int VisibleIndex, string FieldName, object CellValue)
        {
            ASPxHyperLink hyLink = (ASPxHyperLink)NewAsset_ComponentGrid.FindRowCellTemplateControl(VisibleIndex, NewAsset_ComponentGrid.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (hyLink != null)
            {
                string AccName = NewAsset_ComponentGrid.GetRowValues(VisibleIndex, "PRIC_Desc").ToString();
                hyLink.ToolTip = "Padam komponen ini";
                hyLink.ClientInstanceName = FieldName + VisibleIndex.ToString();
                hyLink.NavigateUrl = "javascript: NewAsset_DeleteComponentConfirmation('" + CellValue.ToString() + "','" + AccName + "');";
            }
        }

        protected void PRI_TaxCodeDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();

                try
                {
                    string DbErr = GetGSTs(ref Dt, ticket.Name);

                    if (DbErr == string.Empty)
                    {
                        SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                        parm1.Value = Dt;
                        parm1.Direction = ParameterDirection.Input;
                        e.Command.Parameters.Add(parm1);

                        NewAsset_PRI_TaxCode.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        e.Cancel = true;
                        NewAsset_PRI_TaxCode.JSProperties["cpErrMsg"] = "Pangkalan data SAGA tidak dapat dicapai (Database Error).<br>Masalah: " + DbErr;
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "SagaError", "alert('Pangkalan data SAGA tidak dapat dicapai.\nDatabase Error.');", true);
                    }
                }
                catch (Exception err)
                {
                    e.Cancel = true;
                    NewAsset_PRI_TaxCode.JSProperties["cpErrMsg"] = "Pangkalan data SAGA tidak dapat dicapai (Caught by Exceptions).<br>Masalah: " + err.Message;
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "SagaError", "alert('Pangkalan data SAGA tidak dapat dicapai.\nCaught by Exceptions.');", true);
                }
            }
            else
            { e.Cancel = true; }
        }

        string GetGSTs(ref DataTable ReturnDt, string CurrUser)
        {
            string InformixXmlPhysicalPath = Server.MapPath(ConfigurationManager.AppSettings["SagaXmlFilePath"].ToString());

            try
            {
                //ORIGINAL
                //string SagaCommandText = "select  uttxl_code,uttxl_shortdesc, uttxl_perc from ut_taxtypehdr,ut_taxtypeline where uttxh_id = uttxl_hdrid and uttxl_type ='GST-PUR' and uttxh_company = '01'";

                string SagaCommandText = string.Empty;
                bool AccessToAllPtj = false;
                string CurrentUserPtjCode = string.Empty;

                if (Convert.ToBoolean(ConfigurationManager.AppSettings["PR_GST_Based_On_CurrPtj"]))
                {
                    CommonMethods.GetUserViewAllPtjRights(CurrUser, ref AccessToAllPtj);

                    if (AccessToAllPtj)
                    {
                        SagaCommandText = "select uttxh_company, uttxl_code,uttxl_shortdesc, uttxl_perc , (SELECT apcd_vatglac FROM ap_companydtl WHERE apcd_company = uttxh_company AND apcd_curcode = 'MYR' ) apcd_vatglac from ut_taxtypehdr,ut_taxtypeline where uttxh_id = uttxl_hdrid and uttxl_type ='GST-PUR'";
                    }
                    else
                    {
                        CommonMethods.CurrentUserPtjCode(CurrUser, ref CurrentUserPtjCode);
                        SagaCommandText = "select uttxh_company, uttxl_code,uttxl_shortdesc, uttxl_perc , (SELECT apcd_vatglac FROM ap_companydtl WHERE apcd_company = uttxh_company AND apcd_curcode = 'MYR' ) apcd_vatglac from ut_taxtypehdr,ut_taxtypeline where uttxh_id = uttxl_hdrid and uttxl_type ='GST-PUR' and uttxh_company = '" + CurrentUserPtjCode + "'";
                    }
                }
                else
                { SagaCommandText = "select uttxh_company, uttxl_code,uttxl_shortdesc, uttxl_perc , (SELECT apcd_vatglac FROM ap_companydtl WHERE apcd_company = uttxh_company AND apcd_curcode = 'MYR' ) apcd_vatglac from ut_taxtypehdr,ut_taxtypeline where uttxh_id = uttxl_hdrid and uttxl_type ='GST-PUR' and uttxh_company = '01'"; }

                return InformixMethods.FetchTable(SagaCommandText, InformixXmlPhysicalPath, ref ReturnDt);
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        string GetProjectCodes(ref DataTable ReturnDt, string CurrUser)
        {
            string InformixXmlPhysicalPath = Server.MapPath("../../Public/Xml/" + ConfigurationManager.AppSettings["SagaXMLFile"].ToString());

            try
            {
                //ORIGINAL
                //string SagaCommandText = "select  uttxl_code,uttxl_shortdesc, uttxl_perc from ut_taxtypehdr,ut_taxtypeline where uttxh_id = uttxl_hdrid and uttxl_type ='GST-PUR' and uttxh_company = '01'";

                string SagaCommandText = string.Empty;
                string AccessToAllPtj = string.Empty;
                string CurrentUserPtjCode = string.Empty;

                SagaCommandText = "select pcac_account, pcac_desc, pcac_glac from pc_account";

                //if (Convert.ToBoolean(ConfigurationManager.AppSettings["PR_GST_Based_On_CurrPtj"]))
                //{
                //    PermohonanBelianMethods.CurrentUserAccessToAllPtj(CurrUser, ref AccessToAllPtj);

                //    if (AccessToAllPtj == "1")
                //    {
                //        SagaCommandText = "select uttxh_company, uttxl_code,uttxl_shortdesc, uttxl_perc , (SELECT apcd_vatglac FROM ap_companydtl WHERE apcd_company = uttxh_company AND apcd_curcode = 'MYR' ) apcd_vatglac from ut_taxtypehdr,ut_taxtypeline where uttxh_id = uttxl_hdrid and uttxl_type ='GST-PUR'";
                //    }
                //    else
                //    {
                //        PermohonanBelianMethods.CurrentUserPtjCode(CurrUser, ref CurrentUserPtjCode);
                //        SagaCommandText = "select uttxh_company, uttxl_code,uttxl_shortdesc, uttxl_perc , (SELECT apcd_vatglac FROM ap_companydtl WHERE apcd_company = uttxh_company AND apcd_curcode = 'MYR' ) apcd_vatglac from ut_taxtypehdr,ut_taxtypeline where uttxh_id = uttxl_hdrid and uttxl_type ='GST-PUR' and uttxh_company = '" + CurrentUserPtjCode + "'";
                //    }
                //}
                //else
                //{ SagaCommandText = "select uttxh_company, uttxl_code,uttxl_shortdesc, uttxl_perc , (SELECT apcd_vatglac FROM ap_companydtl WHERE apcd_company = uttxh_company AND apcd_curcode = 'MYR' ) apcd_vatglac from ut_taxtypehdr,ut_taxtypeline where uttxh_id = uttxl_hdrid and uttxl_type ='GST-PUR' and uttxh_company = '01'"; }

                return InformixMethods.FetchTable(SagaCommandText, InformixXmlPhysicalPath, ref ReturnDt);
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        protected void cbp_NewAsset_PopupGLDistibution_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_NewAsset_PopupGLDistibution.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "NEW": GLDist_New(); break;
                case "SAVE": GLDist_SaveDelete(1); break;
                case "DELETE": GLDist_SaveDelete(2); break;
            }
        }

        void GLDist_New()
        {
            NewAsset_GLAC_Account.DataBind();
            NewAsset_GLAC_RowId.Text = string.Empty;
            NewAsset_GLAC_Value.Value = 0;
            NewAsset_GLAC_Desc.Text = string.Empty;
            NewAsset_GLAC_Account.Value = null;
            cbp_NewAsset_PopupGLDistibution.JSProperties["cpErrMsg"] = string.Empty;
        }

        void GLDist_SaveDelete(int Mode)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            LedgerItem li = new LedgerItem
            {
                PurchaseRequestId = txtPurchaseRequestId.Text,
                GlCode = NewAsset_GLAC_Account.Value.ToString(),
                Description = NewAsset_GLAC_Desc.Text,
                Jumlah = Convert.ToInt32(NewAsset_GLAC_Value.Value)
            };

            DataAccess.Models.LedgerItemModel.Add(li, ticket.Name);
            cbp_NewAsset_PopupGLDistibution.JSProperties["cpErrMsg"] = "";

            //cbp_NewAsset_PopupGLDistibution.JSProperties["cpErrMsg"] = PermohonanBelianMethods.SP_PR_GLDistribution(ref Dt, Mode);
        }

        protected void cbp_NewAsset_PopupProjectDistibution_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_NewAsset_PopupProjectDistibution.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "NEW": ProjDist_New(); break;
                case "SAVE": ProjDist_SaveDelete(1); break;
                case "DELETE": ProjDist_SaveDelete(2); break;
            }
        }

        void ProjDist_New()
        {
            NewAsset_PCAC_Account.Value = null;
            NewAsset_PCAC_Desc.Text = string.Empty;
            NewAsset_PCAC_Amount.Value = 0;
            NewAsset_PCAC_RowId.Text = string.Empty;
            cbp_NewAsset_PopupProjectDistibution.JSProperties["cpErrMsg"] = string.Empty;
        }

        void ProjDist_SaveDelete(int Mode)
        {
            //DataTable Dt = new DataTable();
            //FormProjDistTVP(ref Dt);
            //PopulateProjDistTVP(ref Dt);
            //cbp_NewAsset_PopupProjectDistibution.JSProperties["cpErrMsg"] = PermohonanBelianMethods.SP_PR_ProjDistribution(ref Dt, Mode);

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            ProjectItem li = new ProjectItem
            {
                PurchaseRequestId = txtPurchaseRequestId.Text,
                 ProjectCode = NewAsset_PCAC_Account.Value.ToString(),
                  Description = NewAsset_PCAC_Desc.Text,
                Jumlah = Convert.ToInt32(NewAsset_GLAC_Value.Value)
            };

            //if (NewAsset_PCAC_RowId.Text == string.Empty)
            //    Dr["PRPROJDIS_RowId"] = DBNull.Value;
            //else
            //    Dr["PRPROJDIS_RowId"] = Convert.ToInt32(NewAsset_PCAC_RowId.Text);

            //Dr["PRPROJDIS_ProcessId"] = NewAsset_PRI_ProcessId.Text;
            //Dr["PRPROJDIS_Rev"] = Convert.ToInt32(NewAsset_PRI_Revision.Text);
            //Dr["PRPROJDIS_ItemNumber"] = Convert.ToInt32(NewAsset_PRI_ItemNumber.Text);
            //Dr["PRPROJDIS_ProjectCode"] = NewAsset_PCAC_Account.Value.ToString();
            //Dr["PRPROJDIS_GLCode"] = NewAsset_PCAC_Account.GridView.GetRowValues(NewAsset_PCAC_Account.GridView.FocusedRowIndex, "pcac_glac").ToString();
            //Dr["PRPROJDIS_Desc"] = NewAsset_PCAC_Desc.Text;
            //Dr["PRPROJDIS_Value"] = Convert.ToDecimal(NewAsset_PCAC_Amount.Value);


            DataAccess.Models.ProjectItemModel.Add(li, ticket.Name);
            cbp_NewAsset_PopupGLDistibution.JSProperties["cpErrMsg"] = "";


        }

        protected void PC_AccountDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();

                try
                {
                    string DbErr = GetProjectCodes(ref Dt, ticket.Name);

                    if (DbErr == string.Empty)
                    {
                        SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                        parm1.Value = Dt;
                        parm1.Direction = ParameterDirection.Input;
                        e.Command.Parameters.Add(parm1);

                        NewAsset_PRI_TaxCode.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        e.Cancel = true;
                        NewAsset_PRI_TaxCode.JSProperties["cpErrMsg"] = "Pangkalan data SAGA tidak dapat dicapai (Database Error).<br>Masalah: " + DbErr;
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "SagaError", "alert('Pangkalan data SAGA tidak dapat dicapai.\nDatabase Error.');", true);
                    }
                }
                catch (Exception err)
                {
                    e.Cancel = true;
                    NewAsset_PRI_TaxCode.JSProperties["cpErrMsg"] = "Pangkalan data SAGA tidak dapat dicapai (Caught by Exceptions).<br>Masalah: " + err.Message;
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "SagaError", "alert('Pangkalan data SAGA tidak dapat dicapai.\nCaught by Exceptions.');", true);
                }
            }
            else
            { e.Cancel = true; }
        }

        protected void NewAsset_GLDistGridDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (NewAsset_PRI_ProcessId.Text == "" || NewAsset_PRI_ItemNumber.Text == "" || NewAsset_PRI_Revision.Text == "")
                e.Cancel = true;
            else
            {
                e.Command.Parameters["@PRGLDIS_ProcessId"].Value = NewAsset_PRI_ProcessId.Text;
                e.Command.Parameters["@PRGLDIS_ItemNumber"].Value = Convert.ToInt32(NewAsset_PRI_ItemNumber.Text);
                e.Command.Parameters["@PRGLDIS_Rev"].Value = Convert.ToInt32(NewAsset_PRI_Revision.Text);
            }
        }

        protected void NewAsset_GLDistributionGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            NewAsset_GLDistributionGrid.DataBind();
        }

        protected void NewAsset_ProjectDistributionGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            NewAsset_ProjectDistributionGrid.DataBind();
        }

        void FormProjDistTVP(ref DataTable Dt)
        {
            DataColumn PRPROJDIS_RowId = Dt.Columns.Add("PRPROJDIS_RowId", typeof(Int32));
            DataColumn PRPROJDIS_ProcessId = Dt.Columns.Add("PRPROJDIS_ProcessId", typeof(String));
            DataColumn PRPROJDIS_Rev = Dt.Columns.Add("PRPROJDIS_Rev", typeof(Int32));
            DataColumn PRPROJDIS_ItemNumber = Dt.Columns.Add("PRPROJDIS_ItemNumber", typeof(Int32));
            DataColumn PRPROJDIS_ProjectCode = Dt.Columns.Add("PRPROJDIS_ProjectCode", typeof(String));
            DataColumn PRPROJDIS_GLCode = Dt.Columns.Add("PRPROJDIS_GLCode", typeof(String));
            DataColumn PRPROJDIS_Desc = Dt.Columns.Add("PRPROJDIS_Desc", typeof(String));
            DataColumn PRPROJDIS_Value = Dt.Columns.Add("PRPROJDIS_Value", typeof(Decimal));
            Dt.AcceptChanges();
        }

        void FormGLDistTVP(ref DataTable Dt)
        {
            DataColumn PRGLDIS_RowId = Dt.Columns.Add("PRGLDIS_RowId", typeof(Int32));
            DataColumn PRGLDIS_ProcessId = Dt.Columns.Add("PRGLDIS_ProcessId", typeof(String));
            DataColumn PRGLDIS_Rev = Dt.Columns.Add("PRGLDIS_Rev", typeof(Int32));
            DataColumn PRGLDIS_ItemNumber = Dt.Columns.Add("PRGLDIS_ItemNumber", typeof(Int32));
            DataColumn PRGLDIS_ProjectCode = Dt.Columns.Add("PRGLDIS_ProjectCode", typeof(String));
            DataColumn PRGLDIS_GLCode = Dt.Columns.Add("PRGLDIS_GLCode", typeof(String));
            DataColumn PRGLDIS_Desc = Dt.Columns.Add("PRGLDIS_Desc", typeof(String));
            DataColumn PRGLDIS_Value = Dt.Columns.Add("PRGLDIS_Value", typeof(Decimal));
            Dt.AcceptChanges();
        }

        void PopulateProjDistTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (NewAsset_PCAC_RowId.Text == string.Empty)
                Dr["PRPROJDIS_RowId"] = DBNull.Value;
            else
                Dr["PRPROJDIS_RowId"] = Convert.ToInt32(NewAsset_PCAC_RowId.Text);

            Dr["PRPROJDIS_ProcessId"] = NewAsset_PRI_ProcessId.Text;
            Dr["PRPROJDIS_Rev"] = Convert.ToInt32(NewAsset_PRI_Revision.Text);
            Dr["PRPROJDIS_ItemNumber"] = Convert.ToInt32(NewAsset_PRI_ItemNumber.Text);
            Dr["PRPROJDIS_ProjectCode"] = NewAsset_PCAC_Account.Value.ToString();
            Dr["PRPROJDIS_GLCode"] = NewAsset_PCAC_Account.GridView.GetRowValues(NewAsset_PCAC_Account.GridView.FocusedRowIndex, "pcac_glac").ToString();
            Dr["PRPROJDIS_Desc"] = NewAsset_PCAC_Desc.Text;
            Dr["PRPROJDIS_Value"] = Convert.ToDecimal(NewAsset_PCAC_Amount.Value);
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void PopulateGLDistTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (NewAsset_GLAC_RowId.Text == string.Empty)
                Dr["PRGLDIS_RowId"] = DBNull.Value;
            else
                Dr["PRGLDIS_RowId"] = Convert.ToInt32(NewAsset_GLAC_RowId.Text);

            Dr["PRGLDIS_ProcessId"] = NewAsset_PRI_ProcessId.Text;
            Dr["PRGLDIS_Rev"] = Convert.ToInt32(NewAsset_PRI_Revision.Text);
            Dr["PRGLDIS_Rev"] = Convert.ToInt32(NewAsset_PRI_ItemNumber.Text);
            Dr["PRGLDIS_ProjectCode"] = DBNull.Value;
            Dr["PRGLDIS_GLCode"] = NewAsset_GLAC_Account.Value.ToString();
            Dr["PRGLDIS_Desc"] = NewAsset_GLAC_Desc.Text;
            Dr["PRGLDIS_Value"] = Convert.ToDecimal(NewAsset_GLAC_Value.Value);
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        protected void NewAsset_ProjectDistributionGridDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (NewAsset_PRI_ProcessId.Text == "" || NewAsset_PRI_ItemNumber.Text == "" || NewAsset_PRI_Revision.Text == "")
                e.Cancel = true;
            else
            {
                e.Command.Parameters["@PRPROJDIS_ProcessId"].Value = NewAsset_PRI_ProcessId.Text;
                e.Command.Parameters["@PRPROJDIS_ItemNumber"].Value = Convert.ToInt32(NewAsset_PRI_ItemNumber.Text);
                e.Command.Parameters["@PRPROJDIS_Rev"].Value = Convert.ToInt32(NewAsset_PRI_Revision.Text);
            }
        }

        protected void GL_AccountDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                if (NewAsset_PRI_SubCatId.Value != null)
                {
                    DataTable Dt = new DataTable();

                    try
                    {
                        string DbErr = GetVots(ref Dt, ticket.Name);

                        if (DbErr == string.Empty)
                        {
                            SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                            parm1.Value = Dt;
                            parm1.Direction = ParameterDirection.Input;
                            e.Command.Parameters.Add(parm1);

                            //NewAsset_PRI_GLcode.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        {
                            e.Cancel = true;
                            //NewAsset_PRI_GLcode.JSProperties["cpErrMsg"] = "Pangkalan data SAGA tidak dapat dicapai (Database Error).<br>Masalah: " + DbErr;
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "SagaError", "alert('Pangkalan data SAGA tidak dapat dicapai.\nDatabase Error.');", true);
                        }
                    }
                    catch (Exception err)
                    {
                        e.Cancel = true;
                        Console.WriteLine(err.Message);
                        //NewAsset_PRI_GLcode.JSProperties["cpErrMsg"] = "Pangkalan data SAGA tidak dapat dicapai (Caught by Exceptions).<br>Masalah: " + err.Message;
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "SagaError", "alert('Pangkalan data SAGA tidak dapat dicapai.\nCaught by Exceptions.');", true);
                    }
                }
                else
                {
                    e.Cancel = true;
                    //NewAsset_PRI_GLcode.JSProperties["cpErrMsg"] = string.Empty;
                }
            }
        }

        protected void txtPurchaseRequestId_TextChanged(object sender, EventArgs e)
        {

        }
    }
}