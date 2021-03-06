﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace AssetAndStoreManagementSystem.SharedControls.Lookup_KodBidang
{
    public partial class Lookup_KodBidang_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_SelectedKodBiang_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            DataTable Dt = new DataTable();

            try
            {
                if (Session["CurrVendorKodBidang"] != null)
                    Session.Remove("CurrVendorKodBidang");

                FormDt(ref Dt);

                for (int i = 0; i < GridLookupKodBidang.VisibleRowCount; i++)
                {
                    if (GridLookupKodBidang.Selection.IsRowSelected(i))
                    {
                        DataRow Dr = Dt.NewRow();
                        Dr["ItemCode"] = GridLookupKodBidang.GetRowValues(i, "ItemCode").ToString();
                        Dr["Item"] = GridLookupKodBidang.GetRowValues(i, "Item").ToString();
                        Dt.Rows.Add(Dr);
                    }
                }

                Dt.AcceptChanges();
                Session["CurrVendorKodBidang"] = Dt;
                cbp_SelectedKodBiang.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_SelectedKodBiang.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
        }

        void FormDt(ref DataTable Dt)
        {
            DataColumn ItemCode = Dt.Columns.Add("ItemCode", typeof(string));
            DataColumn Item = Dt.Columns.Add("Item", typeof(string));
            Dt.AcceptChanges();
        }
    }
}