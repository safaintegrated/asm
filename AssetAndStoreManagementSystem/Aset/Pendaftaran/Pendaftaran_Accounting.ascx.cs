using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Configuration;
using System.Data;
using System.Web.Security;
using Core.Aset.Pendaftaran;
using System.Data.SqlClient;
using Core.SagaInterface.Informix;
using Core.Utility;

namespace AssetAndStoreManagementSystem.Aset.Pendaftaran
{
    public partial class Pendaftaran_Accounting : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_AI_Accounting_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp_AI_Accounting.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {
                    case "LOAD": LoadMode(); break;
                    case "SAVE": SaveMode(ticket.Name); break;
                }
            }
            else

                cbp_AI_Accounting.JSProperties["cpErrMsg"] = "Session Expired.";            
        }

        void LoadMode()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = AccountsMethods.LoadAcoounts(AIA_UniqueId.Text, ref Dt);

                if (DbErr == string.Empty)
                {
                    if(Dt.Rows.Count == 1)
                    {
                        if (Dt.Rows[0]["AIRMI_PurchasePrice"].ToString() != "")
                            AIRMI_PurchasePrice.Value = Convert.ToDecimal(Dt.Rows[0]["AIRMI_PurchasePrice"]);
                        else
                            AIRMI_PurchasePrice.Value = 0;

                        if (Dt.Rows[0]["DepreciationValuePrevYear"].ToString() != "")
                            DepreciationValuePrevYear.Value = Convert.ToDecimal(Dt.Rows[0]["DepreciationValuePrevYear"]);
                        else
                            DepreciationValuePrevYear.Value = 0;

                        if (Dt.Rows[0]["DepreciationValueCurrYear"].ToString() != "")
                            DepreciationValueCurrYear.Value = Convert.ToDecimal(Dt.Rows[0]["DepreciationValueCurrYear"]);
                        else
                            DepreciationValueCurrYear.Value = 0;

                        if (Dt.Rows[0]["DepreciationValuePrevMonth"].ToString() != "")
                            DepreciationValuePrevMonth.Value = Convert.ToDecimal(Dt.Rows[0]["DepreciationValuePrevMonth"]);
                        else
                            DepreciationValuePrevMonth.Value = 0;

                        if (Dt.Rows[0]["NettValue"].ToString() != "")
                            NettValue.Value = Convert.ToDecimal(Dt.Rows[0]["NettValue"]);
                        else
                            NettValue.Value = 0;

                        if (Dt.Rows[0]["AIA_Percentage"].ToString() != "")
                            AIA_Percentage.Value = Convert.ToDecimal(Dt.Rows[0]["AIA_Percentage"]);
                        else
                            AIA_Percentage.Value = 0;

                        if (Dt.Rows[0]["AIA_Method"].ToString() != "")
                            AIA_Method.Value = Convert.ToInt32(Dt.Rows[0]["AIA_Method"]);
                        else
                            AIA_Method.Value = 0;

                        if (Dt.Rows[0]["AIA_MinValue"].ToString() != "")
                            AIA_MinValue.Value = Convert.ToDecimal(Dt.Rows[0]["AIA_MinValue"]);
                        else
                            AIA_MinValue.Value = 0;

                        if (Dt.Rows[0]["AIA_AssetAccount"].ToString() != "")
                            AIA_AssetAccount.Value = Dt.Rows[0]["AIA_AssetAccount"].ToString();
                        else
                            AIA_AssetAccount.Value = DBNull.Value;

                        if (Dt.Rows[0]["AIA_DepreciationAccount"].ToString() != "")
                            AIA_DepreciationAccount.Value = Dt.Rows[0]["AIA_DepreciationAccount"].ToString();
                        else
                            AIA_DepreciationAccount.Value = DBNull.Value;

                        if (Dt.Rows[0]["AIA_CollectiveDepreciationAccount"].ToString() != "")
                            AIA_CollectiveDepreciationAccount.Value = Dt.Rows[0]["AIA_CollectiveDepreciationAccount"].ToString();
                        else
                            AIA_CollectiveDepreciationAccount.Value = DBNull.Value;

                        if (Dt.Rows[0]["AIA_GainAccount"].ToString() != "")
                            AIA_GainAccount.Value = Dt.Rows[0]["AIA_GainAccount"].ToString();
                        else
                            AIA_GainAccount.Value = DBNull.Value;

                        if (Dt.Rows[0]["AIA_LossAccount"].ToString() != "")
                            AIA_LossAccount.Value = Dt.Rows[0]["AIA_LossAccount"].ToString();
                        else
                            AIA_LossAccount.Value = DBNull.Value;

                        cbp_AI_Accounting.JSProperties["cpErrMsg"] = string.Empty;
                    }                    
                    else
                    {
                        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                        errMsg = errMsg.Replace("BR", "<br><br>");
                        cbp_AI_Accounting.JSProperties["cpErrMsg"] = errMsg + " Sistem tidak dapat membuka maklumat akaun aset alih.";
                    }
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_AI_Accounting.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_AI_Accounting.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        void SaveMode(string CurrUser)
        {
            DataTable Dt = new DataTable();

            try
            {
                FormTVP(ref Dt);
                PopulateTVP(ref Dt);

                string DbErr = AccountsMethods.SP_Save_AssetInventoryAccounting(ref Dt, CurrUser);

                if (DbErr == string.Empty)
                {
                    cbp_AI_Accounting.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_AI_Accounting.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_AI_Accounting.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        void FormTVP(ref DataTable Dt)
        {
            DataColumn AIA_UniqueId = Dt.Columns.Add("AIA_UniqueId", typeof(String));
            DataColumn AIA_Percentage = Dt.Columns.Add("AIA_Percentage", typeof(Decimal));
            DataColumn AIA_Method = Dt.Columns.Add("AIA_Method", typeof(Int32));
            DataColumn AIA_MinValue = Dt.Columns.Add("AIA_MinValue", typeof(Decimal));
            DataColumn AIA_AssetAccount = Dt.Columns.Add("AIA_AssetAccount", typeof(String));
            DataColumn AIA_DepreciationAccount = Dt.Columns.Add("AIA_DepreciationAccount", typeof(String));
            DataColumn AIA_CollectiveDepreciationAccount = Dt.Columns.Add("AIA_CollectiveDepreciationAccount", typeof(String));
            DataColumn AIA_GainAccount = Dt.Columns.Add("AIA_GainAccount", typeof(String));
            DataColumn AIA_LossAccount = Dt.Columns.Add("AIA_LossAccount", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["AIA_UniqueId"] = AIA_UniqueId.Text;
            Dr["AIA_Percentage"] = Convert.ToDecimal(AIA_Percentage.Value);
            Dr["AIA_Method"] = Convert.ToInt32(AIA_Method.Value);
            Dr["AIA_MinValue"] = Convert.ToDecimal(AIA_MinValue.Value);

            if (AIA_AssetAccount.Text != "")
                Dr["AIA_AssetAccount"] = AIA_AssetAccount.Text;
            else
                Dr["AIA_AssetAccount"] = DBNull.Value;

            if (AIA_DepreciationAccount.Text != "")
                Dr["AIA_DepreciationAccount"] = AIA_DepreciationAccount.Text;
            else
                Dr["AIA_DepreciationAccount"]  = DBNull.Value;

            if (AIA_CollectiveDepreciationAccount.Text != "")
                Dr["AIA_CollectiveDepreciationAccount"] = AIA_CollectiveDepreciationAccount.Text;
            else
                Dr["AIA_CollectiveDepreciationAccount"]  = DBNull.Value;

            if (AIA_GainAccount.Text != "")
                Dr["AIA_GainAccount"] = AIA_GainAccount.Text;
            else
                Dr["AIA_GainAccount"]  = DBNull.Value;

            if (AIA_LossAccount.Text != "")
                Dr["AIA_LossAccount"] = AIA_LossAccount.Text;
            else
                Dr["AIA_LossAccount"]  = DBNull.Value;

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

       
        string GetGlCode(ref DataTable ReturnDt)
        {
            DataTable OdbcConnDt = new DataTable();
            DataSet XmlDs = new DataSet();

            string SagaCommandXmlFilePath = Server.MapPath(ConfigurationManager.AppSettings["SagaCommandXmlFilePath"].ToString());
            string errMsgConfig = string.Empty;

            try
            {
                String XmlPath = Server.MapPath(ConfigurationManager.AppSettings["SagaXmlFilePath"].ToString());
                XmlMethods.ReadXMLFile(ref XmlDs, XmlPath);

                OdbcConnDt = XmlDs.Tables[0].Copy();

                return InformixMethods.GetDataTable(ref OdbcConnDt, ref ReturnDt,4,SagaCommandXmlFilePath);
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                return errMsg + " " + err;
            }
            finally
            { OdbcConnDt.Dispose(); ReturnDt.Dispose(); XmlDs.Dispose(); }
        }

        void FormSagaTVPAccount(ref DataTable Dt)
        { 
            DataColumn glac_account = Dt.Columns.Add("glac_account", typeof(String));
            DataColumn glac_desc = Dt.Columns.Add("glac_desc", typeof(String));
            Dt.AcceptChanges();
        }

        protected void AssetAccDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = GetGlCode(ref Dt);

                if (err != string.Empty)
                {
                    FormSagaTVPAccount(ref Dt);
                }

                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm1.Value = Dt;
                parm1.Direction = ParameterDirection.Input;
                e.Command.Parameters.Add(parm1);
            }
            catch (Exception err)
            {
                e.Cancel = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnError", "alert('Terdapat masalah ketika memuat data Akaun Aset.\nMasalah: '"+err.Message +");", true);
            }            
        }

        protected void DepAccDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = GetGlCode(ref Dt);

                if (err != string.Empty)
                {
                    FormSagaTVPAccount(ref Dt);
                }

                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm1.Value = Dt;
                parm1.Direction = ParameterDirection.Input;
                e.Command.Parameters.Add(parm1);
            }
            catch (Exception err)
            {
                e.Cancel = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnError", "alert('Terdapat masalah ketika memuat data Akaun Aset.\nMasalah: '" + err.Message + ");", true);
            }            
        }

        protected void GainDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = GetGlCode(ref Dt);

                if (err != string.Empty)
                {
                    FormSagaTVPAccount(ref Dt);
                }

                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm1.Value = Dt;
                parm1.Direction = ParameterDirection.Input;
                e.Command.Parameters.Add(parm1);
            }
            catch (Exception err)
            {
                e.Cancel = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnError", "alert('Terdapat masalah ketika memuat data Akaun Aset.\nMasalah: '" + err.Message + ");", true);
            }            
        }

        protected void DepCumDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = GetGlCode(ref Dt);

                if (err != string.Empty)
                {
                    FormSagaTVPAccount(ref Dt);
                }

                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm1.Value = Dt;
                parm1.Direction = ParameterDirection.Input;
                e.Command.Parameters.Add(parm1);
            }
            catch (Exception err)
            {
                e.Cancel = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnError", "alert('Terdapat masalah ketika memuat data Akaun Aset.\nMasalah: '" + err.Message + ");", true);
            }            
        }

        protected void LossDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = GetGlCode(ref Dt);

                if (err != string.Empty)
                {
                    FormSagaTVPAccount(ref Dt);
                }

                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm1.Value = Dt;
                parm1.Direction = ParameterDirection.Input;
                e.Command.Parameters.Add(parm1);
            }
            catch (Exception err)
            {
                e.Cancel = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnError", "alert('Terdapat masalah ketika memuat data Akaun Aset.\nMasalah: '" + err.Message + ");", true);
            }            
        }
    }
}