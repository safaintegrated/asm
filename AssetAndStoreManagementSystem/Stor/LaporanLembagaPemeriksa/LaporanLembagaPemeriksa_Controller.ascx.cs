﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using DevExpress.Web;
using System.Web.Security;

using Core.PengurusanSistem;
using Core.Shared;
using Core.Email;

namespace AssetAndStoreManagementSystem.Stor.LaporanLembagaPemeriksa
{
    public partial class LaporanLembagaPemeriksa_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoadEvents();", true);
            }
        }

        protected void cbp_LembagaPemeriksa_Callback(object sender, CallbackEventArgsBase e)
        {
            
        }

       

        

        void LembagaPemeriksaDeleteMemberMode()
        {
            DataTable DtDetail = new DataTable();

            try
            {              
                FormDetailTVP(ref DtDetail);
                PopulateDetailTVP(ref DtDetail);

                DataRow[] drs = DtDetail.Select("LPD_EmpId = '" + DeleteMemberTemp.Text + "'");

                if (drs.Length == 1)
                    DtDetail.Rows.Remove(drs[0]);

                DtDetail.AcceptChanges();

                BindLembagaMemberGrid(ref DtDetail);
                cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DtDetail.Dispose(); }
        }

        void LembagaPemeriksaLoadMode()
        {
            DataTable DtHeader = new DataTable();
            DataTable DtDetail = new DataTable();

            try
            {
                if (LPH_UniqueId.Text == "")
                {
                    LPH_UniqueId.Text = "";
                    LPH_RefNumber.Text = "";
                    //LPH_LembagaName.Text = "";
                    //LPH_AssignedPtj.Value = DBNull.Value;
                    //LPH_AssignYear.Value = DBNull.Value;
                    //LPH_StartDate.Value = DBNull.Value;
                   //LPH_EndDate.Value = DBNull.Value;
                    LPH_LastModeBy.Text = "";
                    LPH_LastModeDate.Value = DBNull.Value;
                    LPH_Status.Text = "";
                    StatusText.Text = "";
                    LastModeName.Text = "";

                    DtDetail.Columns.Clear();
                    DtDetail.Clear();

                    FormDetailTVP(ref DtDetail);
                    BindLembagaMemberGrid(ref DtDetail);
                    cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string err = LembagaPemeriksaMethods.V_LembagaPemeriksa_Header(LPH_UniqueId.Text, ref DtHeader);

                    if (err == string.Empty)
                    {
                        if (DtHeader.Rows.Count == 0)
                        {

                        }
                        else
                        {
                            //LPH_UniqueId.Text = DtHeader.Rows[0]["LPH_UniqueId"].ToString();
                            LPH_RefNumber.Text = DtHeader.Rows[0]["LPH_RefNumber"].ToString();
                            //LPH_LembagaName.Text = DtHeader.Rows[0]["LPH_LembagaName"].ToString();
                            //LPH_AssignedPtj.Value = Convert.ToInt32(DtHeader.Rows[0]["LPH_AssignedPtj"]);
                            //LPH_AssignYear.Value = Convert.ToInt32(DtHeader.Rows[0]["LPH_AssignYear"]);
                            //LPH_StartDate.Value = Convert.ToDateTime(DtHeader.Rows[0]["LPH_StartDate"]);
                            //LPH_EndDate.Value = Convert.ToDateTime(DtHeader.Rows[0]["LPH_EndDate"]);
                            LPH_LastModeBy.Text = DtHeader.Rows[0]["LPH_LastModeBy"].ToString();
                            LPH_LastModeDate.Value = Convert.ToDateTime(DtHeader.Rows[0]["LPH_LastModeDate"]);
                            LPH_Status.Text = DtHeader.Rows[0]["LPH_Status"].ToString();
                            StatusText.Text = DtHeader.Rows[0]["StatusText"].ToString();
                            LastModeName.Text = DtHeader.Rows[0]["LastModeName"].ToString();


                            LembagaPemeriksaMethods.V_LembagaPemeriksa_Detail(LPH_UniqueId.Text, ref DtDetail);
                            BindLembagaMemberGrid(ref DtDetail);
                            cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
                        }
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }                
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DtDetail.Dispose(); DtHeader.Dispose(); }
        }

        void LembagaPemeriksaRefresh()
        {
            //DataTable DtHeader = new DataTable();
            //DataTable DtDetail = new DataTable();

            //try
            //{                
            //    string err = LembagaPemeriksaMethods.V_LembagaPemeriksa_Header_Refresh(LPH_LembagaName.Text, ref DtHeader);

            //    if (err == string.Empty)
            //    {
            //        if (DtHeader.Rows.Count == 0)
            //        {

            //        }
            //        else
            //        {
            //            LPH_UniqueId.Text = DtHeader.Rows[0]["LPH_UniqueId"].ToString();
            //            LPH_RefNumber.Text = DtHeader.Rows[0]["LPH_RefNumber"].ToString();                           
            //            LPH_Status.Text = DtHeader.Rows[0]["LPH_Status"].ToString();
            //            StatusText.Text = DtHeader.Rows[0]["StatusText"].ToString();
            //            LastModeName.Text = DtHeader.Rows[0]["LastModeName"].ToString();

            //            FormDetailTVP(ref DtDetail);
            //            PopulateDetailTVP(ref DtDetail);
            //            BindLembagaMemberGrid(ref DtDetail);
            //        }
            //    }
            //    else
            //    {
            //        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
            //        errMsg = errMsg.Replace("BR", "<br><br>");
            //        cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err;
            //    }                
            //}
            //catch (Exception err)
            //{
            //    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
            //    errMsg = errMsg.Replace("BR", "<br><br>");
            //    cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            //}
            //finally
            //{ DtHeader.Dispose(); }
        }

        void LembagaPemeriksaSavePostMode(int Post, string CurrUser)
        {
            DataTable DtHeader = new DataTable();
            DataTable DtDetail = new DataTable();
            DataTable EmailDt = new DataTable();

            try
            {
                FormHeaderTVP(ref DtHeader);
                PopulateHeaderTVP(ref DtHeader);
                FormDetailTVP(ref DtDetail);
                PopulateDetailTVP(ref DtDetail);
                TrimDetailTVPBeforeSavePost(ref DtDetail);

                string err = LembagaPemeriksaMethods.SP_SavePostDelete_LembagaPemeriksa(ref DtHeader, ref DtDetail, CurrUser, Post);

                if (err == "")
                {
                    if (Post == 2)
                    {
                        LPH_Status.Text = "11";

                        string StatusName = string.Empty;
                        StatusMethods.GetStatusName(ref StatusName, "11");
                        StatusText.Text = StatusName;

                        FormEmailDt(ref EmailDt);
                        PopulateEmailDt(ref EmailDt);

                        string CreatorName = string.Empty;
                        PenggunaSistemMethods.GetSystemUserNamePelupusan(ref CreatorName, CurrUser);
                        //SendMail.LembagaPemeriksa_NotifyMembers(ref EmailDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()));
                    }
                    else if (Post == 3)
                    {
                        LPH_UniqueId.Text = "";
                        LPH_RefNumber.Text = "";
                        //LPH_LembagaName.Text = "";
                        //LPH_AssignedPtj.Value = DBNull.Value;
                        //LPH_AssignYear.Value = DBNull.Value;
                        //LPH_StartDate.Value = DBNull.Value;
                        //LPH_EndDate.Value = DBNull.Value;
                        LPH_LastModeBy.Text = "";
                        LPH_LastModeDate.Value = DBNull.Value;
                        LPH_Status.Text = "";
                        StatusText.Text = "";
                        LastModeName.Text = "";

                        DtDetail.Columns.Clear();
                        DtDetail.Clear();

                        FormDetailTVP(ref DtDetail);
                        BindLembagaMemberGrid(ref DtDetail);
                    }

                    cbp_SavePostDelete.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_SavePostDelete.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }                
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SavePostDelete.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DtDetail.Dispose(); DtHeader.Dispose(); }
        }

        void LembagaPemeriksaDeleteMode(int Post, string CurrUser)
        {
            DataTable DtHeader = new DataTable();
            DataTable DtDetail = new DataTable();

            try
            {
                FormHeaderTVP(ref DtHeader);
                PopulateHeaderTVP(ref DtHeader);
                FormDetailTVP(ref DtDetail);
                PopulateDetailTVP(ref DtDetail);
                TrimDetailTVPBeforeSavePost(ref DtDetail);

                string err = LembagaPemeriksaMethods.SP_SavePostDelete_LembagaPemeriksa(ref DtHeader, ref DtDetail, CurrUser, Post);

                if (err == "")
                {                   
                    LPH_UniqueId.Text = "";
                    LPH_RefNumber.Text = "";
                    //LPH_LembagaName.Text = "";
                    //LPH_AssignedPtj.Value = DBNull.Value;
                    //LPH_AssignYear.Value = DBNull.Value;
                    //LPH_StartDate.Value = DBNull.Value;
                    //LPH_EndDate.Value = DBNull.Value;
                    LPH_LastModeBy.Text = "";
                    LPH_LastModeDate.Value = DBNull.Value;
                    LPH_Status.Text = "";
                    StatusText.Text = "";
                    LastModeName.Text = "";

                    DtDetail.Columns.Clear();
                    DtDetail.Clear();

                    FormDetailTVP(ref DtDetail);
                    BindLembagaMemberGrid(ref DtDetail);

                    cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DtDetail.Dispose(); DtHeader.Dispose(); }
        }

        void FormHeaderTVP(ref DataTable Dt)
        {
            DataColumn LPH_UniqueId = Dt.Columns.Add("LPH_UniqueId", typeof(String));
            DataColumn LPH_RefNumber = Dt.Columns.Add("LPH_RefNumber", typeof(String));
            DataColumn LPH_LembagaName = Dt.Columns.Add("LPH_LembagaName", typeof(String));
            DataColumn LPH_AssignedPtj = Dt.Columns.Add("LPH_AssignedPtj", typeof(Int32));
            DataColumn LPH_AssignYear = Dt.Columns.Add("LPH_AssignYear", typeof(Int32));
            DataColumn LPH_StartDate = Dt.Columns.Add("LPH_StartDate", typeof(DateTime));
            DataColumn LPH_EndDate = Dt.Columns.Add("LPH_EndDate", typeof(DateTime));
            DataColumn LPH_LastModeBy = Dt.Columns.Add("LPH_LastModeBy", typeof(Int32));
            DataColumn LPH_LastModeDate = Dt.Columns.Add("LPH_LastModeDate", typeof(DateTime));
            DataColumn LPH_Status = Dt.Columns.Add("LPH_Status", typeof(Int32));
            Dt.AcceptChanges();
        }

        void PopulateHeaderTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (LPH_UniqueId.Text == "")
                Dr["LPH_UniqueId"] = DBNull.Value;
            else
                Dr["LPH_UniqueId"] = LPH_UniqueId.Text;

            if (LPH_RefNumber.Text == "")
                Dr["LPH_RefNumber"] = DBNull.Value;
            else
                Dr["LPH_RefNumber"] = LPH_RefNumber.Text;

            //Dr["LPH_LembagaName"] = LPH_LembagaName.Text.Trim();
            //Dr["LPH_AssignedPtj"] = Convert.ToInt32(LPH_AssignedPtj.Value);
            //Dr["LPH_AssignYear"] = Convert.ToInt32(LPH_AssignYear.Value);
            //Dr["LPH_StartDate"] = LPH_StartDate.Date;
            //Dr["LPH_EndDate"] = LPH_EndDate.Date;
            Dr["LPH_LastModeBy"] = Convert.ToInt32(LPH_LastModeBy.Text);
            Dr["LPH_LastModeDate"] = DateTime.Now;
            Dr["LPH_Status"] = Convert.ToInt32(LPH_Status.Text);

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void FormEmailDt(ref DataTable Dt)
        {
            DataColumn Name = Dt.Columns.Add("Name", typeof(String));
            DataColumn Email = Dt.Columns.Add("Email", typeof(String));
            DataColumn Peranan = Dt.Columns.Add("Peranan", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateEmailDt(ref DataTable Dt)
        {
            for (int i = 0; i < gvPelupusanHarta.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["Name"] = gvPelupusanHarta.GetRowValues(i, "LPD_EmpName").ToString();
                Dr["Email"] = gvPelupusanHarta.GetRowValues(i, "LPD_EmpEmail").ToString();

                ASPxComboBox cmb = (ASPxComboBox)gvPelupusanHarta.FindRowCellTemplateControl(i, gvPelupusanHarta.DataColumns["LPD_MIR_Id"] as GridViewDataColumn, "LPD_MIR_Id");

                if (cmb != null)
                {
                    if (cmb.SelectedIndex != -1)
                        Dr["Peranan"] = cmb.SelectedItem.Text;
                }
                else
                    Dr["Peranan"] = DBNull.Value;

                Dt.Rows.Add(Dr);
            }
            Dt.AcceptChanges(); 
        }

        void FormDetailTVP(ref DataTable Dt)
        {
            DataColumn LPH_UniqueId = Dt.Columns.Add("LPH_UniqueId", typeof(String));
            DataColumn LPD_EmpId = Dt.Columns.Add("LPD_EmpId", typeof(String));
            DataColumn LPD_EmpName = Dt.Columns.Add("LPD_EmpName", typeof(String));
            DataColumn LPD_EmpDesignation = Dt.Columns.Add("LPD_EmpDesignation", typeof(String));
            DataColumn LPD_EmpGrade = Dt.Columns.Add("LPD_EmpGrade", typeof(String));
            DataColumn LPD_EmpEmail = Dt.Columns.Add("LPD_EmpEmail", typeof(String));
            DataColumn LPD_Telephone = Dt.Columns.Add("LPD_Telephone", typeof(String));
            DataColumn LPD_MIR_Id = Dt.Columns.Add("LPD_MIR_Id", typeof(Int32));
            Dt.AcceptChanges();
        }

        void PopulateDetailTVP(ref DataTable Dt)
        {
            for (int i = 0; i < gvPelupusanHarta.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["LPH_UniqueId"] = LPH_UniqueId.Text;
                Dr["LPD_EmpId"] = gvPelupusanHarta.GetRowValues(i, "LPD_EmpId").ToString();
                Dr["LPD_EmpName"] = gvPelupusanHarta.GetRowValues(i, "LPD_EmpName").ToString();
                Dr["LPD_EmpDesignation"] = gvPelupusanHarta.GetRowValues(i, "LPD_EmpDesignation").ToString();
                Dr["LPD_EmpGrade"] = gvPelupusanHarta.GetRowValues(i, "LPD_EmpGrade").ToString();
                Dr["LPD_EmpEmail"] = gvPelupusanHarta.GetRowValues(i, "LPD_EmpEmail").ToString();
                Dr["LPD_Telephone"] = gvPelupusanHarta.GetRowValues(i, "LPD_Telephone").ToString();

                ASPxComboBox cmb = (ASPxComboBox)gvPelupusanHarta.FindRowCellTemplateControl(i, gvPelupusanHarta.DataColumns["LPD_MIR_Id"] as GridViewDataColumn, "LPD_MIR_Id");

                if (cmb != null)
                {
                    if (cmb.SelectedIndex != -1)
                        Dr["LPD_MIR_Id"] = Convert.ToInt32(cmb.Value);
                }
                else
                    Dr["LPD_MIR_Id"] = DBNull.Value;

                Dt.Rows.Add(Dr);
            }
            Dt.AcceptChanges(); 
        }

        void TrimDetailTVPBeforeSavePost(ref DataTable Dt)
        {
            Dt.Columns.Remove("LPD_EmpName");
            Dt.AcceptChanges();
        }

        void BindLembagaMemberGrid(ref DataTable Dt)
        {
            gvPelupusanHarta.DataSource = Dt;
            gvPelupusanHarta.KeyFieldName = "LPD_EmpId";
            gvPelupusanHarta.DataBind();
        }

        protected void GridLembagaPemeriksa_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
           
        }

        void FormDeleteLink(string FieldName, int VisibleIndex, object CellValue)
        {
            ASPxHyperLink link = (ASPxHyperLink)gvPelupusanHarta.FindRowCellTemplateControl(VisibleIndex, gvPelupusanHarta.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (link != null)
            {
                link.ClientInstanceName = FieldName + VisibleIndex.ToString();
                string LPD_EmpName = gvPelupusanHarta.GetRowValues(VisibleIndex, "LPD_EmpName").ToString();

                link.NavigateUrl = "javascript: BeforeDeleteMember('" + CellValue + "','" + LPD_EmpName + "');";
            }
        }

        void FormPerananCombo(string FieldName, int VisibleIndex, object CellValue)
        {
            ASPxComboBox cmb = (ASPxComboBox)gvPelupusanHarta.FindRowCellTemplateControl(VisibleIndex, gvPelupusanHarta.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (cmb != null)
            {
                cmb.ClientInstanceName = FieldName + VisibleIndex.ToString();

                if (CellValue.ToString() != "")                
                    cmb.Value = Convert.ToInt32(CellValue);                
                else
                    cmb.Value = DBNull.Value;
            }
        }

        protected void GridEmpLookup_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSenaraiPelupusanHarta.DataBind();
        }

        protected void GridEmpLookup_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            if (e.CallbackName == "CUSTOMCALLBACK")
            {
                if (gvPelupusanHarta.VisibleRowCount > 0)
                {
                    DataTable Dt = new DataTable();
                    DataColumn LPD_EmpId = Dt.Columns.Add("LPD_EmpId", typeof(String));
                    Dt.AcceptChanges();

                    for (int i = 0; i < Dt.Rows.Count; i++)
                    {
                        for (int y = 0; y < GridSenaraiPelupusanHarta.VisibleRowCount; y++)
                        {
                            if (GridSenaraiPelupusanHarta.GetRowValues(y, "EmployeeId").ToString() == Dt.Rows[i]["LPD_EmpId"].ToString())
                                GridSenaraiPelupusanHarta.Selection.SelectRow(y);
                        }
                    }
                }
            }
        }

        protected void cbp_SavePostDelete_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_SavePostDelete.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {                   
                    case "SAVE": LembagaPemeriksaSavePostMode(1, ticket.Name); break;
                    case "POST": LembagaPemeriksaSavePostMode(2, ticket.Name); break;
                }
            }
            else
                cbp_SavePostDelete.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        protected void glJabatanFakulti_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridSenaraiPelupusanHarta_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {

        }

        protected void GridSenaraiPelupusanHarta_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void cbp_LaporanPelupusanHarta_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_LaporanLembagaPemeriksa.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {

                    case "ADD": Tambah(ticket.Name); break;
                    case "MASUKKANLISTPELUPUSANHARTA": LembagaPemeriksaAddMemberMode(); break;
                    case "DELETEMEMBER": LembagaPemeriksaDeleteMemberMode(); break;
                    case "LOAD": LembagaPemeriksaLoadMode(); break;
                    case "DELETEHEADER": LembagaPemeriksaDeleteMode(3, ticket.Name); break;
                    case "REFRESHSTATUS": LembagaPemeriksaRefresh(); break;
                }
            }
            else
                cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        private void Tambah(string CurrUser)
        {
            try
            {
                Data.SijilPengesahanPemusnahanStokAlih SPPSA = new Data.SijilPengesahanPemusnahanStokAlih
                {

                   // FakultiAtauPTJ = glFakultiPTJ.Text,
                   // UnitAtauMakmal = txtUnitMakmal.Text,
                   // JenisAset = txtJenisAset.Text,
                   // Kuantiti = txtKuantiti.Text,
                   // Secara = glSecara.Text,
                   // Tarikh = deTarikh.Date,
                   // Tempat = txtTempat.Text,

                    //TarikhLihatPadaSebutharga = deTarikhBolehLihatSebutharga.Date,
                    //TarikhLihatHinggaSebutharga = deTarikhBolehLihatHinggaSebutharga.Date,
                    //NoSebutharga = txtNoSebutharga.Text,
                    //PetiAlamatSebutharga = txtPetiAlamatTenderSebutharga.Text,
                    //TarikhTutupSebutharga = deTarikhTutupSebutharga.Date,


                };

                string err = Core.Stor.SijilPengesahanPemusnahanStokAlih.SijilPengesahanPemusnahanStokAlihMethods.SP_SaveSijilPengesahanPemusnahanStokAlih(SPPSA);

                if (err == "")
                {
                    cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { }
        }

        void LembagaPemeriksaAddMemberMode()
        {
            DataTable DtDetail = new DataTable();
            DataTable DtOri = new DataTable();

            try
            {
                FormDetailTVP(ref DtDetail);

                if (GridSenaraiPelupusanHarta.Selection.Count > 0)
                {
                    FormDetailTVP(ref DtOri);
                    PopulateDetailTVP(ref DtOri);

                    for (int x = 0; x < GridSenaraiPelupusanHarta.VisibleRowCount; x++)
                    {
                        if (GridSenaraiPelupusanHarta.Selection.IsRowSelected(x))
                        {
                           
                            //DataRow Dr = DtDetail.NewRow();

                            //if (LPH_UniqueId.Text == "")
                            //    Dr["LPH_UniqueId"] = DBNull.Value;
                            //else
                            //    Dr["LPH_UniqueId"] = LPH_UniqueId.Text;

                            //Dr["LPD_EmpId"] = GridSenaraiPelupusanHarta.GetRowValues(x, "EmployeeId").ToString();
                            //Dr["LPD_EmpName"] = GridSenaraiPelupusanHarta.GetRowValues(x, "EmployeeName").ToString();
                            //Dr["LPD_EmpDesignation"] = GridSenaraiPelupusanHarta.GetRowValues(x, "EmployeeDesignation").ToString();
                            //Dr["LPD_EmpGrade"] = GridSenaraiPelupusanHarta.GetRowValues(x, "EmployeeGrade").ToString();
                            //Dr["LPD_EmpEmail"] = GridSenaraiPelupusanHarta.GetRowValues(x, "EmployeeEmail").ToString();
                            //Dr["LPD_Telephone"] = GridSenaraiPelupusanHarta.GetRowValues(x, "EmployeeTelephone").ToString();

                            //DataRow[] drs = DtOri.Select("LPD_EmpId = '" + GridSenaraiPelupusanHarta.GetRowValues(x, "EmployeeId").ToString() + "'");

                            //if (drs.Length == 1)
                            //{
                            //    if (drs[0]["LPD_MIR_Id"].ToString() != "")
                            //        Dr["LPD_MIR_Id"] = Convert.ToInt32(drs[0]["LPD_MIR_Id"]);
                            //    else
                            //        Dr["LPD_MIR_Id"] = DBNull.Value;
                            //}
                            //else
                            //    Dr["LPD_MIR_Id"] = DBNull.Value;

                            //DtDetail.Rows.Add(Dr);
                        }
                    }

                    DtDetail.AcceptChanges();
                }

                BindLembagaMemberGrid(ref DtDetail);
                cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DtDetail.Dispose(); }
        }


        protected void txtRujPemohonan_TextChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhPemeriksaan_DateChanged(object sender, EventArgs e)
        {

        }

        protected void glLokasiBlok_TextChanged(object sender, EventArgs e)
        {

        }

        protected void gvPelupusanHarta_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "LPD_EmpId": FormDeleteLink(e.DataColumn.FieldName, e.VisibleIndex, e.CellValue); break;
                case "LPD_MIR_Id": FormPerananCombo(e.DataColumn.FieldName, e.VisibleIndex, e.CellValue); break;
            }
        }

        protected void cbp_LaporanLembagaPemeriksa_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_LaporanLembagaPemeriksa.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {
                    //insert value after click "tambah"
                    case "ADD": LembagaPemeriksaNewMode(ticket.Name); break;
                    //add member ahli lembaga pemeriksaan
                   // case "ADDMEMBER": LembagaPemeriksaAddMemberMode(); break;
                    //delete member
                   // case "DELETEMEMBER": LembagaPemeriksaDeleteMemberMode(); break;
                    //carian 
                   // case "LOAD": LembagaPemeriksaLoadMode(); break;
                   // case "DELETEHEADER": LembagaPemeriksaDeleteMode(3, ticket.Name); break;
                   // case "REFRESHSTATUS": LembagaPemeriksaRefresh(); break;
                }
            }
            else
                cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void LembagaPemeriksaNewMode(string CurrUser)
        {
            try
            {
                Data.LaporanLembagaPemeriksa SLLP = new Data.LaporanLembagaPemeriksa
                {

                    JabatanAtauFakulti = glJabatanFakulti.Text,
                    LokasiAtauBlok = glLokasiBlok.Text,
                    RujukanPemohonan = txtRujPemohonan.Text,
                    TarikhPmeriksaan = deTarikhPemeriksaan.Date,

                };

                string err = Core.Stor.LaporanLembagaPemeriksaMethods.SP_SaveLaporanLembagaPemeriksa(SLLP);

                if (err == "")
                {
                    cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LaporanLembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { }
        }
    }
}