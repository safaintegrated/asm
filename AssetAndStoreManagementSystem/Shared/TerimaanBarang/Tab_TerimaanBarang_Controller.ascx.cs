using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Web.Security;
using System.Configuration;
using System.Data;

using Core.Shared;
using Core.Email;
using Core.PengurusanSistem;

namespace AssetAndStoreManagementSystem.Shared.TerimaanBarang
{
    public partial class Tab_TerimaanBarang_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GRNH_PrNumber_Init(object sender, EventArgs e)
        {
            ASPxGridLookup GRNH_PrNumberLookup = (ASPxGridLookup)sender;
            ASPxGridView GRNH_PrNumberGridView = GRNH_PrNumberLookup.GridView;
            GRNH_PrNumberGridView.CustomCallback += GRNH_PrNumberGridView_CustomCallback;
        }

        void GRNH_PrNumberGridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView GRNH_PrNumberGridView = (ASPxGridView)sender;
            GRNH_PrNumberGridView.DataBind();
        }

        protected void PrDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                if (HeaderMode.Text == "0")
                    e.Cancel = true;
                else
                {
                    e.Command.Parameters["@CurrUser"].Value = Convert.ToInt32(ticket.Name);
                    e.Command.Parameters["@Mode"].Value = Convert.ToInt32(HeaderMode.Text);
                }
            }
            else
                e.Cancel = true;
        }

        protected void cbp_GRN_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_GRN.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {

                switch (e.Parameter)
                {
                    case "NEW": NewMode(); break;
                    case "CHECK": CheckPrNumber(ticket.Name); break;
                    case "LOAD": LoadGRN(); break;
                }
            }
            else
                cbp_GRN.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void NewMode()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                string strProcessId = string.Empty;

                try
                {
                    GRNH_PrNumber.Text = string.Empty;
                    GRNH_SetVen_Name.Text = string.Empty;
                    GRNH_SupplierRef.Text = string.Empty;
                    GRNH_SetVenAddress.Text = string.Empty;
                    GRNH_PackingDetails.Value = string.Empty;
                    GRNH_DeliveryDetails.Text = string.Empty;
                    GRNH_TransportationDetails.Text = string.Empty;
                    GRNH_DeliveryDate.Text = string.Empty;
                   
                    cbp_GRN.JSProperties["cpErrMsg"] = string.Empty;
                }
                catch (Exception err)
                { cbp_GRN.JSProperties["cpErrMsg"] = err.Message; }
            }
            else
                cbp_GRN.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void CheckPrNumber(string CurrUser)
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = TerimaanBarangMethods.SP_GRN_CheckPrNumber(GRNH_PrNumber.Text, CurrUser, ref Dt);

                if (err == string.Empty)
                {
                    GRNH_ProcessId.Text = Dt.Rows[0]["GRNH_ProcessId"].ToString();
                    GRNH_Revision.Text = Dt.Rows[0]["GRNH_Revision"].ToString();
                    GRNH_SetVen_Name.Text = Dt.Rows[0]["GRNH_SetVen_Name"].ToString();
                    GRNH_SetVenAddress.Text = Dt.Rows[0]["GRNH_SetVenAddress"].ToString();
                    GRNH_DeliveryDate.Text = Dt.Rows[0]["GRNH_DeliveryDate"].ToString();
                    GRNH_SupplierRef.Text = Dt.Rows[0]["GRNH_SupplierRef"].ToString();
                    GRNH_Status.Text = Dt.Rows[0]["GRNH_Status"].ToString();
                    GRNH_PackingDetails.Text = Dt.Rows[0]["GRNH_PackingDetails"].ToString();
                    GRNH_DeliveryDetails.Text = Dt.Rows[0]["GRNH_DeliveryDetails"].ToString();
                    GRNH_TransportationDetails.Text = Dt.Rows[0]["GRNH_TransportationDetails"].ToString();
                    GRNH_PtjId.Text = Dt.Rows[0]["GRNH_PtjId"].ToString();

                    cbp_GRN.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_GRN.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_GRN.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        void LoadGRN()
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = TerimaanBarangMethods.SP_GRN_LoadHeader(GRNH_ProcessId.Text, GRNH_Revision.Text, ref Dt);

                if (err == string.Empty)
                {
                    GRNH_ProcessId.Text = Dt.Rows[0]["GRNH_ProcessId"].ToString();
                    GRNH_Revision.Text = Dt.Rows[0]["GRNH_Revision"].ToString();
                    GRNH_SetVen_Name.Text = Dt.Rows[0]["GRNH_SetVen_Name"].ToString();
                    GRNH_SetVenAddress.Text = Dt.Rows[0]["GRNH_SetVenAddress"].ToString();
                    GRNH_DeliveryDate.Text = Dt.Rows[0]["GRNH_DeliveryDate"].ToString();
                    GRNH_SupplierRef.Text = Dt.Rows[0]["GRNH_SupplierRef"].ToString();
                    GRNH_Status.Text = Dt.Rows[0]["GRNH_Status"].ToString();
                    GRNH_PackingDetails.Text = Dt.Rows[0]["GRNH_PackingDetails"].ToString();
                    GRNH_DeliveryDetails.Text = Dt.Rows[0]["GRNH_DeliveryDetails"].ToString();
                    GRNH_TransportationDetails.Text = Dt.Rows[0]["GRNH_TransportationDetails"].ToString();
                    GRNH_PrNumber.Value = Dt.Rows[0]["GRNH_PrNumber"].ToString();
                    GRNH_PtjId.Text = Dt.Rows[0]["GRNH_PtjId"].ToString();
                    cbp_GRN.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_GRN.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_GRN.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        protected void cbp_GrnSavePost_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_GrnSavePost.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt_Header = new DataTable();
                DataTable Dt_Detail = new DataTable();
                DataTable Dt_Wf = new DataTable();

                try
                {
                    FormHeaderTvp(ref Dt_Header);
                    PopulateHeaderTvp(ref Dt_Header);

                    FormDetailTvp(ref Dt_Detail);
                    PopulateDetailTvp(ref Dt_Detail);

                    int Post;
                    if (e.Parameter == "SAVE")
                        Post = 0;
                    else
                        Post = 1;

                    string err = TerimaanBarangMethods.SP_GRN_SavePost(ticket.Name, ref Dt_Header, ref Dt_Detail, Post, ref Dt_Wf);

                    if (err == string.Empty)
                    {
                        if (e.Parameter == "POST")
                        {
                            string ApplicantName = string.Empty;
                            PenggunaSistemMethods.GetSystemUserName(ref ApplicantName, ticket.Name);

                            string EmailErr = SendMail.GRN_NotifyVerfier(ref Dt_Wf, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), ApplicantName);

                            if (EmailErr == string.Empty)
                            {
                                cbp_GrnSavePost.JSProperties["cpErrMsg"] = string.Empty;

                                string cpReceipient = string.Empty;

                                for (int x = 0; x < Dt_Wf.Rows.Count; x++)
                                {
                                    if (cpReceipient != string.Empty)
                                        cpReceipient = cpReceipient + ", ";
                                    else
                                        cpReceipient = cpReceipient + Dt_Wf.Rows[x]["EmployeeName"].ToString();
                                }

                                cbp_GrnSavePost.JSProperties["cpWfReceipient"] = cpReceipient;
                            }
                            else
                            { cbp_GrnSavePost.JSProperties["cpErrMsg"] = "Status Terimaan Barang telah berjaya dikemaskini tetapi email notifikasi kepada Ketua PTJ gagal dihantar.<br>Masalah: " + EmailErr; }
                        }
                        else
                        { cbp_GrnSavePost.JSProperties["cpErrMsg"] = string.Empty; }
                    }
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_GRN.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    }
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_GrnSavePost.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
                finally
                { Dt_Header.Dispose(); Dt_Detail.Dispose(); Dt_Wf.Dispose(); }
            }
            else
                cbp_GrnSavePost.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void FormHeaderTvp(ref DataTable Dt)
        {
            DataColumn GRNH_ProcessId = Dt.Columns.Add("GRNH_ProcessId", typeof(String));
            DataColumn GRNH_Revision = Dt.Columns.Add("GRNH_Revision", typeof(Int32));
            DataColumn GRNH_PrNumber = Dt.Columns.Add("GRNH_PrNumber", typeof(String));
            DataColumn GRNH_PtjId = Dt.Columns.Add("GRNH_PtjId", typeof(String));
            DataColumn GRNH_SetVen_SAGACode = Dt.Columns.Add("GRNH_SetVen_SAGACode", typeof(String));
            DataColumn GRNH_SetVen_Name = Dt.Columns.Add("GRNH_SetVen_Name", typeof(String));
            DataColumn GRNH_SetVenAddress = Dt.Columns.Add("GRNH_SetVenAddress", typeof(String));
            DataColumn GRNH_DeliveryDate = Dt.Columns.Add("GRNH_DeliveryDate", typeof(DateTime));
            DataColumn GRNH_SupplierRef = Dt.Columns.Add("GRNH_SupplierRef", typeof(String));
            DataColumn GRNH_GrnNumber = Dt.Columns.Add("GRNH_GrnNumber", typeof(String));
            DataColumn GRNH_EmpSysId = Dt.Columns.Add("GRNH_EmpSysId", typeof(String));
            DataColumn GRNH_CreatedDate = Dt.Columns.Add("GRNH_CreatedDate", typeof(DateTime));
            DataColumn GRNH_Status = Dt.Columns.Add("GRNH_Status", typeof(Int32));
            DataColumn GRNH_PackingDetails = Dt.Columns.Add("GRNH_PackingDetails", typeof(String));
            DataColumn GRNH_DeliveryDetails = Dt.Columns.Add("GRNH_DeliveryDetails", typeof(String));
            DataColumn GRNH_TransportationDetails = Dt.Columns.Add("GRNH_TransportationDetails", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateHeaderTvp(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["GRNH_ProcessId"] = GRNH_ProcessId.Text;
            Dr["GRNH_Revision"] = Convert.ToInt32(GRNH_Revision.Text);
            Dr["GRNH_PrNumber"] = GRNH_PrNumber.Text;
            Dr["GRNH_PtjId"] = Convert.ToInt32(GRNH_PtjId.Text);
            Dr["GRNH_SetVen_SAGACode"] = DBNull.Value;
            Dr["GRNH_SetVen_Name"] = DBNull.Value;
            Dr["GRNH_SetVenAddress"] = GRNH_SetVenAddress.Text.Trim();
            Dr["GRNH_DeliveryDate"] = GRNH_DeliveryDate.Date;
            Dr["GRNH_SupplierRef"] = GRNH_SupplierRef.Value.ToString().Trim();
            Dr["GRNH_GrnNumber"] = DBNull.Value;
            Dr["GRNH_EmpSysId"] = DBNull.Value;
            Dr["GRNH_CreatedDate"] = DBNull.Value;
            Dr["GRNH_Status"] = DBNull.Value;
            Dr["GRNH_PackingDetails"] = GRNH_PackingDetails.Text.Trim();
            Dr["GRNH_DeliveryDetails"] = GRNH_DeliveryDetails.Text.Trim();
            Dr["GRNH_TransportationDetails"] = GRNH_TransportationDetails.Text.Trim();
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }
        
        void FormDetailTvp(ref DataTable Dt)
        {
            DataColumn GRND_RowId = Dt.Columns.Add("GRND_RowId", typeof(Int32));
            DataColumn GRNH_ProcessId = Dt.Columns.Add("GRNH_ProcessId", typeof(String));
            DataColumn GRNH_Revision = Dt.Columns.Add("GRNH_Revision", typeof(Int32));
            DataColumn GRNH_PrNumber = Dt.Columns.Add("GRNH_PrNumber", typeof(String));
            DataColumn GRND_ItemNumber = Dt.Columns.Add("GRND_ItemNumber", typeof(Int32));
            DataColumn GRND_Type = Dt.Columns.Add("GRND_Type", typeof(String));
            DataColumn GRND_UnitPrice = Dt.Columns.Add("GRND_UnitPrice", typeof(Decimal));
            DataColumn GRND_ReceivedPreviously = Dt.Columns.Add("GRND_ReceivedPreviously", typeof(Int32));
            DataColumn GRND_ReceivedToDate = Dt.Columns.Add("GRND_ReceivedToDate", typeof(Int32));
            DataColumn GRND_Rejected = Dt.Columns.Add("GRND_Rejected", typeof(Int32));
            DataColumn GRND_Maintenance = Dt.Columns.Add("GRND_Maintenance", typeof(Boolean));
            DataColumn GRND_Damagedes = Dt.Columns.Add("GRND_Damagedes", typeof(String));
            DataColumn GRND_Otheres = Dt.Columns.Add("GRND_Otheres", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateDetailTvp(ref DataTable Dt)
        {
            ASPxGridView GV = (ASPxGridView)Tab_SenaraiItem_Controller1.FindControl("GridGrnDetails");

            if (GV != null)
            {
                for (int i = 0; i < GV.VisibleRowCount; i++)
                {
                    ASPxCheckBox chk = (ASPxCheckBox)GV.FindRowCellTemplateControl(i, GV.DataColumns["GRND_RowId"] as GridViewDataColumn, "GRND_RowId");

                    if (chk != null)
                    {
                        if (chk.Checked)
                        {
                            DataRow Dr = Dt.NewRow();

                            Dr["GRND_RowId"] = Convert.ToInt32(GV.GetRowValues(i, "GRND_RowId"));
                            Dr["GRNH_ProcessId"] = GRNH_ProcessId.Text;
                            Dr["GRNH_Revision"] = GRNH_Revision.Text;
                            Dr["GRNH_PrNumber"] = GRNH_PrNumber.Text;
                            Dr["GRND_ItemNumber"] = Convert.ToInt32(GV.GetRowValues(i, "GRND_ItemNumber"));
                            Dr["GRND_Type"] = GV.GetRowValues(i, "GRND_Type").ToString();

                            //GRND_UnitPrice
                            ASPxSpinEdit GRND_UnitPrice = (ASPxSpinEdit)GV.FindRowCellTemplateControl(i, GV.DataColumns["GRND_UnitPrice"] as GridViewDataColumn, "GRND_UnitPrice");

                            if (GRND_UnitPrice != null)
                                Dr["GRND_UnitPrice"] = Convert.ToDecimal(GRND_UnitPrice.Value);
                            else
                                Dr["GRND_UnitPrice"] = 0;

                            Dr["GRND_ReceivedPreviously"] = Convert.ToInt32(GV.GetRowValues(i, "GRND_ReceivedPreviously"));

                            //GRND_ReceivedToDate
                            ASPxSpinEdit GRND_ReceivedToDate = (ASPxSpinEdit)GV.FindRowCellTemplateControl(i, GV.DataColumns["GRND_ReceivedToDate"] as GridViewDataColumn, "GRND_ReceivedToDate");

                            if (GRND_ReceivedToDate != null)
                                Dr["GRND_ReceivedToDate"] = Convert.ToInt32(GRND_ReceivedToDate.Value);
                            else
                                Dr["GRND_ReceivedToDate"] = 0;

                            //GRND_Rejected
                            ASPxSpinEdit GRND_Rejected = (ASPxSpinEdit)GV.FindRowCellTemplateControl(i, GV.DataColumns["GRND_Rejected"] as GridViewDataColumn, "GRND_Rejected");

                            if (GRND_Rejected != null)
                                Dr["GRND_Rejected"] = Convert.ToInt32(GRND_Rejected.Value);
                            else
                                Dr["GRND_Rejected"] = 0;

                            //GRND_Maintenance
                            ASPxCheckBox GRND_Maintenance = (ASPxCheckBox)GV.FindRowCellTemplateControl(i, GV.DataColumns["GRND_Maintenance"] as GridViewDataColumn, "GRND_Maintenance");

                            if (GRND_Maintenance != null)
                                Dr["GRND_Maintenance"] = GRND_Maintenance.Checked;
                            else
                                Dr["GRND_Maintenance"] = false;

                            //GRND_Damagedes
                            ASPxMemo GRND_Damagedes = (ASPxMemo)GV.FindRowCellTemplateControl(i, GV.DataColumns["GRND_Damagedes"] as GridViewDataColumn, "GRND_Damagedes");

                            if (GRND_Damagedes != null)
                                Dr["GRND_Damagedes"] = GRND_Damagedes.Text.Trim();
                            else
                                Dr["GRND_Damagedes"] = "";

                            //GRND_Otheres
                            ASPxMemo GRND_Otheres = (ASPxMemo)GV.FindRowCellTemplateControl(i, GV.DataColumns["GRND_Otheres"] as GridViewDataColumn, "GRND_Otheres");

                            if (GRND_Otheres != null)
                                Dr["GRND_Otheres"] = GRND_Otheres.Text.Trim();
                            else
                                Dr["GRND_Otheres"] = "";

                            Dt.Rows.Add(Dr);
                        }
                    }
                    
                }

                Dt.AcceptChanges();
            }
        }
    }
}