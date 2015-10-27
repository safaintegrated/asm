using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Configuration;
using Core.Stor.Stor;
using DevExpress.Web;
using Core.Utility;
using Core.Stor;

namespace AssetAndStoreManagementSystem.Stor.Stor
{
    public partial class Stor_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }
        }

        protected void cbp_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp.JSProperties["cpMode"] = e.Parameter;
            
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (ticket.Expired)
            {
                cbp.JSProperties["cpErrMsg"] = "Session Expired.";
                return;
            }

            switch (e.Parameter)
            {
                case "LOAD": LoadStore(); break;
                case "SAVE": SaveMode(ticket.Name); break;
                case "CANCEL": CancelMode(); break;
                case "DELETE": DeleteMode(); break;
            }
        }

        private void DeleteMode()
        {

            DataTable A = new DataTable();
            try
            {
                RemoveData(ref A);
                cbp.JSProperties["cpErrMsg"] = string.Empty;
            }

            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LocationInfo.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { A.Dispose(); }
        }

        private void RemoveData(ref DataTable A)
        {
            DataRow[] Drs = A.Select("Stock_Id = " );

            if (Drs.Length == 1)
                A.Rows.Remove(Drs[0]);

            A.AcceptChanges();
        }



        #region Location
        protected void cbp_LocationInfo_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string[] paramx = e.Parameter.Split('*');
            cbp_LocationInfo.JSProperties["cpMode"] = paramx[0].ToString();
            switch (paramx[0].ToString())
            {

                case "LOAD": LoadLocation(); break;
                case "ADDLOCATION": AddLocation(); break;
                case "REMOVELOCATION": RemoveLocation(paramx[1].ToString()); break;
                case "NEW": NewLocationListing(); break;

            }
        }

        private void LoadLocation()
        {
            DataTable TVP = new DataTable();
            string errProcess = string.Empty;

            try
            {
                if (txtStoreId.Text != "")
                {
                    errProcess = StorMethods.SP_FindLocationStoreById(ref TVP, txtStoreId.Text);
                    //DataRow[] Drs = TVP.Select("LocationNumber <= 0");
                    TVP.Columns.Add("LocationNumber", typeof(Int32));
                    for (int i = 0; i < TVP.Rows.Count; i++)
                    {
                        TVP.Rows[i]["LocationNumber"] = i;
                    }

                    TVP.AcceptChanges();
                }
                else
                    FormLocationTVP(ref TVP);

                if (errProcess == string.Empty)
                {
                    BindLocationGrid(ref TVP);
                    cbp_LocationInfo.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_LocationInfo.JSProperties["cpErrMsg"] = errMsg + " " + errProcess;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LocationInfo.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { TVP.Dispose(); }
        }

        private void FormLocationTVP(ref DataTable Dt)
        {
            Dt.Columns.Add("StoreId", typeof(Int32));
            Dt.Columns.Add("LocationName", typeof(String));
            Dt.Columns.Add("LocationSection", typeof(String));
            Dt.Columns.Add("LocationLine", typeof(String));
            Dt.Columns.Add("LocationShelf", typeof(String));
            Dt.Columns.Add("LocationLevel", typeof(String));
            Dt.Columns.Add("LocationSwath", typeof(String));
            Dt.Columns.Add("LocationNumber", typeof(Int32));
            Dt.Columns.Add("Countx", typeof(Int32));
            Dt.AcceptChanges();
        }

        private void BindLocationGrid(ref DataTable dt)
        {
            gvLocation.DataSource = dt;
            gvLocation.KeyFieldName = "LocationNumber";
            //gvLocation.KeyFieldName = "LocationId";
            gvLocation.DataBind();
        }

        void AddLocation()
        {
            DataTable TVP = new DataTable();

            try
            {
                FormLocationTVP(ref TVP);
                PopulateLocationTVP(ref TVP);
                AddNewLocationRow(ref TVP);
                BindLocationGrid(ref TVP);
                cbp_LocationInfo.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LocationInfo.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { TVP.Dispose(); }

        }

        private void PopulateLocationTVP(ref DataTable Dt)
        {
            for (int i = 0; i < gvLocation.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["LocationNumber"] = Convert.ToInt32(gvLocation.GetRowValues(i, "LocationNumber"));

                if (txtStoreId.Text == "")
                    Dr["StoreId"] = DBNull.Value;
                else
                    Dr["StoreId"] = Convert.ToInt32(txtStoreId.Text);

                // Dr["LocationId"] = Convert.ToInt32(gvLocation.GetRowValues(i, "LocationId"));
                ASPxTextBox txtTempLocationName = (ASPxTextBox)gvLocation.FindRowCellTemplateControl(i, gvLocation.DataColumns["txtLocationName"] as GridViewDataColumn, "txtLocationName");
                if (txtTempLocationName != null)
                {
                    Dr["LocationName"] = txtTempLocationName.Text.Trim();
                }
                else
                {
                    Dr["LocationName"] = DBNull.Value;
                }

                Dr["LocationSection"] = GetGridTextBoxValue(i, "txtLocationSection");
                Dr["LocationLine"] = GetGridTextBoxValue(i, "txtLocationLine");
                Dr["LocationShelf"] = GetGridTextBoxValue(i, "txtLocationShelf");
                Dr["LocationLevel"] = GetGridTextBoxValue(i, "txtLocationLevel");
                Dr["LocationSwath"] = GetGridTextBoxValue(i, "txtLocationSwath");


                Dr["Countx"] = Convert.ToInt32(gvLocation.GetRowValues(i, "Countx"));
                Dt.Rows.Add(Dr);
            }

            Dt.AcceptChanges();
        }


        void AddNewLocationRow(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["StoreId"] = DBNull.Value;
            Dr["LocationName"] = DBNull.Value;
            Dr["LocationSection"] = DBNull.Value;
            Dr["LocationLine"] = DBNull.Value;
            Dr["LocationShelf"] = DBNull.Value;
            Dr["LocationLevel"] = DBNull.Value;
            Dr["LocationSwath"] = DBNull.Value;
            Dr["LocationNumber"] = SortingNumberMethod.FormNextSortingIdStartWith1(ref Dt, "LocationNumber");
            Dr["Countx"] = DBNull.Value;

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }


        void RemoveLocation(string Location_IdToRemove)
        {
            DataTable TVP = new DataTable();

            try
            {
                FormLocationTVP(ref TVP);
                PopulateLocationTVP(ref TVP);
                RemoveLocationRow(ref TVP, Location_IdToRemove);
                BindLocationGrid(ref TVP);
                cbp_LocationInfo.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LocationInfo.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { TVP.Dispose(); }
        }

        void NewLocationListing()
        {
            DataTable TVP = new DataTable();

            try
            {
                FormLocationTVP(ref TVP);
                BindLocationGrid(ref TVP);
                cbp_LocationInfo.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LocationInfo.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { TVP.Dispose(); }
        }

        #endregion

        private void LoadStore()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = StorMethods.SP_FindStoreById(ref Dt, txtStoreId.Text);

                if (DbErr == string.Empty)
                {
                    glEmployeeId.Value = Convert.ToInt32(Dt.Rows[0]["ST_StoreOfficerEmpSysId"].ToString());
                    glPtj.Value = Convert.ToInt32(Dt.Rows[0]["ST_StorePTJId"].ToString());
                    cbJenisStor.Value = Convert.ToInt32(Dt.Rows[0]["StoreType"].ToString());

                    txtStoreId.Text = Dt.Rows[0]["ST_StoreId"].ToString();
                    txtStoreName.Text = Dt.Rows[0]["ST_StoreName"].ToString();
                    cbJenisStor.Text = Dt.Rows[0]["StoreType"].ToString();
                    txtStoreAdd1.Text = Dt.Rows[0]["ST_StoreAdd1"].ToString();
                    txtStoreAdd2.Text = Dt.Rows[0]["ST_StoreAdd2"].ToString();
                    txtStoreAdd3.Text = Dt.Rows[0]["ST_StoreAdd3"].ToString();
                    txtStoreAdd4.Text = Dt.Rows[0]["ST_StoreAdd4"].ToString();
                  
                    
                    txtEmployeeName.Text = Dt.Rows[0]["EmployeeName"].ToString();
                    txtPhoneNumber.Text = Dt.Rows[0]["EmployeeTelephone"].ToString();
                    txtEmployeeEmail.Text = Dt.Rows[0]["EmployeeEmail"].ToString();

                    int Jenis = 0;
                    if (!int.TryParse(Dt.Rows[0]["StoreType"].ToString(), out Jenis))
                    {
                        Jenis = 0;
                    }
                    cbJenisStor.SelectedIndex = Jenis;


                    cbp.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        private void SaveMode(string CurrUser)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (ticket.Expired)
            {
                cbp.JSProperties["cpErrMsg"] = "Session Expired.";
                return;
            }

            DataTable HeaderTVP = new DataTable();
            DataTable DetailTVP = new DataTable();
            try
            {

                FormHeaderTVP(ref HeaderTVP);
                PopulateHeaderTVP(ref HeaderTVP);

                FormLocationTVP(ref DetailTVP);
                PopulateLocationTVP(ref DetailTVP);
                AlterDetailTVP(ref DetailTVP);
                TrimDetailTVP(ref DetailTVP);

                string DbErr = StorMethods.SP_StoreSave(ref HeaderTVP, ref DetailTVP, txtStoreId.Text, CurrUser);


                if (DbErr == "")
                { cbp.JSProperties["cpErrMsg"] = string.Empty; }
                else
                { cbp.JSProperties["cpErrMsg"] = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString() + " " + DbErr; }
            }
            catch (Exception err)
            { cbp.JSProperties["cpErrMsg"] = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString() + " " + err; }
            finally
            { HeaderTVP.Dispose(); DetailTVP.Dispose(); }
        }

        private void FormHeaderTVP(ref DataTable TVP)
        {
            TVP.Columns.Add("StoreId", typeof(Int32));
            TVP.Columns.Add("StoreName", typeof(String));
            TVP.Columns.Add("StorePtjId", typeof(Int32));
            TVP.Columns.Add("StoreAddress1", typeof(String));
            TVP.Columns.Add("StoreAddress2", typeof(String));
            TVP.Columns.Add("StoreAddress3", typeof(String));
            TVP.Columns.Add("StoreAddress4", typeof(String));
            TVP.Columns.Add("StoreEmployeeId", typeof(Int32));
            TVP.Columns.Add("StoreType", typeof(Int32));

            TVP.AcceptChanges();
        }

        void PopulateHeaderTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (txtStoreId.Text == "")
                Dr["StoreId"] = DBNull.Value;
            else
                Dr["StoreId"] = Convert.ToInt32(txtStoreId.Text);

            Dr["StoreName"] = txtStoreName.Text.Trim();
            Dr["StoreType"] = Convert.ToInt32(cbJenisStor.Value);
            Dr["StoreAddress1"] = txtStoreAdd1.Text.Trim();
            Dr["StoreAddress2"] = txtStoreAdd2.Text.Trim();
            Dr["StoreAddress3"] = txtStoreAdd3.Text.Trim();
            Dr["StoreAddress4"] = txtStoreAdd4.Text.Trim();
            Dr["StoreEmployeeId"] = Convert.ToInt32(glEmployeeId.Value);
            Dr["StorePtjId"] = Convert.ToInt32(glPtj.Value);


            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();

        }

        void CancelMode()
        {
            txtStoreName.Text = string.Empty;
            glPtj.Value = DBNull.Value;
            txtStoreAdd1.Text = string.Empty;
            txtStoreAdd2.Text = string.Empty;
            txtStoreAdd3.Text = string.Empty;
            txtStoreAdd4.Text = string.Empty;
            glEmployeeId.Value = DBNull.Value;
            txtPhoneNumber.Text = string.Empty;
            txtStoreId.Text = string.Empty;
            //cbJenisStor.Value= DBNull.Value;
            cbJenisStor.SelectedIndex = 0;
            cbp.JSProperties["cpErrMsg"] = string.Empty;
        }

        protected void GridSearch_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearch.DataBind();
        }

        protected void GridSearch_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "ST_StoreName")
            {
                GridViewDataColumn gvc = GridSearch.DataColumns["ST_StoreName"] as GridViewDataColumn;

                var obj = GridSearch.FindRowCellTemplateControl(e.VisibleIndex, gvc, "ST_StoreName");

                ASPxHyperLink link = (ASPxHyperLink)obj;

                if (link != null)
                {
                    string ST_StoreId = GridSearch.GetRowValues(e.VisibleIndex, "ST_StoreId").ToString();
                    link.ClientInstanceName = "ST_StoreName" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: StorSelected('" + ST_StoreId + "');";
                }
            }
        }


        string GetGridTextBoxValue(int RowIndex, string FieldName)
        {
            ASPxTextBox text = (ASPxTextBox)gvLocation.FindRowCellTemplateControl(RowIndex, gvLocation.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (text != null)
                return text.Text.Trim();
            else
                return string.Empty;
        }



        void RemoveLocationRow(ref DataTable Dt, string Location_IdToRemove)
        {
            DataRow[] Drs = Dt.Select("LocationNumber = " + Location_IdToRemove.ToString());

            if (Drs.Length == 1)
                Dt.Rows.Remove(Drs[0]);

            Dt.AcceptChanges();
        }

        void AlterDetailTVP(ref DataTable Dt)
        {
            //DataRow[] Drs = Dt.Select("LocationId <= 0");

            //for (int i = 0; i < Drs.Length; i++)
            //{
            //    Drs[i]["LocationId"] = DBNull.Value;
            //}

            //Dt.AcceptChanges();
        }

        void TrimDetailTVP(ref DataTable Dt)
        {
            Dt.Columns.Remove("Countx");
            Dt.AcceptChanges();
        }

        protected void cbp_Report_Callback(object sender, CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "STOR":
                    Session["ParamStoreId"] = txtStoreId.Text;
                    Session["ReportName"] = "STOCK-STORE";
                    break;
                case "LIST":
                    Session["ReportName"] = "STOCK-STORE-LIST";
                    break;

            }
        }



        protected void GridLocationList_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "LocationShelf":
                case "LocationLevel":
                case "LocationSwath":
                case "LocationLine":
                case "LocationName": 
                case "LocationSection":
                    FormTextBox(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue);
                    break;
                case "LocationNumber":
                    FormDeleteLink(e.VisibleIndex, e.CellValue);
                    break;
            }
        }

        void FormTextBox(int RowIndex, string FieldName, object CellValue)
        {
            ASPxTextBox Tb = (ASPxTextBox)gvLocation.FindRowCellTemplateControl(RowIndex, gvLocation.DataColumns["txt" + FieldName] as GridViewDataColumn, "txt" + FieldName);

            if (Tb != null)
            {
                Tb.ClientInstanceName = "txt" + FieldName + "_" + RowIndex.ToString();
                Tb.Text = CellValue.ToString();
            }
        }

        void FormDeleteLink(int RowIndex, object CellValue)
        {
            ASPxHyperLink Hypp = (ASPxHyperLink)gvLocation.FindRowCellTemplateControl(RowIndex, gvLocation.DataColumns["LocationNumber"] as GridViewDataColumn, "LocationNumber");

            if (Hypp != null)
            {
                Hypp.ClientInstanceName = "hlRemoveLocation_" + RowIndex.ToString();
                Hypp.NavigateUrl = "javascript: RemoveLocation(" + CellValue.ToString() + ");";
            }
        }

        protected void glEmployeeId_TextChanged(object sender, EventArgs e)
        {

        }

    }
}