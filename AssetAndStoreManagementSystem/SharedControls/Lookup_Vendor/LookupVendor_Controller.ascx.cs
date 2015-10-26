using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.SharedControls.Lookup_Vendor
{
    public partial class LookupVendor_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridVendorLookup_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridVendorLookup.DataBind();
        }

        protected void GridVendorLookup_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "SetVen_SAGACode": FormHyperLink(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "SetVen_Name": FormHyperLink(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
            }
        }

        void FormHyperLink(int VisibleIndex, string FieldName, object CellValue)
        {
            ASPxHyperLink link = (ASPxHyperLink)GridVendorLookup.FindRowCellTemplateControl(VisibleIndex, GridVendorLookup.DataColumns[FieldName] as GridViewDataColumn, FieldName);

            if (link != null)
            {
                string SetVen_SAGACode = GridVendorLookup.GetRowValues(VisibleIndex, "SetVen_SAGACode").ToString();

                link.ClientInstanceName = FieldName + "_" + VisibleIndex.ToString();
                link.Text = CellValue.ToString();
                link.NavigateUrl = "javascript: VendorSelected('" + SetVen_SAGACode + "')";
            }
        }
    }
}