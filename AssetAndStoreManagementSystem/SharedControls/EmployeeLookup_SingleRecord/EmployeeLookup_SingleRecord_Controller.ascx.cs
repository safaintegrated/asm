using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.SharedControls.EmployeeLookup_SingleRecord
{
    public partial class EmployeeLookup_SingleRecord_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EmpGrid_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "EmployeeName")
            {
                ASPxHyperLink EmployeeName = (ASPxHyperLink)EmpGrid.FindRowCellTemplateControl(e.VisibleIndex, EmpGrid.DataColumns["EmployeeName"] as GridViewDataColumn, "EmployeeName");

                if (EmployeeName != null)
                {
                    string EmployeeSystemId = EmpGrid.GetRowValues(e.VisibleIndex, "EmployeeSystemId").ToString();
                    string EmployeeId = EmpGrid.GetRowValues(e.VisibleIndex, "EmployeeId").ToString();
                    string EmployeeNameText = EmpGrid.GetRowValues(e.VisibleIndex, "EmployeeName").ToString();
                    EmployeeName.ClientInstanceName = "EmployeeName_" + e.VisibleIndex.ToString();
                    EmployeeName.Text = e.CellValue.ToString();
                    EmployeeName.NavigateUrl = "javascript: SingleEmployeeSelected('" + EmployeeSystemId + "','" + EmployeeId + "','" + EmployeeNameText + "')";
                }
            }
        }

        protected void EmpGrid_DataBound(object sender, EventArgs e)
        {
            EmpGrid.FilterEnabled = true;
            EmpGrid.Settings.ShowFilterRow = true;
            EmpGrid.Settings.ShowFilterRowMenu = true;
        }
    }
}