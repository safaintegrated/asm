using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Web.Security;
using DevExpress.Web;
using Core.VerifikasiPengguna.LogMasuk;
using Core.Utility;
using Core.Email;

namespace AssetAndStoreManagementSystem.VerifikasiPengguna.LogMasuk
{
    public partial class LogMasuk_Controller : System.Web.UI.UserControl
    {
        Core.Services.AuthenticateService _auth = new Core.Services.AuthenticateService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PopupLogin.HeaderText = ConfigurationManager.AppSettings["ProgramTitle"].ToString();
                ASPxLabel lbl = (ASPxLabel)PopupLogin.FindControl("lblClientName");

                if (lbl != null)
                    lbl.Text = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + " Versi " + ConfigurationManager.AppSettings["Version"].ToString() + "&nbsp;&nbsp;<br>" + ConfigurationManager.AppSettings["ClientName"].ToString() + "&nbsp;&nbsp;";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int ErrCode = 0;
            string ErrMsg = string.Empty;
            string SystemUserId  = string.Empty;

            DataTable Dt = new DataTable();

            try
            {
                //LogMasukMethod.AuthenticateUser(txtUserId.Text, txtPassword.Text, ref ErrCode, ref ErrMsg, ref Dt);
                Data.Entity.Employee employee ;
                var status = _auth.AuthenticateUser(txtUserId.Text, txtPassword.Text, out employee);
                switch (status)
                {
                    case Data.Enum.LoginStatus.Success:
                        FormsAuthentication.RedirectFromLoginPage(employee.UserId, false);
                        break;
                    case Data.Enum.LoginStatus.InvalidPassword:
                       InvalidPasswordMode(); 
                       break;
                    case Data.Enum.LoginStatus.InActive:
                         InactiveUserMode(); 
                         break;
                    case Data.Enum.LoginStatus.NoRecord:
                        MoreThanOneRecordMode(); 
                        break;
                    case Data.Enum.LoginStatus.Failed:
                         DatabaseError(); 
                         break;
                    case Data.Enum.LoginStatus.DatabaseError:
                         DatabaseError(); 
                         break;
                    default:
                        break;
                }

                //                case 5: InactiveUserMode(); break; //inactive user mode
                //case 2: MoreThanOneRecordMode(); break; //more than 1 record for user
                //case 1: InvalidPasswordMode(); break; //invalid password entered

                //if (ErrCode == 0)
                //{ FormsAuthentication.RedirectFromLoginPage(Dt.Rows[0]["User_Id"].ToString(), false); }
                //else
                //{
                //    if (ErrMsg != string.Empty)
                //    { DbCaughtByExceptionMode(ErrMsg); }
                //    else
                //    { LoadErrorMessage(ErrCode, ref Dt); }
                //}
            }
            catch (Exception err)
            { LoginError(err.Message); }
            finally
            { Dt.Dispose(); }
        }

        public String GetLanIPAddress()
        {
            //The X-Forwarded-For (XFF) HTTP header field is a de facto standard for identifying the originating IP address of a 
            //client connecting to a web server through an HTTP proxy or load balancer
            String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (string.IsNullOrEmpty(ip))
            {
                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }

            return ip;
        }

        void LoginError(string ErrMsg)
        {
            ErrorPopupMessageBox_Label.Text = "Login tidak berjaya.<br>Masalah: " + ErrMsg;
            ErrorPopupMessageBox.ShowOnPageLoad = true;
        }

        void DbCaughtByExceptionMode(string ErrMsg)
        {
            ErrMsg = "Sistem menghadapi masalah ketika capaian pangkalan data dibuat.<br>Masalah: " + ErrMsg;
            ErrorPopupMessageBox_Label.Text = ErrMsg;
            ErrorPopupMessageBox.ShowOnPageLoad = true;
        }

        void GeneralExceptions(string ErrMsg)
        {
            ErrMsg = "Sistem menghadapi masalah (Caught by Exceptions).<br>Masalah: " + ErrMsg;
            ErrorPopupMessageBox_Label.Text = ErrMsg;
            ErrorPopupMessageBox.ShowOnPageLoad = true;
        }

        void LoadErrorMessage(int ErrorCode, ref DataTable Dt)
        {
            switch (ErrorCode)
            {
                case 5: InactiveUserMode(); break; //inactive user mode
                case 2: MoreThanOneRecordMode(); break; //more than 1 record for user
                case 1: InvalidPasswordMode(); break; //invalid password entered
            }
        }

        void InvalidPasswordMode()
        {
            ErrorPopupMessageBox_Label.Text = "Kata laluan yang dimasukkan tidak sah.<br>Sila cuba sekali lagi.";
            ErrorPopupMessageBox.ShowOnPageLoad = true;
        }

        void InactiveUserMode()
        {
            ErrorPopupMessageBox_Label.Text = "ID Pengguna yang dimasukkan tidak aktif.<br>Sila hubungi unit pengurusan Portal Kehadiran Staf.";
            ErrorPopupMessageBox.ShowOnPageLoad = true;
        }

        void DatabaseError()
        {
            ErrorPopupMessageBox_Label.Text = "Masalah pada paengkalan data.<br>Sila hubungi unit pengurusan sistem.";
            ErrorPopupMessageBox.ShowOnPageLoad = true;
        }

        void MoreThanOneRecordMode()
        {
            ErrorPopupMessageBox_Label.Text = "Id Pengguna yang dimasukkan tidak dijumpai.<br>Sila cuba sekali lagi.";
            ErrorPopupMessageBox.ShowOnPageLoad = true;
        }

        protected void popupHelp_SubmitBtn_Click(object sender, EventArgs e)
        {
            string tmppass = LogMasukMethod.GenerateTempPassword(7);
            string oripass = tmppass;
            tmppass = EncryptDecryptMethod.EncryptString(tmppass, "UPNM");

            string DbErr = LogMasukMethod.SP_UserAuthentication_ResetPassword(popupHelp_IDStaf.Text.Trim(), popupHelp_Emel.Text.Trim(), tmppass);

            if (DbErr == string.Empty)
            {
                string StaffName = string.Empty;

                popupHelp.ShowOnPageLoad = false;

                DbErr = SendMail.ResetEmail_SendMail(popupHelp_Emel.Text.Trim(), oripass, StaffName, Server.MapPath(ConfigurationManager.AppSettings["EmailXmlFilePath"].ToString()));

                if (DbErr == string.Empty)
                {
                    ErrorPopupMessageBox_Label.Text = "Kata laluan baru sudah dihantar.<br> Sila semak Emel anda.";
                    ErrorPopupMessageBox.ShowOnPageLoad = true;
                }
                else
                {
                    ErrorPopupMessageBox_Label.Text = "Sistem tidak dapat menghantar kata laluan baharu kepada emel anda.<br>Kata laluan baharu anda ialah: " + oripass;
                    ErrorPopupMessageBox.ShowOnPageLoad = true;
                }
            }
            else
            {
                ErrorPopupMessageBox_Label.Text = DbErr;
                ErrorPopupMessageBox.ShowOnPageLoad = true;
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
         }
    }
}