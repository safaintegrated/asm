using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.SharedControls.LookupPegawaiAset
{
    public partial class LookupPegawaiAset_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridLookupPegawaiAset_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridLookupPegawaiAset.DataBind();
        }

        protected void GridLookupPegawaiAset_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "EmployeeName")
            {
                ASPxHyperLink EmployeeName = (ASPxHyperLink)GridLookupPegawaiAset.FindRowCellTemplateControl(e.VisibleIndex, GridLookupPegawaiAset.DataColumns["EmployeeName"] as GridViewDataColumn, "EmployeeName");

                if (EmployeeName != null)
                {
                    EmployeeName.ClientInstanceName = "EmployeeName_" + e.VisibleIndex.ToString();
                    EmployeeName.Text = e.CellValue.ToString();
                    EmployeeName.NavigateUrl = "javascript: PegawaiAsetSelected();";
                }
            }
        }

        protected void GridLookupPegawaiAset_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            GridLookupPegawaiAset.DataColumns["EmployeeName"].Settings.AutoFilterCondition = DevExpress.Web.AutoFilterCondition.Contains;
            GridLookupPegawaiAset.DataColumns["EmployeeId"].Settings.AutoFilterCondition = DevExpress.Web.AutoFilterCondition.Contains;
            GridLookupPegawaiAset.DataColumns["EmployeeDesignation"].Settings.AutoFilterCondition = DevExpress.Web.AutoFilterCondition.Contains;
            GridLookupPegawaiAset.DataColumns["EmployeePTJ"].Settings.AutoFilterCondition = DevExpress.Web.AutoFilterCondition.Contains;
            GridLookupPegawaiAset.DataColumns["StartDate"].Settings.AutoFilterCondition = DevExpress.Web.AutoFilterCondition.Equals;
            GridLookupPegawaiAset.DataColumns["EndDate"].Settings.AutoFilterCondition = DevExpress.Web.AutoFilterCondition.Equals;
            GridLookupPegawaiAset.DataColumns["ActiveStatus"].Settings.AutoFilterCondition = DevExpress.Web.AutoFilterCondition.Equals;
        }
    }
}