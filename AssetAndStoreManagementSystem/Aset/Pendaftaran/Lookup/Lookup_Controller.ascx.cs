using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.Aset.Pendaftaran.Lookup
{
    public partial class Lookup_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridAssetInvLookup_AfterPerformCallback(object sender, DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs e)
        {

        }

        protected void GridAssetInvLookup_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "AIRMI_RegistrationNumber")
            {
                ASPxHyperLink AIRMI_RegistrationNumber = (ASPxHyperLink)GridAssetInvLookup.FindRowCellTemplateControl(e.VisibleIndex, GridAssetInvLookup.DataColumns["AIRMI_RegistrationNumber"] as GridViewDataColumn, "AIRMI_RegistrationNumber");

                if (AIRMI_RegistrationNumber != null)
                {
                    string AIRMI_UniqueId = GridAssetInvLookup.GetRowValues(e.VisibleIndex, "AIRMI_UniqueId").ToString();
                    string AIRMI_AssetInvType = GridAssetInvLookup.GetRowValues(e.VisibleIndex, "AIRMI_AssetInvType").ToString();

                    AIRMI_RegistrationNumber.ClientInstanceName = "AIRMI_RegistrationNumber" + e.VisibleIndex.ToString();
                    AIRMI_RegistrationNumber.Text = e.CellValue.ToString();
                    AIRMI_RegistrationNumber.NavigateUrl = "javascript: AssetInvSelected('" + AIRMI_UniqueId + "','" + AIRMI_AssetInvType + "');";
                }
            }
        }
    }
}