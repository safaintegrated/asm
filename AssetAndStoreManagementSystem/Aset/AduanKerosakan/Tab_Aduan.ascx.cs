using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using Core.Aset.AduanKerosakan;
using System.IO;
using Core.Email;

namespace AssetAndStoreManagementSystem.Aset.AduanKerosakan
{
    public partial class Tab_Aduan : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_TabAduan_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                cbp_TabAduan.JSProperties["cpMode"] = e.Parameter;

                switch (e.Parameter)
                {
                    case "ADD": AK_AddMode(ticket.Name); break;
                    case "ASSETINVSELECTED": AK_AssetInvSelected(); break;
                    case "SAVE": AK_SavePostMode(0); break;
                    case "POST": AK_SavePostMode(1); break;
                    case "LOAD": AK_LoadMode(); break;
                    case "CANCEL": AK_CancelMode(); break;
                }
            }
            else
            {
                cbp_TabAduan.JSProperties["cpErrMsg"] = "Session Expired.";
            }
        }

        void AK_AddMode(string CurrUser)
        {
            DataTable Dt = new DataTable();

            try
            {
                string ProcessId = DateTime.Now.ToString("yyMMdd-HHmmss");
                string err = AduanKerosakanMethods.SP_AduanKerosakan_CreateNewRecord(ProcessId, CurrUser);

                if (err == "")
                {
                    AduanKerosakanMethods.SP_AduanKerosakan_GetCreatorInfo(CurrUser, ref Dt);

                    if (Dt.Rows.Count == 1)
                    {
                        AK_ProcessId.Text = ProcessId;
                        CreatorName.Text = Dt.Rows[0]["User_Salutation"].ToString();
                        CreatorEmail.Text = Dt.Rows[0]["User_EmailAddress"].ToString();
                        AK_CreatedByEmpId.Text = Dt.Rows[0]["User_Id"].ToString();
                        CreatorPTJ.Text = Dt.Rows[0]["PTJ_FullName"].ToString();
                        CreatorTelephone.Text = Dt.Rows[0]["User_Handphone"].ToString();
                        AK_Status.Text = "";

                        //slider
                        Slider.DataBind();

                        //reported asset inventory
                        AK_AssetInvRegNumber.Text = "";
                        AK_AssetInvDesc.Text = "";
                        CatName.Text = "";
                        SubCatName.Text = "";
                        AK_AssetInvCategory.Text = "";
                        AK_AssetInvSubCategory.Text = "";
                        AssetInvOwnerName.Text = "";
                        PTJ_Name.Text = "";
                        DeptName.Text = "";
                        BuildingName.Text = "";
                        FloorName.Text = "";
                        SpaceName.Text = "";
                        AK_AssetInvEmployeName.Text = "";
                        AK_AssetInvPtj.Text = "";
                        AK_AssetInvDept.Text = "";
                        AK_AssetInvBuilding.Text = "";
                        AK_AssetInvFloor.Text = "";
                        AK_AssetInvSpace.Text = "";
                        AK_AssetInvUniqueId.Text = "";
                        AK_AssetInvType.Text = "";
                        AK_DamageNotes.Text = "";
                        AK_OtherNotes.Text = "";

                        cbp_TabAduan.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        cbp_TabAduan.JSProperties["cpErrMsg"] = "Sistem tidak dapat menyediakan rekod Aduan Kerosakan baharu untuk anda.<br>Sila cuba lagi sebentar lagi.";
                    }
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_TabAduan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_TabAduan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }
   

        void AK_LoadMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = AduanKerosakanMethods.V_AduanKerosakan(ref Dt, AK_ProcessId.Text);

                if (err == "")
                {
                    if (Dt.Rows.Count == 1)
                    {
                        CreatorName.Text = Dt.Rows[0]["CreatorName"].ToString();
                        CreatorEmail.Text = Dt.Rows[0]["CreatorEmail"].ToString();
                        AK_CreatedByEmpId.Text = Dt.Rows[0]["AK_CreatedByEmpId"].ToString();
                        CreatorPTJ.Text = Dt.Rows[0]["CreatorPTJ"].ToString();
                        CreatorTelephone.Text = Dt.Rows[0]["CreatorTelephone"].ToString();
                        AK_Status.Text = Dt.Rows[0]["AK_Status"].ToString();

                        //slider
                        Slider.DataBind();

                        //reported asset inventory
                        AK_AssetInvRegNumber.Text = Dt.Rows[0]["AK_AssetInvRegNumber"].ToString();
                        AK_AssetInvDesc.Text = Dt.Rows[0]["AK_AssetInvDesc"].ToString();
                        CatName.Text = Dt.Rows[0]["CatName"].ToString();
                        SubCatName.Text = Dt.Rows[0]["SubCatName"].ToString();
                        AK_AssetInvCategory.Text = Dt.Rows[0]["AK_AssetInvCategory"].ToString();
                        AK_AssetInvSubCategory.Text = Dt.Rows[0]["AK_AssetInvSubCategory"].ToString();
                        AssetInvOwnerName.Text = Dt.Rows[0]["AssetInvOwnerName"].ToString();
                        PTJ_Name.Text = Dt.Rows[0]["PTJ_Name"].ToString();
                        DeptName.Text = Dt.Rows[0]["DeptName"].ToString();
                        BuildingName.Text = Dt.Rows[0]["BuildingName"].ToString();
                        FloorName.Text = Dt.Rows[0]["FloorName"].ToString();
                        SpaceName.Text = Dt.Rows[0]["SpaceName"].ToString();
                        AK_AssetInvEmployeName.Text = Dt.Rows[0]["AK_AssetInvEmployeName"].ToString();
                        AK_AssetInvPtj.Text = Dt.Rows[0]["AK_AssetInvPtj"].ToString();
                        AK_AssetInvDept.Text = Dt.Rows[0]["AK_AssetInvDept"].ToString();
                        AK_AssetInvBuilding.Text = Dt.Rows[0]["AK_AssetInvBuilding"].ToString();
                        AK_AssetInvFloor.Text = Dt.Rows[0]["AK_AssetInvFloor"].ToString();
                        AK_AssetInvSpace.Text = Dt.Rows[0]["AK_AssetInvSpace"].ToString();
                        AK_AssetInvUniqueId.Text = Dt.Rows[0]["AK_AssetInvUniqueId"].ToString();
                        AK_AssetInvType.Text = Dt.Rows[0]["AK_AssetInvType"].ToString();
                        AK_DamageNotes.Text = Dt.Rows[0]["AK_DamageNotes"].ToString();
                        AK_OtherNotes.Text = Dt.Rows[0]["AK_OtherNotes"].ToString();
                        cbp_TabAduan.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    {
                        cbp_TabAduan.JSProperties["cpErrMsg"] = "Sistem tidak dapat membuka rekod aduan kerosakan yang dipilih.<br>Sila cuba lagi sebentar lagi.";
                    }
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_TabAduan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_TabAduan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        }

        void AK_AssetInvSelected()
        {
            bool selected = false;

            for (int i = 0; i < GridSearchAssetInv.VisibleRowCount; i++)
            {
                if (GridSearchAssetInv.Selection.IsRowSelected(i))
                {
                    AK_AssetInvRegNumber.Text = GridSearchAssetInv.GetRowValues(i, "AssInvRegNum").ToString();
                    AK_AssetInvDesc.Text = GridSearchAssetInv.GetRowValues(i, "AssInvDesc").ToString();
                    CatName.Text = GridSearchAssetInv.GetRowValues(i, "CatName").ToString();
                    SubCatName.Text = GridSearchAssetInv.GetRowValues(i, "SubCatName").ToString();
                    AK_AssetInvCategory.Text = GridSearchAssetInv.GetRowValues(i, "AIRMI_Cat").ToString();
                    AK_AssetInvSubCategory.Text = GridSearchAssetInv.GetRowValues(i, "AIRMI_SubCat").ToString();

                    AssetInvOwnerName.Text = GridSearchAssetInv.GetRowValues(i, "EmployeeName").ToString();
                    PTJ_Name.Text = GridSearchAssetInv.GetRowValues(i, "PTJ_Name").ToString();
                    DeptName.Text = GridSearchAssetInv.GetRowValues(i, "Dept_Name").ToString();
                    BuildingName.Text = GridSearchAssetInv.GetRowValues(i, "Build_Name").ToString();
                    FloorName.Text = GridSearchAssetInv.GetRowValues(i, "Floor_Name").ToString();
                    SpaceName.Text = GridSearchAssetInv.GetRowValues(i, "Space_Name").ToString();
                    AK_AssetInvEmployeName.Text = GridSearchAssetInv.GetRowValues(i, "PH_EmpId").ToString();
                    AK_AssetInvPtj.Text = GridSearchAssetInv.GetRowValues(i, "PH_PtjId").ToString();
                    AK_AssetInvDept.Text = GridSearchAssetInv.GetRowValues(i, "PH_DeptId").ToString();
                    AK_AssetInvBuilding.Text = GridSearchAssetInv.GetRowValues(i, "PH_BuildId").ToString();
                    AK_AssetInvFloor.Text = GridSearchAssetInv.GetRowValues(i, "PH_FloorId").ToString();
                    AK_AssetInvSpace.Text = GridSearchAssetInv.GetRowValues(i, "PH_SpaceID").ToString();
                    AK_AssetInvUniqueId.Text = GridSearchAssetInv.GetRowValues(i, "AssInvUniqueId").ToString();
                    AK_AssetInvType.Text = GridSearchAssetInv.GetRowValues(i, "AssetInvType").ToString();
                    selected = false;
                }

                if (selected)
                    break;
            }

            cbp_TabAduan.JSProperties["cpErrMsg"] = string.Empty;
        }

        void AK_SavePostMode(int Post)
        {
            DataTable TVP = new DataTable();
            DataTable PostDt = new DataTable();

            try
            {
                FormTVP(ref TVP);
                PopulateFormTVP(ref TVP);

                string err = AduanKerosakanMethods.SP_AduanKerosakan_SaveSubmit(ref TVP, Post);

                if (err == "")
                {
                    if (Post == 1)
                    {
                        string PegawaiAsetNameString = string.Empty;

                        AduanKerosakanMethods.SP_AduanKerosakan_GetPegawaiAsetDetails(ref PostDt, AK_AssetInvUniqueId.Text, AK_AssetInvType.Text);

                        string RefNumber = string.Empty;
                        AduanKerosakanMethods.GetAduanKerosakanRefNumber(ref RefNumber, AK_ProcessId.Text);

                        string EmailError = SendMail.AduanKerosakan_NotifyPegawaiAset(ref PostDt, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()), RefNumber, CreatorName.Text);

                        if (EmailError == string.Empty)
                        {

                            for (int q = 0; q < PostDt.Rows.Count; q++)
                            {
                                if (PegawaiAsetNameString == string.Empty)
                                    PegawaiAsetNameString = PostDt.Rows[q]["EmployeeName"].ToString();
                                else
                                    PegawaiAsetNameString = PegawaiAsetNameString + ", " + PostDt.Rows[q]["EmployeeName"].ToString();
                            }

                            cbp_TabAduan.JSProperties["cpPegawaiAsetName"] = PegawaiAsetNameString;
                            cbp_TabAduan.JSProperties["cpMailError"] = string.Empty;
                        }
                        else
                            cbp_TabAduan.JSProperties["cpMailError"] = EmailError;
                    }

                    cbp_TabAduan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_TabAduan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_TabAduan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { TVP.Dispose(); }           
        }

        void AK_CancelMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                //Grid Listing
                FormTVP(ref Dt);
                //BindGridList(ref Dt);

                //form header
                AK_ProcessId.Text = "";
                CreatorName.Text = "";
                CreatorEmail.Text = "";
                AK_CreatedByEmpId.Text = "";
                CreatorPTJ.Text = "";
                CreatorTelephone.Text = "";
                AK_Status.Text = "";

                //slider
                Slider.DataBind();

                //reported asset inventory
                AK_AssetInvRegNumber.Text = "";
                AK_AssetInvDesc.Text = "";
                CatName.Text = "";
                SubCatName.Text = "";
                AK_AssetInvCategory.Text = "";
                AK_AssetInvSubCategory.Text = "";
                AssetInvOwnerName.Text = "";
                PTJ_Name.Text = "";
                DeptName.Text = "";
                BuildingName.Text = "";
                FloorName.Text = "";
                SpaceName.Text = "";
                AK_AssetInvEmployeName.Text = "";
                AK_AssetInvPtj.Text = "";
                AK_AssetInvDept.Text = "";
                AK_AssetInvBuilding.Text = "";
                AK_AssetInvFloor.Text = "";
                AK_AssetInvSpace.Text = "";
                AK_AssetInvUniqueId.Text = "";
                AK_AssetInvType.Text = "";
                AK_DamageNotes.Text = "";
                AK_OtherNotes.Text = "";

                cbp_TabAduan.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_TabAduan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Dt.Dispose(); }
        
        }

        protected void SliderDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {            
            string UploadLocation = ConfigurationManager.AppSettings["ImageUploadFolder"].ToString();
            string FileFullPath = Path.Combine(Server.MapPath(UploadLocation), string.Empty);

            e.Command.Parameters["@ProcessId"].Value = AK_ProcessId.Text;
            e.Command.Parameters["@PhysicalPath"].Value = ConfigurationManager.AppSettings["ImageUploadFolder"].ToString();
        }

        protected void cbp_Slider_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            Slider.DataBind();
        }

        /*void BindGridList(ref DataTable Dt)
        {
            GridSearchAssetInv.DataSource = Dt;
            GridSearchAssetInv.KeyFieldName = "AssInvUniqueId";
            //GridSearchAssetInv.DataBind();
            
        }*/

        protected void GridSearchAssetInv_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearchAssetInv.DataBind();
        }

        void FormTVP(ref DataTable Dt)
        {
            DataColumn AK_ProcessId = Dt.Columns.Add("AK_ProcessId", typeof(String));
            DataColumn AK_CreatedByEmpId = Dt.Columns.Add("AK_CreatedByEmpId", typeof(Int32));
            DataColumn AK_AssetInvUniqueId = Dt.Columns.Add("AK_AssetInvUniqueId", typeof(String));
            DataColumn AK_AssetInvRegNumber = Dt.Columns.Add("AK_AssetInvRegNumber", typeof(String));
            DataColumn AK_AssetInvType = Dt.Columns.Add("AK_AssetInvType", typeof(Int32));
            DataColumn AK_AssetInvDesc = Dt.Columns.Add("AK_AssetInvDesc", typeof(String));
            DataColumn AK_AssetInvCategory = Dt.Columns.Add("AK_AssetInvCategory", typeof(Int32));
            DataColumn AK_AssetInvSubCategory = Dt.Columns.Add("AK_AssetInvSubCategory", typeof(Int32));
            DataColumn AK_AssetInvPtj = Dt.Columns.Add("AK_AssetInvPtj", typeof(Int32));
            DataColumn AK_AssetInvDept = Dt.Columns.Add("AK_AssetInvDept", typeof(Int32));
            DataColumn AK_AssetInvEmployeName = Dt.Columns.Add("AK_AssetInvEmployeName", typeof(String));
            DataColumn AK_AssetInvBuilding = Dt.Columns.Add("AK_AssetInvBuilding", typeof(Int32));
            DataColumn AK_AssetInvFloor = Dt.Columns.Add("AK_AssetInvFloor", typeof(Int32));
            DataColumn AK_AssetInvSpace = Dt.Columns.Add("AK_AssetInvSpace", typeof(Int32));
            DataColumn AK_DamageNotes = Dt.Columns.Add("AK_DamageNotes", typeof(String));
            DataColumn AK_OtherNotes = Dt.Columns.Add("AK_OtherNotes", typeof(String));
            DataColumn AK_RefNumber = Dt.Columns.Add("AK_RefNumber", typeof(String));
            DataColumn AK_CreatedDate = Dt.Columns.Add("AK_CreatedDate", typeof(DateTime));
            DataColumn AK_Status = Dt.Columns.Add("AK_Status", typeof(Int32));
            DataColumn AK_AssetOfficerId = Dt.Columns.Add("AK_AssetOfficerId", typeof(Int32));
            DataColumn AK_AssetOfficerConfirmationId = Dt.Columns.Add("AK_AssetOfficerConfirmationId", typeof(Int32));
            DataColumn AK_AssetOfficerRecommendationId = Dt.Columns.Add("AK_AssetOfficerRecommendationId", typeof(Int32));
            DataColumn AK_AssetOfficerNotes = Dt.Columns.Add("AK_AssetOfficerNotes", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateFormTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dt.Rows.Add(Dr);
            Dr["AK_ProcessId"] = AK_ProcessId.Text;
            Dr["AK_CreatedByEmpId"] = AK_CreatedByEmpId.Text;
            Dr["AK_AssetInvUniqueId"] = AK_AssetInvUniqueId.Text;
            Dr["AK_AssetInvRegNumber"] = AK_AssetInvRegNumber.Text;
            Dr["AK_AssetInvType"] = Convert.ToInt32(AK_AssetInvType.Text);
            Dr["AK_AssetInvDesc"] = AK_AssetInvDesc.Text;
            Dr["AK_AssetInvCategory"] = Convert.ToInt32(AK_AssetInvCategory.Text);
            Dr["AK_AssetInvSubCategory"] = Convert.ToInt32(AK_AssetInvSubCategory.Text);
            Dr["AK_AssetInvPtj"] = Convert.ToInt32(AK_AssetInvPtj.Text);
            Dr["AK_AssetInvDept"] = Convert.ToInt32(AK_AssetInvDept.Text);
            Dr["AK_AssetInvEmployeName"] = AK_AssetInvEmployeName.Text;
            Dr["AK_AssetInvBuilding"] = Convert.ToInt32(AK_AssetInvBuilding.Text);
            Dr["AK_AssetInvFloor"] = Convert.ToInt32(AK_AssetInvFloor.Text);
            Dr["AK_AssetInvSpace"] = Convert.ToInt32(AK_AssetInvSpace.Text);
            Dr["AK_DamageNotes"] = AK_DamageNotes.Text.Trim();
            Dr["AK_OtherNotes"] = AK_OtherNotes.Text.Trim();
            Dr["AK_RefNumber"] = DBNull.Value;
            Dr["AK_CreatedDate"]= DateTime.Now;
            Dr["AK_Status"] = DBNull.Value;
            Dr["AK_AssetOfficerId"] = DBNull.Value;
            Dr["AK_AssetOfficerConfirmationId"] = DBNull.Value;
            Dr["AK_AssetOfficerRecommendationId"] = DBNull.Value;
            Dr["AK_AssetOfficerNotes"] = DBNull.Value;
            Dt.AcceptChanges();
        }
    }
}