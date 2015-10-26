using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using System.Data;
using Core.Aset.LaporanKehilangan;
using DevExpress.Web;
using Core.PengurusanSistem;
using Core.Email;

namespace AssetAndStoreManagementSystem.Aset.LaporanKehilangan
{
    public partial class Laporan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_Laporan_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                cbp_Laporan.JSProperties["cpMode"] = e.Parameter;

                switch (e.Parameter)
                {
                    case "ADD": AddMode(ticket.Name); break;
                    case "ASSETINVSELECTED": AssetSelectedMode(); break;
                    case "SAVE": SavePostMode(ticket.Name,0); break;
                    case "POST": SavePostMode(ticket.Name,1); break;
                    case "LOAD": LoadMode(); break;
                    case "DELETEITEM": DeleteItemMode(); break;
                }
            }
            else
            {
                cbp_Laporan.JSProperties["cpErrMsg"] = "Session Expired.";
            }
        }

        void AddMode(string CurrUser)
        {
            DataTable Dt = new DataTable();
            DataTable DetailDt = new DataTable();

            try
            {
                string ProcessId = DateTime.Now.ToString("yyMMdd-HHmmss");
                string err = LaporanKehilanganMethods.SP_LaporanKehilangan_CreateNewEntry(ProcessId, CurrUser, ref Dt);

                if (err == "")
                {
                    LKH_MissingDate.Value = DBNull.Value;
                    LKH_MissingLocation.Text = string.Empty;
                    LKH_MissingReason.Text = string.Empty;
                    LKH_PoliceRptNumber.Text = string.Empty;
                    LKH_PolieRptDate.Value = DBNull.Value;
                    LKH_OfficerInchargeEmpId.Value = DBNull.Value;
                    LKH_OfficerInchargeDesignation.Text = "";
                    LKH_OfficerInChargeDesignationType.Text = "";
                    LKH_SurchargeAction.Value = DBNull.Value;
                    LKH_SurchargeDate.Value = DBNull.Value;
                    LKH_DiciplinaryAction.SelectedIndex = -1;
                    LKH_DiciplinaryDate.Value = DBNull.Value;
                    LKH_ExistingPrecautionMethods.Text = "";
                    LKH_FuturePrecautionMethods.Text = "";
                    LKH_ProcessId.Text = ProcessId;
                    LKH_RevNumber.Text = "1";
                    LKH_Status.Text = "2";
                    CreatorPtjName.Text = Dt.Rows[0]["PTJ_Name"].ToString();
                    EmployeeTelephone.Text = Dt.Rows[0]["EmployeeTelephone"].ToString();
                    EmployeeName.Text = Dt.Rows[0]["EmployeeName"].ToString();
                    LKH_CreatorEmpId.Text = Dt.Rows[0]["EmployeeId"].ToString();
                    cbp_Laporan.JSProperties["cpErrMsg"] = string.Empty;

                    FormDetailTVP(ref DetailDt);
                    BindMissingItemGrid(ref DetailDt);
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Laporan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Laporan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); DetailDt.Dispose(); }
        }

        void AssetSelectedMode()
        {
            DataTable DetailDt = new DataTable();

            try
            {
                FormDetailTVP(ref DetailDt);

                for (int i = 0; i < GridSearchAssetInv.VisibleRowCount; i++)
                {
                    object key = GridSearchAssetInv.GetRowValues(i, GridSearchAssetInv.KeyFieldName);
                    if (GridSearchAssetInv.Selection.IsRowSelectedByKey(key))
                    {
                        DataRow Dr = DetailDt.NewRow();
                        Dr["LKMI_ProcessId"] = LKH_ProcessId.Text;
                        Dr["LKMI_Revision"] = Convert.ToInt32(LKH_RevNumber.Text);
                        Dr["LKMI_AssetInvUniqueId"] = GridSearchAssetInv.GetRowValues(i, "AssInvUniqueId").ToString();
                        Dr["LKMI_AssetInvType"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(i, "AssetInvType"));
                        Dr["LKMI_CurrentValue"] = DBNull.Value;
                        Dr["AssetInvRegNumber"] = GridSearchAssetInv.GetRowValues(i, "AssInvRegNum").ToString();
                        Dr["AssetInvDesc"] = GridSearchAssetInv.GetRowValues(i, "AssInvDesc").ToString();
                        Dr["AssetInvBrand"] = GridSearchAssetInv.GetRowValues(i, "AIRMI_Brand").ToString();
                        Dr["AssetInvModel"] = GridSearchAssetInv.GetRowValues(i, "AIRMI_Model").ToString();

                        if (GridSearchAssetInv.GetRowValues(i, "AIRMI_ReceivedDate").ToString() != "")
                            Dr["AssetInvReceivedDate"] = Convert.ToDateTime(GridSearchAssetInv.GetRowValues(i, "AIRMI_ReceivedDate"));
                        else
                            Dr["AssetInvReceivedDate"] = DBNull.Value;

                        if (GridSearchAssetInv.GetRowValues(i, "AIRMI_PurchasePrice").ToString() != "")
                            Dr["AssetInvPurchasePrice"] = Convert.ToDecimal(GridSearchAssetInv.GetRowValues(i, "AIRMI_PurchasePrice"));
                        else
                            Dr["AssetInvPurchasePrice"] = DBNull.Value;

                        DetailDt.Rows.Add(Dr);
                    }
                }

                DetailDt.AcceptChanges();
                BindMissingItemGrid(ref DetailDt);                
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Laporan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DetailDt.Dispose(); }
        }

        void SavePostMode(string CurrUser, int Post)
        {
            DataTable HeaderDt = new DataTable();
            DataTable DetailDt = new DataTable();
            DataTable PostDt = new DataTable();

            try
            {
                FormHeaderTVP(ref HeaderDt);
                PopulateHeaderTVP(ref HeaderDt);
                FormDetailTVP(ref DetailDt);
                PopulateDetailTVP(ref DetailDt);
                TrimDetailTVP(ref DetailDt);

                string err = LaporanKehilanganMethods.SP_LaporanKehilangan_SavePost(CurrUser, ref HeaderDt, ref DetailDt, Post);

                if (err == "")
                {
                    if (Post == 1)
                    {
                        string ApplicantName = string.Empty;
                        string KetuaPtjString = string.Empty;

                        KakitanganMethods.GetEmployeeNameByUserSystemId(ref ApplicantName,CurrUser);

                        string RefNumber = string.Empty;
                        LaporanKehilanganMethods.GetRefNumber(LKH_ProcessId.Text,LKH_RevNumber.Text,ref RefNumber);

                        LaporanKehilanganMethods.SP_LaporanKerosakan_GetKetuaPtj(LKH_ProcessId.Text,LKH_RevNumber.Text,ref PostDt);

                        string EmailError = SendMail.LaporanKerosakan_KetuaPtjApprovalOne(ref PostDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), ApplicantName, RefNumber);

                        if (EmailError == string.Empty)
                        {

                            for (int q = 0; q < PostDt.Rows.Count; q++)
                            {
                                if (KetuaPtjString == string.Empty)
                                    KetuaPtjString = PostDt.Rows[q]["EmployeeName"].ToString();
                                else
                                    KetuaPtjString = KetuaPtjString + ", " + PostDt.Rows[q]["EmployeeName"].ToString();
                            }

                            cbp_Laporan.JSProperties["cpVerifier"] = KetuaPtjString;
                            cbp_Laporan.JSProperties["cpMailError"] = string.Empty;
                        }
                        else
                            cbp_Laporan.JSProperties["cpMailError"] = EmailError;
                    }

                    cbp_Laporan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Laporan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Laporan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { HeaderDt.Dispose(); DetailDt.Dispose(); PostDt.Dispose(); }
        }

        void LoadMode()
        {
            DataTable HeaderDt = new DataTable();
            DataTable DetailDt = new DataTable();
            try
            {
                string DbErr = LaporanKehilanganMethods.GetLaporanKehilanganInfo(LKH_ProcessId.Text, LKH_RevNumber.Text, ref HeaderDt, ref DetailDt);

                if (DbErr == string.Empty)
                {
                    //form                  
                    CreatorPtjName.Text = HeaderDt.Rows[0]["CreatorPtjName"].ToString();
                    EmployeeTelephone.Text = HeaderDt.Rows[0]["EmployeeTelephone"].ToString();
                    EmployeeName.Text = HeaderDt.Rows[0]["EmployeeName"].ToString();
                    LKH_Status.Text = HeaderDt.Rows[0]["LKH_Status"].ToString();
                    LKH_CreatorEmpId.Text = HeaderDt.Rows[0]["LKH_CreatorEmpId"].ToString();
                    LKH_MissingDate.Date = Convert.ToDateTime(HeaderDt.Rows[0]["LKH_MissingDate"]);
                    LKH_MissingLocation.Text = HeaderDt.Rows[0]["LKH_MissingLocation"].ToString();
                    LKH_MissingReason.Text = HeaderDt.Rows[0]["LKH_MissingReason"].ToString();
                    LKH_PoliceRptNumber.Text = HeaderDt.Rows[0]["LKH_PoliceRptNumber"].ToString();

                    if (HeaderDt.Rows[0]["LKH_PolieRptDate"].ToString() == "")
                        LKH_PolieRptDate.Value = DBNull.Value;
                    else
                        LKH_PolieRptDate.Date = Convert.ToDateTime(HeaderDt.Rows[0]["LKH_PolieRptDate"]);

                    LKH_OfficerInchargeEmpId.Value = HeaderDt.Rows[0]["LKH_OfficerInchargeEmpId"].ToString();
                    LKH_OfficerInchargeDesignation.Text = HeaderDt.Rows[0]["LKH_OfficerInchargeDesignation"].ToString();
                    LKH_OfficerInChargeDesignationType.Text = HeaderDt.Rows[0]["LKH_OfficerInChargeDesignationType"].ToString();

                    if (HeaderDt.Rows[0]["LKH_SurchargeAction"].ToString() == "")
                        LKH_SurchargeAction.Value = DBNull.Value;
                    else
                        LKH_SurchargeAction.Value = Convert.ToDecimal(HeaderDt.Rows[0]["LKH_SurchargeAction"]);

                    if (HeaderDt.Rows[0]["LKH_SurchargeDate"].ToString() == "")
                        LKH_SurchargeDate.Value = DBNull.Value;
                    else
                        LKH_SurchargeDate.Date = Convert.ToDateTime(HeaderDt.Rows[0]["LKH_SurchargeDate"]);

                    if (HeaderDt.Rows[0]["LKH_DiciplinaryAction"].ToString() == "")
                        LKH_DiciplinaryAction.Value = DBNull.Value;
                    else
                        LKH_DiciplinaryAction.Value = Convert.ToInt32(HeaderDt.Rows[0]["LKH_DiciplinaryAction"]);

                    if (HeaderDt.Rows[0]["LKH_DiciplinaryDate"].ToString() == "")
                        LKH_DiciplinaryDate.Value = DBNull.Value;
                    else
                        LKH_DiciplinaryDate.Date = Convert.ToDateTime(HeaderDt.Rows[0]["LKH_DiciplinaryDate"]);

                    LKH_ExistingPrecautionMethods.Text = HeaderDt.Rows[0]["LKH_ExistingPrecautionMethods"].ToString();
                   LKH_FuturePrecautionMethods.Text = HeaderDt.Rows[0]["LKH_FuturePrecautionMethods"].ToString();

                    //missing item list
                    BindMissingItemGrid(ref DetailDt);
                    cbp_Laporan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Laporan.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }                
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Laporan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { HeaderDt.Dispose(); DetailDt.Dispose(); }
        }

        void DeleteItemMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormDetailTVP(ref Dt);
                PopulateDetailTVP(ref Dt);

                DataRow[] drs = Dt.Select("LKMI_AssetInvUniqueId = '"+ tempDelete.Text +"'");

                if (drs.Length == 1)
                    Dt.Rows.Remove(drs[0]);

                Dt.AcceptChanges();

                BindMissingItemGrid(ref Dt);
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Laporan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void BindMissingItemGrid(ref DataTable Dt)
        {
            GridMissingItems.DataSource = Dt;
            GridMissingItems.KeyFieldName = "LKMI_AssetInvUniqueId";
            GridMissingItems.DataBind();
        }

        void FormHeaderTVP(ref DataTable Dt)
        {
            DataColumn LKH_ProcessId = Dt.Columns.Add("LKH_ProcessId", typeof(String));
            DataColumn LKH_RevNumber = Dt.Columns.Add("LKH_RevNumber", typeof(Int32));
            DataColumn LKH_REfNumber = Dt.Columns.Add("LKH_REfNumber", typeof(String));
            DataColumn LKH_CreatorEmpId = Dt.Columns.Add("LKH_CreatorEmpId", typeof(String));
            DataColumn LKH_CreatedDate = Dt.Columns.Add("LKH_CreatedDate", typeof(DateTime));
            DataColumn LKH_MissingDate = Dt.Columns.Add("LKH_MissingDate", typeof(DateTime));
            DataColumn LKH_MissingLocation = Dt.Columns.Add("LKH_MissingLocation", typeof(String));
            DataColumn LKH_MissingReason = Dt.Columns.Add("LKH_MissingReason", typeof(String));
            DataColumn LKH_PoliceRptNumber = Dt.Columns.Add("LKH_PoliceRptNumber", typeof(String));
            DataColumn LKH_PolieRptDate = Dt.Columns.Add("LKH_PolieRptDate", typeof(DateTime));
            DataColumn LKH_OfficerInchargeEmpId = Dt.Columns.Add("LKH_OfficerInchargeEmpId", typeof(String));
            DataColumn LKH_OfficerInchargeDesignation = Dt.Columns.Add("LKH_OfficerInchargeDesignation", typeof(String));
            DataColumn LKH_OfficerInChargeDesignationType = Dt.Columns.Add("LKH_OfficerInChargeDesignationType", typeof(String));
            DataColumn LKH_SurchargeAction = Dt.Columns.Add("LKH_SurchargeAction", typeof(Decimal));
            DataColumn LKH_SurchargeDate = Dt.Columns.Add("LKH_SurchargeDate", typeof(DateTime));
            DataColumn LKH_DiciplinaryAction = Dt.Columns.Add("LKH_DiciplinaryAction", typeof(Int32));
            DataColumn LKH_DiciplinaryDate = Dt.Columns.Add("LKH_DiciplinaryDate", typeof(DateTime));
            DataColumn LKH_ExistingPrecautionMethods = Dt.Columns.Add("LKH_ExistingPrecautionMethods", typeof(String));
            DataColumn LKH_FuturePrecautionMethods = Dt.Columns.Add("LKH_FuturePrecautionMethods", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateHeaderTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            Dr["LKH_ProcessId"] = LKH_ProcessId.Text;
            Dr["LKH_RevNumber"] = Convert.ToInt32(LKH_RevNumber.Text);
            Dr["LKH_REfNumber"] = DBNull.Value;
            Dr["LKH_CreatorEmpId"] = LKH_CreatorEmpId.Text;
            Dr["LKH_CreatedDate"] = DateTime.Today;

            if (LKH_MissingDate.Text == "")
                Dr["LKH_MissingDate"] = DBNull.Value;
            else
                Dr["LKH_MissingDate"] = LKH_MissingDate.Date;

            if (LKH_MissingLocation.Text == "")
                Dr["LKH_MissingLocation"] = DBNull.Value;
            else
                Dr["LKH_MissingLocation"] = LKH_MissingLocation.Text.Trim();

            if (LKH_MissingReason.Text == "")
                Dr["LKH_MissingReason"] = DBNull.Value;
            else
                Dr["LKH_MissingReason"] = LKH_MissingReason.Text.Trim();

            if (LKH_PoliceRptNumber.Text == "")
                Dr["LKH_PoliceRptNumber"] = DBNull.Value;
            else
                Dr["LKH_PoliceRptNumber"] = LKH_PoliceRptNumber.Text.Trim();

            if (LKH_PolieRptDate.Text == "")
                Dr["LKH_PolieRptDate"] = DBNull.Value;
            else
                Dr["LKH_PolieRptDate"] = LKH_PolieRptDate.Date;

            Dr["LKH_OfficerInchargeEmpId"] = LKH_OfficerInchargeEmpId.Value.ToString();
            Dr["LKH_OfficerInchargeDesignation"] = LKH_OfficerInchargeDesignation.Text;
            Dr["LKH_OfficerInChargeDesignationType"] = LKH_OfficerInChargeDesignationType.Text;

            if (LKH_SurchargeAction.Text == "")
                Dr["LKH_SurchargeAction"] = DBNull.Value;
            else
                Dr["LKH_SurchargeAction"] = Convert.ToDecimal(LKH_SurchargeAction.Value);

            if (LKH_SurchargeDate.Text == "")
                Dr["LKH_SurchargeDate"] = DBNull.Value;
            else
                Dr["LKH_SurchargeDate"] = LKH_SurchargeDate.Date;

            if (LKH_DiciplinaryAction.SelectedIndex == -1)
                Dr["LKH_DiciplinaryAction"] = DBNull.Value;
            else
                Dr["LKH_DiciplinaryAction"] = Convert.ToInt32(LKH_DiciplinaryAction.Value);

            if (LKH_DiciplinaryDate.Text == "")
                Dr["LKH_DiciplinaryDate"] = DBNull.Value;
            else
                Dr["LKH_DiciplinaryDate"] = LKH_DiciplinaryDate.Date;

            if (LKH_ExistingPrecautionMethods.Text == "")
                Dr["LKH_ExistingPrecautionMethods"] = DBNull.Value;
            else
                Dr["LKH_ExistingPrecautionMethods"] = LKH_ExistingPrecautionMethods.Text.Trim();

            if (LKH_FuturePrecautionMethods.Text == "")
                Dr["LKH_FuturePrecautionMethods"] = DBNull.Value;
            else
                Dr["LKH_FuturePrecautionMethods"] = LKH_FuturePrecautionMethods.Text.Trim();

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void FormDetailTVP(ref DataTable Dt)
        {
            DataColumn LKMI_ProcessId = Dt.Columns.Add("LKMI_ProcessId", typeof(String));
            DataColumn LKMI_Revision = Dt.Columns.Add("LKMI_Revision", typeof(Int32));
            DataColumn LKMI_AssetInvUniqueId = Dt.Columns.Add("LKMI_AssetInvUniqueId", typeof(String));
            DataColumn LKMI_AssetInvType = Dt.Columns.Add("LKMI_AssetInvType", typeof(Int32));
            DataColumn LKMI_CurrentValue = Dt.Columns.Add("LKMI_CurrentValue", typeof(Decimal));
            DataColumn AssetInvRegNumber = Dt.Columns.Add("AssetInvRegNumber", typeof(String));
            DataColumn AssetInvDesc = Dt.Columns.Add("AssetInvDesc", typeof(String));
            DataColumn AssetInvBrand = Dt.Columns.Add("AssetInvBrand", typeof(String));
            DataColumn AssetInvModel = Dt.Columns.Add("AssetInvModel", typeof(String));
            DataColumn AssetInvReceivedDate = Dt.Columns.Add("AssetInvReceivedDate", typeof(DateTime));
            DataColumn AssetInvPurchasePrice = Dt.Columns.Add("AssetInvPurchasePrice", typeof(Decimal));
            Dt.AcceptChanges();
        }

        void PopulateDetailTVP(ref DataTable Dt)
        {
            for (int i = 0; i < GridMissingItems.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["LKMI_ProcessId"] = GridMissingItems.GetRowValues(i,"LKMI_ProcessId").ToString();
                Dr["LKMI_Revision"] = Convert.ToInt32(GridMissingItems.GetRowValues(i, "LKMI_Revision"));
                Dr["LKMI_AssetInvUniqueId"] = GridMissingItems.GetRowValues(i, "LKMI_AssetInvUniqueId").ToString();
                Dr["LKMI_AssetInvType"] = Convert.ToInt32(GridMissingItems.GetRowValues(i, "LKMI_AssetInvType"));

                ASPxSpinEdit LKMI_CurrentValue = (ASPxSpinEdit)GridMissingItems.FindRowCellTemplateControl(i, GridMissingItems.DataColumns["LKMI_CurrentValue"] as GridViewDataColumn, "LKMI_CurrentValue");

                if (LKMI_CurrentValue != null)
                {
                    if (LKMI_CurrentValue.Text != "")
                    {
                        Dr["LKMI_CurrentValue"] = Convert.ToDecimal(LKMI_CurrentValue.Value);
                    }
                    else
                        Dr["LKMI_CurrentValue"] = DBNull.Value;
                }
                else
                    Dr["LKMI_CurrentValue"] = DBNull.Value;

                Dr["AssetInvRegNumber"] = GridMissingItems.GetRowValues(i, "AssetInvRegNumber").ToString();
                Dr["AssetInvDesc"] = GridMissingItems.GetRowValues(i, "AssetInvDesc").ToString();
                Dr["AssetInvBrand"] = GridMissingItems.GetRowValues(i, "AssetInvBrand").ToString();
                Dr["AssetInvModel"] = GridMissingItems.GetRowValues(i, "AssetInvModel").ToString();
                Dr["AssetInvReceivedDate"] = Convert.ToDateTime(GridMissingItems.GetRowValues(i, "AssetInvReceivedDate"));

                if (GridMissingItems.GetRowValues(i, "AssetInvPurchasePrice").ToString() != "")
                    Dr["AssetInvPurchasePrice"] = Convert.ToDecimal(GridMissingItems.GetRowValues(i, "AssetInvPurchasePrice"));
                else
                    Dr["AssetInvPurchasePrice"] = DBNull.Value;

                Dt.Rows.Add(Dr);

            }
            Dt.AcceptChanges();
        }

        void TrimDetailTVP(ref DataTable Dt)
        {
            Dt.Columns.Remove("AssetInvRegNumber");
            Dt.Columns.Remove("AssetInvDesc");
            Dt.Columns.Remove("AssetInvBrand");
            Dt.Columns.Remove("AssetInvModel");
            Dt.Columns.Remove("AssetInvReceivedDate");
            Dt.Columns.Remove("AssetInvPurchasePrice");
            Dt.AcceptChanges();
        }

        protected void GridMissingItems_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "LKMI_CurrentValue": FormSpinEdit(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "LKMI_AssetInvUniqueId": FormDeleteLink(e.VisibleIndex, e.DataColumn.FieldName); break;
            }
        }

        void FormSpinEdit(int VisibleIndex, string FieldName, object CellValue)
        {
            ASPxSpinEdit spin = (ASPxSpinEdit)GridMissingItems.FindRowCellTemplateControl(VisibleIndex, GridMissingItems.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (spin != null)
            {
                spin.ClientInstanceName = FieldName + VisibleIndex.ToString();

                if (CellValue.ToString() != "")
                    spin.Value = Convert.ToDecimal(CellValue);
                else
                    spin.Value = 0;
            }
        }

        void FormDeleteLink(int VisibleIndex, string FieldName)
        {
            ASPxHyperLink link = (ASPxHyperLink)GridMissingItems.FindRowCellTemplateControl(VisibleIndex, GridMissingItems.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (link != null)
            {
                string LKMI_AssetInvUniqueId = GridMissingItems.GetRowValues(VisibleIndex,"LKMI_AssetInvUniqueId").ToString();
                string AssetInvRegNumber = GridMissingItems.GetRowValues(VisibleIndex,"AssetInvRegNumber").ToString();
                link.ClientInstanceName = FieldName + VisibleIndex.ToString();
                link.NavigateUrl = "javascript: RemoveItem('" + LKMI_AssetInvUniqueId + "','" + AssetInvRegNumber + "');";                
            }
        }

        protected void cbp_CheckWf_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                string WfCountz = string.Empty;
                LaporanKehilanganMethods.SP_LaporanKerosakan_CheckWorkflow(LKH_Status.Text, ticket.Name, ref WfCountz, LKH_ProcessId.Text, LKH_RevNumber.Text);
                WfCount.Text = WfCountz;
                cbp_CheckWf.JSProperties["cpErrMsg"] = string.Empty;
            }
            else
                cbp_CheckWf.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        protected void GridSearchAssetInv_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearchAssetInv.DataBind();
        }

        protected void cbp_GetMissingItemDt_Callback(object sender, CallbackEventArgsBase e)
        {
            DataTable Dt = new DataTable();

            try
            {
                if (Session["MissingItemDt"] != null)
                    Session.Remove("MissingItemDt");

                FormDetailTVP(ref Dt);
                PopulateDetailTVP(ref Dt);
                TrimDetailTVP(ref Dt);
                Session["MissingItemDt"] = Dt;
                cbp_GetMissingItemDt.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_GetMissingItemDt.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }
    }
}