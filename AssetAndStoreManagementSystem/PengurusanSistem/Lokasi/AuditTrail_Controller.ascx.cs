﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//dev
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Lokasi
{
    public partial class AuditTrail_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridAuditDetails_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridAuditDetails.DataBind();
        }

        protected void AuditTrailDetailDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (AuditTrailType.Text == "")
                e.Cancel = true;
            else
            {
                e.Command.Parameters["@Type"].Value = Convert.ToInt32(AuditTrailType.Text);
                e.Command.Parameters["@ProcessId"].Value = AuditTrailProcessId.Text;
            }
        }

        protected void GridAuditListing_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "ModifiedBy")
            {
                ASPxHyperLink ModifiedBy = (ASPxHyperLink)GridAuditListing.FindRowCellTemplateControl(e.VisibleIndex, GridAuditListing.DataColumns["ModifiedBy"] as GridViewDataColumn, "ModifiedBy");

                if (ModifiedBy != null)
                {
                    string ProcessId = GridAuditListing.GetRowValues(e.VisibleIndex, "ProcessId").ToString();
                    ModifiedBy.ClientInstanceName = "ModifiedBy_" + e.VisibleIndex.ToString();
                    ModifiedBy.Text = e.CellValue.ToString();
                    ModifiedBy.NavigateUrl = "javascript: AuditDetailSelected('" + ProcessId + "'); ";
                }

            }
        }

        protected void GridAuditListing_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridAuditListing.DataBind();
        }

        protected void AuditMasterDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (AuditTrailType.Text == "")
                e.Cancel = true;
            else
                e.Command.Parameters["@Type"].Value = Convert.ToInt32(AuditTrailType.Text);
        }
    }
}