using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.IO;
using Core.Common;
using DevExpress.Web;
using Core.PengurusanSistem;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Organisasi
{
    public partial class Organisasi_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ManageMainRibbon();
                Session.Remove("CurrOrgAuditNumber");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }
        }

        protected void cbp_Save_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "LOAD": LoadOrg(); break;
            }
        }       

        void LoadOrg()
        {
            cbp_Save.JSProperties["cpMode"] = "LOAD";

            DataTable Dt = new DataTable();
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            try
            {
                FormTVP(ref Dt);
                string err = OrganisasiMethods.SP_LoadUpdate_Organisation(ref Dt, ticket.Name, "LOAD");

                if (err == "")
                {
                    if (Dt.Rows.Count == 1)
                    {
                        LoadOrgInformation(ref Dt);
                        cbp_Save.JSProperties["cpErrMsg"] = string.Empty;
                    }
                }
                else
                { cbp_Save.JSProperties["cpErrMsg"] = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString() + " " + err; }
            }
            catch (Exception err)
            { cbp_Save.JSProperties["cpErrMsg"] = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString() + " " + err.Message; }
            finally
            { Dt.Dispose(); }
        }

        void FormTVP(ref DataTable Dt)
        {
            DataColumn Org_ID = Dt.Columns.Add("Org_ID", typeof(Int32));
            DataColumn Org_Name = Dt.Columns.Add("Org_Name", typeof(String));
            DataColumn Org_Add1 = Dt.Columns.Add("Org_Add1", typeof(String));
            DataColumn Org_Add2 = Dt.Columns.Add("Org_Add2", typeof(String));
            DataColumn Org_Add3 = Dt.Columns.Add("Org_Add3", typeof(String));
            DataColumn Org_Add4 = Dt.Columns.Add("Org_Add4", typeof(String));
            DataColumn Org_Postcode = Dt.Columns.Add("Org_Postcode", typeof(String));
            DataColumn Org_City = Dt.Columns.Add("Org_City", typeof(String));
            DataColumn Org_State = Dt.Columns.Add("Org_State", typeof(Int32));
            DataColumn Org_Tel = Dt.Columns.Add("Org_Tel", typeof(String));
            DataColumn Org_Fax = Dt.Columns.Add("Org_Fax", typeof(String));
            DataColumn Org_Email = Dt.Columns.Add("Org_Email", typeof(String));
            DataColumn Org_Website = Dt.Columns.Add("Org_Website", typeof(String));
            DataColumn Org_Logo = Dt.Columns.Add("Org_Logo", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();
            Dr["Org_ID"] = Convert.ToInt32(ConfigurationManager.AppSettings["OrgId"].ToString());
            Dr["Org_Name"] = Org_Name.Text.Trim();
            Dr["Org_Add1"] = Org_Add1.Text.Trim();
            Dr["Org_Add2"] = Org_Add2.Text.Trim();
            Dr["Org_Add3"] = Org_Add3.Text.Trim();
            Dr["Org_Add4"] = Org_Add4.Text.Trim();
            Dr["Org_Postcode"] = Org_Postcode.Text.Trim();
            Dr["Org_City"] = Org_City.Text.Trim();

            if (Org_State.SelectedIndex == -1)
                Dr["Org_State"] = DBNull.Value;
            else
                Dr["Org_State"] = Convert.ToInt32(Org_State.Value);

            Dr["Org_Tel"] = Org_Tel.Text.Trim();
            Dr["Org_Email"] = Org_Email.Text.Trim();
            Dr["Org_Website"] = Org_Website.Text.Trim();
            Dr["Org_Logo"] = DBNull.Value;

            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }

        void LoadOrgInformation(ref DataTable Dt)
        {
            DataRow Dr = Dt.Rows[0];

            Org_Name.Text = Dr["Org_Name"].ToString();
            Org_Add1.Text = Dr["Org_Add1"].ToString();
            Org_Add2.Text = Dr["Org_Add2"].ToString();
            Org_Add3.Text = Dr["Org_Add3"].ToString();
            Org_Add4.Text = Dr["Org_Add4"].ToString();
            Org_Postcode.Text = Dr["Org_Postcode"].ToString();
            Org_City.Text = Dr["Org_City"].ToString();

            if (Dr["Org_State"].ToString() == "")
                Org_State.SelectedIndex = -1;
            else
                Org_State.SelectedIndex = Org_State.Items.FindByValue(Convert.ToInt32(Dr["Org_State"].ToString())).Index;

            Org_Tel.Text = Dr["Org_Tel"].ToString();
            Org_Email.Text = Dr["Org_Email"].ToString();
            Org_Website.Text = Dr["Org_Website"].ToString();

            if (Dr["Org_Logo"].ToString() != "")
            {
                string UploadLocation = ConfigurationManager.AppSettings["SystemLogoLocation"].ToString();
                string FileFullPath = Path.Combine(Server.MapPath(UploadLocation), Dr["Org_Logo"].ToString());

                if (!File.Exists(FileFullPath))
                    OrgLogo.ImageUrl = "~/Upload/DefaultOrgImage.png";
                else
                    OrgLogo.ImageUrl = Path.Combine(UploadLocation,Dr["Org_Logo"].ToString());
            }
            else
                OrgLogo.ImageUrl = "~/Upload/DefaultOrgImage.png"; 
        }

        protected void LogoSelector_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                try
                {
                    string UploadLocation = ConfigurationManager.AppSettings["SystemLogoLocation"].ToString();
                    string NewFileName = DateTime.Now.ToString("ddMMyyHHmmss") + "_" + e.UploadedFile.FileName;
                    e.UploadedFile.SaveAs(MapPath(UploadLocation) + NewFileName);

                    //remove old image file
                    string OldFileName = string.Empty;
                    OrganisasiMethods.GetOrganizationLogo(ref OldFileName);

                    string OldFileNamePath = Path.Combine(Server.MapPath(UploadLocation), OldFileName);

                    if (File.Exists(OldFileNamePath))
                        File.Delete(OldFileNamePath);

                    //update db with the new filename
                    string ErrMsg = OrganisasiMethods.UpdateOrganizationLogo(NewFileName);

                    if(ErrMsg == string.Empty)
                        LogoSelector.JSProperties["cpErrMsg"] = "";
                    else
                        LogoSelector.JSProperties["cpErrMsg"] = "System telah menghadapi masalah ketika memuat-naik logo organisasi.<br>Masalah: "+ErrMsg;
                    
                }
                catch (Exception err)
                {
                    LogoSelector.JSProperties["cpErrMsg"] = err.Message;
                }
            }
            else
            { LogoSelector.JSProperties["cpErrMsg"] = e.ErrorText; }
        }

        protected void cbp_OrgLogo_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            try
            {
                string FileName = string.Empty;

                string ErrMsg = OrganisasiMethods.GetOrganizationLogo(ref FileName);

                if (ErrMsg == string.Empty)
                {
                    string UploadLocation = ConfigurationManager.AppSettings["SystemLogoLocation"].ToString();
                    string FileFullPath = Path.Combine(Server.MapPath(UploadLocation), FileName);

                    if (!File.Exists(FileFullPath))
                    { OrgLogo.ImageUrl = "~/Upload/DefaultOrgImage.png"; }
                    else
                    { OrgLogo.ImageUrl = Path.Combine(UploadLocation, FileName); }

                    LogoSelector.JSProperties["cpErrMsg"] = "";
                }
                else
                    LogoSelector.JSProperties["cpErrMsg"] = "System telah menghadapi masalah ketika memuat-naik logo organisasi.<br>Masalah: " + ErrMsg;

            }
            catch (Exception err)
            { LogoSelector.JSProperties["cpErrMsg"] = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString() + " " + err.Message; }
        }

        protected void cbp_SaveOrg_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();

                try
                {
                    FormTVP(ref Dt);
                    PopulateTVP(ref Dt);

                    string err = OrganisasiMethods.SP_LoadUpdate_Organisation(ref Dt, ticket.Name, "SAVE");

                    if (err == "")
                    { cbp_SaveOrg.JSProperties["cpErrMsg"] = string.Empty; }
                    else
                    { cbp_SaveOrg.JSProperties["cpErrMsg"] = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString() + " " + err; }
                }
                catch (Exception err)
                { cbp_SaveOrg.JSProperties["cpErrMsg"] = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString() + " " + err.Message; }
                finally
                { Dt.Dispose(); }
            }
            else
            { cbp_SaveOrg.JSProperties["cpErrMsg"] = "Session Expired."; }           
        }

        void ManageMainRibbon()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if(!ticket.Expired)
            {
                DataTable Dt = new DataTable();
                CommonMethods.SP_Common_GetUserGroupRights(ticket.Name, 1, ref Dt);

                var tab = MainRibbon.Tabs.FindByName("Utama");
                var group = tab.Groups.FindByName("Pengurusan Rekod");
                var AddBtn = group.Items.FindByName("Tambah") as RibbonButtonItem;
                var EditBtn = group.Items.FindByName("Kemaskini") as RibbonButtonItem;
                var DeleteBtn = group.Items.FindByName("Padam") as RibbonButtonItem;


                if (Dt.Rows.Count == 1)
                {
                    EnableCreate.Text = Dt.Rows[0]["EnableCreate"].ToString();
                    EnableUpdate.Text = Dt.Rows[0]["EnableUpdate"].ToString();
                    EnableDelete.Text = Dt.Rows[0]["EnableDelete"].ToString();

                    if (Convert.ToBoolean(Dt.Rows[0]["EnableCreate"]))
                        AddBtn.ClientEnabled = false;
                    else
                        AddBtn.ClientEnabled = false;

                    if (Convert.ToBoolean(Dt.Rows[0]["EnableUpdate"]))
                        EditBtn.ClientEnabled = true;
                    else
                        EditBtn.ClientEnabled = false;

                    if (Convert.ToBoolean(Dt.Rows[0]["EnableDelete"]))
                        DeleteBtn.ClientEnabled = false;
                    else
                        DeleteBtn.ClientEnabled = false;
                }
                else
                { 
                    DeleteBtn.ClientEnabled = false;
                    EditBtn.ClientEnabled = false;
                    AddBtn.ClientEnabled = false;
                }

            }            
        }
    }
}