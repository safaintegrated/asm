using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using Core.Shared;

namespace AssetAndStoreManagementSystem.Shared.PermohonanBelian
{
    public partial class PermohonanBelian_PrHeader : System.Web.UI.UserControl
    {
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
                    PRH_ProcessId.Text = string.Empty;
                    PRH_Purpose.Text = string.Empty;
                    PRH_Status.Text = string.Empty;
                    PRH_Revision.Text = string.Empty;
                    PRH_RequestBy.Value = DBNull.Value;
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
                    PRH_PurchaserId.Value = DBNull.Value;
                    PRH_DeliveryAdd1.Text = string.Empty;
                    PRH_DeliveryAdd2.Text = string.Empty;
                    PRH_DeliveryAdd3.Text = string.Empty;
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
                    FormTVP(ref Dt);
                    PopulateTVP(ref Dt, ticket.Name);
                    DbErr = PermohonanBelianMethods.SP_PR_Header_SaveSubmitCancel(ticket.Name, Mode, ref Dt, ref ReturnProcessId, ref ReturnRevNumber);
                    cbp_PermohonanBelian_PrHeader.JSProperties["cpReturnProcessId"] = ReturnProcessId;
                    cbp_PermohonanBelian_PrHeader.JSProperties["cpReturnRevNumber"] = ReturnRevNumber.ToString();
                    cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = DbErr;
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

            if(PRH_ProcessId.Text == string.Empty)
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
            Dr["PRH_RequestBy"] = PRH_RequestBy.Value.ToString();
            Dr["PRH_PurchaserId"] = PRH_PurchaserId.Text;
            Dr["PRH_DeliveryAdd1"] = PRH_DeliveryAdd1.Text;
            Dr["PRH_DeliveryAdd2"] = PRH_DeliveryAdd2.Text;
            Dr["PRH_DeliveryAdd3"] = PRH_DeliveryAdd3.Text;
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

        void ViewPRMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = PermohonanBelianMethods.LoadPrUtamaRecord(PRH_ProcessId.Text, PRH_Revision.Text, ref Dt);

                if (DbErr == string.Empty)
                {
                    PRH_Purpose.Text = Dt.Rows[0]["PRH_Purpose"].ToString();
                    PRH_Status.Text = Dt.Rows[0]["PRH_Status"].ToString();
                    PRH_RequestBy.Value = Dt.Rows[0]["PRH_RequestBy"].ToString();
                    PRH_ProcurementMethodId.Value = Convert.ToInt32(Dt.Rows[0]["PRH_ProcurementMethodId"]);
                    PRH_ProcurementITypeId.Value = Convert.ToInt32(Dt.Rows[0]["PRH_ProcurementITypeId"]);
                    PRH_ProcurementCatId.Value = Convert.ToInt32(Dt.Rows[0]["PRH_ProcurementCatId"]);
                    PRH_SupplierCode.Value = Dt.Rows[0]["PRH_SupplierCode"].ToString();
                    PRH_VendorAddress1.Text = Dt.Rows[0]["PRH_VendorAddress1"].ToString();
                    PRH_VendorAddress2.Text = Dt.Rows[0]["PRH_VendorAddress2"].ToString();
                    PRH_VendorAddress3.Text = Dt.Rows[0]["PRH_VendorAddress3"].ToString();
                    PRH_VendorAddress4.Text = Dt.Rows[0]["PRH_VendorAddress4"].ToString();
                    PRH_SupplierGLCode.Text = Dt.Rows[0]["PRH_SupplierGLCode"].ToString();
                    PRH_SupplierGLDesc.Text = Dt.Rows[0]["PRH_SupplierGLDesc"].ToString();
                    PRH_PurchaserId.Value = Dt.Rows[0]["PRH_PurchaserId"].ToString();
                    PRH_DeliveryAdd1.Text = Dt.Rows[0]["PRH_DeliveryAdd1"].ToString();
                    PRH_DeliveryAdd2.Text = Dt.Rows[0]["PRH_DeliveryAdd2"].ToString();
                    PRH_DeliveryAdd3.Text = Dt.Rows[0]["PRH_DeliveryAdd3"].ToString();
                    PRH_DeliveryInstruction.Text = Dt.Rows[0]["PRH_DeliveryInstruction"].ToString();
                    PRH_PRnumber.Text = Dt.Rows[0]["PRH_PRnumber"].ToString();
                    PTJ_SagaCode.Text = Dt.Rows[0]["PTJ_SagaCode"].ToString();
                    cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                { cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = DbErr; }
            }
            catch (Exception err)
            { cbp_PermohonanBelian_PrHeader.JSProperties["cpErrMsg"] = err.Message; }
            finally
            { Dt.Dispose(); }
        }
    }
}