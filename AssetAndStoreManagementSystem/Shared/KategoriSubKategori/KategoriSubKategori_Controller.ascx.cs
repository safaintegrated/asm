using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;
using Core.PengurusanSistem;
using System.Configuration;
using System.Web.Security;
using Core.Shared;
using Core.Utility;
using Core.Common;

namespace AssetAndStoreManagementSystem.Shared.KategoriSubKategori
{
    public partial class KategoriSubKategori_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ManageMainRibbon();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }
        }

        void ManageMainRibbon()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();
                CommonMethods.SP_Common_GetUserGroupRights(ticket.Name, 24, ref Dt);

                if (Dt.Rows.Count == 1)
                {
                    EnableCreate.Text = Dt.Rows[0]["EnableCreate"].ToString();
                    EnableUpdate.Text = Dt.Rows[0]["EnableUpdate"].ToString();
                    EnableDelete.Text = Dt.Rows[0]["EnableDelete"].ToString();

                    var tab = MainRibbon.Tabs.FindByName("Utama");
                    var group = tab.Groups.FindByName("Pengurusan Rekod");
                    var AddBtn = group.Items.FindByName("Tambah") as RibbonButtonItem;
                    var EditBtn = group.Items.FindByName("Kemaskini") as RibbonButtonItem;
                    var DeleteBtn = group.Items.FindByName("Padam") as RibbonButtonItem;

                    if (Convert.ToBoolean(Dt.Rows[0]["EnableCreate"]))
                        AddBtn.ClientEnabled = true;
                    else
                        AddBtn.ClientEnabled = false;

                    EditBtn.ClientEnabled = false;
                    DeleteBtn.ClientEnabled = false;
                }
            }
        }

        protected void MainGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void MainGrid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "CatName")
            {
                ASPxHyperLink CatName = (ASPxHyperLink)MainGrid.FindRowCellTemplateControl(e.VisibleIndex, MainGrid.DataColumns["CatName"] as GridViewDataColumn, "CatName");

                if (CatName != null)
                {
                    string CatId = MainGrid.GetRowValues(e.VisibleIndex, "CatId").ToString();
                    CatName.ClientInstanceName = e.DataColumn.FieldName + e.VisibleIndex.ToString();
                    CatName.Text = e.CellValue.ToString();
                    CatName.NavigateUrl = "javascript: ViewCat('" + CatId + "');";
                }
            }
        }       
    }
}