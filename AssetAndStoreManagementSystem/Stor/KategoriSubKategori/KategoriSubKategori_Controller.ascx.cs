using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;
using Core.PengurusanSistem;
using System.Configuration;
using System.Web.Security;

using Core.Shared;
using Core.Utility;

namespace AssetAndStoreManagementSystem.Stor.KategoriSubKategori
{
    public partial class KategoriSubKategori_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
        }

        protected void DetailAuditGrid_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void cbp_SubCatInfo_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string[] paramx = e.Parameter.Split('*');

            cbp_SubCatInfo.JSProperties["cpMode"] = paramx[0].ToString();

            switch (paramx[0].ToString())
            {
                case "LOAD": LoadSubCat(); break;
                case "ADD": AddSubCat(); break;
                case "DELETE": RemoveSubCat(paramx[1].ToString()); break;
                case "NEW": NewSubCatListing(); break;
            }
        }

        void LoadSubCat()
        {
            DataTable TVP = new DataTable();
            string errProcess = string.Empty;

            try
            {
                if (PelupusanId.Text != "")
                    errProcess = KategoriSubKategoriMethods.Load_SubCategori(ref TVP, PelupusanId.Text);
                else
                    FormSubCatTVP(ref TVP);

                if (errProcess == string.Empty)
                {
                    BindSubCatGrid(ref TVP);
                    cbp_SubCatInfo.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_SubCatInfo.JSProperties["cpErrMsg"] = errMsg + " " + errProcess;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SubCatInfo.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { TVP.Dispose(); }
        }

        void AddSubCat()
        {
            DataTable TVP = new DataTable();

            try
            {
                FormSubCatTVP(ref TVP);
                SaveSubCatGrid(ref TVP);
                AddNewSubCatRow(ref TVP);
                BindSubCatGrid(ref TVP);
                cbp_SubCatInfo.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SubCatInfo.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { TVP.Dispose(); }
        }

        void RemoveSubCat(string SubCatIdToRemove)
        {
            DataTable TVP = new DataTable();

            try
            {
                FormSubCatTVP(ref TVP);
                SaveSubCatGrid(ref TVP);
                RemoveSubCatRow(ref TVP, SubCatIdToRemove);
                BindSubCatGrid(ref TVP);
                cbp_SubCatInfo.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SubCatInfo.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { TVP.Dispose(); }
        }

        void NewSubCatListing()
        {
            DataTable TVP = new DataTable();

            try
            {
                FormSubCatTVP(ref TVP);
                BindSubCatGrid(ref TVP);
                cbp_SubCatInfo.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SubCatInfo.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { TVP.Dispose(); }
        }

        void FormSubCatTVP(ref DataTable Dt)
        {
            DataColumn PelupusanId = Dt.Columns.Add("PelupusanId", typeof(Int32));
            DataColumn Stock_Id = Dt.Columns.Add("Stock_Id", typeof(Int32));
            DataColumn Stock_RegisterNo = Dt.Columns.Add("Stock_RegisterNo", typeof(String));
            DataColumn Stock_Detail = Dt.Columns.Add("Stock_Detail", typeof(String));
            DataColumn Stock_Price = Dt.Columns.Add("Stock_Price", typeof(String));
            DataColumn Stock_QuantityRecord = Dt.Columns.Add("Stock_QuantityRecord", typeof(String));
            DataColumn Stock_QuantityPhysical = Dt.Columns.Add("Stock_QuantityPhysical", typeof(String));
            DataColumn Stock_Suggestion = Dt.Columns.Add("Stock_Suggestion", typeof(String));
            DataColumn Stock_Status = Dt.Columns.Add("Stock_Status", typeof(String));
            DataColumn Countx = Dt.Columns.Add("Countx", typeof(Int32));
            Dt.AcceptChanges();
        }

        void SaveSubCatGrid(ref DataTable Dt)
        {
            for (int i = 0; i < GridSubCatList.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();

                if (PelupusanId.Text == "")
                    Dr["PelupusanId"] = DBNull.Value;
                else
                    Dr["PelupusanId"] = Convert.ToInt32(PelupusanId.Text);

                Dr["Stock_Id"] = Convert.ToInt32(GridSubCatList.GetRowValues(i, "Stock_Id"));
                Dr["Stock_RegisterNo"] = GetGridTextBoxValue(i, "Stock_RegisterNo");
                Dr["Stock_Detail"] = GetGridTextBoxValue(i, "Stock_Detail");
                Dr["Stock_Price"] = GetGridTextBoxValue(i, "Stock_Price");
                Dr["Stock_QuantityRecord"] = GetGridTextBoxValue(i, "Stock_QuantityRecord");
                Dr["Stock_QuantityPhysical"] = GetGridTextBoxValue(i, "Stock_QuantityPhysical");
                Dr["Stock_Suggestion"] = GetGridTextBoxValue(i, "Stock_Suggestion");
                Dr["Stock_Status"] = GetGridTextBoxValue(i, "Stock_Status");
                Dr["Countx"] = Convert.ToInt32(GridSubCatList.GetRowValues(i, "Countx"));
                Dt.Rows.Add(Dr);
            }

            Dt.AcceptChanges();
        }

        string GetGridTextBoxValue(int RowIndex, string FieldName)
        {
            ASPxTextBox text = (ASPxTextBox)GridSubCatList.FindRowCellTemplateControl(RowIndex, GridSubCatList.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (text != null)
                return text.Text.Trim();
            else
                return string.Empty;
        }

        void AddNewSubCatRow(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (PelupusanId.Text == "")
                Dr["PelupusanId"] = DBNull.Value;
            else
                Dr["PelupusanId"] = Convert.ToInt32(PelupusanId.Text);

            Dr["Stock_Id"] = SortingNumberMethod.FormNextSortingId(ref Dt, "Stock_Id");
            Dr["Stock_RegisterNo"] = DBNull.Value;
            Dr["Stock_Detail"] = DBNull.Value;
            Dr["Stock_Price"] = DBNull.Value;
            Dr["Stock_QuantityRecord"] = DBNull.Value;
            Dr["Stock_QuantityPhysical"] = DBNull.Value;
            Dr["Stock_Suggestion"] = DBNull.Value;
            Dr["Stock_Status"] = DBNull.Value;
            Dr["Countx"] = 0;

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void RemoveSubCatRow(ref DataTable Dt, string SubCatIdToRemove)
        {
            DataRow[] Drs = Dt.Select("Stock_Id = " + SubCatIdToRemove.ToString());

            if (Drs.Length == 1)
                Dt.Rows.Remove(Drs[0]);
            
            Dt.AcceptChanges();
        }

        protected void cbp_CatInfo_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            DataTable TVP = new DataTable();

            try
            {
                if (PelupusanId.Text == "")
                {
                }
                else
                {
                    string err = KategoriSubKategoriMethods.Load_Categori(ref TVP, PelupusanId.Text);

                    if (err == "")
                    {
                        PelupusanDaftarStor.Value = Convert.ToInt32(TVP.Rows[0]["PelupusanDaftarStor"]);
                        PelupusanKeteranganStor.Text = TVP.Rows[0]["PelupusanKeteranganStor"].ToString();
                        PelupusanId.Text = TVP.Rows[0]["Stock_Id"].ToString();
                        cbp_CatInfo.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_CatInfo.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_CatInfo.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { TVP.Dispose(); }
        }

        void BindSubCatGrid(ref DataTable Dt)
        {
            GridSubCatList.DataSource = Dt;
            GridSubCatList.KeyFieldName = "Stock_Id";
            GridSubCatList.DataBind();
        }

        protected void GridSubCatList_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Stock_Id")
            {
                ASPxHyperLink Stock_Id = (ASPxHyperLink)GridSubCatList.FindRowCellTemplateControl(e.VisibleIndex, GridSubCatList.DataColumns["Stock_Id"] as GridViewDataColumn, "Stock_Id");

                if (Stock_Id != null)
                {
                    int Countx = Convert.ToInt32(GridSubCatList.GetRowValues(e.VisibleIndex, "Countx"));
                    Stock_Id.ClientInstanceName = "Stock_Id" + e.VisibleIndex.ToString();
                    Stock_Id.NavigateUrl = "javascript: RemoveStok("+ GridSubCatList.GetRowValues(e.VisibleIndex,"Stock_Id").ToString()+");";

                    if (Countx == 0)
                        Stock_Id.ClientVisible = true;
                    else
                        Stock_Id.ClientVisible = false;
                }
            }
            else
            {
                ASPxTextBox text = (ASPxTextBox)GridSubCatList.FindRowCellTemplateControl(e.VisibleIndex, GridSubCatList.DataColumns[e.DataColumn.FieldName] as GridViewDataColumn, e.DataColumn.FieldName);

                if (text != null)
                {
                    text.ClientInstanceName = e.DataColumn.FieldName + "_" + e.VisibleIndex.ToString();
                    text.Text = e.CellValue.ToString();
                }
            }
        }

        protected void cbp_Save_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_Save.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable HeaderTVP = new DataTable();
                DataTable DetailTVP = new DataTable();

                try
                {
                    FormHeaderTVP(ref HeaderTVP);
                    PopulateHeaderTVP(ref HeaderTVP);
                    FormSubCatTVP(ref DetailTVP);
                    SaveSubCatGrid(ref DetailTVP);
                    AlterDetailTVP(ref DetailTVP);
                    TrimDetailTVP(ref DetailTVP);

                    string err = KategoriSubKategoriMethods.SP_SaveDelete_CategorySubCategory(ref HeaderTVP, ref DetailTVP, PelupusanId.Text, ticket.Name, e.Parameter);

                    if (err == "")
                    {
                        if (e.Parameter == "SAVE")
                        {
                            string CategoryId = string.Empty;
                            KategoriSubKategoriMethods.GetCatId(ref CategoryId, PelupusanDaftarStor.Text.Trim());
                            cbp_Save.JSProperties["cpCatId"] = CategoryId;
                        }

                        cbp_Save.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_Save.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Save.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
                finally
                { HeaderTVP.Dispose(); DetailTVP.Dispose(); }
            }
            else
                cbp_Save.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void FormHeaderTVP(ref DataTable TVP)
        {
            DataColumn CatId = TVP.Columns.Add("PelupusanId", typeof(Int32));
            DataColumn CatType = TVP.Columns.Add("PelupusanDaftarStor", typeof(Int32));
            DataColumn CatName = TVP.Columns.Add("PelupusanKeteranganStor", typeof(String));
            //DataColumn CatCode = TVP.Columns.Add("Stock_Status", typeof(String));
            TVP.AcceptChanges();
        }

        void PopulateHeaderTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (PelupusanId.Text == "")
                Dr["PelupusanId"] = DBNull.Value;
            else
                Dr["PelupusanId"] = Convert.ToInt32(PelupusanId.Text);

            Dr["PelupusanDaftarStor"] = Convert.ToInt32(PelupusanDaftarStor.Value);
            Dr["PelupusanKeteranganStor"] = PelupusanKeteranganStor.Text.Trim();
            //Dr["DisposalType"] = DisposalType.Text.Trim();

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();

        }

        void AlterDetailTVP(ref DataTable Dt)
        {
            DataRow[] Drs = Dt.Select("SubCatId <= 0");
           
            for (int i = 0; i < Drs.Length; i++)
            {
                Drs[i]["SubCatId"] = DBNull.Value;
            }

            Dt.AcceptChanges();
        }

        void TrimDetailTVP(ref DataTable Dt)
        {
            Dt.Columns.Remove("Countx");
            Dt.AcceptChanges();
        }

        //protected void cbp_Report_Callback(object sender, CallbackEventArgsBase e)
        //{
        //    Session["ReportName"] = "Kategori Sub Kategori";
        //}

        protected void FormCatInfo_E2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Stock_RegisterNo_TextChanged(object sender, EventArgs e)
        {

        }
    }
}