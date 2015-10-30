using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using Core.Shared;

namespace AssetAndStoreManagementSystem.Shared.PurchaseRequest
{
    public partial class PermohonanBelian_PrHeader : System.Web.UI.UserControl
    {
        Core.Services.PurchaseRequestService _prSvc = new Core.Services.PurchaseRequestService();
        Data.Entity.PurchaseRequest _pr;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_PermohonanBelian_PrHeader_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_PermohonanBelian_PrHeader.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "NEW": NewMode(); break;
                case "SAVE": SaveSubmitCancelPRMode(1); break;
                case "VIEW": ViewPRMode(); break;
                case "APPROVED": ApprovedPr(); break;
            }
        }

        private void ApprovedPr()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (ticket.Expired)
            {
                cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = "Session Expired.";
                return;
            }

            try
            {
                _prSvc.ApprovedPr(_pr, ticket.Name);
            }
            catch (Exception ex)
            {
            }
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
                    UpdateUserInfo(ticket.Name);

                    PRH_ProcessId.Text = string.Empty;
                    PRH_Purpose.Text = string.Empty;
                    PRH_Status.Text = string.Empty;
                    PRH_Revision.Text = string.Empty;
                    //PRH_RequestBy.Value = DBNull.Value;
                    PRH_ProcurementMethodId.Value = DBNull.Value;
                    PRH_ProcurementITypeId.Value = DBNull.Value;
                    PRH_ProcurementCatId.Value = DBNull.Value;
                    PRH_SupplierCode.Value = DBNull.Value;
                    PRH_VendorAddress1.Text = string.Empty;
                    PRH_VendorAddress2.Text = string.Empty;
                    PRH_VendorAddress3.Text = string.Empty;
                    PRH_VendorAddress4.Text = string.Empty;
                    PRH_SupplierGLCode.Text = string.Empty;
                    PRH_SupplierGLDesc.Text = string.Empty;
                    //PRH_PurchaserId.Value = DBNull.Value;
                    //PRH_DeliveryAdd1.Text = string.Empty;
                    //PRH_DeliveryAdd2.Text = string.Empty;
                    //PRH_DeliveryAdd3.Text = string.Empty;
                    PRH_DeliveryInstruction.Text = string.Empty;
                    PRH_PRnumber.Text = string.Empty;
                    PTJ_SagaCode.Text = string.Empty;

                    cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = string.Empty;
                }
                catch (Exception err)
                { cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = err.Message; }
            }
            else
                cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        private void UpdateUserInfo(string userName)
        {
            var employee = Data.Models.EmployeeModel.FindByUserId(userName);
            txtOfficerName.Text = employee.FullName;
            txtPtjName.Text = employee.PtjName;
            txtPtjId.Text = employee.PtjCode;

            var ptj = Data.Models.PusatTanggungjawabModel.FindByCode(employee.PtjCode);
            txtPtjAddress1.Text = ptj.Address1;
            txtPtjAddress2.Text = ptj.Address2;
            txtPtjAddress3.Text = ptj.Address3;

        }

        void SaveSubmitCancelPRMode(int Mode)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();
                string DbErr = string.Empty;
                string ReturnProcessId = string.Empty;
                int ReturnRevNumber = 0;

                try
                {
                    //FormTVP(ref Dt);
                    //PopulateTVP(ref Dt, ticket.Name);
                    Data.Entity.PurchaseRequest pr = new Data.Entity.PurchaseRequest

                    {
                        //RequestorUserName = ticket.Name,
                        Description = PRH_Purpose.Text.Trim(),
                        Instruction = PRH_DeliveryInstruction.Text.Trim(),
                        //RequesterId = PRH_RequestBy.Value.ToString(),
                        //RequestorName = PRH_RequestBy.Text,
                        ProcurementCategoryId = PRH_ProcurementCatId.Value.ToString(),
                        ProcurementMethodId = PRH_ProcurementMethodId.Value.ToString(),
                        ProcurementTypeId = PRH_ProcurementITypeId.Value.ToString(),
                        SupplierId = PRH_SupplierCode.Value.ToString(),
                        SupplierName = PRH_SupplierCode.Text.Trim(),
                        //ReceiverId = PRH_PurchaserId.Value.ToString()
                    };

                    _prSvc.CreateNewPr(pr, ticket.Name);
                    //Data.Models.PurchaseRequestModel.Add(pr, ticket.Name);

                    //DbErr = PermohonanBelianMethods.SP_PR_Header_SaveSubmitCancel(ticket.Name, Mode, ref Dt, ref ReturnProcessId, ref ReturnRevNumber);
                    cbp_PermohonanBelian_PrHeader.JSProperties["cpReturnProcessId"] = pr.ProcessId;
                    cbp_PermohonanBelian_PrHeader.JSProperties["cpReturnRevNumber"] = pr.RevisionNumber.ToString();
                    cbp_PermohonanBelian_PrHeader.JSProperties["cpReturnPurchaseRequestId"] = pr.Id.ToString();
                    cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = DbErr;
                    _pr = pr;
                }
                catch (Exception err)
                { cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = err.Message; }
                finally
                { Dt.Dispose(); }
            }
            else
            { cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = "Session Expired."; }
        }

        void FormTVP(ref DataTable Dt)
        {
            DataColumn PRH_ProcessId = Dt.Columns.Add("PRH_ProcessId", typeof(String));
            DataColumn PRH_Purpose = Dt.Columns.Add("PRH_Purpose", typeof(String));
            DataColumn PRH_SupplierName = Dt.Columns.Add("PRH_SupplierName", typeof(String));
            DataColumn PRH_SupplierCode = Dt.Columns.Add("PRH_SupplierCode", typeof(String));
            DataColumn PRH_VendorAddress1 = Dt.Columns.Add("PRH_VendorAddress1", typeof(String));
            DataColumn PRH_VendorAddress2 = Dt.Columns.Add("PRH_VendorAddress2", typeof(String));
            DataColumn PRH_VendorAddress3 = Dt.Columns.Add("PRH_VendorAddress3", typeof(String));
            DataColumn PRH_VendorAddress4 = Dt.Columns.Add("PRH_VendorAddress4", typeof(String));
            DataColumn PRH_RequestBy = Dt.Columns.Add("PRH_RequestBy", typeof(String));
            DataColumn PRH_PurchaserId = Dt.Columns.Add("PRH_PurchaserId", typeof(String));
            DataColumn PRH_DeliveryAdd1 = Dt.Columns.Add("PRH_DeliveryAdd1", typeof(String));
            DataColumn PRH_DeliveryAdd2 = Dt.Columns.Add("PRH_DeliveryAdd2", typeof(String));
            DataColumn PRH_DeliveryAdd3 = Dt.Columns.Add("PRH_DeliveryAdd3", typeof(String));
            DataColumn PRH_DeliveryInstruction = Dt.Columns.Add("PRH_DeliveryInstruction", typeof(String));
            DataColumn PRH_ProcurementITypeId = Dt.Columns.Add("PRH_ProcurementITypeId", typeof(Int32));
            DataColumn PRH_ProcurementMethodId = Dt.Columns.Add("PRH_ProcurementMethodId", typeof(Int32));
            DataColumn PRH_ProcurementCatId = Dt.Columns.Add("PRH_ProcurementCatId", typeof(Int32));
            DataColumn PRH_PRnumber = Dt.Columns.Add("PRH_PRnumber", typeof(String));
            DataColumn PRH_CreationDate = Dt.Columns.Add("PRH_CreationDate", typeof(DateTime));
            DataColumn PRH_CreatedBy = Dt.Columns.Add("PRH_CreatedBy", typeof(Int32));
            DataColumn PRH_Revision = Dt.Columns.Add("PRH_Revision", typeof(Int32));
            DataColumn PRH_Status = Dt.Columns.Add("PRH_Status", typeof(Int32));
            DataColumn PTJ_SagaCode = Dt.Columns.Add("PTJ_SagaCode", typeof(String));
            DataColumn PRH_SupplierGLCode = Dt.Columns.Add("PRH_SupplierGLCode", typeof(String));
            DataColumn PRH_SupplierGLDesc = Dt.Columns.Add("PRH_SupplierGLDesc", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt, string CurrUser)
        {
            DataRow Dr = Dt.NewRow();

            if (PRH_ProcessId.Text == string.Empty)
                Dr["PRH_ProcessId"] = DBNull.Value;
            else
                Dr["PRH_ProcessId"] = PRH_ProcessId.Text;

            Dr["PRH_Purpose"] = PRH_Purpose.Text.Trim();
            Dr["PRH_SupplierName"] = PRH_SupplierCode.Text;
            Dr["PRH_SupplierCode"] = PRH_SupplierCode.Value.ToString();
            Dr["PRH_VendorAddress1"] = PRH_VendorAddress1.Text;
            Dr["PRH_VendorAddress2"] = PRH_VendorAddress2.Text;
            Dr["PRH_VendorAddress3"] = PRH_VendorAddress3.Text;
            Dr["PRH_VendorAddress4"] = PRH_VendorAddress4.Text;
            //Dr["PRH_RequestBy"] = PRH_RequestBy.Value.ToString();
            //Dr["PRH_PurchaserId"] = PRH_PurchaserId.Text;
            Dr["PRH_DeliveryAdd1"] = "";// PRH_DeliveryAdd1.Text;
            Dr["PRH_DeliveryAdd2"] = "";//PRH_DeliveryAdd2.Text;
            Dr["PRH_DeliveryAdd3"] = "";// PRH_DeliveryAdd3.Text;
            Dr["PRH_DeliveryInstruction"] = PRH_DeliveryInstruction.Text.Trim();
            Dr["PRH_ProcurementITypeId"] = Convert.ToInt32(PRH_ProcurementITypeId.Value);
            Dr["PRH_ProcurementMethodId"] = Convert.ToInt32(PRH_ProcurementMethodId.Value);
            Dr["PRH_ProcurementCatId"] = Convert.ToInt32(PRH_ProcurementCatId.Value);
            Dr["PRH_PRnumber"] = DBNull.Value;
            Dr["PRH_CreationDate"] = DateTime.Today;
            Dr["PRH_CreatedBy"] = Convert.ToInt32(CurrUser);

            if (PRH_Revision.Text == string.Empty)
                Dr["PRH_Revision"] = DBNull.Value;
            else
                Dr["PRH_Revision"] = Convert.ToInt32(PRH_Revision.Text);

            if (PRH_Status.Text == string.Empty)
                Dr["PRH_Status"] = DBNull.Value;
            else
                Dr["PRH_Status"] = Convert.ToInt32(PRH_Status.Text);

            Dr["PTJ_SagaCode"] = PTJ_SagaCode.Text;
            Dr["PRH_SupplierGLCode"] = PRH_SupplierGLCode.Text;
            Dr["PRH_SupplierGLDesc"] = PRH_SupplierGLDesc.Text;

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        private void ViewPRMode()
        {
            try
            {
                Data.Entity.PurchaseRequest pr = Data.Models.PurchaseRequestModel.FindById(PRH_ProcessId.Text);
                if (pr == null)
                    throw new Exception("Purchase Request Not Found");

                PRH_Purpose.Text = pr.Description;
                PRH_Status.Text = pr.StatusName;
                PRH_ProcurementMethodId.Value = pr.ProcurementMethodId;
                PRH_ProcurementITypeId.Value = pr.ProcurementTypeId;
                PRH_ProcurementCatId.Value = pr.ProcurementCategoryId;

                Data.Entity.Supplier s = Data.Models.SupplierModel.FindById(pr.SupplierId);
                if (s == null)
                    throw new Exception("Supplier Not Found");
                PRH_SupplierCode.Value = s.Id;
                PRH_VendorAddress1.Text = s.Address1;
                PRH_VendorAddress2.Text = s.Address2;
                PRH_VendorAddress3.Text = s.Address3;
                PRH_VendorAddress4.Text = s.Address4;
                PRH_SupplierGLCode.Text = s.GlacControlCode;
                PRH_SupplierGLDesc.Text = s.GlacDescription;

                Data.Entity.PuDeliveryAddress pda = Data.Models.PuDeliveryAddressModel.FindById(pr.ReceiverId);
                if (pda != null)
                {
                    // PRH_PurchaserId.Value = pda.Id;// Dt.Rows[0]["PRH_PurchaserId"].ToString();
                    //PRH_DeliveryAdd1.Text = pda.Address1;// Dt.Rows[0]["PRH_DeliveryAdd1"].ToString();
                    //PRH_DeliveryAdd2.Text = pda.Address2;// Dt.Rows[0]["PRH_DeliveryAdd2"].ToString();
                    //PRH_DeliveryAdd3.Text = pda.Address3;// Dt.Rows[0]["PRH_DeliveryAdd3"].ToString();
                }

                PRH_DeliveryInstruction.Text = pr.Instruction;
                PRH_PRnumber.Text = pr.PrNumber;
                cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = err.Message;
            }
            finally
            {
            }
        }

        protected void txtPtjName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtPtjAddress1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}