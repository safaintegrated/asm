using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using DevExpress.Web;
using Core.Aset.LaporanKehilangan;
using System.Web.Security;
using Core.Email;
using Core.PengurusanSistem;

namespace AssetAndStoreManagementSystem.Aset.LaporanKehilangan
{
    public partial class Penyiasat_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridSearchPegawaiPenyiasat_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearchPegawaiPenyiasat.DataBind();
        }

        protected void GridSearchPegawaiPenyiasat_AfterPerformCallback(object sender, DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            if (e.CallbackName == "CUSTOMCALLBACK")
            {
                if (GridSelectedPegawaiPenyiasat.VisibleRowCount > 0)
                {
                    DataTable Dt = new DataTable();
                    DataColumn LKIB_InvestigatorEmpId = Dt.Columns.Add("LKIB_InvestigatorEmpId", typeof(String));
                    Dt.AcceptChanges();

                    for (int i = 0; i < GridSelectedPegawaiPenyiasat.VisibleRowCount; i++)
                    {
                        DataRow Dr = Dt.NewRow();
                        Dr["LKIB_InvestigatorEmpId"] = GridSelectedPegawaiPenyiasat.GetRowValues(i, "LKIB_InvestigatorEmpId").ToString();
                        Dt.Rows.Add(Dr);
                    }

                    Dt.AcceptChanges();

                    string InvestigatorEmpId = string.Empty;

                    for (int x = 0; x < Dt.Rows.Count; x++)
                    {
                        InvestigatorEmpId = Dt.Rows[x]["LKIB_InvestigatorEmpId"].ToString();

                        for (int y = 0; y < GridSearchPegawaiPenyiasat.VisibleRowCount; y++)
                        {
                            if (GridSearchPegawaiPenyiasat.GetRowValues(y, "EmployeeId").ToString() == InvestigatorEmpId)
                            {
                                GridSearchPegawaiPenyiasat.Selection.SelectRow(y);
                            }
                        }
                    }
                }
                else
                    GridSearchPegawaiPenyiasat.Selection.UnselectAll();
            }
        }

        void FormPenyiasatTVP(ref DataTable Dt)
        {
            DataColumn LKIB_ProcessId = Dt.Columns.Add("LKIB_ProcessId", typeof(String));
            DataColumn LKIB_Rev = Dt.Columns.Add("LKIB_Rev", typeof(Int32));
            DataColumn LKIB_InvestigatorEmpId = Dt.Columns.Add("LKIB_InvestigatorEmpId", typeof(String));
            DataColumn LKIB_Email = Dt.Columns.Add("LKIB_Email", typeof(String));
            DataColumn LKIB_Telephone = Dt.Columns.Add("LKIB_Telephone", typeof(String));
            DataColumn LKIB_Department = Dt.Columns.Add("LKIB_Department", typeof(String));
            DataColumn LKIB_Role = Dt.Columns.Add("LKIB_Role", typeof(Int32));
            DataColumn EmployeeName = Dt.Columns.Add("EmployeeName", typeof(String));
            DataColumn EmployeeDesignation = Dt.Columns.Add("EmployeeDesignation", typeof(String));
            DataColumn EmployeeGrade = Dt.Columns.Add("EmployeeGrade", typeof(String));
            DataColumn Dept_Name = Dt.Columns.Add("Dept_Name", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulatePenyiasatTVP(ref DataTable Dt)
        {
            for (int i = 0; i < GridSelectedPegawaiPenyiasat.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["LKIB_ProcessId"] = GridSelectedPegawaiPenyiasat.GetRowValues(i,"LKIB_ProcessId").ToString();
                Dr["LKIB_Rev"] = Convert.ToInt32(GridSelectedPegawaiPenyiasat.GetRowValues(i, "LKIB_Rev"));
                Dr["LKIB_InvestigatorEmpId"] = GridSelectedPegawaiPenyiasat.GetRowValues(i, "LKIB_InvestigatorEmpId").ToString();
                Dr["LKIB_Email"] = GridSelectedPegawaiPenyiasat.GetRowValues(i, "LKIB_Email").ToString();
                Dr["LKIB_Telephone"] = GridSelectedPegawaiPenyiasat.GetRowValues(i, "LKIB_Telephone").ToString();
                Dr["LKIB_Department"] = GridSelectedPegawaiPenyiasat.GetRowValues(i, "LKIB_Department").ToString();

                ASPxComboBox combo = (ASPxComboBox)GridSelectedPegawaiPenyiasat.FindRowCellTemplateControl(i, GridSelectedPegawaiPenyiasat.DataColumns["LKIB_Role"] as GridViewDataColumn, "LKIB_Role");

                if (combo != null)
                {
                    if (combo.SelectedIndex != -1)
                        Dr["LKIB_Role"] = Convert.ToInt32(combo.Value);
                    else
                        Dr["LKIB_Role"] = DBNull.Value;
                }
                else
                    Dr["LKIB_Role"] = DBNull.Value;

                Dr["EmployeeName"] = GridSelectedPegawaiPenyiasat.GetRowValues(i, "EmployeeName").ToString();
                Dr["EmployeeDesignation"] = GridSelectedPegawaiPenyiasat.GetRowValues(i, "EmployeeDesignation").ToString();
                Dr["EmployeeGrade"] = GridSelectedPegawaiPenyiasat.GetRowValues(i, "EmployeeGrade").ToString();
                Dr["Dept_Name"] = GridSelectedPegawaiPenyiasat.GetRowValues(i, "Dept_Name").ToString();
                Dt.Rows.Add(Dr);

            }

            Dt.AcceptChanges();
        }

        void TrimPenyiasatDt(ref DataTable Dt)
        {
            Dt.Columns.Remove("EmployeeName");
            Dt.Columns.Remove("EmployeeDesignation");
            Dt.Columns.Remove("EmployeeGrade");
            Dt.Columns.Remove("Dept_Name");
            Dt.AcceptChanges();
        }

        protected void GridSelectedPegawaiPenyiasat_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSelectedPegawaiPenyiasat.JSProperties["cpMode"] = e.Parameters;

            switch (e.Parameters)
            {
                case "DELETE": DeletePP(); break;
                case "LOAD": LoadPP(); break;
                case "ADD": AddPP(); break;
            }
        }

        void DeletePP()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormPenyiasatTVP(ref Dt);
                PopulatePenyiasatTVP(ref Dt);

                DataRow[] Drs = Dt.Select("LKIB_InvestigatorEmpId = '" + TempDeletePP.Text + "'");

                if (Drs.Length == 1)
                    Dt.Rows.Remove(Drs[0]);

                Dt.AcceptChanges();
                BindSelectedPPGrid(ref Dt);
                GridSelectedPegawaiPenyiasat.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                GridSelectedPegawaiPenyiasat.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void BindSelectedPPGrid(ref DataTable Dt)
        {
            GridSelectedPegawaiPenyiasat.DataSource = Dt;
            GridSelectedPegawaiPenyiasat.KeyFieldName = "LKIB_InvestigatorEmpId";
            GridSelectedPegawaiPenyiasat.DataBind();
        }

        void LoadPP()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = LaporanKehilanganMethods.GetPegawaiPenyiasat(PP_ProcessId.Text, PP_Rev.Text, ref Dt);

                if (DbErr == string.Empty)
                {
                    BindSelectedPPGrid(ref Dt);
                    GridSelectedPegawaiPenyiasat.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    GridSelectedPegawaiPenyiasat.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }                
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                GridSelectedPegawaiPenyiasat.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void AddPP()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormPenyiasatTVP(ref Dt);

                for (int i = 0; i < GridSearchPegawaiPenyiasat.VisibleRowCount; i++)
                {
                    object key = GridSearchPegawaiPenyiasat.GetRowValues(i, GridSearchPegawaiPenyiasat.KeyFieldName);

                    if (GridSearchPegawaiPenyiasat.Selection.IsRowSelectedByKey(key))
                    {
                        DataRow Dr = Dt.NewRow();
                        Dr["LKIB_ProcessId"] = PP_ProcessId.Text;
                        Dr["LKIB_Rev"] = Convert.ToInt32(PP_Rev.Text);
                        Dr["LKIB_InvestigatorEmpId"] = GridSearchPegawaiPenyiasat.GetRowValues(i, "EmployeeId").ToString();
                        Dr["LKIB_Email"] = GridSearchPegawaiPenyiasat.GetRowValues(i, "EmployeeEmail").ToString();
                        Dr["LKIB_Telephone"] = GridSearchPegawaiPenyiasat.GetRowValues(i, "EmployeeTelephone").ToString();
                        Dr["LKIB_Department"] = GridSearchPegawaiPenyiasat.GetRowValues(i, "EmployeeDepartmentId").ToString();                       
                        Dr["LKIB_Role"] = DBNull.Value;
                        Dr["EmployeeName"] = GridSearchPegawaiPenyiasat.GetRowValues(i, "EmployeeName").ToString();
                        Dr["EmployeeDesignation"] = GridSearchPegawaiPenyiasat.GetRowValues(i, "EmployeeDesignation").ToString();
                        Dr["EmployeeGrade"] = GridSearchPegawaiPenyiasat.GetRowValues(i, "EmployeeGrade").ToString();
                        Dr["Dept_Name"] = GridSearchPegawaiPenyiasat.GetRowValues(i, "EmployeeDepartment").ToString();
                        Dt.Rows.Add(Dr);
                    }
                }

                Dt.AcceptChanges();
                BindSelectedPPGrid(ref Dt);
                GridSelectedPegawaiPenyiasat.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                GridSelectedPegawaiPenyiasat.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        protected void GridSelectedPegawaiPenyiasat_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "LKIB_InvestigatorEmpId")
            {
                ASPxHyperLink link = (ASPxHyperLink)GridSelectedPegawaiPenyiasat.FindRowCellTemplateControl(e.VisibleIndex, GridSelectedPegawaiPenyiasat.DataColumns["LKIB_InvestigatorEmpId"] as GridViewDataColumn, "LKIB_InvestigatorEmpId");

                if (link != null)
                {
                    string LKIB_InvestigatorEmpId = GridSelectedPegawaiPenyiasat.GetRowValues(e.VisibleIndex, "LKIB_InvestigatorEmpId").ToString();
                    link.ClientInstanceName = "LKIB_InvestigatorEmpId" + e.VisibleIndex.ToString();
                    link.NavigateUrl = "javascript: DeletePegawaiPenyiasat('" + LKIB_InvestigatorEmpId + "');";
                }
            }
            else if (e.DataColumn.FieldName == "LKIB_Role")
            {
                ASPxComboBox combo = (ASPxComboBox)GridSelectedPegawaiPenyiasat.FindRowCellTemplateControl(e.VisibleIndex, GridSelectedPegawaiPenyiasat.DataColumns["LKIB_Role"] as GridViewDataColumn, "LKIB_Role");

                if (combo != null)
                {
                    combo.ClientInstanceName = "LKIB_Role" + e.VisibleIndex.ToString();

                    if (e.CellValue.ToString() != "")
                        combo.Value = Convert.ToInt32(e.CellValue);
                    else
                        combo.SelectedIndex = -1;
                }
            }
        }

        protected void cbp_SavePostPP_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                cbp_SavePostPP.JSProperties["cpMode"] = e.Parameter;

                switch (e.Parameter)
                {
                    case "SAVE": PostSavePegawaiPenyiasat(ticket.Name, 0); break;
                    case "POST": PostSavePegawaiPenyiasat(ticket.Name, 1); break;
                }
            }
            else
            {
                cbp_SavePostPP.JSProperties["cpErrMsg"] = "Session Expired.";
            }           
        }

        void PostSavePegawaiPenyiasat(string CurrUser, int Mode)
        {
             DataTable Dt = new DataTable();
             DataTable EmailDt = new DataTable();

            try
            {
                FormPenyiasatTVP(ref Dt);
                PopulatePenyiasatTVP(ref Dt);
                TrimPenyiasatDt(ref Dt);

                string DbErr = LaporanKehilanganMethods.SP_LaporanKehilangan_LantikanPegawaiPenyiasat(CurrUser, ref Dt, Mode);

                if (DbErr == string.Empty)
                {
                    if(Mode == 1)
                    {
                        FormEmailDt(ref EmailDt);
                        PopulateEmailDt(ref EmailDt);

                        string BendahariName = string.Empty;
                        PenggunaSistemMethods.GetSystemUserName(ref BendahariName, CurrUser);

                        string EmailErr = SendMail.LaporanKerosakan_PegawaiPenyiasatTelahDilantik(ref EmailDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), BendahariName, PP_RefNumber.Text);

                        if (EmailErr == string.Empty)
                        { cbp_SavePostPP.JSProperties["cpMailError"] = EmailErr; }
                        else
                        { cbp_SavePostPP.JSProperties["cpMailError"] = string.Empty; }
                    }

                    cbp_SavePostPP.JSProperties["cpErrMsg"] = string.Empty; 
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_SavePostPP.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SavePostPP.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void FormEmailDt(ref DataTable Dt)
        {
            DataColumn EmployeeEmail = Dt.Columns.Add("EmployeeEmail", typeof(String));
            DataColumn EmployeeName = Dt.Columns.Add("EmployeeName", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateEmailDt(ref DataTable Dt)
        {
            for (int i = 0; i < GridSelectedPegawaiPenyiasat.VisibleRowCount; i++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["EmployeeEmail"] = GridSelectedPegawaiPenyiasat.GetRowValues(i, "LKIB_Email").ToString();
                Dr["EmployeeName"] = GridSelectedPegawaiPenyiasat.GetRowValues(i, "EmployeeName").ToString();
                Dt.Rows.Add(Dr);
            }

            Dt.AcceptChanges();
        }
    }
}