using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using DevExpress.Web;
using Core.Utility;
using Core.Shared;
using Core.SagaInterface.Informix;
using System.Data.SqlClient;

namespace AssetAndStoreManagementSystem.Stor.PermohonanBelian_Stor
{
    public partial class Tab_ItemDetails_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_SavePRItem_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string[] prms = e.Parameter.Split('*');

            cbp_SavePRItem.JSProperties["cpMode"] = prms[0].ToString();

            switch (prms[0].ToString())
            {
                case "ADDCOMPONENT": AddNewItemComponent(); break;
                case "SAVE": SavePrItem(); break;
                case "LOAD": LoadPrItem(); break;
                case "REMOVECOMPONENT": DeleteComponent(prms[1].ToString()); break;
            }
        }

        protected void PRI_ParentId_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            //PRI_ParentId.DataBind();
        }

        void AddNewItemComponent()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormComponentTVP(ref Dt);
                //PopulateComponentTVP(ref Dt);
                AddNewComponentRow(ref Dt);
                BindComponentGrid(ref Dt);
                cbp_SavePRItem.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SavePRItem.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { Dt.Dispose(); }
        }

        void DeleteComponent(string ComponentIdToRemove)
        {
            DataTable Dt = new DataTable();

            try
            {
                FormComponentTVP(ref Dt);
               // PopulateComponentTVP(ref Dt);
                RemoveComponent(ref Dt, ComponentIdToRemove);
                BindComponentGrid(ref Dt);
                cbp_SavePRItem.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SavePRItem.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { Dt.Dispose(); }
        }

        void RemoveComponent(ref DataTable Dt, string ComponentIdToRemove)
        {
            DataRow[] drs = Dt.Select("PRC_ComponentNumber = " + ComponentIdToRemove);

            if (drs.Length == 1)
                Dt.Rows.Remove(drs[0]);

            Dt.AcceptChanges();
        }

        void FormComponentTVP(ref DataTable Dt)
        {
            DataColumn PRC_ProcessId = Dt.Columns.Add("PRC_ProcessId", typeof(String));
            DataColumn PRC_ItemNumber = Dt.Columns.Add("PRC_ItemNumber", typeof(Int32));
            DataColumn PRC_ComponentNumber = Dt.Columns.Add("PRC_ComponentNumber", typeof(Int32));
            DataColumn PRC_Desc = Dt.Columns.Add("PRC_Desc", typeof(String));
            DataColumn PRC_Brand = Dt.Columns.Add("PRC_Brand", typeof(String));
            DataColumn PRC_Model = Dt.Columns.Add("PRC_Model", typeof(String));
            DataColumn PRC_Qty = Dt.Columns.Add("PRC_Qty", typeof(Int32));
            DataColumn PRC_UnitCost = Dt.Columns.Add("PRC_UnitCost", typeof(Decimal));
        }

        //void PopulateComponentTVP(ref DataTable Dt)
        //{
        //    for (int i = 0; i < GridPrItemComponentListing.VisibleRowCount; i++)
        //    {
        //        DataRow Dr = Dt.NewRow();
        //        Dr["PRC_ProcessId"] = PRI_ProcessId.Text;
        //        Dr["PRC_ItemNumber"] = Convert.ToInt32(PRI_ItemNumber.Text);
        //        Dr["PRC_ComponentNumber"] = Convert.ToInt32(GridPrItemComponentListing.GetRowValues(i, "PRC_ComponentNumber"));

        //        ASPxMemo PRC_Desc = (ASPxMemo)GridPrItemComponentListing.FindRowCellTemplateControl(i, GridPrItemComponentListing.DataColumns["PRC_Desc"] as GridViewDataColumn, "PRC_Desc");

        //        if (PRC_Desc != null)
        //        {
        //            Dr["PRC_Desc"] = PRC_Desc.Text.Trim();
        //        }
        //        else
        //            Dr["PRC_Desc"] = DBNull.Value;

        //        ASPxTextBox PRC_Brand = (ASPxTextBox)GridPrItemComponentListing.FindRowCellTemplateControl(i, GridPrItemComponentListing.DataColumns["PRC_Brand"] as GridViewDataColumn, "PRC_Brand");

        //        if (PRC_Brand != null)
        //        {
        //            Dr["PRC_Brand"] = PRC_Brand.Text.Trim();
        //        }
        //        else
        //            Dr["PRC_Brand"] = DBNull.Value;

        //        ASPxTextBox PRC_Model = (ASPxTextBox)GridPrItemComponentListing.FindRowCellTemplateControl(i, GridPrItemComponentListing.DataColumns["PRC_Model"] as GridViewDataColumn, "PRC_Model");

        //        if (PRC_Model != null)
        //        {
        //            Dr["PRC_Model"] = PRC_Model.Text.Trim();
        //        }
        //        else
        //            Dr["PRC_Model"] = DBNull.Value;

        //        //ASPxSpinEdit PRC_Qty = (ASPxSpinEdit)GridPrItemComponentListing.FindRowCellTemplateControl(i, GridPrItemComponentListing.DataColumns["PRC_Qty"] as GridViewDataColumn, "PRC_Qty");

        //        //if (PRC_Qty != null)
        //        //{
        //        //    if (PRC_Qty.Text != "")
        //        //        Dr["PRC_Qty"] = Convert.ToInt32(PRC_Qty.Value);
        //        //    else
        //        //        Dr["PRC_Qty"] = DBNull.Value;
        //        //}
        //        //else
        //        Dr["PRC_Qty"] = Convert.ToInt32(PRI_Qty.Value);

        //        ASPxSpinEdit PRC_UnitCost = (ASPxSpinEdit)GridPrItemComponentListing.FindRowCellTemplateControl(i, GridPrItemComponentListing.DataColumns["PRC_UnitCost"] as GridViewDataColumn, "PRC_UnitCost");

        //        if (PRC_UnitCost != null)
        //        {
        //            if (PRC_UnitCost.Text != "")
        //                Dr["PRC_UnitCost"] = Convert.ToDecimal(PRC_UnitCost.Value);
        //            else
        //                Dr["PRC_UnitCost"] = DBNull.Value;
        //        }
        //        else
        //            Dr["PRC_UnitCost"] = DBNull.Value;

        //        Dt.Rows.Add(Dr);

        //    }
        //    Dt.AcceptChanges();
        //}

        void FormItemTVP(ref DataTable Dt)
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
            DataColumn PRI_ProjectCode = Dt.Columns.Add("PRI_ProjectCode", typeof(String));
            DataColumn PRI_GLcode = Dt.Columns.Add("PRI_GLcode", typeof(String));
            DataColumn PRI_Revision = Dt.Columns.Add("PRI_Revision", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateItemTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["PRI_ProcessId"] = PRI_ProcessId.Text;
            Dr["PRI_ItemNumber"] = Convert.ToInt32(PRI_ItemNumber.Text);
            Dr["PRI_PurchaseType"] = Convert.ToInt32(PRI_PurchaseType.Value);

            //if (PRI_ParentId.GridView.FocusedRowIndex == -1)
            //    Dr["PRI_ParentId"] = DBNull.Value;
            //else
            //    Dr["PRI_ParentId"] = PRI_ParentId.Value.ToString();

            if (PRI_CatId.GridView.FocusedRowIndex == -1)
                Dr["PRI_CatId"] = DBNull.Value;
            else
                Dr["PRI_CatId"] = Convert.ToInt32(PRI_CatId.Value);

            if (PRI_SubCatId.GridView.FocusedRowIndex == -1)
                Dr["PRI_SubCatId"] = DBNull.Value;
            else
                Dr["PRI_SubCatId"] = Convert.ToInt32(PRI_SubCatId.Value);

            //if (PRI_TypeId.GridView.FocusedRowIndex == -1)
            //    Dr["PRI_TypeId"] = DBNull.Value;
            //else
            //    Dr["PRI_TypeId"] = Convert.ToInt32(PRI_TypeId.Value);

            Dr["PRI_Desc"] = PRI_Desc.Text.Trim();
            Dr["PRI_UomId"] = Convert.ToInt32(PRI_UomId.Value);
            Dr["PRI_Qty"] = Convert.ToInt32(PRI_Qty.Value);
            Dr["PRI_UnitPrice"] = Convert.ToDecimal(PRI_UnitPrice.Text);

            if (PRI_ProjectCode.Value == null)
                Dr["PRI_ProjectCode"] = DBNull.Value;
            else
                Dr["PRI_ProjectCode"] = PRI_ProjectCode.Value;

            if (PRI_GLcode.Value == null)
                Dr["PRI_GLcode"] = DBNull.Value;
            else
                Dr["PRI_GLcode"] = PRI_GLcode.Value;

            Dr["PRI_Revision"] = Convert.ToInt32(PRI_Revision.Text);

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void AddNewComponentRow(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["PRC_ProcessId"] = DBNull.Value;
            Dr["PRC_ItemNumber"] = DBNull.Value;
            Dr["PRC_ComponentNumber"] = SortingNumberMethod.FormNextSortingIdStartWith1(ref Dt, "PRC_ComponentNumber");
            Dr["PRC_Desc"] = DBNull.Value;
            Dr["PRC_Brand"] = DBNull.Value;
            Dr["PRC_Model"] = DBNull.Value;
            Dr["PRC_Qty"] = DBNull.Value;
            Dr["PRC_UnitCost"] = DBNull.Value;
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void BindComponentGrid(ref DataTable Dt)
        {
            //GridPrItemComponentListing.DataSource = Dt;
            //GridPrItemComponentListing.KeyFieldName = "PRC_ComponentNumber";
            //GridPrItemComponentListing.DataBind();

        }

        void SavePrItem()
        {
            DataTable ItemTVP = new DataTable();
            DataTable ComponentTVP = new DataTable();

            try
            {
                FormItemTVP(ref ItemTVP);
                PopulateItemTVP(ref ItemTVP);
                FormComponentTVP(ref ComponentTVP);
               // PopulateComponentTVP(ref ComponentTVP);

                string err = PermohonanBelianMethods.SP_PermohonanBelian_SaveItem(ref ItemTVP, ref ComponentTVP, PRI_ProcessId.Text,PRI_Revision.Text);

                if (err == "")
                {  
                    cbp_SavePRItem.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_SavePRItem.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SavePRItem.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { ItemTVP.Dispose(); ComponentTVP.Dispose(); }
          
        }

        void LoadPrItem()
        {
            DataSet Ds = new DataSet();
            DataTable Dt = new DataTable();

            try
            {
                string err = PermohonanBelianMethods.SP_PermohonanBelian_LoadItem(ref Ds, PRI_ProcessId.Text, PRI_ItemNumber.Text, PRI_Revision.Text);

                if (err == "")
                {
                    if (Ds.Tables[0].Rows.Count == 1)
                    {
                        Dt = Ds.Tables[1].Copy();
                        BindComponentGrid(ref Dt);

                        PRI_PurchaseType.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PRI_PurchaseType"]);

                        if (Ds.Tables[0].Rows[0]["PRI_SubCatId"].ToString() != "")
                        {
                            PRI_CatId.DataBind();
                            PRI_CatId.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PRI_CatId"]);                           
                        }
                        else
                        {
                            PRI_CatId.Value = DBNull.Value;
                        }

                        if(Ds.Tables[0].Rows[0]["PRI_SubCatId"].ToString() != "")
                        {
                            PRI_SubCatId.DataBind();
                            PRI_SubCatId.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PRI_SubCatId"]); 
                        }
                        else
                            PRI_SubCatId.Value = DBNull.Value;

                        //if (Ds.Tables[0].Rows[0]["PRI_TypeId"].ToString() != "")
                        //{
                        //    PRI_TypeId.DataBind();
                        //    PRI_TypeId.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PRI_TypeId"]);
                        //}
                        //else
                        //    PRI_TypeId.Value = DBNull.Value;

                        PRI_Desc.Text = Ds.Tables[0].Rows[0]["PRI_Desc"].ToString();
                        PRI_UomId.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PRI_UomId"]);
                        PRI_Qty.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PRI_Qty"]);
                        PRI_UnitPrice.Value = Convert.ToDecimal(Ds.Tables[0].Rows[0]["PRI_UnitPrice"]);
                        PRI_Amount.Value = Convert.ToDecimal(Ds.Tables[0].Rows[0]["PRI_UnitPrice"]) * Convert.ToDecimal(Ds.Tables[0].Rows[0]["PRI_Qty"]);

                        if (Ds.Tables[0].Rows[0]["PRI_ProjectCode"].ToString() != "")
                        {
                            PRI_ProjectCode.DataBind();
                            PRI_ProjectCode.Value = Ds.Tables[0].Rows[0]["PRI_ProjectCode"];
                        }
                        else
                            PRI_ProjectCode.Value = null;

                        if (Ds.Tables[0].Rows[0]["PRI_GLcode"].ToString() != "")
                        {
                            PRI_GLcode.DataBind();
                            PRI_GLcode.Value = Ds.Tables[0].Rows[0]["PRI_GLcode"].ToString();
                        }
                        else
                            PRI_GLcode.Value = DBNull.Value;

                        //if (Ds.Tables[0].Rows[0]["PRI_ParentId"].ToString() != "")
                        //{
                        //    PRI_ParentId.DataBind();
                        //    PRI_ParentId.Value = Ds.Tables[0].Rows[0]["PRI_ParentId"].ToString();
                        //}
                        //else
                        //    PRI_ParentId.Value = DBNull.Value;

                        cbp_SavePRItem.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        FormComponentTVP(ref Dt);
                        BindComponentGrid(ref Dt);

                        //PRI_TypeId.Value = null;
                        PRI_CatId.Value = null;
                        PRI_PurchaseType.Value = null;
                        //PRI_ParentId.Value = null;
                        PRI_SubCatId.Value = null;
                        PRI_Desc.Text = "";
                        PRI_UomId.Value = null;
                        PRI_Qty.Value = 0;
                        PRI_UnitPrice.Value = 0;
                        PRI_Amount.Value = 0;
                        PRI_ProjectCode.DataBind();
                        PRI_ProjectCode.Value = null;
                        PRI_GLcode.DataBind();
                        PRI_GLcode.Value = null;
                        cbp_SavePRItem.JSProperties["cpErrMsg"] = string.Empty;
                    }
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_SavePRItem.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SavePRItem.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { Ds.Dispose(); Dt.Dispose(); }
        }

        protected void GridPrItemComponentListing_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "PRC_Desc": FormMemoBox(e.VisibleIndex, e.CellValue); break;
                case "PRC_Brand": FormTextBox(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "PRC_Model": FormTextBox(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "PRC_Qty": FormSpinEditor(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue,"Int32"); break;
                case "PRC_UnitCost": FormSpinEditor(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue, "Decimal"); break;
                case "PRC_ComponentNumber": FormDeleteLink(e.VisibleIndex, e.CellValue); break;
            }
        }

        void FormMemoBox(int RowIndex, object CellValue)
        {
            //ASPxMemo PRC_Desc = (ASPxMemo)GridPrItemComponentListing.FindRowCellTemplateControl(RowIndex, GridPrItemComponentListing.DataColumns["PRC_Desc"] as GridViewDataColumn, "PRC_Desc");

            //if (PRC_Desc != null)
            //{
            //    PRC_Desc.ClientInstanceName = "PRC_Desc_" + RowIndex.ToString();
            //    PRC_Desc.Text = CellValue.ToString();
            //}
        }

        void FormTextBox(int RowIndex, string FieldName, object CellValue)
        {
            //ASPxTextBox Tb = (ASPxTextBox)GridPrItemComponentListing.FindRowCellTemplateControl(RowIndex, GridPrItemComponentListing.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            //if (Tb != null)
            //{
            //    Tb.ClientInstanceName = FieldName + "_" + RowIndex.ToString();
            //    Tb.Text = CellValue.ToString();
            //}
        }

        void FormSpinEditor(int RowIndex, string FieldName, object CellValue, string NumberFormat)
        {
            //ASPxSpinEdit Spin = (ASPxSpinEdit)GridPrItemComponentListing.FindRowCellTemplateControl(RowIndex, GridPrItemComponentListing.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            //if (Spin != null)
            //{
            //    Spin.ClientInstanceName = FieldName + "_" + RowIndex.ToString();

            //    if (CellValue.ToString() == "")
            //        Spin.Value = 0;
            //    else
            //    {
            //        if (NumberFormat == "Decimal")
            //            Spin.Value = Convert.ToDecimal(CellValue);
            //        else
            //            Spin.Value = Convert.ToInt32(CellValue);
            //    }
            //}
        }

        void FormDeleteLink(int RowIndex, object CellValue)
        {
            //ASPxHyperLink Hypp = (ASPxHyperLink)GridPrItemComponentListing.FindRowCellTemplateControl(RowIndex, GridPrItemComponentListing.DataColumns["PRC_ComponentNumber"] as GridViewDataColumn, "PRC_ComponentNumber");

            //if (Hypp != null)
            //{
            //    Hypp.ClientInstanceName = "PRC_ComponentNumber_" + RowIndex.ToString();
            //    Hypp.NavigateUrl = "javascript: RemoveComponent("+CellValue.ToString()+");";
            //}
        }

        protected void PRI_ProjectCode_Init(object sender, EventArgs e)
        {
            ASPxGridLookup ProjGridLookup = (ASPxGridLookup)sender;
            ASPxGridView ProjGridView = ProjGridLookup.GridView;
            ProjGridView.CustomCallback += ProjGridView_CustomCallback;
        }

        void ProjGridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView ProjGridView = (ASPxGridView)sender;
            ProjGridView.DataBind();
        }

        protected void PRI_GLcode_Init(object sender, EventArgs e)
        {
            ASPxGridLookup GlGridLookup = (ASPxGridLookup)sender;
            ASPxGridView GlGridView = GlGridLookup.GridView;
            GlGridView.CustomCallback += GlGridView_CustomCallback;
        }

        void GlGridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView GlGridView = (ASPxGridView)sender;
            GlGridView.DataBind();
        }

        protected void SagaProjectCodeDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = GetProjectGlCode(ref Dt);

                if (err == string.Empty)
                {
                    SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                    parm1.Value = Dt;
                    parm1.Direction = ParameterDirection.Input;
                    e.Command.Parameters.Add(parm1);
                }
                else
                {
                    e.Cancel = true;
                    PrItemPopupMsg_Label.Text = err;
                    PrItemPopupMsg.ShowOnPageLoad = true;
                }
            }
            catch (Exception err)
            {
                e.Cancel = true;
                PrItemPopupMsg_Label.Text = err.Message;
                PrItemPopupMsg.ShowOnPageLoad = true;
            }
        }

        string GetProjectGlCode(ref DataTable ReturnDt)
        {
            DataTable OdbcConnDt = new DataTable();
            DataSet XmlDs = new DataSet();

            string SagaCommandXmlFilePath = Server.MapPath(ConfigurationManager.AppSettings["SagaCommandXmlFilePath"].ToString());
            string errMsgConfig = string.Empty;

            try
            {
                String XmlPath = Server.MapPath(ConfigurationManager.AppSettings["SagaXmlFilePath"].ToString());
                XmlMethods.ReadXMLFile(ref XmlDs, XmlPath);

                OdbcConnDt = XmlDs.Tables[0].Copy();

                return InformixMethods.GetDataTable(ref OdbcConnDt, ref ReturnDt, 2, SagaCommandXmlFilePath);
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                return errMsg + " " + err;
            }
            finally
            { OdbcConnDt.Dispose(); ReturnDt.Dispose(); XmlDs.Dispose(); }
        }
        
        protected void SagaGlCode_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

            if (PRI_SubCatId.Value == null)
            { e.Cancel = true; }
            else
            {
                DataTable Dt = new DataTable();

                try
                {
                    string err = GetGlCode(ref Dt);

                    if (err == string.Empty)
                    {
                        SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                        parm1.Value = Dt;
                        parm1.Direction = ParameterDirection.Input;
                        e.Command.Parameters.Add(parm1);
                    }
                    else
                    {
                        e.Cancel = true;
                        PrItemPopupMsg_Label.Text = err;
                        PrItemPopupMsg.ShowOnPageLoad = true;
                    }
                }
                catch (Exception err)
                {
                    e.Cancel = true;
                    PrItemPopupMsg_Label.Text = err.Message;
                    PrItemPopupMsg.ShowOnPageLoad = true;
                }
            }
        }

        string GetGlCode(ref DataTable ReturnDt)
        {
            DataTable OdbcConnDt = new DataTable();
            DataSet XmlDs = new DataSet();

            string SagaCommandXmlFilePath = Server.MapPath(ConfigurationManager.AppSettings["SagaCommandXmlFilePath"].ToString());
            string errMsgConfig = string.Empty;

            try
            {
                String XmlPath = Server.MapPath(ConfigurationManager.AppSettings["SagaXmlFilePath"].ToString());
                XmlMethods.ReadXMLFile(ref XmlDs, XmlPath);

                OdbcConnDt = XmlDs.Tables[0].Copy();

                string SagaCommandText = string.Empty;
                InformixMethods.GetSagaCommandText(3, SagaCommandXmlFilePath, ref SagaCommandText);

                string GlCode = string.Empty;
                PermohonanBelianMethods.SP_PR_GetGlCode(Convert.ToInt32(PRI_PurchaseType.Value), Convert.ToInt32(PRI_SubCatId.Value), Convert.ToDecimal(PRI_UnitPrice.Value), ref GlCode);

                SagaCommandText = SagaCommandText.Replace("$$$", GlCode);

                return InformixMethods.GetDataTable(ref OdbcConnDt, ref ReturnDt, SagaCommandText);
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                return errMsg + " " + err;
            }
            finally
            { OdbcConnDt.Dispose(); ReturnDt.Dispose(); XmlDs.Dispose(); }
        }

        #region PRI_CatId Initialize
        protected void PRI_CatId_Init(object sender, EventArgs e)
        {
            ASPxGridLookup PRI_CatId = (ASPxGridLookup)sender;
            ASPxGridView PRI_CatIdGridView = PRI_CatId.GridView;
            PRI_CatIdGridView.CustomCallback += PRI_CatIdGridView_CustomCallback;
            PRI_CatIdGridView.AfterPerformCallback += PRI_CatIdGridView_AfterPerformCallback;
        }

        void PRI_CatIdGridView_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            ASPxGridView PRI_CatIdGridView = (ASPxGridView)sender;
            PRI_CatIdGridView.DataColumns["CatCode"].Settings.AutoFilterCondition = AutoFilterCondition.Contains;
            PRI_CatIdGridView.DataColumns["CatName"].Settings.AutoFilterCondition = AutoFilterCondition.Contains;
        }

        void PRI_CatIdGridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView PRI_CatIdGridView = (ASPxGridView)sender;
            PRI_CatIdGridView.DataBind();
        }

        protected void CatDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (PRI_PurchaseType.SelectedIndex == -1)
                e.Command.Parameters["@PurchaseType"].Value = DBNull.Value;
            else
                e.Command.Parameters["@PurchaseType"].Value = Convert.ToInt32(PRI_PurchaseType.Value);
        }
        #endregion

        #region SubCatId Initialize
        protected void PRI_SubCatId_Init(object sender, EventArgs e)
        {
            ASPxGridLookup PRI_SubCatId = (ASPxGridLookup)sender;
            ASPxGridView PRI_SubCatIdGridView = PRI_SubCatId.GridView;
            PRI_SubCatIdGridView.CustomCallback += PRI_SubCatIdGridView_CustomCallback;
            PRI_SubCatIdGridView.AfterPerformCallback += PRI_SubCatIdGridView_AfterPerformCallback;
        }

        void PRI_SubCatIdGridView_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            ASPxGridView PRI_SubCatIdGridView = (ASPxGridView)sender;
            PRI_SubCatIdGridView.DataColumns["SubCatCode"].Settings.AutoFilterCondition = AutoFilterCondition.Contains;
            PRI_SubCatIdGridView.DataColumns["SubCatName"].Settings.AutoFilterCondition = AutoFilterCondition.Contains;
        }

        void PRI_SubCatIdGridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView PRI_SubCatIdGridView = (ASPxGridView)sender;
            PRI_SubCatIdGridView.DataBind();
        }

        protected void SubCatDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (PRI_CatId.GridView.FocusedRowIndex == -1)
                e.Command.Parameters["@CatId"].Value = DBNull.Value;
            else
                e.Command.Parameters["@CatId"].Value = Convert.ToInt32(PRI_CatId.GridView.GetRowValues(PRI_CatId.GridView.FocusedRowIndex, "CatId"));
        }
        #endregion

        #region Type Initialize
        protected void PRI_TypeId_Init(object sender, EventArgs e)
        {
            ASPxGridLookup PRI_TypeId = (ASPxGridLookup)sender;
            ASPxGridView PRI_TypeIdGridView = PRI_TypeId.GridView;
            PRI_TypeIdGridView.CustomCallback += PRI_TypeIdGridView_CustomCallback;
            PRI_TypeIdGridView.AfterPerformCallback += PRI_TypeIdGridView_AfterPerformCallback;
        }

        void PRI_TypeIdGridView_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            ASPxGridView PRI_TypeIdGridView = (ASPxGridView)sender;
            PRI_TypeIdGridView.DataColumns["T_Desc"].Settings.AutoFilterCondition = AutoFilterCondition.Contains;
        }

        void PRI_TypeIdGridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView PRI_TypeIdGridView = (ASPxGridView)sender;
            PRI_TypeIdGridView.DataBind();
        }

        protected void TypeDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (PRI_SubCatId.GridView.FocusedRowIndex == -1)
                e.Command.Parameters["@SubCatId"].Value = DBNull.Value;
            else
                e.Command.Parameters["@SubCatId"].Value = Convert.ToInt32(PRI_SubCatId.GridView.GetRowValues(PRI_SubCatId.GridView.FocusedRowIndex, "SubCatId"));
        }
        #endregion

        #region Parent Id Initialize
        protected void PRI_ParentId_Init(object sender, EventArgs e)
        {
            ASPxGridLookup PRI_ParentId = (ASPxGridLookup)sender;
            ASPxGridView PRI_ParentIdGridView = PRI_ParentId.GridView;
            PRI_ParentIdGridView.CustomCallback += PRI_ParentIdGridView_CustomCallback;
            PRI_ParentIdGridView.AfterPerformCallback += PRI_ParentIdGridView_AfterPerformCallback;
        }

        void PRI_ParentIdGridView_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            ASPxGridView PRI_ParentIdGridView = (ASPxGridView)sender;
            PRI_ParentIdGridView.DataBind();
        }

        void PRI_ParentIdGridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView PRI_ParentIdGridView = (ASPxGridView)sender;
            PRI_ParentIdGridView.DataColumns["AIRMI_RegistrationNumber"].Settings.AutoFilterCondition = AutoFilterCondition.Contains;
            PRI_ParentIdGridView.DataColumns["AIRMI_Desc"].Settings.AutoFilterCondition = AutoFilterCondition.Contains;
        }

        protected void ParentDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (PRI_PurchaseType.SelectedIndex == -1)
                e.Cancel = true;
            else
            {
                if (Convert.ToInt32(PRI_PurchaseType.Value) == 1)
                    e.Cancel = true;
                else if(Convert.ToInt32(PRI_PurchaseType.Value) == 2 || Convert.ToInt32(PRI_PurchaseType.Value) == 3 || Convert.ToInt32(PRI_PurchaseType.Value) == 4 || Convert.ToInt32(PRI_PurchaseType.Value) == 5)
                    e.Command.Parameters["@PurchaseType"].Value = Convert.ToInt32(PRI_PurchaseType.Value);
            }
        }
        #endregion

        protected void PRI_GLcode_TextChanged(object sender, EventArgs e)
        {

        }

        protected void PRI_CatId_TextChanged(object sender, EventArgs e)
        {

        }
    }
}