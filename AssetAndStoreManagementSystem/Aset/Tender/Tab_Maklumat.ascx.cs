using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using System.Data;
using DevExpress.Web;
using Core.Aset.Tender;

namespace AssetAndStoreManagementSystem.Aset.Tender
{
    public partial class Tab_Maklumat : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridList_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "TD_AssetInvUniqueId")
            {
                ASPxHyperLink TD_AssetInvUniqueId = (ASPxHyperLink)GridList.FindRowCellTemplateControl(e.VisibleIndex, GridList.DataColumns["TD_AssetInvUniqueId"] as GridViewDataColumn, "TD_AssetInvUniqueId");

                if (TD_AssetInvUniqueId != null)
                {
                    string AIRMI_Desc = GridList.GetRowValues(e.VisibleIndex, "AIRMI_Desc").ToString();
                    TD_AssetInvUniqueId.ClientInstanceName = "TD_AssetInvUniqueId" + e.VisibleIndex.ToString();
                    TD_AssetInvUniqueId.NavigateUrl = "javascript: RemoveAssetInv('" + e.CellValue.ToString() + "','" + AIRMI_Desc + "');";
                }
            }
        }

        protected void cbp_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                cbp.JSProperties["cpMode"] = e.Parameter;

                switch (e.Parameter)
                {
                    case "DELETEITEM": DeleteItemMode(); break;
                    case "ITEMSELECTED": ItemSelectedMode(); break;
                    case "LOAD": LoadMode(); break;
                    case "ADD": AddMode(); break;
                    case "SAVE": SaveDeleteMode(ticket.Name, 1); break;
                    case "DELETE": SaveDeleteMode(ticket.Name, 2); break;
                    case "CANCEL": CancelMode(); break;
                }
            }
            else
            {
                GridList.JSProperties["cpErrMsg"] = "Session Expired.";
            }
        }

        void DeleteItemMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormItemTVP(ref Dt);
                PopulateItemTVP(ref Dt);

                DataRow[] drs = Dt.Select("TD_AssetInvUniqueId = '" + TempDeleteAssetInv.Text + "'");

                if (drs.Length == 1)
                    Dt.Rows.Remove(drs[0]);

                BindGridList(ref Dt);
                cbp.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void ItemSelectedMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormItemTVP(ref Dt);

                for (int i = 0; i < GridSearchAssetInv.VisibleRowCount; i++)
                {
                    if (GridSearchAssetInv.Selection.IsRowSelected(i))
                    {
                        DataRow Dr = Dt.NewRow();
                        Dr["Reg_Number"] = GridSearchAssetInv.GetRowValues(i, "AssInvRegNum").ToString();
                        Dr["AIRMI_Desc"] = GridSearchAssetInv.GetRowValues(i, "AssInvDesc").ToString();
                        Dr["AIRMI_Brand"] = GridSearchAssetInv.GetRowValues(i, "AIRMI_Brand").ToString();
                        Dr["AIRMI_ReceivedDate"] = GridSearchAssetInv.GetRowValues(i, "AIRMI_ReceivedDate");
                        Dr["TD_ProcessId"] = TH_ProcessID.Text;
                        Dr["TD_AssetInvUniqueId"] = GridSearchAssetInv.GetRowValues(i, "AssInvUniqueId").ToString();
                        Dr["TD_AssetInvType"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(i, "AssetInvType"));
                        Dt.Rows.Add(Dr);
                    }
                }

                BindGridList(ref Dt);
                cbp.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void LoadMode()
        {
            DataSet Ds = new DataSet();
            DataTable Dt = new DataTable();

            try
            {
                string err = TenderMethods.SP_Tender_FindRecord(TH_ProcessID.Text, ref Ds);

                if (err == "")
                {
                    if (Ds.Tables.Count == 2)
                    {
                        if (Ds.Tables[0].Rows.Count == 1)
                        {
                            //Grid Listing
                            Dt = Ds.Tables[1].Copy();
                            BindGridList(ref Dt);

                            //form header
                            TH_NoTender.Text = Ds.Tables[0].Rows[0]["TH_NoTender"].ToString();
                            TH_StartDate.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["TH_StartDate"]);
                            TH_EndDate.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["TH_EndDate"]);
                            TH_ReservedPrice.Value = Convert.ToDecimal(Ds.Tables[0].Rows[0]["TH_ReservedPrice"]);
                            TH_DocumentPrice.Value = Convert.ToDecimal(Ds.Tables[0].Rows[0]["TH_DocumentPrice"]);
                            TH_Address.Text = Ds.Tables[0].Rows[0]["TH_Address"].ToString();

                            cbp.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        {
                            cbp.JSProperties["cpErrMsg"] = "Sistem tidak dapat membuka maklumat Tawaran Sebutharga yang dipilih (TABLE 1 MULTIPLE ROWS).";
                        }
                    }
                    else
                    {
                        cbp.JSProperties["cpErrMsg"] = "Sistem tidak dapat membuka maklumat Tawaran Sebutharga yang dipilih (TABLE COUNT <> 2).";
                    }
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); Ds.Dispose(); }
        }

        void AddMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                //Grid Listing
                FormItemTVP(ref Dt);
                BindGridList(ref Dt);

                //form header
                TH_ProcessID.Text = "";
                TH_NoTender.Text = "";
                TH_StartDate.Value = DBNull.Value;
                TH_EndDate.Value = DBNull.Value;
                TH_ReservedPrice.Value = 0;
                TH_DocumentPrice.Value = 0;
                TH_Address.Text = "";

                cbp.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void CancelMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                //Grid Listing
                FormItemTVP(ref Dt);
                BindGridList(ref Dt);

                //form header
                TH_ProcessID.Text = "";
                TH_NoTender.Text = "";
                TH_StartDate.Value = DBNull.Value;
                TH_EndDate.Value = DBNull.Value;
                TH_ReservedPrice.Value = 0;
                TH_DocumentPrice.Value = 0;
                TH_Address.Text = "";

                cbp.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void SaveDeleteMode(string CurrUser, int Mode)
        {
            DataTable DtHeader = new DataTable();
            DataTable DtDetail = new DataTable();

            try
            {
                if (Mode == 1)
                {
                    FormHeaderTVP(ref DtHeader);
                    PopulateHeaderTVP(ref DtHeader);
                    FormItemTVP(ref DtDetail);
                    PopulateItemTVP(ref DtDetail);
                }
                else
                {
                    FormHeaderTVP(ref DtHeader);
                    FormItemTVP(ref DtDetail);

                    DataRow Dr = DtHeader.NewRow();
                    Dr["TH_ProcessID"] = TH_ProcessID.Text;
                    DtHeader.Rows.Add(Dr);
                    DtHeader.AcceptChanges();
                }

                TrimDetailTVP(ref DtDetail);

                string err = TenderMethods.SP_Tender_SaveDelete(ref DtHeader, ref DtDetail, CurrUser, Mode);

                if (err == string.Empty)
                {
                    if (Mode == 2)
                    {
                        BindGridList(ref DtDetail);
                        TH_ProcessID.Text = "";
                        TH_NoTender.Text = "";
                        TH_StartDate.Value = DBNull.Value;
                        TH_EndDate.Value = DBNull.Value;
                        TH_ReservedPrice.Value = 0;
                        TH_DocumentPrice.Value = 0;
                        TH_Address.Text = "";
                        cbp.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        if (TH_ProcessID.Text == "")
                        {
                            string ProcessId = string.Empty;
                            TenderMethods.GetProcessId(ref ProcessId, TH_NoTender.Text.Trim());
                            TH_ProcessID.Text = ProcessId;
                        }
                        cbp.JSProperties["cpErrMsg"] = string.Empty;
                    }
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DtHeader.Dispose(); DtDetail.Dispose(); }
        }

        void FormHeaderTVP(ref DataTable Dt)
        {
            DataColumn TH_ProcessID = Dt.Columns.Add("TH_ProcessID", typeof(String));
            DataColumn TH_NoTender = Dt.Columns.Add("TH_NoTender", typeof(String));
            DataColumn TH_StartDate = Dt.Columns.Add("TH_StartDate", typeof(DateTime));
            DataColumn TH_EndDate = Dt.Columns.Add("TH_EndDate", typeof(DateTime));
            DataColumn TH_ReservedPrice = Dt.Columns.Add("TH_ReservedPrice", typeof(Decimal));
            DataColumn TH_DocumentPrice = Dt.Columns.Add("TH_DocumentPrice", typeof(Decimal));
            DataColumn TH_RefNumber = Dt.Columns.Add("TH_RefNumber", typeof(String));
            DataColumn TH_Address = Dt.Columns.Add("TH_Address", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateHeaderTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (TH_ProcessID.Text == "")
                Dr["TH_ProcessID"] = DBNull.Value;
            else
                Dr["TH_ProcessID"] = TH_ProcessID.Text;

            Dr["TH_NoTender"] = TH_NoTender.Text.Trim();
            Dr["TH_StartDate"] = TH_StartDate.Date;
            Dr["TH_EndDate"] = TH_EndDate.Date;
            Dr["TH_ReservedPrice"] = Convert.ToDecimal(TH_ReservedPrice.Value);
            Dr["TH_DocumentPrice"] = Convert.ToDecimal(TH_DocumentPrice.Value);
            Dr["TH_RefNumber"] = DBNull.Value;
            Dr["TH_Address"] = TH_Address.Text.Trim();
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void FormItemTVP(ref DataTable Dt)
        {
            DataColumn Reg_Number = Dt.Columns.Add("Reg_Number", typeof(String));
            DataColumn AIRMI_Desc = Dt.Columns.Add("AIRMI_Desc", typeof(String));
            DataColumn AIRMI_Brand = Dt.Columns.Add("AIRMI_Brand", typeof(String));
            DataColumn AIRMI_ReceivedDate = Dt.Columns.Add("AIRMI_ReceivedDate", typeof(DateTime));
            DataColumn TD_ProcessId = Dt.Columns.Add("TD_ProcessId", typeof(String));
            DataColumn TD_AssetInvUniqueId = Dt.Columns.Add("TD_AssetInvUniqueId", typeof(String));
            DataColumn TD_AssetInvType = Dt.Columns.Add("TD_AssetInvType", typeof(Int32));
            Dt.AcceptChanges();
        }

        void PopulateItemTVP(ref DataTable Dt)
        {
            for (int i = 0; i < GridList.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dt.Rows.Add(Dr);
                Dr["Reg_Number"] = GridList.GetRowValues(i, "Reg_Number").ToString();
                Dr["AIRMI_Desc"] = GridList.GetRowValues(i, "AIRMI_Desc").ToString();
                Dr["AIRMI_Brand"] = GridList.GetRowValues(i, "AIRMI_Brand").ToString();
                Dr["AIRMI_ReceivedDate"] = GridList.GetRowValues(i, "AIRMI_ReceivedDate");

                if (TH_ProcessID.Text == "")
                    Dr["TD_ProcessId"] = DBNull.Value;
                else
                    Dr["TD_ProcessId"] = TH_ProcessID.Text;

                Dr["TD_AssetInvUniqueId"] = GridList.GetRowValues(i, "TD_AssetInvUniqueId").ToString();
                Dr["TD_AssetInvType"] = Convert.ToInt32(GridList.GetRowValues(i, "TD_AssetInvType"));
            }

            Dt.AcceptChanges();
        }

        void BindGridList(ref DataTable Dt)
        {
            GridList.DataSource = Dt;
            GridList.KeyFieldName = "TD_AssetInvUniqueId";
            GridList.DataBind();
        }

        protected void GridSearchAssetInv_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearchAssetInv.DataBind();
        }

        void TrimDetailTVP(ref DataTable Dt)
        {
            Dt.Columns.Remove("Reg_Number");
            Dt.Columns.Remove("AIRMI_Desc");
            Dt.Columns.Remove("AIRMI_Brand");
            Dt.Columns.Remove("AIRMI_ReceivedDate");
        }

        protected void GridSearchAssetInv_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            if (e.CallbackName == "CUSTOMCALLBACK")
            {
                if (GridList.VisibleRowCount > 0)
                {
                    DataTable Dt = new DataTable();
                    DataColumn PD_AssetInvUniqueId = Dt.Columns.Add("PD_AssetInvUniqueId", typeof(String));
                    Dt.AcceptChanges();

                    for (int i = 0; i < GridList.VisibleRowCount; i++)
                    {
                        DataRow Dr = Dt.NewRow();
                        Dr["PD_AssetInvUniqueId"] = GridList.GetRowValues(i, "TD_AssetInvUniqueId").ToString();
                        Dt.Rows.Add(Dr);
                    }

                    Dt.AcceptChanges();

                    string AssetInvUniqueId = string.Empty;

                    for (int x = 0; x < Dt.Rows.Count; x++)
                    {
                        AssetInvUniqueId = Dt.Rows[x]["PD_AssetInvUniqueId"].ToString();

                        for (int y = 0; y < GridSearchAssetInv.VisibleRowCount; y++)
                        {
                            if (GridSearchAssetInv.GetRowValues(y, "AssInvUniqueId").ToString() == AssetInvUniqueId)
                            {
                                GridSearchAssetInv.Selection.SelectRow(y);
                            }
                        }
                    }
                }
                else
                    GridSearchAssetInv.Selection.UnselectAll();
            }
        }
    }
}