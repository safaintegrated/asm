﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Web.Security;

namespace AssetAndStoreManagementSystem.Stor.Pelupusan.Lookup
{
    public partial class Lookup_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void GridLookupLembagaPemeriksa_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        //{
        //    if (e.DataColumn.FieldName == "LPH_LembagaName")
        //    {
        //        ASPxHyperLink LPH_LembagaName = (ASPxHyperLink)GridLookupPelupusan.FindRowCellTemplateControl(e.VisibleIndex, GridLookupLembagaPemeriksa.DataColumns["LPH_LembagaName"] as GridViewDataColumn, "LPH_LembagaName");

        //        if (LPH_LembagaName != null)
        //        {
        //            string LPH_UniqueId = string.Empty;
        //            LPH_UniqueId = GridLookupPelupusan.GetRowValues(e.VisibleIndex, "LPH_UniqueId").ToString();
        //            LPH_LembagaName.ClientInstanceName = "LPH_LembagaName" + e.VisibleIndex.ToString();
        //            LPH_LembagaName.Text = e.CellValue.ToString();
        //            LPH_LembagaName.NavigateUrl = "javascript: PelupusanSelected('" + LPH_UniqueId + "');";
        //        }
        //    }
        //}

        protected void SearchDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                e.Command.Parameters["@CurrUser"].Value = Convert.ToInt32(ticket.Name);
            }
            else
                e.Cancel = true;
        }

        protected void GridLookupPelupusan_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "PerihalStok")
            {
                ASPxHyperLink link = (ASPxHyperLink)GridLookupPelupusan.FindRowCellTemplateControl(e.VisibleIndex, GridLookupPelupusan.DataColumns["PerihalStok"] as GridViewDataColumn, "PerihalStok");

                if (link != null)
                {
                    string PelupusanItemId = GridLookupPelupusan.GetRowValues(e.VisibleIndex, "PelupusanItemId").ToString();

                    link.ClientInstanceName = "PerihalStok" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: PelupusanSelected(" + PelupusanItemId + ");";
                }
            }
        }

    }
}