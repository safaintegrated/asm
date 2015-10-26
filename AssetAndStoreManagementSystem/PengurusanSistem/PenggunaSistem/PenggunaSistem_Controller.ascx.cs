using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using DevExpress.Web;
using Core.Utility;
using Core.PengurusanSistem;
using Core.Common;

namespace AssetAndStoreManagementSystem.PengurusanSistem.PenggunaSistem
{
    public partial class PenggunaSistem_Controller : System.Web.UI.UserControl
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
                CommonMethods.SP_Common_GetUserGroupRights(ticket.Name, 3, ref Dt);

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

                    AddBtn.ClientEnabled = false;
                    EditBtn.ClientEnabled = false;
                    DeleteBtn.ClientEnabled = false;
                }
            }
        }

        protected void MainGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            MainGrid.DataBind();
        }

        protected void MainGrid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "User_Name")
            {
                ASPxHyperLink User_Name = (ASPxHyperLink)MainGrid.FindRowCellTemplateControl(e.VisibleIndex, MainGrid.DataColumns["User_Name"] as GridViewDataColumn, "User_Name");

                if (User_Name != null)
                {
                    string User_Id = MainGrid.GetRowValues(e.VisibleIndex, "User_Id").ToString();
                    User_Name.ClientInstanceName = "User_Name" + e.VisibleIndex.ToString();
                    User_Name.Text = e.CellValue.ToString();
                    User_Name.NavigateUrl = "javascript: SystemUserSelected('" + User_Id + "');";
                }

            }
        }

        protected void cbp_Report_Callback(object sender, CallbackEventArgsBase e)
        {
            Session["ReportName"] = "SystemUser";
        }
       
    }
}