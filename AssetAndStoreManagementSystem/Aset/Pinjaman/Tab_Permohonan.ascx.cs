using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using DevExpress.Web;
using System.Configuration;
using Core.Aset.Pinjaman;

namespace AssetAndStoreManagementSystem.Aset.Pinjaman
{
    public partial class Tab_Permohonan : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridList_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "PPD_AssetInvUniqueId")
            {
                ASPxHyperLink PPD_AssetInvUniqueId = (ASPxHyperLink)GridList.FindRowCellTemplateControl(e.VisibleIndex, GridList.DataColumns["PPD_AssetInvUniqueId"] as GridViewDataColumn, "PPD_AssetInvUniqueId");

                if (PPD_AssetInvUniqueId != null)
                {
                    string AssInvRegNum = GridList.GetRowValues(e.VisibleIndex, "AssInvRegNum").ToString();
                    PPD_AssetInvUniqueId.ClientInstanceName = "PPD_AssetInvUniqueId" + e.VisibleIndex.ToString();
                    PPD_AssetInvUniqueId.NavigateUrl = "javascript: RemoveAssetInv('" + e.CellValue.ToString() + "','" + AssInvRegNum + "');";
                }
            }
        }

        protected void SearchDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (PP_CreatedByEmpId.Text == "")
                e.Cancel = true;
            else
                e.Command.Parameters["@EmpId"].Value = PP_CreatedByEmpId.Text;
        }

        protected void GridSearchAssetInv_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearchAssetInv.DataBind();
        }

        protected void GridSearchAssetInv_AfterPerformCallback(object sender, DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            if (e.CallbackName == "CUSTOMCALLBACK")
            {
                if (GridList.VisibleRowCount > 0)
                {
                    DataTable Dt = new DataTable();
                    DataColumn PPPD_AssetInvUniqueId = Dt.Columns.Add("PPPD_AssetInvUniqueId", typeof(String));
                    Dt.AcceptChanges();

                    for (int i = 0; i < GridList.VisibleRowCount; i++)
                    {
                        DataRow Dr = Dt.NewRow();
                        Dr["PPPD_AssetInvUniqueId"] = GridList.GetRowValues(i, "PPD_AssetInvUniqueId").ToString();
                        Dt.Rows.Add(Dr);
                    }

                    Dt.AcceptChanges();

                    string AssetInvUniqueId = string.Empty;

                    for (int x = 0; x < Dt.Rows.Count; x++)
                    {
                        AssetInvUniqueId = Dt.Rows[x]["PPPD_AssetInvUniqueId"].ToString();

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

        void FormHeaderTVP(ref DataTable Dt)
        {
            DataColumn PP_ProcessId = Dt.Columns.Add("PP_ProcessId", typeof(String));
            DataColumn PP_Revision = Dt.Columns.Add("PP_Revision", typeof(Int32));
            DataColumn PP_RefNumber = Dt.Columns.Add("PP_RefNumber", typeof(String));
            DataColumn PP_CreatedByEmpId = Dt.Columns.Add("PP_CreatedByEmpId", typeof(String));
            DataColumn PP_LastModDate = Dt.Columns.Add("PP_LastModDate", typeof(DateTime));
            DataColumn PP_Purpose = Dt.Columns.Add("PP_Purpose", typeof(String));
            DataColumn PP_Status = Dt.Columns.Add("PP_Status", typeof(Int32));
            DataColumn PP_AssetOfficerSystemId_Approval = Dt.Columns.Add("PP_AssetOfficerSystemId_Approval", typeof(Int32));
            DataColumn PP_ApprovalDate = Dt.Columns.Add("PP_ApprovalDate", typeof(DateTime));
            DataColumn PP_AssetOfficerSystemId_TakeOut = Dt.Columns.Add("PP_AssetOfficerSystemId_TakeOut", typeof(Int32));
            DataColumn PP_TakeOutDate = Dt.Columns.Add("PP_TakeOutDate", typeof(DateTime));
            DataColumn PP_AssetOfficerSystemId_Return = Dt.Columns.Add("PP_AssetOfficerSystemId_Return", typeof(Int32));
            DataColumn PP_ReturnDate = Dt.Columns.Add("PP_ReturnDate", typeof(DateTime));
            Dt.AcceptChanges();
        }

        void PopulateHeaderTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["PP_ProcessId"] = PP_ProcessId.Text;
            Dr["PP_Revision"] = Convert.ToInt32(PP_Revision.Text);
            Dr["PP_RefNumber"] = PP_RefNumber.Text;
            Dr["PP_CreatedByEmpId"] = PP_CreatedByEmpId.Text;
            Dr["PP_LastModDate"] = DateTime.Today;
            Dr["PP_Purpose"] = PP_Purpose.Text.Trim();
            Dr["PP_Status"] = Convert.ToInt32(PP_Status.Text);
            Dr["PP_AssetOfficerSystemId_Approval"] = DBNull.Value;
            Dr["PP_ApprovalDate"] = DBNull.Value;
            Dr["PP_AssetOfficerSystemId_TakeOut"] = DBNull.Value;
            Dr["PP_TakeOutDate"] = DBNull.Value;
            Dr["PP_AssetOfficerSystemId_Return"] = DBNull.Value;
            Dr["PP_ReturnDate"] = DBNull.Value;
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void FormDetailTVP(ref DataTable Dt)
        {
            DataColumn PPD_ProcessId = Dt.Columns.Add("PPD_ProcessId", typeof(String));
            DataColumn PPD_Revision = Dt.Columns.Add("PPD_Revision", typeof(Int32));
            DataColumn PPD_AssetType = Dt.Columns.Add("PPD_AssetType", typeof(Int32));
            DataColumn PPD_AssetInvUniqueId = Dt.Columns.Add("PPD_AssetInvUniqueId", typeof(String));
            DataColumn PPD_OriPtj = Dt.Columns.Add("PPD_OriPtj", typeof(Int32));
            DataColumn PPD_OriDept = Dt.Columns.Add("PPD_OriDept", typeof(Int32));
            DataColumn PPD_OriBuild = Dt.Columns.Add("PPD_OriBuild", typeof(Int32));
            DataColumn PPD_OriFloor = Dt.Columns.Add("PPD_OriFloor", typeof(Int32));
            DataColumn PPD_OriSpace = Dt.Columns.Add("PPD_OriSpace", typeof(Int32));
            DataColumn PPD_OriEmpId = Dt.Columns.Add("PPD_OriEmpId", typeof(String));
            DataColumn PPD_ReturnStatus = Dt.Columns.Add("PPD_ReturnStatus", typeof(Int32));
            DataColumn PPD_ReturnNotes = Dt.Columns.Add("PPD_ReturnNotes", typeof(String));
            DataColumn PTJ_Name = Dt.Columns.Add("PTJ_Name", typeof(String));
            DataColumn Dept_Name = Dt.Columns.Add("Dept_Name", typeof(String));
            DataColumn Build_Name = Dt.Columns.Add("Build_Name", typeof(String));
            DataColumn Floor_Name = Dt.Columns.Add("Floor_Name", typeof(String));
            DataColumn Space_Name = Dt.Columns.Add("Space_Name", typeof(String));
            DataColumn EmployeeName = Dt.Columns.Add("EmployeeName", typeof(String));
            DataColumn AssInvRegNum = Dt.Columns.Add("AssInvRegNum", typeof(String));
            DataColumn AssInvDesc = Dt.Columns.Add("AssInvDesc", typeof(String));
     
            Dt.AcceptChanges();
        }

        void PopulateDetailTVP(ref DataTable Dt)
        {
            for (int x = 0; x < GridList.VisibleRowCount; x++)
            {
                DataRow Dr = Dt.NewRow();

                if (PP_ProcessId.Text == "")
                    Dr["PPD_ProcessId"] = DBNull.Value;
                else
                    Dr["PPD_ProcessId"] = PP_ProcessId.Text;

                if (PP_Revision.Text == "")
                    Dr["PPD_Revision"] = DBNull.Value;
                else
                    Dr["PPD_Revision"] = Convert.ToInt32(PP_Revision.Text);

                Dr["PPD_AssetType"] = Convert.ToInt32(GridList.GetRowValues(x, "PPD_AssetType"));
                Dr["PPD_AssetInvUniqueId"] = GridList.GetRowValues(x, "PPD_AssetInvUniqueId").ToString();
                Dr["PPD_OriPtj"] = Convert.ToInt32(GridList.GetRowValues(x, "PPD_OriPtj"));
                Dr["PPD_OriDept"] = Convert.ToInt32(GridList.GetRowValues(x, "PPD_OriDept"));
                Dr["PPD_OriBuild"] = Convert.ToInt32(GridList.GetRowValues(x, "PPD_OriBuild"));
                Dr["PPD_OriFloor"] = Convert.ToInt32(GridList.GetRowValues(x, "PPD_OriFloor"));
                Dr["PPD_OriSpace"] = Convert.ToInt32(GridList.GetRowValues(x, "PPD_OriSpace"));
                Dr["PPD_OriEmpId"] = GridList.GetRowValues(x, "PPD_OriEmpId").ToString();
                Dr["PTJ_Name"] = GridList.GetRowValues(x, "PTJ_Name").ToString();
                Dr["Dept_Name"] = GridList.GetRowValues(x, "Dept_Name").ToString();
                Dr["Build_Name"] = GridList.GetRowValues(x, "Build_Name").ToString();
                Dr["Floor_Name"] = GridList.GetRowValues(x, "Floor_Name").ToString();
                Dr["Space_Name"] = GridList.GetRowValues(x, "Space_Name").ToString();
                Dr["EmployeeName"] = GridList.GetRowValues(x, "EmployeeName").ToString();
                Dr["AssInvRegNum"] = GridList.GetRowValues(x, "AssInvRegNum").ToString();
                Dr["AssInvDesc"] = GridList.GetRowValues(x, "AssInvDesc").ToString();
                Dr["PPD_ReturnStatus"] = DBNull.Value;
                Dr["PPD_ReturnNotes"] = DBNull.Value;
                Dt.Rows.Add(Dr);
            }

            Dt.AcceptChanges();
        }

        void TrimDetailTVP(ref DataTable Dt)
        {
            Dt.Columns.Remove("PTJ_Name");
            Dt.Columns.Remove("Dept_Name");
            Dt.Columns.Remove("Build_Name");
            Dt.Columns.Remove("Floor_Name");
            Dt.Columns.Remove("Space_Name");
            Dt.Columns.Remove("EmployeeName");
            Dt.Columns.Remove("AssInvRegNum");
            Dt.Columns.Remove("AssInvDesc");
            Dt.AcceptChanges();
        }

        protected void cbp_Permohonan_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_Permohonan.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {
                    case "ADD": AddMode(ticket.Name); break;
                    case "ASSETINVSELECTED": AddAssetMode(); break;
                    case "DELETEASSETINV": DeleteItemMode(); break;
                    case "SAVE": SavePost(ticket.Name, 0); break;
                    case "POST": SavePost(ticket.Name, 1); break;
                    case "LOAD": LoadMode(); break;
                }
            }
            else
            { cbp_Permohonan.JSProperties["cpErrMsg"] = "Session Expired."; }
        }

        void AddMode(string CurrUser)
        {
            DataTable Dt = new DataTable();
            DataTable DtUser = new DataTable();

            try
            {
                string ProcessId = DateTime.Now.ToString("yyMMdd-HHmmss");
                string DbError = PinjamanMethods.SP_PermohonanPinjaman_CreateNewEntry(ProcessId, CurrUser);

                if (DbError == string.Empty)
                {
                    PinjamanMethods.SP_PermohonanPinjaman_GetCreatorInfo(CurrUser, ref DtUser);

                    if (DtUser.Rows.Count == 1)
                    {
                        //form
                        EmployeeName.Text = DtUser.Rows[0]["EmployeeName"].ToString();
                        EmployeeEmail.Text = DtUser.Rows[0]["EmployeeEmail"].ToString();
                        PP_ProcessId.Text = ProcessId;
                        PP_CreatedByEmpId.Text = DtUser.Rows[0]["EmployeeId"].ToString();
                        EmployeePTJ.Text = DtUser.Rows[0]["EmployeePTJ"].ToString();
                        EmployeeTelephone.Text = DtUser.Rows[0]["EmployeeTelephone"].ToString();
                        PP_RefNumber.Text = "";
                        PP_Status.Text = "2";
                        PP_Revision.Text = "1";
                        PP_ProcessId.Text = ProcessId;
                        PP_Purpose.Text = "";

                        //grid
                        FormDetailTVP(ref Dt);
                        BindGridList(ref Dt);

                        cbp_Permohonan.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        cbp_Permohonan.JSProperties["cpErrMsg"] = "Sistem tidak dapat mengenalpasti identiti pengguna semasa.<br>Sila cuba semula sebentar lagi.";
                    }
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Permohonan.JSProperties["cpErrMsg"] = errMsg + " " + DbError;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Permohonan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { }
        }

        void AddAssetMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormDetailTVP(ref Dt);

                for (int i = 0; i < GridSearchAssetInv.VisibleRowCount; i++)
                {
                    if (GridSearchAssetInv.Selection.IsRowSelected(i))
                    {
                        DataRow Dr = Dt.NewRow();
                        if (PP_ProcessId.Text == "")
                            Dr["PPD_ProcessId"] = DBNull.Value;
                        else
                            Dr["PPD_ProcessId"] = PP_ProcessId.Text;

                        if (PP_Revision.Text == "")
                            Dr["PPD_Revision"] = DBNull.Value;
                        else
                            Dr["PPD_Revision"] = Convert.ToInt32(PP_Revision.Text);
                                                
                        Dr["EmployeeName"] = GridSearchAssetInv.GetRowValues(i, "EmployeeName").ToString();
                        Dr["PTJ_Name"] = GridSearchAssetInv.GetRowValues(i, "PTJ_Name").ToString();
                        Dr["Dept_Name"] = GridSearchAssetInv.GetRowValues(i, "Dept_Name").ToString();
                        Dr["Build_Name"] = GridSearchAssetInv.GetRowValues(i, "Build_Name").ToString();
                        Dr["Floor_Name"] = GridSearchAssetInv.GetRowValues(i, "Floor_Name").ToString();
                        Dr["Space_Name"] = GridSearchAssetInv.GetRowValues(i, "Space_Name").ToString();
                        Dr["PPD_OriEmpId"] = GridSearchAssetInv.GetRowValues(i, "PH_EmpId").ToString();
                        Dr["PPD_OriPtj"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(i, "PH_PtjId"));
                        Dr["PPD_OriDept"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(i, "PH_DeptId"));
                        Dr["PPD_OriBuild"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(i, "PH_BuildId"));
                        Dr["PPD_OriFloor"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(i, "PH_FloorId"));
                        Dr["PPD_OriSpace"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(i, "PH_SpaceID"));
                        Dr["PPD_AssetInvUniqueId"] = GridSearchAssetInv.GetRowValues(i, "AssInvUniqueId").ToString();
                        Dr["PPD_AssetType"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(i, "AssetInvType"));
                        Dr["PPD_ReturnStatus"] = DBNull.Value;
                        Dr["PPD_ReturnNotes"] = DBNull.Value;
                        Dr["AssInvRegNum"] = GridSearchAssetInv.GetRowValues(i, "AssInvRegNum").ToString();
                        Dr["AssInvDesc"] = GridSearchAssetInv.GetRowValues(i, "AssInvDesc").ToString();
                        Dt.Rows.Add(Dr);
                    }
                }

                Dt.AcceptChanges();
                BindGridList(ref Dt);
                cbp_Permohonan.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Permohonan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void DeleteItemMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormDetailTVP(ref Dt);
                PopulateDetailTVP(ref Dt);

                DataRow[] Drs = Dt.Select("PPD_AssetInvUniqueId = '"+ TempDelete.Text+"'");

                if (Drs.Length == 1)
                    Dt.Rows.Remove(Drs[0]);

                Dt.AcceptChanges();
                BindGridList(ref Dt);
                cbp_Permohonan.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Permohonan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void SavePost(string CurrUser, int Post)
        {
            DataTable HeaderDt = new DataTable();
            DataTable DetailDt = new DataTable();

            try
            {
                FormHeaderTVP(ref HeaderDt);
                PopulateHeaderTVP(ref HeaderDt);
                FormDetailTVP(ref DetailDt);
                PopulateDetailTVP(ref DetailDt);
                TrimDetailTVP(ref DetailDt);

                string DbErr = PinjamanMethods.SP_PermohonanPinjaman_SavePost(CurrUser, ref HeaderDt, ref DetailDt, Post);

                if (DbErr == string.Empty)
                {
                    cbp_Permohonan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Permohonan.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Permohonan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { HeaderDt.Dispose(); DetailDt.Dispose(); }
        }

        void LoadMode()
        {
            DataSet Ds = new DataSet();
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = PinjamanMethods.SP_PermohonanPinjaman_Load(PP_ProcessId.Text, PP_Revision.Text, ref Ds);

                if (DbErr == string.Empty)
                {
                    EmployeeName.Text = Ds.Tables[0].Rows[0]["EmployeeName"].ToString();
                    EmployeeEmail.Text = Ds.Tables[0].Rows[0]["EmployeeEmail"].ToString();
                    PP_CreatedByEmpId.Text = Ds.Tables[0].Rows[0]["PP_CreatedByEmpId"].ToString();
                    EmployeePTJ.Text = Ds.Tables[0].Rows[0]["EmployeePTJ"].ToString();
                    EmployeeTelephone.Text = Ds.Tables[0].Rows[0]["EmployeeTelephone"].ToString();
                    PP_RefNumber.Text = Ds.Tables[0].Rows[0]["PP_RefNumber"].ToString();
                    PP_Status.Text = Ds.Tables[0].Rows[0]["PP_Status"].ToString();
                    PP_Revision.Text = Ds.Tables[0].Rows[0]["PP_Revision"].ToString();
                    PP_Purpose.Text = Ds.Tables[0].Rows[0]["PP_Purpose"].ToString();

                    Dt = Ds.Tables[1].Copy();
                    BindGridList(ref Dt);

                    cbp_Permohonan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Permohonan.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Permohonan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Ds.Dispose(); }
        }

        void BindGridList(ref DataTable Dt)
        {
            GridList.DataSource = Dt;
            GridList.KeyFieldName = "PPD_AssetInvUniqueId";
            GridList.DataBind();

        }

        protected void cbp_Workflow_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                try
                {
                    string WfCount = string.Empty;
                    PinjamanMethods.SP_PermohonanPinjaman_CheckWorkflowAvailability(PP_ProcessId.Text, ticket.Name, ref WfCount);
                    txtWorkflowCount.Text = WfCount;
                    cbp_Workflow.JSProperties["cpErrMsg"] = string.Empty;
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Workflow.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }              
            }
            else
                cbp_Workflow.JSProperties["cpErrMsg"] = "Session Expired.";           
        }
    }
}