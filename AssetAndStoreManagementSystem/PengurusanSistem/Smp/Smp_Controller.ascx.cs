using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Web.Security;
using Sybase.Data.AseClient;
using System.Configuration;
using Core.Utility;
using Core.PengurusanSistem;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Smp
{
    public partial class Smp_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoad();", true);
            }
        }

        protected void cbp_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                cbp.JSProperties["cpMode"] = e.Parameter;

                switch (e.Parameter)
                {
                    case "LOAD": LoadSmpConfig(); break;
                    case "SAVE": SaveSmpConfig(ticket.Name); break;
                }
            }
        }

        void LoadSmpConfig()
        {
            DataSet ds = new DataSet();
            string XmlEmailFilePath = Server.MapPath(ConfigurationManager.AppSettings["SmpXmlFilePath"].ToString());

            try
            {
                string errx = XmlMethods.ReadXMLFile(ref ds, XmlEmailFilePath);

                if (errx == string.Empty)
                {
                    ConnString.Text = ds.Tables[0].Rows[0]["ConnString"].ToString();
                    LastModBy.Text = ds.Tables[0].Rows[0]["LastModBy"].ToString();
                    LastModDate.Text = ds.Tables[0].Rows[0]["LastModDate"].ToString();
                    cbp.JSProperties["cpErrMsg"] = "";
                }
                else
                {
                    cbp.JSProperties["cpErrMsg"] = "Sistem telah menghadapi masalah teknikal (XML Error).<br>Masalah : " + errx;
                }
            }
            catch (Exception err)
            {
                cbp.JSProperties["cpErrMsg"] = "Sistem telah menghadapi masalah teknikal (Caught by exceptions).<br>Masalah : " + err.Message;
            }
            finally
            {
                ds.Dispose();
            }
        }

        void SaveSmpConfig(string CurrUser)
        {
            DataTable dt = new DataTable();
            string XmlEmailFilePath = Server.MapPath(ConfigurationManager.AppSettings["SmpXmlFilePath"].ToString());

            try
            {
                string ErrMsg = string.Empty;
                string DateAndTime = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                string FullName = string.Empty;
                ErrMsg = PenggunaSistemMethods.GetSystemUserName(ref FullName, CurrUser);

                if (ErrMsg == string.Empty)
                {
                    CreateTVP(ref dt);
                    PopulateTVP(ref dt, FullName, DateAndTime);

                    ErrMsg = XmlMethods.UpdateSmpXMLFile(ref dt, XmlEmailFilePath);

                    if (ErrMsg == string.Empty)
                    {
                        cbp.JSProperties["cpErrMsg"] = "";
                        LastModBy.Text = FullName;
                        LastModDate.Text = DateAndTime;
                    }
                    else
                    {
                        cbp.JSProperties["cpErrMsg"] = "Sistem telah menghadapi masalah teknikal (DB Returned Error).<br>Masalah : " + ErrMsg;
                    }
                }
                else
                {
                    cbp.JSProperties["cpErrMsg"] = "Sistem telah menghadapi masalah teknikal (XML Error).<br>Masalah : " + ErrMsg;
                }
            }
            catch (Exception err)
            {
                cbp.JSProperties["cpErrMsg"] = "Sistem telah menghadapi masalah teknikal (Caught by exceptions).<br>Masalah : " + err.Message;
            }
            finally
            {
                dt.Dispose();
            }
        }

        void CreateTVP(ref DataTable dt)
        {
            DataColumn HostName = dt.Columns.Add("ConnString", typeof(String));
            DataColumn LastModBy = dt.Columns.Add("LastModBy", typeof(String));
            DataColumn LastModDate = dt.Columns.Add("LastModDate", typeof(String));
            dt.AcceptChanges();
        }

        void PopulateTVP(ref DataTable dt, string FullName, string DateAndTime)
        {
            DataRow dr = dt.NewRow();
            dr["ConnString"] = ConnString.Text.Trim();
            dr["LastModBy"] = FullName;
            dr["LastModDate"] = DateAndTime;
            dt.Rows.Add(dr);
            dt.AcceptChanges();
        }

        protected void cbp_TestSmp_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            try
            {
                AseConnection AseConn = new AseConnection();
                AseConn.ConnectionString = ConnString.Text.Trim();
                AseConn.Open();
                AseConn.Close();
                cbp_TestSmp.JSProperties["cpErrMsg"] = string.Empty;
            }
            catch (Exception err)
            {
                cbp_TestSmp.JSProperties["cpErrMsg"] = "Sistem menghadapi masalah ketika melakukan ujian pangkalan data SMP (Caught by Exceptions).<br><br>Masalah: " + err.Message;
            }
        }
    }
}