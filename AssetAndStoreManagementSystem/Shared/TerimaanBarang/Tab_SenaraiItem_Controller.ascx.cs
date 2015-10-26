using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.Shared.TerimaanBarang
{
    public partial class Tab_SenaraiItem_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GrnItemsDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (Senarai_ProcessId.Text == "" || Senarai_Revision.Text == "" || Senarai_PrNumber.Text == "")
                e.Cancel = true;
            else
            {
                e.Command.Parameters["@ProcessId"].Value = Senarai_ProcessId.Text;
                e.Command.Parameters["@Revision"].Value = Convert.ToInt32(Senarai_Revision.Text);
                e.Command.Parameters["@PrNumber"].Value = Senarai_PrNumber.Text;
            }
        }

        protected void GridGrnDetails_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridGrnDetails.DataBind();
        }

        protected void GridGrnDetails_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            switch (e.DataColumn.FieldName)
            {
                case "GRND_RowId": FormCheckBox(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "GRND_UnitPrice": FormSpinEdit(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "GRND_Maintenance": FormCheckBox(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "GRND_DamagedNotes": FormMemo(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "GRND_OtherNotes": FormMemo(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "PRI_Qty": FormSpinEdit(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "GRND_ReceivedPreviously": FormSpinEdit(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "GRND_ReceivedToDate": FormSpinEdit(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "GRND_Rejected": FormSpinEdit(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
                case "Balance": FormSpinEdit(e.VisibleIndex, e.DataColumn.FieldName, e.CellValue); break;
            }
        }

        void FormCheckBox(int VisibleIndex, string Fieldname, object CellValue)
        {
            ASPxCheckBox chk = (ASPxCheckBox)GridGrnDetails.FindRowCellTemplateControl(VisibleIndex, GridGrnDetails.DataColumns[Fieldname] as GridViewDataColumn, Fieldname);

            if (chk != null)
            {
                chk.ClientInstanceName = Fieldname + VisibleIndex.ToString();

                if (Fieldname == "GRND_RowId")
                {
                    int Received = Convert.ToInt32(GridGrnDetails.GetRowValues(VisibleIndex, "GRND_ReceivedToDate"));
                    int Rejected = Convert.ToInt32(GridGrnDetails.GetRowValues(VisibleIndex, "GRND_ReceivedToDate"));

                    if (Received > 0 || Rejected > 0)
                        chk.Checked = true;
                }
                else
                {
                    chk.Checked = Convert.ToBoolean(GridGrnDetails.GetRowValues(VisibleIndex, "GRND_Maintenance"));
                }
            }
        }

        void FormSpinEdit(int VisibleIndex, string Fieldname, object CellValue)
        {
            ASPxSpinEdit spin = (ASPxSpinEdit)GridGrnDetails.FindRowCellTemplateControl(VisibleIndex, GridGrnDetails.DataColumns[Fieldname] as GridViewDataColumn, Fieldname);

            if (spin != null)
            {
                spin.ClientInstanceName = Fieldname + VisibleIndex.ToString();

                if (Fieldname == "GRND_UnitPrice")
                {
                    spin.Value = Convert.ToDecimal(CellValue);
                }
                else
                {
                    spin.Value = Convert.ToInt32(CellValue);

                    if(Fieldname == "GRND_ReceivedToDate"  || Fieldname == "GRND_Rejected")
                        spin.ClientSideEvents.ValueChanged = "function(s, e) { CalculateRowBalance('"+ VisibleIndex.ToString() +"'); }";
                }
                
            }
        }

        void FormMemo(int VisibleIndex, string Fieldname, object CellValue)
        {
            ASPxMemo memo = (ASPxMemo)GridGrnDetails.FindRowCellTemplateControl(VisibleIndex, GridGrnDetails.DataColumns[Fieldname] as GridViewDataColumn, Fieldname);

            if (memo != null)
            {
                memo.ClientInstanceName = Fieldname + VisibleIndex.ToString();
                memo.Value = CellValue.ToString();
            }
        }
    }
}