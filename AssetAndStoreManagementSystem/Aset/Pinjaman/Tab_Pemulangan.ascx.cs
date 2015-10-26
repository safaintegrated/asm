using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using DevExpress.Web;
using Core.Common;
using Core.Aset.Pinjaman;
using System.Configuration;

namespace AssetAndStoreManagementSystem.Aset.Pinjaman
{
    public partial class Tab_Pemulangan : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ReturnDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@PPD_ProcessId"].Value = RetProcessId.Text;

            if (RetRevision.Text != "")
                e.Command.Parameters["@PPD_Revision"].Value = Convert.ToInt32(RetRevision.Text);
            else
                e.Command.Parameters["@PPD_Revision"].Value = 0;
        }

        protected void GridReturnList_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "PPD_ReturnNotes": FormTextBox(e.VisibleIndex, e.DataColumn.FieldName,e.CellValue); break;
                case "PPD_ReturnStatus": FormComboBox(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
            }
        }

        void FormTextBox(int VisibleIndex, string Fieldname, object CellValue)
        {
            ASPxTextBox txt = (ASPxTextBox)GridReturnList.FindRowCellTemplateControl(VisibleIndex, GridReturnList.DataColumns[Fieldname] as GridViewDataColumn, Fieldname);

            if (txt != null)
            {
                txt.ClientInstanceName = Fieldname + VisibleIndex.ToString();
                txt.Text = CellValue.ToString();
            }
        }

        void FormComboBox(int VisibleIndex, string Fieldname, object CellValue)
        {
            ASPxComboBox cmb = (ASPxComboBox)GridReturnList.FindRowCellTemplateControl(VisibleIndex, GridReturnList.DataColumns[Fieldname] as GridViewDataColumn, Fieldname);

            if (cmb != null)
            {
                cmb.ClientInstanceName = Fieldname + VisibleIndex.ToString();

                if (CellValue.ToString() != "")
                    cmb.Value = Convert.ToInt32(CellValue);
                else
                    cmb.Value = DBNull.Value;
            }
        }

        protected void GridReturnList_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridReturnList.DataBind();
        }

        protected void cbp_Return_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_Return.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "APPROVE": PemulanganMode(); break;
                case "LOAD": LoadMode(); break;
                case "CHECK": CheckMode(); break;
            }
        }

        void PemulanganMode()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();

                try
                {
                    FormDetailTVP(ref Dt);
                    PopulateDetailTVP(ref Dt);
                    TrimDetailTVP(ref Dt);

                    string AssetOfficerName = string.Empty;
                    string DbErr = PinjamanMethods.SP_PermohonanPinjaman_Pemulangan(ticket.Name, RetProcessId.Text, RetRevision.Text, ref Dt, ref AssetOfficerName);

                    if (DbErr == string.Empty)
                    {
                        TxtAOreturn.Text = AssetOfficerName;
                        DateAOreturn.Date = DateTime.Today;
                        cbp_Return.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_Return.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Return.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
            }
            else
                cbp_Return.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void LoadMode()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();

                try
                {

                    string DbErr = PinjamanMethods.V_PermohonanPinjaman_Header(RetProcessId.Text, RetRevision.Text, ref Dt);

                    if (DbErr == string.Empty)
                    {
                        if (Dt.Rows.Count == 1)
                        {
                            TxtAOreturn.Text = Dt.Rows[0]["PP_AssetOfficerSystemId_ReturnName"].ToString();

                            if (Dt.Rows[0]["PP_ReturnDate"].ToString() != "")
                            { DateAOreturn.Date = Convert.ToDateTime(Dt.Rows[0]["PP_ReturnDate"]); }
                            else
                            { DateAOreturn.Value = DBNull.Value; }

                            chkAOreturn.Checked = true;
                            chkAOreturn.ClientEnabled = false;
                            btnAOreturn.ClientEnabled = false;

                            cbp_Return.JSProperties["cpErrMsg"] = string.Empty;
                        }
                        else
                        {
                            string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                            errMsg = errMsg.Replace("BR", "<br><br>");
                            cbp_Return.JSProperties["cpErrMsg"] = errMsg + " Sistem tidak dapat mengenalpasti rekod yang ingin dibuka.";
                        }
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_Return.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Return.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
            }
            else
                cbp_Return.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void CheckMode()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                string AssetOfficerCount = string.Empty;
                CommonMethods.SP_Common_IsAssetOfficer(ticket.Name, ref AssetOfficerCount);

                if (AssetOfficerCount == "0")
                {
                    chkAOreturn.ClientEnabled = false;
                    btnAOreturn.ClientEnabled = false;
                }
                else
                {
                    chkAOreturn.ClientEnabled = true;
                    btnAOreturn.ClientEnabled = false;
                }

                cbp_Return.JSProperties["cpIsAssetOfficer"] = AssetOfficerCount;

                DataTable Dt = new DataTable();

                string DbErr = PinjamanMethods.V_PermohonanPinjaman_Header(RetProcessId.Text, RetRevision.Text, ref Dt);

                if (DbErr == string.Empty)
                {
                    if (Dt.Rows.Count == 1)
                    {
                        TxtAOreturn.Text = Dt.Rows[0]["PP_AssetOfficerSystemId_ReturnName"].ToString();

                        if (Dt.Rows[0]["PP_ReturnDate"].ToString() != "")
                        { DateAOreturn.Date = Convert.ToDateTime(Dt.Rows[0]["PP_ReturnDate"]); }
                        else
                        { DateAOreturn.Value = DBNull.Value; }

                         cbp_Return.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_Return.JSProperties["cpErrMsg"] = errMsg + " Sistem tidak dapat mengenalpasti rekod yang ingin dibuka.";
                    }
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_Return.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            else
                cbp_Return.JSProperties["cpErrMsg"] = "Session Expired.";
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
            for (int x = 0; x < GridReturnList.VisibleRowCount; x++)
            {
                DataRow Dr = Dt.NewRow();

                if (RetProcessId.Text == "")
                    Dr["PPD_ProcessId"] = DBNull.Value;
                else
                    Dr["PPD_ProcessId"] = RetProcessId.Text;

                if (RetRevision.Text == "")
                    Dr["PPD_Revision"] = DBNull.Value;
                else
                    Dr["PPD_Revision"] = Convert.ToInt32(RetRevision.Text);

                Dr["PPD_AssetType"] = Convert.ToInt32(GridReturnList.GetRowValues(x, "PPD_AssetType"));
                Dr["PPD_AssetInvUniqueId"] = GridReturnList.GetRowValues(x, "PPD_AssetInvUniqueId").ToString();
                Dr["PPD_OriPtj"] = Convert.ToInt32(GridReturnList.GetRowValues(x, "PPD_OriPtj"));
                Dr["PPD_OriDept"] = Convert.ToInt32(GridReturnList.GetRowValues(x, "PPD_OriDept"));
                Dr["PPD_OriBuild"] = Convert.ToInt32(GridReturnList.GetRowValues(x, "PPD_OriBuild"));
                Dr["PPD_OriFloor"] = Convert.ToInt32(GridReturnList.GetRowValues(x, "PPD_OriFloor"));
                Dr["PPD_OriSpace"] = Convert.ToInt32(GridReturnList.GetRowValues(x, "PPD_OriSpace"));
                Dr["PPD_OriEmpId"] = GridReturnList.GetRowValues(x, "PPD_OriEmpId").ToString();

                ASPxComboBox cmb = (ASPxComboBox)GridReturnList.FindRowCellTemplateControl(x, GridReturnList.DataColumns["PPD_ReturnStatus"] as GridViewDataColumn, "PPD_ReturnStatus");

                if (cmb != null)
                    Dr["PPD_ReturnStatus"] = Convert.ToInt32(cmb.Value);
                else
                    Dr["PPD_ReturnStatus"] = DBNull.Value;

                ASPxTextBox txt = (ASPxTextBox)GridReturnList.FindRowCellTemplateControl(x, GridReturnList.DataColumns["PPD_ReturnNotes"] as GridViewDataColumn, "PPD_ReturnNotes");

                if (txt != null)
                { Dr["PPD_ReturnNotes"] = txt.Text.Trim(); }
                else
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
    }
}