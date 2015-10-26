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
using Core.Aset.Lelong;

namespace AssetAndStoreManagementSystem.Aset.Lelong
{
    public partial class Tab_Maklumat : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridList_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "KLD_AssetInvUniqueId")
            {
                ASPxHyperLink KLD_AssetInvUniqueId = (ASPxHyperLink)GridList.FindRowCellTemplateControl(e.VisibleIndex, GridList.DataColumns["KLD_AssetInvUniqueId"] as GridViewDataColumn, "KLD_AssetInvUniqueId");

                if (KLD_AssetInvUniqueId != null)
                {
                    string AIRMI_Desc = GridList.GetRowValues(e.VisibleIndex, "AIRMI_Desc").ToString();
                    KLD_AssetInvUniqueId.ClientInstanceName = "KLD_AssetInvUniqueId" + e.VisibleIndex.ToString();
                    KLD_AssetInvUniqueId.NavigateUrl = "javascript: RemoveAssetInv('" + e.CellValue.ToString() + "','" + AIRMI_Desc + "');";
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

                DataRow[] drs = Dt.Select("KLD_AssetInvUniqueId = '" + TempDeleteAssetInv.Text + "'");

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
                        //Dr["AIRMI_ReceivedDate"] = Convert.ToDateTime(GridSearchAssetInv.GetRowValues(i, "AIRMI_ReceivedDate"));
                        Dr["AIRMI_ReceivedDate"] = GridSearchAssetInv.GetRowValues(i, "AIRMI_ReceivedDate");
                        Dr["KLD_ProcessId"] = KLH_ProcessID.Text;
                        Dr["KLD_AssetInvUniqueId"] = GridSearchAssetInv.GetRowValues(i, "AssInvUniqueId").ToString();
                        Dr["KLD_AssetInvType"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(i, "AssetInvType"));
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
                string err = LelongMethods.SP_KenyataanLelong_FindRecord(KLH_ProcessID.Text, ref Ds);

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
                           KLH_NoLelongan.Text = Ds.Tables[0].Rows[0]["KLH_NoLelongan"].ToString();
                           KLH_AuctionDate.Value = Convert.ToDateTime(Ds.Tables[0].Rows[0]["KLH_AuctionDate"]);
                           KLH_AuctionLocation.Text = Ds.Tables[0].Rows[0]["KLH_AuctionLocation"].ToString();
                           KLH_ViewStartDate.Value = Convert.ToDateTime(Ds.Tables[0].Rows[0]["KLH_ViewStartDate"]);
                           KLH_ViewEndDate.Value = Convert.ToDateTime(Ds.Tables[0].Rows[0]["KLH_ViewEndDate"]);
                           KLH_ViewLocation.Text = Ds.Tables[0].Rows[0]["KLH_ViewLocation"].ToString();
                           KLH_ReservedPrice.Value = Convert.ToDecimal(Ds.Tables[0].Rows[0]["KLH_ReservedPrice"]);

                            cbp.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        {
                            cbp.JSProperties["cpErrMsg"] = "Sistem tidak dapat membuka maklumat Kenyataan Lelong yang dipilih (TABLE 1 MULTIPLE ROWS).";
                        }
                    }
                    else
                    {
                        cbp.JSProperties["cpErrMsg"] = "Sistem tidak dapat membuka maklumat Kenyataan Lelong yang dipilih (TABLE COUNT <> 2).";
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
               KLH_ProcessID.Text = "";
               KLH_NoLelongan.Text = "";
               KLH_AuctionDate.Value = DBNull.Value;
               KLH_AuctionLocation.Text = "";
               KLH_ViewStartDate.Value = DBNull.Value;
               KLH_ViewEndDate.Value = DBNull.Value;
               KLH_ViewLocation.Text = "";
               KLH_ReservedPrice.Value = 0;

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
                KLH_ProcessID.Text = "";
                KLH_NoLelongan.Text = "";
                KLH_AuctionDate.Value = DBNull.Value;
                KLH_AuctionLocation.Text = "";
                KLH_ViewStartDate.Value = DBNull.Value;
                KLH_ViewEndDate.Value = DBNull.Value;
                KLH_ViewLocation.Text = "";
                KLH_ReservedPrice.Value = 0;

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
                    Dr["KLH_ProcessID"] = KLH_ProcessID.Text;
                    DtHeader.Rows.Add(Dr);
                    DtHeader.AcceptChanges();
                }

                TrimDetailTVP(ref DtDetail);

                string err = LelongMethods.SP_KenyataanLelong_SaveDelete(ref DtHeader, ref DtDetail, CurrUser, Mode);

                if (err == string.Empty)
                {
                    if (Mode == 2)
                    {
                        BindGridList(ref DtDetail);
                        KLH_ProcessID.Text = "";
                        KLH_NoLelongan.Text = "";
                        KLH_AuctionDate.Value = DBNull.Value;
                        KLH_AuctionLocation.Text = "";
                        KLH_ViewStartDate.Value = DBNull.Value;
                        KLH_ViewEndDate.Value = DBNull.Value;
                        KLH_ViewLocation.Text = "";
                        KLH_ReservedPrice.Value = 0;
                        cbp.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        if (KLH_ProcessID.Text == "")
                        {
                            string ProcessId = string.Empty;
                            LelongMethods.GetProcessId(ref ProcessId, KLH_NoLelongan.Text.Trim());
                            KLH_ProcessID.Text = ProcessId;
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
            DataColumn KLH_ProcessID = Dt.Columns.Add("KLH_ProcessID", typeof(String));
            DataColumn KLH_NoLelongan = Dt.Columns.Add("KLH_NoLelongan", typeof(String));
            DataColumn KLH_AuctionDate = Dt.Columns.Add("KLH_AuctionDate", typeof(DateTime));
            DataColumn KLH_AuctionLocation = Dt.Columns.Add("KLH_AuctionLocation", typeof(String));
            DataColumn KLH_ViewStartDate = Dt.Columns.Add("KLH_ViewStartDate", typeof(DateTime));
            DataColumn KLH_ViewEndDate = Dt.Columns.Add("KLH_ViewEndDate", typeof(DateTime));
            DataColumn KLH_ViewLocation = Dt.Columns.Add("KLH_ViewLocation", typeof(String));
            DataColumn KLH_ReservedPrice = Dt.Columns.Add("KLH_ReservedPrice", typeof(Decimal));
            DataColumn KLH_RefNumber = Dt.Columns.Add("KLH_RefNumber", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateHeaderTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (KLH_ProcessID.Text == "")
                Dr["KLH_ProcessID"] = DBNull.Value;
            else
                Dr["KLH_ProcessID"] = KLH_ProcessID.Text;

            Dr["KLH_NoLelongan"] = KLH_NoLelongan.Text.Trim();
            Dr["KLH_AuctionDate"] = Convert.ToDateTime(KLH_AuctionDate.Value);
            Dr["KLH_AuctionLocation"] = KLH_AuctionLocation.Text.Trim();
            Dr["KLH_ViewStartDate"] = Convert.ToDateTime(KLH_ViewStartDate.Value);
            Dr["KLH_ViewEndDate"] = Convert.ToDateTime(KLH_ViewEndDate.Value);
            Dr["KLH_ViewLocation"] = KLH_ViewLocation.Text.Trim();
            Dr["KLH_ReservedPrice"] = Convert.ToDecimal(KLH_ReservedPrice.Value);
            Dr["KLH_RefNumber"] = DBNull.Value;
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void FormItemTVP(ref DataTable Dt)
        {
            DataColumn Reg_Number = Dt.Columns.Add("Reg_Number", typeof(String));
            DataColumn AIRMI_Desc = Dt.Columns.Add("AIRMI_Desc", typeof(String));
            DataColumn AIRMI_Brand = Dt.Columns.Add("AIRMI_Brand", typeof(String));
            DataColumn AIRMI_ReceivedDate = Dt.Columns.Add("AIRMI_ReceivedDate", typeof(DateTime));
            DataColumn KLD_ProcessId = Dt.Columns.Add("KLD_ProcessId", typeof(String));
            DataColumn KLD_AssetInvUniqueId = Dt.Columns.Add("KLD_AssetInvUniqueId", typeof(String));
            DataColumn KLD_AssetInvType = Dt.Columns.Add("KLD_AssetInvType", typeof(Int32));
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
                Dr["AIRMI_ReceivedDate"] = (GridList.GetRowValues(i, "AIRMI_ReceivedDate"));

                if (KLH_ProcessID.Text == "")
                    Dr["KLD_ProcessId"] = DBNull.Value;
                else
                    Dr["KLD_ProcessId"] = KLH_ProcessID.Text;

                Dr["KLD_AssetInvUniqueId"] = GridList.GetRowValues(i, "KLD_AssetInvUniqueId").ToString();
                Dr["KLD_AssetInvType"] = Convert.ToInt32(GridList.GetRowValues(i, "KLD_AssetInvType"));
            }

            Dt.AcceptChanges();
        }

        void BindGridList(ref DataTable Dt)
        {
            GridList.DataSource = Dt;
            GridList.KeyFieldName = "KLD_AssetInvUniqueId";
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
                        Dr["PD_AssetInvUniqueId"] = GridList.GetRowValues(i, "KLD_AssetInvUniqueId").ToString();
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