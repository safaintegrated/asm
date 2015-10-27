using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Configuration;
using Core.Stor.Stor;

namespace AssetAndStoreManagementSystem.Stor.Stor
{
    public partial class Stor_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }
        }

        protected void cbp_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch(e.Parameter)
                {
                    case "SAVE": SaveDeleteMode(ticket.Name, 1); break; 
                }                
            }
            else
                cbp.JSProperties["cpErrMsg"] = "Session Expired.";            
        }

        void SaveDeleteMode(string CurrUser, int Mode)
        {
            DataTable Dt = new DataTable();

            try
            {
                FormTVP(ref Dt);
                PopulateTVP(ref Dt);

                string DbErr = "";//StorMethods.SP_Store_SaveDelete(ref Dt, CurrUser, Mode);

                if (DbErr == "")
                { cbp.JSProperties["cpErrMsg"] = string.Empty; }
                else
                { cbp.JSProperties["cpErrMsg"] = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString() + " " + DbErr; }
            }
            catch (Exception err)
            { cbp.JSProperties["cpErrMsg"] = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString() + " " + err; }
            finally
            { Dt.Dispose(); }
        }

        void FormTVP(ref DataTable Dt)
        { 
            DataColumn ST_StoreId = Dt.Columns.Add("ST_StoreId", typeof(Int32));
            DataColumn ST_StoreName = Dt.Columns.Add("ST_StoreName", typeof(String));
            DataColumn ST_StorePTJId = Dt.Columns.Add("ST_StorePTJId", typeof(Int32));
            DataColumn ST_StoreAdd1 = Dt.Columns.Add("ST_StoreAdd1", typeof(String));
            DataColumn ST_StoreAdd2 = Dt.Columns.Add("ST_StoreAdd2", typeof(String));
            DataColumn ST_StoreAdd3 = Dt.Columns.Add("ST_StoreAdd3", typeof(String));
            DataColumn ST_StoreAdd4 = Dt.Columns.Add("ST_StoreAdd4", typeof(String));
            DataColumn ST_StoreOfficerEmpSysId = Dt.Columns.Add("ST_StoreOfficerEmpSysId", typeof(Int32));
            DataColumn ST_StorePhoneNumber = Dt.Columns.Add("ST_StorePhoneNumber", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if(ST_StoreId.Text == "")
                Dr["ST_StoreId"] = DBNull.Value;
            else
                Dr["ST_StoreId"] = Convert.ToInt32(ST_StoreId.Text);

            Dr["ST_StoreName"] = ST_StoreName.Text.Trim();
            Dr["ST_StorePTJId"] = Convert.ToInt32(ST_StorePTJId.Value);
            Dr["ST_StoreAdd1"] = ST_StoreAdd1.Text.Trim();
            Dr["ST_StoreAdd2"] = ST_StoreAdd2.Text.Trim();
            Dr["ST_StoreAdd3"] = ST_StoreAdd3.Text.Trim();
            Dr["ST_StoreAdd4"] = ST_StoreAdd4.Text.Trim();
            Dr["ST_StoreOfficerEmpSysId"] = Convert.ToInt32(ST_StoreOfficerEmpSysId.Value);
            Dr["ST_StorePhoneNumber"] = ST_StorePhoneNumber.Text.Trim();
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }
    }
}