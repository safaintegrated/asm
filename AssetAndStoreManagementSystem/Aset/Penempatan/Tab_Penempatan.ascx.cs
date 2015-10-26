using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.Configuration;
using DevExpress.Web;
using Core.Aset.Penempatan;
using Core.Email;

namespace AssetAndStoreManagementSystem.Aset.Penempatan
{
    public partial class Tab_Penempatan : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void cbp_Penempatan_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_Penempatan.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "ADD": PenempatanAddMode(); break;
                case "ADDDETAIL": AddDetail(); break;
                case "DELETEDETAIL": DeleteDetail(); break;
                case "REFRESH": RefreshDetail(); break;
                case "LOAD": LoadMode(); break;
                case "SAVE": SavePostMode(0); break;
                case "POST": SavePostMode(1); break;
                case "CANCEL": CancelMode(); break;

            }
        }

        void PenempatanAddMode()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();
                DataTable Dlist = new DataTable();

                try
                {
                    string err = PenempatanMethods.GetCreatorInfo(ref Dt, ticket.Name);

                    if (err == "")
                    {
                        if (Dt.Rows.Count == 1)
                        {
                            EmployeeName.Text = Dt.Rows[0]["User_Salutation"].ToString();
                            EmployeeEmail.Text = Dt.Rows[0]["User_EmailAddress"].ToString();
                            PTJ_Name.Text = Dt.Rows[0]["PTJ_FullName"].ToString();
                            EmployeeTelephone.Text = Dt.Rows[0]["User_Handphone"].ToString();
                            PH_CreatedBy.Text = ticket.Name;
                            PH_CreatedDate.Date = DateTime.Today;
                            PH_ProcessId.Text = DateTime.Now.ToString("ddMMyyyy-HHmmss");
                            PH_Status.Text = "2";
                            PH_StatusText.Text = "Belum Dihantar";

                            PH_PtjId.Value = DBNull.Value;
                            PH_DeptId.Value = DBNull.Value;
                            PH_BuildId.Value = DBNull.Value;
                            PH_FloorId.Value = DBNull.Value;
                            PH_SpaceID.Value = DBNull.Value;
                            PH_EmpId.Value = DBNull.Value;

                            FormDetailTVP(ref Dlist);
                            BindPenempatanGrid(ref Dlist);

                            cbp_Penempatan.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        {
                            string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                            errMsg = errMsg.Replace("BR", "<br><br>");
                            cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " Maklumat anda tidak dapat dicapai.";
                        }
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
                finally
                { Dt.Dispose(); Dlist.Dispose(); }
            }
            else
            { cbp_Penempatan.JSProperties["cpErrMsg"] = "Session Expired."; }
        }

        void AddDetail()
        {
            DataTable Dt = new DataTable();

            try
            {
                if (GridSearchAssetInv.Selection.Count > 0)
                {
                    FormDetailTVP(ref Dt);

                    for (int x = 0; x < GridSearchAssetInv.VisibleRowCount; x++)
                    {
                        if (GridSearchAssetInv.Selection.IsRowSelected(x))
                        {
                            DataRow Dr = Dt.NewRow();
                            Dr["PD_ProcessId"] = PH_ProcessId.Text;
                            Dr["PD_AssetType"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(x, "AssetInvType"));
                            Dr["PD_AssetInvUniqueId"] = GridSearchAssetInv.GetRowValues(x, "AssInvUniqueId").ToString();
                            Dr["PD_OriPtj"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(x, "PH_PtjId"));
                            Dr["PD_OriDept"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(x, "PH_DeptId"));
                            Dr["PD_OriBuild"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(x, "PH_BuildId"));
                            Dr["PD_OriFloor"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(x, "PH_FloorId"));
                            Dr["PD_OriSpace"] = Convert.ToInt32(GridSearchAssetInv.GetRowValues(x, "PH_SpaceID"));
                            Dr["PD_OriEmpId"] = GridSearchAssetInv.GetRowValues(x, "PH_EmpId").ToString();
                            Dr["PTJ_Name"] = GridSearchAssetInv.GetRowValues(x, "PTJ_Name").ToString();
                            Dr["Dept_Name"] = GridSearchAssetInv.GetRowValues(x, "Dept_Name").ToString();
                            Dr["Build_Name"] = GridSearchAssetInv.GetRowValues(x, "Build_Name").ToString();
                            Dr["Floor_Name"] = GridSearchAssetInv.GetRowValues(x, "Floor_Name").ToString();
                            Dr["Space_Name"] = GridSearchAssetInv.GetRowValues(x, "Space_Name").ToString();
                            Dr["EmployeeName"] = GridSearchAssetInv.GetRowValues(x, "EmployeeName").ToString();
                            Dr["AssInvRegNum"] = GridSearchAssetInv.GetRowValues(x, "AssInvRegNum").ToString();
                            Dr["AssInvDesc"] = GridSearchAssetInv.GetRowValues(x, "AssInvDesc").ToString();
                            Dt.Rows.Add(Dr);
                        }
                    }                   
                }

                Dt.AcceptChanges();
                BindPenempatanGrid(ref Dt);
                cbp_Penempatan.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void DeleteDetail()
        {
            DataTable Dt = new DataTable();

            try
            {
                FormDetailTVP(ref Dt);
                PopulateDetailTVP(ref Dt);

                DataRow[] drs = Dt.Select("PD_AssetInvUniqueId = '"+ TempDeleteId.Text+"'");

                if (drs.Length == 1)
                    Dt.Rows.Remove(drs[0]);                    
                
                Dt.AcceptChanges();
                BindPenempatanGrid(ref Dt);
                cbp_Penempatan.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void RefreshDetail()
        {
            DataTable Dt = new DataTable();
            DataTable ReturnDt = new DataTable();

            try
            {
                FormDetailTVP(ref Dt);
                PopulateDetailTVP(ref Dt);
                TrimDetailTVP(ref Dt);

                string err = PenempatanMethods.SP_Penempatan_RefreshDetailLocations(ref Dt, ref ReturnDt);

                if (err == "")
                {
                    BindPenempatanGrid(ref ReturnDt);
                    cbp_Penempatan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); ReturnDt.Dispose(); }
        }

        void LoadMode()
        {
            DataTable HeaderDt = new DataTable();
            DataTable DetailDt = new DataTable();

            try
            {
                string err = PenempatanMethods.V_PenempatanHeader(PH_ProcessId.Text, ref HeaderDt);

                if (err == "")
                {
                    if (HeaderDt.Rows.Count == 1)
                    {
                        PH_ProcessId.Text = HeaderDt.Rows[0]["PH_ProcessId"].ToString();
	                    PH_CreatedBy.Text = HeaderDt.Rows[0]["PH_CreatedBy"].ToString();
	                    PH_CreatedDate.Date = Convert.ToDateTime(HeaderDt.Rows[0]["PH_CreatedDate"]);
	                    PH_RefNumber.Text = HeaderDt.Rows[0]["PH_RefNumber"].ToString();

                        if (HeaderDt.Rows[0]["PH_PtjId"].ToString() != "")
                            PH_PtjId.Value = HeaderDt.Rows[0]["PH_PtjId"].ToString();
                        else
                            PH_PtjId.Value = DBNull.Value;

                        if(HeaderDt.Rows[0]["PH_DeptId"].ToString() != "")
                            PH_DeptId.Value = Convert.ToInt32(HeaderDt.Rows[0]["PH_DeptId"]);
                        else
                            PH_DeptId.Value = DBNull.Value;

                         if(HeaderDt.Rows[0]["PH_BuildId"].ToString() != "")
                             PH_BuildId.Value = Convert.ToInt32(HeaderDt.Rows[0]["PH_BuildId"]);
                        else
                            PH_BuildId.Value = DBNull.Value;

                        if(HeaderDt.Rows[0]["PH_FloorId"].ToString() != "")
                            PH_FloorId.Value = Convert.ToInt32(HeaderDt.Rows[0]["PH_FloorId"]);
                        else
                            PH_FloorId.Value = DBNull.Value;

                         if(HeaderDt.Rows[0]["PH_SpaceID"].ToString() != "")
                             PH_SpaceID.Value = Convert.ToInt32(HeaderDt.Rows[0]["PH_SpaceID"]);
                        else
                            PH_SpaceID.Value = DBNull.Value;

                        if(HeaderDt.Rows[0]["PH_EmpId"].ToString() != "")
                            PH_EmpId.Value = HeaderDt.Rows[0]["PH_EmpId"].ToString();
                        else
                            PH_EmpId.Value = DBNull.Value;

	                    PH_Status.Text = HeaderDt.Rows[0]["PH_Status"].ToString();
                        EmployeeName.Text = HeaderDt.Rows[0]["EmployeeName"].ToString();
                        EmployeeEmail.Text = HeaderDt.Rows[0]["EmployeeEmail"].ToString();
                        PTJ_Name.Text = HeaderDt.Rows[0]["PTJ_Name"].ToString();
                        EmployeeTelephone.Text = HeaderDt.Rows[0]["EmployeeTelephone"].ToString();
                        PH_StatusText.Text = HeaderDt.Rows[0]["PH_StatusText"].ToString();

                        PenempatanMethods.SP_Penempatan_LoadDetails(PH_ProcessId.Text, ref DetailDt);
                        BindPenempatanGrid(ref DetailDt);
                    }
                    else
                    {
                        PH_ProcessId.Text = "";
                        PH_CreatedBy.Text = "";
                        PH_CreatedDate.Value = DBNull.Value;
                        PH_RefNumber.Text = "";                                                
                        PH_PtjId.Value = DBNull.Value;
                        PH_DeptId.Value = DBNull.Value;
                        PH_BuildId.Value = DBNull.Value;
                        PH_FloorId.Value = DBNull.Value;
                        PH_SpaceID.Value = DBNull.Value;
                        PH_EmpId.Value = DBNull.Value;
                        PH_Status.Text = "";
                        EmployeeName.Text = "";
                        EmployeeEmail.Text = "";
                        PTJ_Name.Text = "";
                        EmployeeTelephone.Text = "";
                        PH_StatusText.Text = "";

                        FormDetailTVP(ref DetailDt);
                        BindPenempatanGrid(ref DetailDt);
                    }
                   
                    cbp_Penempatan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { HeaderDt.Dispose(); DetailDt.Dispose(); }
        }

        void SavePostMode(int Post)
        {
            DataTable HeaderDt = new DataTable();
            DataTable DetailDt = new DataTable();

            try
            {
                FormHeaderTVP(ref HeaderDt);
                FormDetailTVP(ref DetailDt);
                PopulateHeaderTVP(ref HeaderDt);
                PopulateDetailTVP(ref DetailDt);
                TrimDetailTVP(ref DetailDt);

                string err = PenempatanMethods.SP_Penempatan_SaveSubmit(ref HeaderDt, ref DetailDt, Post);

                if (err == "")
                {
                    if (Post == 1)
                    {                        
                        DetailDt.Columns.Clear();
                        DetailDt.Clear();
                        FormDetailTVP(ref DetailDt);
                        PopulateDetailTVP(ref DetailDt);

                        err = SendMail.Penempatan_NotifyReceipient(ref DetailDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), PH_EmpId.GridView.GetRowValues(PH_EmpId.GridView.FocusedRowIndex, "User_Salutation").ToString(), PH_EmpId.GridView.GetRowValues(PH_EmpId.GridView.FocusedRowIndex, "User_EmailAddress").ToString());

                        if (err == "")
                        { cbp_Penempatan.JSProperties["cpErrMsg"] = string.Empty; }
                        else
                        {
                            string errMsg = "Rekod penempatan telah berjaya dihantar tetapi sistem menghadapi masalah ketika menghantar emel pemberitahuan.<br>Masalah: ";
                            cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                        }                       
                    }

                   cbp_Penempatan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { HeaderDt.Dispose(); DetailDt.Dispose(); }
        }

        void CancelMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                //Grid Listing
                FormDetailTVP(ref Dt);
                BindPenempatanGrid(ref Dt);

                //form header
                PH_ProcessId.Text = "";
                PH_CreatedBy.Text = "";
                PH_CreatedDate.Value = DBNull.Value;
                PH_RefNumber.Text = "";
                PH_PtjId.Value = DBNull.Value;
                PH_DeptId.Value = DBNull.Value;
                PH_BuildId.Value = DBNull.Value;
                PH_FloorId.Value = DBNull.Value;
                PH_SpaceID.Value = DBNull.Value;
                PH_EmpId.Value = DBNull.Value;
                PH_Status.Text = "";
                EmployeeName.Text = "";
                EmployeeEmail.Text = "";
                PTJ_Name.Text = "";
                EmployeeTelephone.Text = "";
                PH_StatusText.Text = "";

                cbp_Penempatan.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_Penempatan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        
        }

        void BindPenempatanGrid(ref DataTable Dt)
        {
            DataView Dv = Dt.DefaultView;
            Dv.Sort = "AssInvRegNum ASC";

            GridPenempatanList.DataSource = Dv;
            GridPenempatanList.KeyFieldName = "PD_AssetInvUniqueId";
            GridPenempatanList.DataBind();
        }

        void FormDetailTVP(ref DataTable Dt)
        {
            DataColumn PD_ProcessId = Dt.Columns.Add("PD_ProcessId", typeof(String));
            DataColumn PD_AssetType = Dt.Columns.Add("PD_AssetType", typeof(Int32));
            DataColumn PD_AssetInvUniqueId = Dt.Columns.Add("PD_AssetInvUniqueId", typeof(String));
            DataColumn PD_OriPtj = Dt.Columns.Add("PD_OriPtj", typeof(Int32));
            DataColumn PD_OriDept = Dt.Columns.Add("PD_OriDept", typeof(Int32));
            DataColumn PD_OriBuild = Dt.Columns.Add("PD_OriBuild", typeof(Int32));
            DataColumn PD_OriFloor = Dt.Columns.Add("PD_OriFloor", typeof(Int32));
            DataColumn PD_OriSpace = Dt.Columns.Add("PD_OriSpace", typeof(Int32));
            DataColumn PD_OriEmpId = Dt.Columns.Add("PD_OriEmpId", typeof(String));
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
            for (int x = 0; x < GridPenempatanList.VisibleRowCount; x++)
            {
                DataRow Dr = Dt.NewRow();
                Dr["PD_ProcessId"] = PH_ProcessId.Text;
                Dr["PD_AssetType"] = Convert.ToInt32(GridPenempatanList.GetRowValues(x, "PD_AssetType"));
                Dr["PD_AssetInvUniqueId"] = GridPenempatanList.GetRowValues(x, "PD_AssetInvUniqueId").ToString();
                Dr["PD_OriPtj"] = Convert.ToInt32(GridPenempatanList.GetRowValues(x, "PD_OriPtj"));
                Dr["PD_OriDept"] = Convert.ToInt32(GridPenempatanList.GetRowValues(x, "PD_OriDept"));
                Dr["PD_OriBuild"] = Convert.ToInt32(GridPenempatanList.GetRowValues(x, "PD_OriBuild"));
                Dr["PD_OriFloor"] = Convert.ToInt32(GridPenempatanList.GetRowValues(x, "PD_OriFloor"));
                Dr["PD_OriSpace"] = Convert.ToInt32(GridPenempatanList.GetRowValues(x, "PD_OriSpace"));
                Dr["PD_OriEmpId"] = GridPenempatanList.GetRowValues(x, "PD_OriEmpId").ToString();
                Dr["PTJ_Name"] = GridPenempatanList.GetRowValues(x, "PTJ_Name").ToString();
                Dr["Dept_Name"] = GridPenempatanList.GetRowValues(x, "Dept_Name").ToString();
                Dr["Build_Name"] = GridPenempatanList.GetRowValues(x, "Build_Name").ToString();
                Dr["Floor_Name"] = GridPenempatanList.GetRowValues(x, "Floor_Name").ToString();
                Dr["Space_Name"] = GridPenempatanList.GetRowValues(x, "Space_Name").ToString();
                Dr["EmployeeName"] = GridPenempatanList.GetRowValues(x, "EmployeeName").ToString();
                Dr["AssInvRegNum"] = GridPenempatanList.GetRowValues(x, "AssInvRegNum").ToString();
                Dr["AssInvDesc"] = GridPenempatanList.GetRowValues(x, "AssInvDesc").ToString();
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

        void FormHeaderTVP(ref DataTable Dt)
        {
            DataColumn PH_ProcessId = Dt.Columns.Add("PH_ProcessId", typeof(String));
            DataColumn PH_CreatedBy = Dt.Columns.Add("PH_CreatedBy", typeof(Int32));
            DataColumn PH_CreatedDate = Dt.Columns.Add("PH_CreatedDate", typeof(DateTime));
            DataColumn PH_RefNumber = Dt.Columns.Add("PH_RefNumber", typeof(String));
            DataColumn PH_PtjId = Dt.Columns.Add("PH_PtjId", typeof(String));
            DataColumn PH_DeptId = Dt.Columns.Add("PH_DeptId", typeof(Int32));
            DataColumn PH_BuildId = Dt.Columns.Add("PH_BuildId", typeof(Int32));
            DataColumn PH_FloorId = Dt.Columns.Add("PH_FloorId", typeof(Int32));
            DataColumn PH_SpaceID = Dt.Columns.Add("PH_SpaceID", typeof(Int32));
            DataColumn PH_EmpId = Dt.Columns.Add("PH_EmpId", typeof(String));
            DataColumn PH_Status = Dt.Columns.Add("PH_Status", typeof(Int32));
            Dt.AcceptChanges();
        }

        void PopulateHeaderTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["PH_ProcessId"] = PH_ProcessId.Text;
            Dr["PH_CreatedBy"] = Convert.ToInt32(PH_CreatedBy.Text);
            Dr["PH_CreatedDate"] = DateTime.Today;

            if (PH_RefNumber.Text != "")
                Dr["PH_RefNumber"] = PH_RefNumber.Text;
            else
                Dr["PH_RefNumber"] = DBNull.Value;

            if (PH_PtjId.GridView.FocusedRowIndex == -1)
                Dr["PH_PtjId"] = DBNull.Value;
            else
                Dr["PH_PtjId"] = PH_PtjId.Value.ToString();

            if (PH_DeptId.GridView.FocusedRowIndex == -1)
                Dr["PH_DeptId"] = DBNull.Value;
            else
                Dr["PH_DeptId"] = Convert.ToInt32(PH_DeptId.Value);

            if (PH_BuildId.GridView.FocusedRowIndex == -1)
                Dr["PH_BuildId"] = DBNull.Value;
            else
                Dr["PH_BuildId"] = Convert.ToInt32(PH_BuildId.Value);

            if (PH_FloorId.GridView.FocusedRowIndex == -1)
                Dr["PH_FloorId"] = DBNull.Value;
            else
                Dr["PH_FloorId"] = Convert.ToInt32(PH_FloorId.Value);

            if (PH_SpaceID.GridView.FocusedRowIndex == -1)
                Dr["PH_SpaceID"] = DBNull.Value;
            else
                Dr["PH_SpaceID"] = Convert.ToInt32(PH_SpaceID.Value);

            if (PH_EmpId.GridView.FocusedRowIndex == -1)
                Dr["PH_EmpId"] = DBNull.Value;
            else
                Dr["PH_EmpId"] = PH_EmpId.Value.ToString();

            Dr["PH_Status"] = Convert.ToInt32(PH_Status.Text);
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        protected void GridSearchAssetInv_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        { 
            GridSearchAssetInv.DataBind();
        }

        protected void GridSearchAssetInv_AfterPerformCallback(object sender, DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            if (e.CallbackName == "CUSTOMCALLBACK")
            {
                if (GridPenempatanList.VisibleRowCount > 0)
                {
                    DataTable Dt = new DataTable();
                    DataColumn PD_AssetInvUniqueId = Dt.Columns.Add("PD_AssetInvUniqueId", typeof(String));
                    Dt.AcceptChanges();

                    for (int i = 0; i < GridPenempatanList.VisibleRowCount; i++)
                    {
                        DataRow Dr = Dt.NewRow();
                        Dr["PD_AssetInvUniqueId"] = GridPenempatanList.GetRowValues(i, "PD_AssetInvUniqueId").ToString();
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

        protected void GridPenempatanList_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "PD_AssetInvUniqueId")
            {
                ASPxHyperLink PD_AssetInvUniqueId = (ASPxHyperLink)GridPenempatanList.FindRowCellTemplateControl(e.VisibleIndex, GridPenempatanList.DataColumns["PD_AssetInvUniqueId"] as GridViewDataColumn, "PD_AssetInvUniqueId");

                if (PD_AssetInvUniqueId != null)
                {
                    string AssInvRegNum = GridPenempatanList.GetRowValues(e.VisibleIndex, "AssInvRegNum").ToString();
                    PD_AssetInvUniqueId.ClientInstanceName = "PD_AssetInvUniqueId" + e.VisibleIndex.ToString();
                    PD_AssetInvUniqueId.NavigateUrl = "javascript: DeleteDetail('" + e.CellValue.ToString() + "','" + AssInvRegNum + "');";
                }
            }
        }

        protected void PH_PtjId_TextChanged(object sender, EventArgs e)
        {

        }

        protected void PH_FloorId_TextChanged(object sender, EventArgs e)
        {

        }

        protected void PH_Status_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ASPxFormLayout1_E1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}