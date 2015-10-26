using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Core.Common;
using System.Configuration;
using System.Web.Security;
using System.Data;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Lokasi
{
    public partial class Lokasi_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ManageMainRibbon();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnLokasi_Controller_PageLoad();", true);
            }               
        }

        void ManageMainRibbon()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            var tab = MainRibbon.Tabs.FindByName("Utama");
            var group = tab.Groups.FindByName("Pengurusan Rekod");
            var AddBtn = group.Items.FindByName("Tambah") as RibbonButtonItem;
            var EditBtn = group.Items.FindByName("Kemaskini") as RibbonButtonItem;
            var DeleteBtn = group.Items.FindByName("Padam") as RibbonButtonItem;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();
                CommonMethods.SP_Common_GetUserGroupRights(ticket.Name, 36, ref Dt);

                if (Dt.Rows.Count == 1)
                {
                    EnableCreate.Text = Dt.Rows[0]["EnableCreate"].ToString();
                    EnableUpdate.Text = Dt.Rows[0]["EnableUpdate"].ToString();
                    EnableDelete.Text = Dt.Rows[0]["EnableDelete"].ToString();                  

                    if (Convert.ToBoolean(Dt.Rows[0]["EnableCreate"]))
                        AddBtn.ClientEnabled = true;
                    else
                        AddBtn.ClientEnabled = false;

                    EditBtn.ClientEnabled = false;
                    DeleteBtn.ClientEnabled = false;
                }
                else
                {
                    AddBtn.ClientEnabled = false;
                    EditBtn.ClientEnabled = false;
                    DeleteBtn.ClientEnabled = false;
                }
            }
        }

        protected void cbp_Report_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (PageControl.ActiveTabIndex == 0)
            { Session["ReportName"] = "PTJList"; }
            else if (PageControl.ActiveTabIndex == 1)
            { Session["ReportName"] = "FPJBList"; }
            else if (PageControl.ActiveTabIndex == 2)
            { Session["ReportName"] = "BUILDList"; }
            else if (PageControl.ActiveTabIndex == 3)
            { Session["ReportName"] = "FLOORList"; }
            else if (PageControl.ActiveTabIndex == 4)
            { Session["ReportName"] = "SPACEList"; }
        }
    }
}