using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Core.PengurusanSistem;
using Core.VerifikasiPengguna.LogMasuk;
using System.Data;
using System.Configuration;
using System.IO;

namespace AssetAndStoreManagementSystem.LamanUtama
{
    public partial class Index_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PopupLoading.ShowOnPageLoad = false;
                
                LoadSystemUserPopup();
            }
        }

        void LoadSystemUserPopup()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                string DbErr = string.Empty;
                DataTable Dt = new DataTable();
                DataTable LoginDt = new DataTable();

                try
                {
                    string IP = LogMasukMethod.GetLanIPAddress();

                    LogMasukMethod.SP_LoginHistory_Insert(ticket.Name, IP);
                    DbErr = PenggunaSistemMethods.GetCurrentUserInfo(ticket.Name, ref Dt);

                    if (DbErr == string.Empty && Dt.Rows.Count == 1)
                    {
                        lblUserName.Text = Dt.Rows[0]["User_Salutation"].ToString();
                        lblPtj.Text = Dt.Rows[0]["PTJ_FullName"].ToString();

                        string OldFileNamePath = Path.Combine(Server.MapPath(ConfigurationManager.AppSettings["SystemUsersImageFolder"].ToString()), Dt.Rows[0]["UserCre_ImageName"].ToString());

                        if (File.Exists(OldFileNamePath))
                        {
                            ProfileImage.ImageUrl = Path.Combine(ConfigurationManager.AppSettings["SystemUsersImageFolder"].ToString(), Dt.Rows[0]["UserCre_ImageName"].ToString());
                            SystemUserDefaultImage.ImageUrl = Path.Combine(ConfigurationManager.AppSettings["SystemUsersImageFolder"].ToString(), Dt.Rows[0]["UserCre_ImageName"].ToString());
                        }
                        else
                        {
                            ProfileImage.ImageUrl = "~/Upload/SystemUsers/DefaultSystemUser.png";
                            SystemUserDefaultImage.ImageUrl = "~/Upload/SystemUsers/DefaultSystemUser.png";
                        }

                        LogMasukMethod.SP_LoginHistory_GetLastLogin(ticket.Name, ref LoginDt);

                        if (LoginDt.Rows.Count == 2)
                        {
                            lblLastLogin.Text = Convert.ToDateTime(LoginDt.Rows[1]["LoginDateTime"]).ToString("dd/MM/yyyy HH:mm:ss") + " (" + LoginDt.Rows[1]["IpAddress"].ToString() + ")";
                        }
                        else
                        {
                            lblLastLogin.Text = "Login kali pertama.";
                        }
                    }
                }
                catch(Exception err)
                { Console.WriteLine(err.Message); }
                finally
                {Dt.Dispose();}
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }       

        protected void cbp_UserProfile_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            LoadSystemUserPopup();
        }

        protected void UserProfileImageUploader_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                if (e.IsValid)
                {
                    try
                    {
                        string UploadLocation = ConfigurationManager.AppSettings["SystemUsersImageFolder"].ToString();
                        string NewFileName = DateTime.Now.ToString("ddMMyyHHmmss") + e.UploadedFile.FileName;
                        e.UploadedFile.SaveAs(MapPath(UploadLocation) + NewFileName);

                        string CurrImageFileName = string.Empty;
                        PenggunaSistemMethods.GetSystemUserProfileImage(ticket.Name, ref CurrImageFileName);

                        string OldFileNamePath = Path.Combine(Server.MapPath(UploadLocation), CurrImageFileName);

                        if (File.Exists(OldFileNamePath))
                            File.Delete(OldFileNamePath);

                        PenggunaSistemMethods.UpdateSystemUserProfileImage(ticket.Name, NewFileName);

                        string PathForMainImage = Path.Combine(UploadLocation, CurrImageFileName);
                        PathForMainImage = PathForMainImage.Replace("~","");

                        UserProfileImageUploader.JSProperties["cpProfileImageUrl"] = PathForMainImage;
                        UserProfileImageUploader.JSProperties["cppopupAttachImage_SystemFileName"] = NewFileName;
                        UserProfileImageUploader.JSProperties["cppopupAttachImage_UserFileName"] = e.UploadedFile.FileName;
                        UserProfileImageUploader.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    catch (Exception err)
                    {
                        UserProfileImageUploader.JSProperties["cpErrMsg"] = err.Message;
                    }
                }
                else
                { UserProfileImageUploader.JSProperties["cpErrMsg"] = e.ErrorText; }
            }
            else
            { UserProfileImageUploader.JSProperties["cpErrMsg"] = "Session Expired."; } 
        }

        protected void cbp_DefaultProfileImage_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            string UploadLocation = ConfigurationManager.AppSettings["SystemUsersImageFolder"].ToString();
            string CurrImageFileName = string.Empty;
            PenggunaSistemMethods.GetSystemUserProfileImage(ticket.Name, ref CurrImageFileName);

            string OldFileNamePath = Path.Combine(Server.MapPath(ConfigurationManager.AppSettings["SystemUsersImageFolder"].ToString()), CurrImageFileName);

            if (File.Exists(OldFileNamePath))
            {
                SystemUserDefaultImage.ImageUrl = Path.Combine(ConfigurationManager.AppSettings["SystemUsersImageFolder"].ToString(), CurrImageFileName);
            }
            else
            {
                SystemUserDefaultImage.ImageUrl = "~/Upload/SystemUsers/DefaultSystemUser.png";
            }               
        }
    }
}