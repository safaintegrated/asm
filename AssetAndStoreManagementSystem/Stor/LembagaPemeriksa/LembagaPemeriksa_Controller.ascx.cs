using System;
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
using Core.Stor;

namespace AssetAndStoreManagementSystem.Stor.LembagaPemeriksa
{
    public partial class LembagaPemeriksa_Controller : System.Web.UI.UserControl
    {
        //PageLoad : time mula2 click lembaga Pemeriksaan
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoadEvents();", true);
            }
        }

        //Click tambah
        protected void cbp_LembagaPemeriksa_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_LembagaPemeriksa.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {
                    //insert value after click "tambah"
                    case "ADD": LembagaPemeriksaNewMode(ticket.Name); break;
                    //add member ahli lembaga pemeriksaan
                    case "ADDMEMBER": LembagaPemeriksaAddMemberMode(); break;
                    //delete member
                    case "DELETEMEMBER": LembagaPemeriksaDeleteMemberMode(); break;
                    //carian 
                    case "LOAD": LembagaPemeriksaLoadMode(); break;
                    case "DELETEHEADER": LembagaPemeriksaDeleteMode(3, ticket.Name); break;
                    case "REFRESHSTATUS": LembagaPemeriksaRefresh(); break;
                }
            }
            else
                cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        //insert value after click "tambah"
        void LembagaPemeriksaNewMode(string CurrUser)
        {
            DataTable DtDetail = new DataTable();

            try
            {
                txtUniqueId.Text = "";
                txtRefNumber.Text = "";
                txtNamaPemeriksaan.Text = "";
                glPtj.Value = DBNull.Value;
                seTahunPemeriksaan.Value = DBNull.Value;
                deTarikhMula.Value = DBNull.Value;
                deTarikhTamat.Value = DBNull.Value;
                txtLastModeBy.Text = CurrUser;
                deLastModeDate.Date = DateTime.Now;
                txtStatus.Text = "2";

                string StatusName = string.Empty;
                StatusMethods.GetStatusName(ref StatusName, "2");
                StatusText.Text = StatusName;

                string SystemUserName = string.Empty;
                PenggunaSistemMethods.GetSystemUserNamePelupusan(ref SystemUserName, CurrUser);
                LastModeName.Text = SystemUserName;

                FormDetailTVP(ref DtDetail);
                BindLembagaMemberGrid(ref DtDetail);

                cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DtDetail.Dispose(); }
        }


        //add member ahli lembaga pemeriksaan
        void LembagaPemeriksaAddMemberMode()
        {
            DataTable DtDetail = new DataTable();
            DataTable DtOri = new DataTable();

            try
            {
                FormDetailTVP(ref DtDetail);

                if (GridEmpLookup.Selection.Count > 0)
                {
                    FormDetailTVP(ref DtOri);
                    PopulateDetailTVP(ref DtOri);

                    for (int x = 0; x < GridEmpLookup.VisibleRowCount; x++)
                    {
                        if (GridEmpLookup.Selection.IsRowSelected(x))
                        {
                            DataRow Dr = DtDetail.NewRow();

                            if (txtUniqueId.Text == "")
                                Dr["LPH_UniqueId"] = DBNull.Value;
                            else
                                Dr["LPH_UniqueId"] = txtUniqueId.Text;

                            Dr["LPD_EmpId"] = GridEmpLookup.GetRowValues(x, "EmployeeId").ToString();
                            Dr["LPD_EmpName"] = GridEmpLookup.GetRowValues(x, "EmployeeName").ToString();
                            Dr["LPD_EmpDesignation"] = GridEmpLookup.GetRowValues(x, "EmployeeDesignation").ToString();
                            Dr["LPD_EmpGrade"] = GridEmpLookup.GetRowValues(x, "EmployeeGrade").ToString();
                            Dr["LPD_EmpEmail"] = GridEmpLookup.GetRowValues(x, "EmployeeEmail").ToString();
                            Dr["LPD_Telephone"] = GridEmpLookup.GetRowValues(x, "EmployeeTelephone").ToString();

                            DataRow[] drs = DtOri.Select("LPD_EmpId = '" + GridEmpLookup.GetRowValues(x, "EmployeeId").ToString() + "'");

                            if (drs.Length == 1)
                            {
                                if (drs[0]["LPD_MIR_Id"].ToString() != "")
                                    Dr["LPD_MIR_Id"] = Convert.ToInt32(drs[0]["LPD_MIR_Id"]);
                                else
                                    Dr["LPD_MIR_Id"] = DBNull.Value;
                            }
                            else
                                Dr["LPD_MIR_Id"] = DBNull.Value;

                            DtDetail.Rows.Add(Dr);
                        }
                    }

                    DtDetail.AcceptChanges();                    
                }

                BindLembagaMemberGrid(ref DtDetail);
                cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DtDetail.Dispose(); }
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
                cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DtDetail.Dispose(); }
        }
        
        //carian lembaga
        void LembagaPemeriksaLoadMode()
        {
            DataTable DtHeader = new DataTable();
            DataTable DtDetail = new DataTable();

            try
            {
                if (txtUniqueId.Text == "")
                {
                    txtUniqueId.Text = "";
                    txtRefNumber.Text = "";
                    txtNamaPemeriksaan.Text = "";
                    glPtj.Value = DBNull.Value;
                    seTahunPemeriksaan.Value = DBNull.Value;
                    deTarikhMula.Value = DBNull.Value;
                    deTarikhTamat.Value = DBNull.Value;
                    txtLastModeBy.Text = "";
                    deLastModeDate.Value = DBNull.Value;
                    txtStatus.Text = "";
                    StatusText.Text = "";
                    LastModeName.Text = "";

                    DtDetail.Columns.Clear();
                    DtDetail.Clear();

                    FormDetailTVP(ref DtDetail);
                    BindLembagaMemberGrid(ref DtDetail);
                    cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string err = StorLembagaPemeriksaMethods.V_LembagaPemeriksa_Header(txtUniqueId.Text, ref DtHeader);

                    if (err == string.Empty)
                    {
                        if (DtHeader.Rows.Count == 0)
                        {

                        }
                        else
                        {
                            //txtUniqueId.Text = DtHeader.Rows[0]["LPH_UniqueId"].ToString();
                            txtRefNumber.Text = DtHeader.Rows[0]["LPH_RefNumber"].ToString();
                            txtNamaPemeriksaan.Text = DtHeader.Rows[0]["LPH_LembagaName"].ToString();
                            glPtj.Value = Convert.ToInt32(DtHeader.Rows[0]["LPH_AssignedPtj"]);
                            seTahunPemeriksaan.Value = Convert.ToInt32(DtHeader.Rows[0]["LPH_AssignYear"]);
                            deTarikhMula.Value = Convert.ToDateTime(DtHeader.Rows[0]["LPH_StartDate"]);
                            deTarikhTamat.Value = Convert.ToDateTime(DtHeader.Rows[0]["LPH_EndDate"]);
                            txtLastModeBy.Text = DtHeader.Rows[0]["LPH_LastModeBy"].ToString();
                            deLastModeDate.Value = Convert.ToDateTime(DtHeader.Rows[0]["LPH_LastModeDate"]);
                            txtStatus.Text = DtHeader.Rows[0]["LPH_Status"].ToString();
                            StatusText.Text = DtHeader.Rows[0]["StatusText"].ToString();
                            LastModeName.Text = DtHeader.Rows[0]["LastModeName"].ToString();


                            StorLembagaPemeriksaMethods.V_LembagaPemeriksa_Detail(txtUniqueId.Text, ref DtDetail);
                            BindLembagaMemberGrid(ref DtDetail);
                            cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
                        }
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }                
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DtDetail.Dispose(); DtHeader.Dispose(); }
        }

        void LembagaPemeriksaRefresh()
        {
            DataTable DtHeader = new DataTable();
            DataTable DtDetail = new DataTable();

            try
            {                
                string err = StorLembagaPemeriksaMethods.V_LembagaPemeriksa_Header_Refresh(txtNamaPemeriksaan.Text, ref DtHeader);

                if (err == string.Empty)
                {
                    if (DtHeader.Rows.Count == 0)
                    {

                    }
                    else
                    {
                        txtUniqueId.Text = DtHeader.Rows[0]["LPH_UniqueId"].ToString();
                        txtRefNumber.Text = DtHeader.Rows[0]["LPH_RefNumber"].ToString();                           
                        txtStatus.Text = DtHeader.Rows[0]["LPH_Status"].ToString();
                        StatusText.Text = DtHeader.Rows[0]["StatusText"].ToString();
                        LastModeName.Text = DtHeader.Rows[0]["LastModeName"].ToString();

                        FormDetailTVP(ref DtDetail);
                        PopulateDetailTVP(ref DtDetail);
                        BindLembagaMemberGrid(ref DtDetail);
                    }
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }                
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { DtHeader.Dispose(); }
        }


        //Click Simpan
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

                string err = StorLembagaPemeriksaMethods.SP_SavePostDelete_LembagaPemeriksa(ref DtHeader, ref DtDetail, CurrUser, Post);

                if (err == "")
                {
                    if (Post == 2)
                    {
                        txtStatus.Text = "11";

                        string StatusName = string.Empty;
                        StatusMethods.GetStatusName(ref StatusName, "11");
                        StatusText.Text = StatusName;

                        FormEmailDt(ref EmailDt);
                        PopulateEmailDt(ref EmailDt);

                        string CreatorName = string.Empty;
                        PenggunaSistemMethods.GetSystemUserNamePelupusan(ref CreatorName, CurrUser);
                        SendMail.LembagaPemeriksa_NotifyMembers(ref EmailDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), txtNamaPemeriksaan.Text, glPtj.GridView.GetRowValues(glPtj.GridView.FocusedRowIndex, "PTJ_Name").ToString(), seTahunPemeriksaan.Text, deTarikhMula.Text, deTarikhTamat.Text, CreatorName);
                    }
                    else if (Post == 3)
                    {
                        txtUniqueId.Text = "";
                        txtRefNumber.Text = "";
                        txtNamaPemeriksaan.Text = "";
                        glPtj.Value = DBNull.Value;
                        seTahunPemeriksaan.Value = DBNull.Value;
                        deTarikhMula.Value = DBNull.Value;
                        deTarikhTamat.Value = DBNull.Value;
                        txtLastModeBy.Text = "";
                        deLastModeDate.Value = DBNull.Value;
                        txtStatus.Text = "";
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


        //delete member
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

                string err = StorLembagaPemeriksaMethods.SP_SavePostDelete_LembagaPemeriksa(ref DtHeader, ref DtDetail, CurrUser, Post);

                if (err == "")
                {                   
                    txtUniqueId.Text = "";
                    txtRefNumber.Text = "";
                    txtNamaPemeriksaan.Text = "";
                    glPtj.Value = DBNull.Value;
                    seTahunPemeriksaan.Value = DBNull.Value;
                    deTarikhMula.Value = DBNull.Value;
                    deTarikhTamat.Value = DBNull.Value;
                    txtLastModeBy.Text = "";
                    deLastModeDate.Value = DBNull.Value;
                    txtStatus.Text = "";
                    StatusText.Text = "";
                    LastModeName.Text = "";

                    DtDetail.Columns.Clear();
                    DtDetail.Clear();

                    FormDetailTVP(ref DtDetail);
                    BindLembagaMemberGrid(ref DtDetail);
                    
                    cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_LembagaPemeriksa.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
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
            DataColumn LPH_Stor = Dt.Columns.Add("LPH_Stor", typeof(Int32));
            
            Dt.AcceptChanges();
        }

        void PopulateHeaderTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (txtUniqueId.Text == "")
                Dr["LPH_UniqueId"] = DBNull.Value;
            else
                Dr["LPH_UniqueId"] = txtUniqueId.Text;

            if (txtRefNumber.Text == "")
                Dr["LPH_RefNumber"] = DBNull.Value;
            else
                Dr["LPH_RefNumber"] = txtRefNumber.Text;

            Dr["LPH_LembagaName"] = txtNamaPemeriksaan.Text.Trim();
            Dr["LPH_AssignedPtj"] = Convert.ToInt32(glPtj.Value);
            Dr["LPH_Stor"] = Convert.ToInt32(glStor.Value);
            Dr["LPH_AssignYear"] = Convert.ToInt32(seTahunPemeriksaan.Value);
            Dr["LPH_StartDate"] = deTarikhMula.Date;
            Dr["LPH_EndDate"] = deTarikhTamat.Date;
            Dr["LPH_LastModeBy"] = Convert.ToInt32(txtLastModeBy.Text);
            Dr["LPH_LastModeDate"] = DateTime.Now;
            Dr["LPH_Status"] = Convert.ToInt32(txtStatus.Text);

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
            for (int i = 0; i < GridLembagaPemeriksa.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["Name"] = GridLembagaPemeriksa.GetRowValues(i, "LPD_EmpName").ToString();
                Dr["Email"] = GridLembagaPemeriksa.GetRowValues(i, "LPD_EmpEmail").ToString();

                ASPxComboBox cmb = (ASPxComboBox)GridLembagaPemeriksa.FindRowCellTemplateControl(i, GridLembagaPemeriksa.DataColumns["LPD_MIR_Id"] as GridViewDataColumn, "LPD_MIR_Id");

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
            for (int i = 0; i < GridLembagaPemeriksa.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["LPH_UniqueId"] = txtUniqueId.Text;
                Dr["LPD_EmpId"] = GridLembagaPemeriksa.GetRowValues(i, "LPD_EmpId").ToString();
                Dr["LPD_EmpName"] = GridLembagaPemeriksa.GetRowValues(i, "LPD_EmpName").ToString();
                Dr["LPD_EmpDesignation"] = GridLembagaPemeriksa.GetRowValues(i, "LPD_EmpDesignation").ToString();
                Dr["LPD_EmpGrade"] = GridLembagaPemeriksa.GetRowValues(i, "LPD_EmpGrade").ToString();
                Dr["LPD_EmpEmail"] = GridLembagaPemeriksa.GetRowValues(i, "LPD_EmpEmail").ToString();
                Dr["LPD_Telephone"] = GridLembagaPemeriksa.GetRowValues(i, "LPD_Telephone").ToString();

                ASPxComboBox cmb = (ASPxComboBox)GridLembagaPemeriksa.FindRowCellTemplateControl(i, GridLembagaPemeriksa.DataColumns["LPD_MIR_Id"] as GridViewDataColumn, "LPD_MIR_Id");

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
            GridLembagaPemeriksa.DataSource = Dt;
            GridLembagaPemeriksa.KeyFieldName = "LPD_EmpId";
            GridLembagaPemeriksa.DataBind();
        }

        protected void GridLembagaPemeriksa_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "LPD_EmpId": FormDeleteLink(e.DataColumn.FieldName, e.VisibleIndex, e.CellValue); break;
                case "LPD_MIR_Id": FormPerananCombo(e.DataColumn.FieldName, e.VisibleIndex, e.CellValue); break;
            }
        }

        void FormDeleteLink(string FieldName, int VisibleIndex, object CellValue)
        {
            ASPxHyperLink link = (ASPxHyperLink)GridLembagaPemeriksa.FindRowCellTemplateControl(VisibleIndex, GridLembagaPemeriksa.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (link != null)
            {
                link.ClientInstanceName = FieldName + VisibleIndex.ToString();
                string LPD_EmpName = GridLembagaPemeriksa.GetRowValues(VisibleIndex, "LPD_EmpName").ToString();

                link.NavigateUrl = "javascript: BeforeDeleteMember('" + CellValue + "','" + LPD_EmpName + "');";
            }
        }

        void FormPerananCombo(string FieldName, int VisibleIndex, object CellValue)
        {
            ASPxComboBox cmb = (ASPxComboBox)GridLembagaPemeriksa.FindRowCellTemplateControl(VisibleIndex, GridLembagaPemeriksa.DataColumns[FieldName] as GridViewDataColumn, FieldName);

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
            GridEmpLookup.DataBind();
        }

        protected void GridEmpLookup_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            if (e.CallbackName == "CUSTOMCALLBACK")
            {
                if (GridLembagaPemeriksa.VisibleRowCount > 0)
                {
                    DataTable Dt = new DataTable();
                    DataColumn LPD_EmpId = Dt.Columns.Add("LPD_EmpId", typeof(String));
                    Dt.AcceptChanges();

                    for (int i = 0; i < Dt.Rows.Count; i++)
                    {
                        for (int y = 0; y < GridEmpLookup.VisibleRowCount; y++)
                        {
                            if (GridEmpLookup.GetRowValues(y, "EmployeeId").ToString() == Dt.Rows[i]["LPD_EmpId"].ToString())
                                GridEmpLookup.Selection.SelectRow(y);
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
    }
}