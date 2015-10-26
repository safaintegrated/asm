using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using Core.PengurusanSistem;
using Core.SagaInterface.Informix;
using Core.Utility;
using DevExpress.Web;
using Core.Common;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Pembekal
{
    public partial class Pembekal_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ManageMainRibbon();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }     
        }

        void ManageMainRibbon()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();
                CommonMethods.SP_Common_GetUserGroupRights(ticket.Name, 38, ref Dt);

                if (Dt.Rows.Count == 1)
                {
                    EnableCreate.Text = Dt.Rows[0]["EnableCreate"].ToString();
                    EnableUpdate.Text = Dt.Rows[0]["EnableUpdate"].ToString();
                    EnableDelete.Text = Dt.Rows[0]["EnableDelete"].ToString();
                }
            }
        }

        protected void MainGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            MainGrid.DataBind();
        }

        protected void MainGrid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "apsu_suppid")
            {
                ASPxHyperLink apsu_suppid = (ASPxHyperLink)MainGrid.FindRowCellTemplateControl(e.VisibleIndex, MainGrid.DataColumns["apsu_suppid"] as GridViewDataColumn, "apsu_suppid");

                if (apsu_suppid != null)
                {
                    apsu_suppid.ClientInstanceName = "apsu_suppid" + e.VisibleIndex.ToString();
                    apsu_suppid.Text = e.CellValue.ToString();
                    apsu_suppid.NavigateUrl = "javascript: ViewVendor('"+e.CellValue.ToString() +"');";
                }
            }
        }

        protected void cbp_PopupVendor_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_PopupVendor.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "LOAD": LoadMode(); break;
                case "ADDCODE": AddCodeMode(); break;
                case "REMOVECODE": RemoveCodeMode(); break;
                case "SAVE": SaveMode(); break;
                   
            }
        }

        void LoadMode()
        {
            DataSet Ds = new DataSet();
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = PembekalMethods.LoadVendor(ref Ds,apsu_suppid.Text.Trim());

                if(DbErr == string.Empty)
                {
                    if (Ds.Tables.Count == 2)
                    {

                        if (Ds.Tables[0].Rows.Count == 1)
                        {
                            Dt = Ds.Tables[1].Copy();

                            apsu_suppid.Text = Ds.Tables[0].Rows[0]["apsu_suppid"].ToString();
                            apsu_lname.Text = Ds.Tables[0].Rows[0]["apsu_lname"].ToString();
                            CombinedAddress.Text = Ds.Tables[0].Rows[0]["CombinedAddress"].ToString();
                            apsu_phone.Text = Ds.Tables[0].Rows[0]["apsu_phone"].ToString();
                            apsu_fax.Text = Ds.Tables[0].Rows[0]["apsu_fax"].ToString();
                            apsu_contact.Text = Ds.Tables[0].Rows[0]["apsu_contact"].ToString();
                            apsu_vatregno.Text = Ds.Tables[0].Rows[0]["apsu_vatregno"].ToString();
                            CertNumber.Text = Ds.Tables[0].Rows[0]["CertNumber"].ToString();
                            RegReference.Text = Ds.Tables[0].Rows[0]["RegReference"].ToString();

                            if (Ds.Tables[0].Rows[0]["StartDate"].ToString() != "")
                                StartDate.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["StartDate"]);
                            else
                                StartDate.Value = null;

                            if (Ds.Tables[0].Rows[0]["EndDate"].ToString() != "")
                                EndDate.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["EndDate"]);
                            else
                                EndDate.Value = null;

                            if (Ds.Tables[0].Rows[0]["BumiStatus"].ToString() != "")
                                BumiStatus.Checked = Convert.ToBoolean(Ds.Tables[0].Rows[0]["BumiStatus"]);
                            else
                                BumiStatus.Checked = false;

                            BindKodBidangGrid(ref Dt);

                            cbp_PopupVendor.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        { cbp_PopupVendor.JSProperties["cpErrMsg"] = "NO ROW FOUND."; }
                    }
                    else
                    { cbp_PopupVendor.JSProperties["cpErrMsg"] = "INSUFFICIENT NUMBER OF DATATABLES."; }
                }
                else
                { cbp_PopupVendor.JSProperties["cpErrMsg"] = DbErr; }
            }
            catch (Exception err)
            { cbp_PopupVendor.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Ds.Dispose(); Dt.Dispose();}
        }

        void BindKodBidangGrid(ref DataTable Dt)
        {
            GridKodBidang.DataSource = Dt;
            GridKodBidang.KeyFieldName = "ItemCode";
            GridKodBidang.DataBind();
        }

        void AddCodeMode()
        {
            DataTable Dt = new DataTable();
            FormKodBidangTVP(ref Dt);

            try
            {
                for (int x = 0; x < GridLookupKodBidang.VisibleRowCount; x++)
                {
                    object key = GridLookupKodBidang.GetRowValues(x, GridLookupKodBidang.KeyFieldName);

                    if (GridLookupKodBidang.Selection.IsRowSelectedByKey(key))
                    {
                        DataRow Dr = Dt.NewRow();
                        Dr["SetVen_SAGACode"] = apsu_suppid.Text;
                        Dr["Item"] = GridLookupKodBidang.GetRowValues(x, "Item").ToString();
                        Dr["ItemCode"] = GridLookupKodBidang.GetRowValues(x, "ItemCode").ToString();
                        Dt.Rows.Add(Dr);
                    }
                }

                Dt.AcceptChanges();
                BindKodBidangGrid(ref Dt);

                cbp_PopupVendor.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            { cbp_PopupVendor.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose();}
            
        }

        void RemoveCodeMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormKodBidangTVP(ref Dt);
                PopulateKodBidangFromVendorGrid(ref Dt);

                DataRow[] Drs = Dt.Select("ItemCode = '" + tmpCode.Text + "'");

                if (Drs.Length == 1)
                    Dt.Rows.Remove(Drs[0]);

                Dt.AcceptChanges();
                BindKodBidangGrid(ref Dt);

                cbp_PopupVendor.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            { cbp_PopupVendor.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose(); }
        }

        void SaveMode()
        {
             FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if(!ticket.Expired)
            {
                DataTable TVP_AP_Supplier = new DataTable();
                DataTable TVP_VendorKodBidang = new DataTable();

                try
                {
                    FormTVP_AP_SupplierForUpdate(ref TVP_AP_Supplier);
                    PopulateTVP_AP_SupplierForUpdate(ref TVP_AP_Supplier);
                    FormTVP_VendorKodBidang(ref TVP_VendorKodBidang);
                    PopulateTVP_VendorKodBidang(ref TVP_VendorKodBidang);
                    cbp_PopupVendor.JSProperties["cpErrMsg"] = PembekalMethods.AP_Supplier_Update(ref TVP_AP_Supplier, ref TVP_VendorKodBidang, ticket.Name);
                }
                catch(Exception err)
                {
                    cbp_PopupVendor.JSProperties["cpErrMsg"] = err.Message;
                }
                finally
                { TVP_AP_Supplier.Dispose(); TVP_VendorKodBidang.Dispose();}
            }
            else
            { cbp_PopupVendor.JSProperties["cpErrMsg"] = "Session Expired."; }
        }

        protected void GridLookupKodBidang_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridLookupKodBidang.DataBind();
        }

        protected void GridLookupKodBidang_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            if (e.CallbackName == "CUSTOMCALLBACK")
            {
                GridLookupKodBidang.Selection.UnselectAll();

                if (GridKodBidang.VisibleRowCount > 0)
                {
                    DataTable Dt = new DataTable();
                    FormKodBidangTVP(ref Dt);
                    PopulateKodBidangFromVendorGrid(ref Dt);

                    for (int i = 0; i < Dt.Rows.Count; i++)
                    {
                        for (int y = 0; y < GridLookupKodBidang.VisibleRowCount; y++)
                        {
                            if (GridLookupKodBidang.GetRowValues(y, "ItemCode").ToString() == Dt.Rows[i]["ItemCode"].ToString())
                                GridLookupKodBidang.Selection.SelectRow(y);
                        }
                    }

                    Dt.Dispose();
                }
            }
        }

        void FormKodBidangTVP(ref DataTable Dt)
        {
            DataColumn SetVen_SAGACode = Dt.Columns.Add("SetVen_SAGACode",typeof(String));
            DataColumn Item = Dt.Columns.Add("Item",typeof(String));
            DataColumn ItemCode = Dt.Columns.Add("ItemCode",typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateKodBidangFromVendorGrid(ref DataTable Dt)
        {
            for (int i = 0; i < GridKodBidang.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["SetVen_SAGACode"] = apsu_suppid.Text;
                Dr["Item"] = GridKodBidang.GetRowValues(i, "Item").ToString();
                Dr["ItemCode"] = GridKodBidang.GetRowValues(i, "ItemCode").ToString();
                Dt.Rows.Add(Dr);
            }

            Dt.AcceptChanges();
        }

        protected void GridKodBidang_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.Caption == "Padam")
            {
                ASPxHyperLink ItemCode = (ASPxHyperLink)GridKodBidang.FindRowCellTemplateControl(e.VisibleIndex, GridKodBidang.DataColumns["Padam"] as GridViewDataColumn, "ItemCode");

                if (ItemCode != null)
                {
                    ItemCode.ClientInstanceName = "ItemCode" + e.VisibleIndex.ToString();
                    ItemCode.NavigateUrl = "javascript: DeleteCode('"+ e.CellValue.ToString() +"');";
                }
            }
        }

        void FormTVP_AP_SupplierForUpdate(ref DataTable Dt)
        {
            DataColumn apsu_suppid = Dt.Columns.Add("apsu_suppid", typeof(String));
            DataColumn CertNumber = Dt.Columns.Add("CertNumber", typeof(String));
            DataColumn RegReference = Dt.Columns.Add("RegReference", typeof(String));
            DataColumn StartDate = Dt.Columns.Add("StartDate", typeof(DateTime));
            DataColumn EndDate = Dt.Columns.Add("EndDate", typeof(DateTime));
            DataColumn BumiStatus = Dt.Columns.Add("BumiStatus", typeof(Boolean));
            Dt.AcceptChanges();
        }

        void PopulateTVP_AP_SupplierForUpdate(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["apsu_suppid"] = apsu_suppid.Text;

            if (CertNumber.Text != string.Empty)
                Dr["CertNumber"] = CertNumber.Text.Trim();
            else
                Dr["CertNumber"] = DBNull.Value;

            if (RegReference.Text != string.Empty)
                Dr["RegReference"] = RegReference.Text.Trim();
            else
                Dr["RegReference"] = DBNull.Value;

            if (StartDate.Text != string.Empty)
                Dr["StartDate"] = StartDate.Date;
            else
                Dr["StartDate"] = DBNull.Value;

            if (EndDate.Text != string.Empty)
                Dr["EndDate"] = EndDate.Date;
            else
                Dr["EndDate"] = DBNull.Value;

            Dr["BumiStatus"] = BumiStatus.Checked;

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void FormTVP_VendorKodBidang(ref DataTable Dt)
        {
            DataColumn SetVen_SAGACode = Dt.Columns.Add("SetVen_SAGACode", typeof(String));
            DataColumn ItemCode = Dt.Columns.Add("ItemCode", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTVP_VendorKodBidang(ref DataTable Dt)
        {
            for (int i = 0; i < GridKodBidang.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["SetVen_SAGACode"] = apsu_suppid.Text;
                Dr["ItemCode"] = GridKodBidang.GetRowValues(i,"ItemCode").ToString();
                Dt.Rows.Add(Dr);
            }

            Dt.AcceptChanges();
        }

        protected void cbp_Report_Callback(object sender, CallbackEventArgsBase e)
        {
            if (MainGrid.DataColumns["apsu_lname"].FilterExpression.ToString() != string.Empty)
            {
                string[] F_apsu_lname = MainGrid.DataColumns["apsu_lname"].FilterExpression.ToString().Split(',');
                string CleanApsuLnameFilter = F_apsu_lname[1].Replace("'", "");
                CleanApsuLnameFilter = CleanApsuLnameFilter.Replace(")", "");
                CleanApsuLnameFilter = CleanApsuLnameFilter.TrimEnd();
                CleanApsuLnameFilter = CleanApsuLnameFilter.TrimStart();
                Session["apsu_lname"] = CleanApsuLnameFilter;
            }
            else
            {
                Session.Remove("apsu_lname");
            }

            if (MainGrid.DataColumns["apsu_phone"].FilterExpression.ToString() != string.Empty)
            {
                string[] F_apsu_phone = MainGrid.DataColumns["apsu_phone"].FilterExpression.ToString().Split(',');
                string CleanApsu_PhoneFilter = F_apsu_phone[1].Replace("'", "");
                CleanApsu_PhoneFilter = CleanApsu_PhoneFilter.Replace(")", "");
                CleanApsu_PhoneFilter = CleanApsu_PhoneFilter.TrimEnd();
                CleanApsu_PhoneFilter = CleanApsu_PhoneFilter.TrimStart();
                Session["apsu_phone"] = CleanApsu_PhoneFilter;
            }

            if (MainGrid.DataColumns["apsu_fax"].FilterExpression.ToString() != string.Empty)
            {
                string[] F_apsu_fax = MainGrid.DataColumns["apsu_fax"].FilterExpression.ToString().Split(',');
                string CleanApsu_FaxFilter = F_apsu_fax[1].Replace("'", "");
                CleanApsu_FaxFilter = CleanApsu_FaxFilter.Replace(")", "");
                CleanApsu_FaxFilter = CleanApsu_FaxFilter.TrimEnd();
                CleanApsu_FaxFilter = CleanApsu_FaxFilter.TrimStart();
                Session["apsu_fax"] = CleanApsu_FaxFilter;
            }

            if (MainGrid.DataColumns["apsu_email"].FilterExpression.ToString() != string.Empty)
            {
                string[] F_apsu_email = MainGrid.DataColumns["apsu_email"].FilterExpression.ToString().Split(',');
                string CleanApsu_EmailFilter = F_apsu_email[1].Replace("'", "");
                CleanApsu_EmailFilter = CleanApsu_EmailFilter.Replace(")", "");
                CleanApsu_EmailFilter = CleanApsu_EmailFilter.TrimEnd();
                CleanApsu_EmailFilter = CleanApsu_EmailFilter.TrimStart();
                Session["apsu_email"] = CleanApsu_EmailFilter;
            }

            if (MainGrid.DataColumns["apsu_contact"].FilterExpression.ToString() != string.Empty)
            {
                string[] F_apsu_contact = MainGrid.DataColumns["apsu_contact"].FilterExpression.ToString().Split(',');
                string CleanApsu_ContactFilter = F_apsu_contact[1].Replace("'", "");
                CleanApsu_ContactFilter = CleanApsu_ContactFilter.Replace(")", "");
                CleanApsu_ContactFilter = CleanApsu_ContactFilter.TrimEnd();
                CleanApsu_ContactFilter = CleanApsu_ContactFilter.TrimStart();
                Session["apsu_contact"] = CleanApsu_ContactFilter;
            }

            if (MainGrid.DataColumns["apsu_vatregno"].FilterExpression.ToString() != string.Empty)
            {
                string[] F_apsu_vatregno = MainGrid.DataColumns["apsu_vatregno"].FilterExpression.ToString().Split(',');
                string CleanApsu_VatregnoFilter = F_apsu_vatregno[1].Replace("'", "");
                CleanApsu_VatregnoFilter = CleanApsu_VatregnoFilter.Replace(")", "");
                CleanApsu_VatregnoFilter = CleanApsu_VatregnoFilter.TrimEnd();
                CleanApsu_VatregnoFilter = CleanApsu_VatregnoFilter.TrimStart();
                Session["apsu_vatregno"] = CleanApsu_VatregnoFilter;
            }

            if (MainGrid.DataColumns["KodBidang"].FilterExpression.ToString() != string.Empty)
            {
                string[] F_KodBidang = MainGrid.DataColumns["KodBidang"].FilterExpression.ToString().Split(',');
                string CleanKodBidangFilter = F_KodBidang[1].Replace("'", "");
                CleanKodBidangFilter = CleanKodBidangFilter.Replace(")", "");
                CleanKodBidangFilter = CleanKodBidangFilter.TrimEnd();
                CleanKodBidangFilter = CleanKodBidangFilter.TrimStart();
                Session["KodBidang"] = CleanKodBidangFilter;
            }

            Session["ReportName"] = "Vendor";
        }

    }
}