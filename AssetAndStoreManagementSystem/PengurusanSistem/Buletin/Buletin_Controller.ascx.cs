using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using DevExpress.Web;
using System.Configuration;
using Core.PengurusanSistem;
using System.IO;
using Core.Common;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Buletin
{
    public partial class Buletin_Controller : System.Web.UI.UserControl
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
                CommonMethods.SP_Common_GetUserGroupRights(ticket.Name, 6, ref Dt);

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

        void SaveDeleteMode(int Mode)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();
                string BulId = string.Empty;

                try
                {
                    FormTvp(ref Dt);
                    PopulateTvp(ref Dt);
                    cbp_popupManagement.JSProperties["cpErrMsg"] = BuletinMethods.SP_Buletin_SaveDelete(ticket.Name, ref Dt, Mode, ref BulId);                   
                }
                catch (Exception err)
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_popupManagement.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
                }
            }
            else
            {
                cbp_popupManagement.JSProperties["cpErrMsg"] = "Session Expired.";
            } 
        }

        void NewMode()
        {
            BLT_Id.Text = string.Empty;
            BLT_StartDate.Value = DBNull.Value;
            BLT_EndDate.Value = DBNull.Value;
            BLT_Image.Text = string.Empty;
            BLT_Title.Text = string.Empty;
            BLT_Content.Text = string.Empty;
            BLT_ImagePic.ImageUrl = "~/Public/Images/Others/BuletinDefaulImage.png";
            cbp_popupManagement.JSProperties["cpErrMsg"] = string.Empty;
        }

        void LoadImage()
        {
            string ImagePath = Path.Combine(ConfigurationManager.AppSettings["ImageUploadFolder"].ToString(), BLT_Image.Text);
            BLT_ImagePic.ImageUrl = ImagePath;
            cbp_popupManagement.JSProperties["cpErrMsg"] = string.Empty;
        }

        void LoadBuletin()
        {
            DataTable Dt = new DataTable();

            try
            {
                string DbErr = BuletinMethods.LoadBuletin(ref Dt, BLT_Id.Text);

                if (DbErr == string.Empty)
                {
                    BLT_StartDate.Date = Convert.ToDateTime(Dt.Rows[0]["BLT_StartDate"]);
                    BLT_EndDate.Date = Convert.ToDateTime(Dt.Rows[0]["BLT_EndDate"]);
                    BLT_Image.Text = Dt.Rows[0]["BLT_Image"].ToString();
                    BLT_Title.Text = Dt.Rows[0]["BLT_Title"].ToString();
                    BLT_Content.Text = Dt.Rows[0]["BLT_Content"].ToString();
                    string ImagePath = Path.Combine(ConfigurationManager.AppSettings["ImageUploadFolder"].ToString(),Dt.Rows[0]["BLT_Image"].ToString());

                    if (File.Exists(Server.MapPath(ImagePath)))
                        BLT_ImagePic.ImageUrl = ImagePath;
                    else
                        BLT_ImagePic.ImageUrl = "~/Public/Images/Others/BuletinDefaulImage.png";

                    cbp_popupManagement.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {                   
                    cbp_popupManagement.JSProperties["cpErrMsg"] = DbErr;
                }
            }
            catch (Exception err)
            {               
                cbp_popupManagement.JSProperties["cpErrMsg"] = err.Message;
            }
        }
               
        void FormTvp(ref DataTable Dt)
        {
            DataColumn BLT_Id = Dt.Columns.Add("BLT_Id", typeof(Int32));
            DataColumn BLT_StartDate = Dt.Columns.Add("BLT_StartDate", typeof(DateTime));
            DataColumn BLT_EndDate = Dt.Columns.Add("BLT_EndDate", typeof(DateTime));
            DataColumn BLT_Image = Dt.Columns.Add("BLT_Image", typeof(String));
            DataColumn BLT_Title = Dt.Columns.Add("BLT_Title", typeof(String));
            DataColumn BLT_Content = Dt.Columns.Add("BLT_Content", typeof(String));
            Dt.AcceptChanges();
        }

        void PopulateTvp(ref DataTable Dt)
        {
            DataRow Dr = Dt.NewRow();

            if (BLT_Id.Text == "")
                Dr["BLT_Id"] = DBNull.Value;
            else
                Dr["BLT_Id"] = Convert.ToInt32(BLT_Id.Text);

            Dr["BLT_StartDate"] = BLT_StartDate.Date;
            Dr["BLT_EndDate"] = BLT_EndDate.Date;
            Dr["BLT_Image"] = BLT_Image.Text;
            Dr["BLT_Title"] = BLT_Title.Text.Trim();
            Dr["BLT_Content"] = BLT_Content.Text.Trim();
            Dt.Rows.Add(Dr);
            Dt.AcceptChanges();
        }       

        protected void ImageUploader_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                if (e.IsValid)
                {
                    try
                    {
                        string UploadLocation = ConfigurationManager.AppSettings["ImageUploadFolder"].ToString();
                        string NewFileName = DateTime.Now.ToString("ddMMyyHHmmss") + e.UploadedFile.FileName;
                        string FileFullPath = Path.Combine(Server.MapPath(UploadLocation), NewFileName);
                        e.UploadedFile.SaveAs(FileFullPath);

                        ImageUploader.JSProperties["cppopupAttachImage_SystemFileName"] = NewFileName;
                        ImageUploader.JSProperties["cppopupAttachImage_UserFileName"] = e.UploadedFile.FileName;
                        ImageUploader.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    catch (Exception err)
                    {
                        ImageUploader.JSProperties["cpErrMsg"] = err.Message;
                    }
                }
                else
                { ImageUploader.JSProperties["cpErrMsg"] = e.ErrorText; }
            }
            else
            { ImageUploader.JSProperties["cpErrMsg"] = "Session Expired."; }            
        }

        protected void cbp_Report_Callback(object sender, CallbackEventArgsBase e)
        {
            Session["ReportName"] = "Buletin";
        }

        protected void MainGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            MainGrid.DataBind();
        }

        protected void MainGrid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "BLT_Title")
            {
                ASPxHyperLink link = (ASPxHyperLink)MainGrid.FindRowCellTemplateControl(e.VisibleIndex, MainGrid.DataColumns["BLT_Title"] as GridViewDataColumn, "BLT_Title");

                if (link != null)
                {
                    string BLT_Id = MainGrid.GetRowValues(e.VisibleIndex, "BLT_Id").ToString();
                    link.ClientInstanceName = e.DataColumn.FieldName + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: ViewBuletin('" + BLT_Id + "');";                    
                }
            }
        }

        protected void cbp_popupManagement_Callback(object sender, CallbackEventArgsBase e)
        {
            cbp_popupManagement.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "LOAD": LoadBuletin(); break;
                case "LOADIMAGE": LoadImage(); break;
                case "ADD": NewMode(); break;
                case "CANCEL": NewMode(); break;
                case "DELETE": SaveDeleteMode(2); break;
                case "SAVE": SaveDeleteMode(1); break;
            }
        }

        protected void GridAuditListing_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridAuditListing.DataBind();
        }

        protected void GridAuditListing_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "ModifiedBy")
            {
                ASPxHyperLink ModifiedBy = (ASPxHyperLink)GridAuditListing.FindRowCellTemplateControl(e.VisibleIndex, GridAuditListing.DataColumns["ModifiedBy"] as GridViewDataColumn, "ModifiedBy");

                if (ModifiedBy != null)
                {
                    string ProcessId = GridAuditListing.GetRowValues(e.VisibleIndex, "ProcessId").ToString();
                    ModifiedBy.Text = e.CellValue.ToString();
                    ModifiedBy.ClientInstanceName = "ModifiedBy" + e.VisibleIndex.ToString();
                    ModifiedBy.NavigateUrl = "javascript: ViewAuditDetails('" + ProcessId + "');";
                }
            }
        }

        protected void AuditHeaderDs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (Pid.Text == string.Empty)
                e.Cancel = true;
            else
                e.Command.Parameters["@ProcessId"].Value = Pid.Text;
        }

        protected void GridAuditHeaderDetails_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridAuditHeaderDetails.DataBind();
        }
    }
}