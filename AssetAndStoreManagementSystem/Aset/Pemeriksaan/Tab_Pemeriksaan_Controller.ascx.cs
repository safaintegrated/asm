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
using Core.Aset.Pemeriksaan;
using Core.Email;

namespace AssetAndStoreManagementSystem.Aset.Pemeriksaan
{
    public partial class Tab_Pemeriksaan_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_TabPemeriksaan_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_TabPemeriksaan.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {
                    //case "DELETEITEM": DeleteItemMode(); break;
                    case "ADD": AddMode(); break;
                    case "SAVE": SavePostMode(ticket.Name, 0); break;
                    case "POST": SavePostMode(ticket.Name, 1); break;
                    case "ASSETINV": LoadAssetInv(); break;
                    case "LOAD": LoadMode(); break;
                    case "INVESTIGATOR": LoadInvestigator(); break;
                    case "CANCEL": CancelMode(); break;

                }
            }
            else
                cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = "Session Expired";
        }

        void AddMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                //Grid Listing
                FormHeaderTVP(ref Dt);
                BindAssetInvGrid(ref Dt);
                BindInvestigatorGrid(ref Dt);

                //form header
                PEMH_RowId.Value = "";
                PEMH_RefNumber.Text = "";
                PEMH_Name.Text = "";
                PEMH_Desc.Text = "";
                PEMH_StartDate.Value = 0;
                PEMH_EndDate.Value = 0;
                PEMH_LembagaPemeriksaUniqueId.Value = DBNull.Value;
                PEMH_PTJ.Value = DBNull.Value;
                PEMH_Dept.Value = DBNull.Value;
                PEMH_Block.Value = DBNull.Value;
                PEMH_Floor.Value = DBNull.Value;
                PEMH_Space.Value = DBNull.Value;
                PEMH_Status.Text = "";

                cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void SavePostMode(string CurrUser, int Post)
        {
            DataTable Dt = new DataTable();
            DataTable LembagaDt = new DataTable();

            string RowId = string.Empty;
            string RefNumber = string.Empty;

            try
            {
                FormHeaderTVP(ref Dt);
                PopulateHeaderTVP(ref Dt,CurrUser,Post);

                string DbErr = PemeriksaanMethods.SP_Pemeriksaan_SavePost(CurrUser, ref Dt, Post, ref RowId, ref RefNumber);

                if (DbErr == string.Empty)
                {
                    PEMH_RowId.Text = RowId;

                    if (Post == 1)
                    {
                        PEMH_Status.Text = "37";
                        PEMH_RefNumber.Text = RefNumber;
                        ScanInvestigatorGrid(ref LembagaDt);

                        string MailErr = SendMail.Pemeriksaan_NotifyLembagaPemeriksa(ref LembagaDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), PEMH_Name.Text, PEMH_StartDate.Date, PEMH_EndDate.Date, PEMH_RefNumber.Text);

                        if (MailErr == string.Empty)
                        {
                            cbp_TabPemeriksaan.JSProperties["cpMailErr"] = string.Empty;
                        }
                        else
                        {
                            cbp_TabPemeriksaan.JSProperties["cpMailErr"] = "Status rekod Pemeriksaan Aset Alih berjaya dikemaskini tetapi sistem menghadapi masalah ketika menghantar emel notifikasi kepada Lembaga Pemeriksa.<br>Masalah: "+MailErr;
                        }
                    }

                    cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void LoadAssetInv()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = PemeriksaanMethods.SP_Pemeriksaan_LookupAssetInv(ref Dt, PEMH_PTJ.Value, PEMH_Dept.Value, PEMH_Block.Value, PEMH_Floor.Value, PEMH_Space.Value);

                if (DbErr == string.Empty)
                {
                    BindAssetInvGrid(ref Dt);
                    cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void LoadMode()
        {
            DataSet Ds = new DataSet();
            DataTable AssetListDt = new DataTable();
            DataTable InspectorDt = new DataTable();

            try
            {
                string DbErr = PemeriksaanMethods.SP_Pemeriksaan_LoadPemeriksaanTab(PEMH_RowId.Text, ref Ds);

                if (DbErr == string.Empty)
                {
                    PEMH_RefNumber.Text = Ds.Tables[0].Rows[0]["PEMH_RefNumber"].ToString();
                    PEMH_Name.Text = Ds.Tables[0].Rows[0]["PEMH_Name"].ToString();
                    PEMH_Desc.Text = Ds.Tables[0].Rows[0]["PEMH_Desc"].ToString();
                    PEMH_StartDate.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["PEMH_StartDate"]);
                    PEMH_EndDate.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["PEMH_EndDate"]);
                    PEMH_LembagaPemeriksaUniqueId.Text = Ds.Tables[0].Rows[0]["PEMH_LembagaPemeriksaUniqueId"].ToString();

                    if (Ds.Tables[0].Rows[0]["PEMH_PTJ"].ToString() != "")
                        PEMH_PTJ.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PEMH_PTJ"]);
                    else
                        PEMH_PTJ.Value = DBNull.Value;

                    if (Ds.Tables[0].Rows[0]["PEMH_Dept"].ToString() != "")
                        PEMH_Dept.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PEMH_Dept"]);
                    else
                        PEMH_Dept.Value = DBNull.Value;

                    if (Ds.Tables[0].Rows[0]["PEMH_Block"].ToString() != "")
                        PEMH_Block.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PEMH_Block"]);
                    else
                        PEMH_Block.Value = DBNull.Value;

                    if (Ds.Tables[0].Rows[0]["PEMH_Floor"].ToString() != "")
                        PEMH_Floor.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PEMH_Floor"]);
                    else
                        PEMH_Floor.Value = DBNull.Value;

                    if (Ds.Tables[0].Rows[0]["PEMH_Space"].ToString() != "")
                        PEMH_Space.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["PEMH_Space"]);
                    else
                        PEMH_Space.Value = DBNull.Value;

                    PEMH_Status.Text = Ds.Tables[0].Rows[0]["PEMH_Status"].ToString();

                    AssetListDt = Ds.Tables[2].Copy();
                    InspectorDt = Ds.Tables[1].Copy();

                    BindAssetInvGrid(ref AssetListDt);
                    BindInvestigatorGrid(ref InspectorDt);
                    cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Ds.Dispose(); AssetListDt.Dispose(); InspectorDt.Dispose(); }
        }

        void LoadInvestigator()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = PemeriksaanMethods.V_LembagaPemeriksa_Detail(ref Dt, PEMH_LembagaPemeriksaUniqueId.Value.ToString());

                if (DbErr == string.Empty)
                {
                    BindInvestigatorGrid(ref Dt);
                    cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
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
                FormHeaderTVP(ref Dt);
                BindInvestigatorGrid(ref Dt);
                BindAssetInvGrid(ref Dt);

                //form header
                PEMH_RowId.Value = "";
                PEMH_RefNumber.Text = "";
                PEMH_Name.Text = "";
                PEMH_Desc.Text = "";
                PEMH_StartDate.Value = 0;
                PEMH_EndDate.Value = 0;
                PEMH_LembagaPemeriksaUniqueId.Value = DBNull.Value;
                PEMH_PTJ.Value = DBNull.Value;
                PEMH_Dept.Value = DBNull.Value;
                PEMH_Block.Value = DBNull.Value;
                PEMH_Floor.Value = DBNull.Value;
                PEMH_Space.Value = DBNull.Value;
                PEMH_Status.Text = "";

                cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_TabPemeriksaan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void BindAssetInvGrid(ref DataTable Dt)
        {
            GridAssInvList.DataSource = Dt;
            GridAssInvList.KeyFieldName = "AssInvRegNum";
            GridAssInvList.DataBind();
        }

        void BindInvestigatorGrid(ref DataTable Dt)
        {
            GridInvestigator.DataSource = Dt;
            GridInvestigator.KeyFieldName = "LPD_EmpId";
            GridInvestigator.DataBind();
        }

        void FormHeaderTVP(ref DataTable Dt)
        {
            DataColumn PEMH_RowId = Dt.Columns.Add("PEMH_RowId", typeof(Int32));
            DataColumn PEMH_RefNumber = Dt.Columns.Add("PEMH_RefNumber", typeof(String));
            DataColumn PEMH_LastModDate = Dt.Columns.Add("PEMH_LastModDate", typeof(DateTime));
            DataColumn PEMH_LastModBy = Dt.Columns.Add("PEMH_LastModBy", typeof(Int32));
            DataColumn PEMH_PostDate = Dt.Columns.Add("PEMH_PostDate", typeof(DateTime));
            DataColumn PEMH_Name = Dt.Columns.Add("PEMH_Name", typeof(String));
            DataColumn PEMH_Desc = Dt.Columns.Add("PEMH_Desc", typeof(String));
            DataColumn PEMH_StartDate = Dt.Columns.Add("PEMH_StartDate", typeof(DateTime));
            DataColumn PEMH_EndDate = Dt.Columns.Add("PEMH_EndDate", typeof(DateTime));
            DataColumn PEMH_LembagaPemeriksaUniqueId = Dt.Columns.Add("PEMH_LembagaPemeriksaUniqueId", typeof(String));
            DataColumn PEMH_PTJ = Dt.Columns.Add("PEMH_PTJ", typeof(Int32));
            DataColumn PEMH_Dept = Dt.Columns.Add("PEMH_Dept", typeof(Int32));
            DataColumn PEMH_Block = Dt.Columns.Add("PEMH_Block", typeof(Int32));
            DataColumn PEMH_Floor = Dt.Columns.Add("PEMH_Floor", typeof(Int32));
            DataColumn PEMH_Space = Dt.Columns.Add("PEMH_Space", typeof(Int32));
            DataColumn PEMH_Status = Dt.Columns.Add("PEMH_Status", typeof(Int32));
            Dt.AcceptChanges();
        }

        void PopulateHeaderTVP(ref DataTable Dt, string CurrUser, int Post)
        {
            DataRow Dr = Dt.NewRow();

            if (PEMH_RowId.Text == "")
                Dr["PEMH_RowId"] = DBNull.Value;
            else
                Dr["PEMH_RowId"] = Convert.ToInt32(PEMH_RowId.Text);

            if (PEMH_RefNumber.Text == "")
                Dr["PEMH_RefNumber"] = DBNull.Value;
            else
                Dr["PEMH_RefNumber"] = PEMH_RefNumber.Text;

            Dr["PEMH_LastModDate"] = DateTime.Now;
            Dr["PEMH_LastModBy"] = Convert.ToInt32(CurrUser);

            if (Post == 1)
                Dr["PEMH_PostDate"] = DateTime.Now;
            else
                Dr["PEMH_PostDate"] = DBNull.Value;

            Dr["PEMH_Name"] = PEMH_Name.Text.Trim();
            Dr["PEMH_Desc"] = PEMH_Desc.Text.Trim();
            Dr["PEMH_StartDate"] = PEMH_StartDate.Date;
            Dr["PEMH_EndDate"] = PEMH_EndDate.Date;

            if (PEMH_LembagaPemeriksaUniqueId.Text != "")
                Dr["PEMH_LembagaPemeriksaUniqueId"] = PEMH_LembagaPemeriksaUniqueId.Value.ToString();
            else
                Dr["PEMH_LembagaPemeriksaUniqueId"] = DBNull.Value;

            if (PEMH_PTJ.Text == "")
                Dr["PEMH_PTJ"] = DBNull.Value;
            else
                Dr["PEMH_PTJ"] = Convert.ToInt32(PEMH_PTJ.Value);

            if (PEMH_Dept.Text == "")
                Dr["PEMH_Dept"] = DBNull.Value;
            else
                Dr["PEMH_Dept"] = Convert.ToInt32(PEMH_Dept.Value);

            if (PEMH_Block.Text == "")
                Dr["PEMH_Block"] = DBNull.Value;
            else
                Dr["PEMH_Block"] = Convert.ToInt32(PEMH_Block.Value);

            if (PEMH_Floor.Text == "")
                Dr["PEMH_Floor"] = DBNull.Value;
            else
                Dr["PEMH_Floor"] = Convert.ToInt32(PEMH_Floor.Value);

            if (PEMH_Space.Text == "")
                Dr["PEMH_Space"] = DBNull.Value;
            else
                Dr["PEMH_Space"] = Convert.ToInt32(PEMH_Space.Value);

            Dr["PEMH_Status"] = Convert.ToInt32(PEMH_Status.Value);

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void ScanInvestigatorGrid(ref DataTable Dt)
        {
            DataColumn EmployeeEmail = Dt.Columns.Add("EmployeeEmail", typeof(String));
            DataColumn EmployeeName = Dt.Columns.Add("EmployeeName", typeof(String));
            Dt.AcceptChanges();

            for (int i = 0; i < GridInvestigator.VisibleRowCount; i++)
            {
                if (GridInvestigator.GetRowValues(i, "LPD_EmpEmail").ToString() != "" && GridInvestigator.GetRowValues(i, "LPD_EmpName").ToString() != "")
                {
                    DataRow Dr = Dt.NewRow();
                    Dr["EmployeeEmail"] = GridInvestigator.GetRowValues(i, "LPD_EmpEmail").ToString();
                    Dr["EmployeeName"] = GridInvestigator.GetRowValues(i, "LPD_EmpName").ToString();
                    Dt.Rows.Add(Dr);
                }
            }

            Dt.AcceptChanges();
        }
    }
}