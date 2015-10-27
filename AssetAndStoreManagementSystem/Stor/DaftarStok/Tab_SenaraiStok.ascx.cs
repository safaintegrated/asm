using Core.Stor;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.DaftarStok
{
    public partial class Tab_SenaraiStok : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public int ReportLocationId
        {
            get { return (int)glSenaraiLocation.Value; }
            set { glSenaraiLocation.Value = value; }
        }

        public int ReportStockId
        {
            get { return (int)glSenaraiStock.Value; }
            set { glSenaraiStock.Value = value; }
        }


        protected void ST_StoreId_TextChanged(object sender, EventArgs e)
        {

        }

        //call back
        protected void cbp_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp.JSProperties["cpMode"] = e.Parameter;
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {
                    case "REFRESH_DAFTAR_STOCK":
                        RefreshDaftarStock();
                        break;
                }
            }
            else
                cbp.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        private void RefreshDaftarStock()
        {
            try
            {
                int locationId = Convert.ToInt32(glSenaraiLocation.Value);
                int stockId = Convert.ToInt32(glSenaraiStock.Value);

                DaftarStockDataSource.SelectParameters["@StockId"].DefaultValue = stockId.ToString();
                DaftarStockDataSource.SelectParameters["@LocationId"].DefaultValue = locationId.ToString();
                ST_Grid_DaftarStock.DataBind();
            }
            catch (Exception ex)
            {
            }

            return;
        }

        private void BindDaftarStockGrid(ref DataTable Dt)
        {
            throw new NotImplementedException();
        }

        protected void ST_Txt_StoreId_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ST_Btn_Submit_Click(object sender, EventArgs e)
        {

        }

        protected void ST_Grid_DaftarStock_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

            ST_Grid_DaftarStock.DataBind();

        }

        protected void DaftarStockDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //if (string.IsNullOrEmpty(ST_Txt_StoreId.Text))
            //    return;
            //e.Command.Parameters["@StoreId"].Value = Convert.ToInt32(ST_Txt_StoreId.Text);

        }


    }
}