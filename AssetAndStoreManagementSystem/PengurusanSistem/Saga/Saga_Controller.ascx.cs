using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Web.Security;
using System.Configuration;
using Core.Utility;
using Core.SagaInterface.Informix;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Saga
{
    public partial class Saga_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string Password = "";
                cb_DsnDrivers.DataSource = GetSystemDriverList64bit();
                cb_DsnDrivers.DataBind();
                string err = LoadSagaConfig(ref Password);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OnPageLoad", "OnPageLoad('"+ err +"','" + Password + "');", true);
            }
        }

        static List<String> GetSystemDriverList64bit()
        {
            List<string> names = new List<string>();
            Microsoft.Win32.RegistryKey baseKey = Microsoft.Win32.RegistryKey.OpenBaseKey(Microsoft.Win32.RegistryHive.LocalMachine, Microsoft.Win32.RegistryView.Registry32);
            Microsoft.Win32.RegistryKey key = baseKey.OpenSubKey("Software", Microsoft.Win32.RegistryKeyPermissionCheck.ReadSubTree);

            if (key != null)
            {
                key = key.OpenSubKey("ODBC");
                if (key != null)
                {
                    key = key.OpenSubKey("ODBCINST.INI");
                    if (key != null)
                    {
                        key = key.OpenSubKey("ODBC Drivers");
                        if (key != null)
                        {
                            foreach (string sName in key.GetValueNames())
                            {
                                names.Add(sName);
                            }
                        }
                    }

                }
            }

            return names;
        }

        string LoadSagaConfig(ref string _Password)
        {
            string err = "";
            String XmlPath = Server.MapPath(ConfigurationManager.AppSettings["SagaXmlFilePath"].ToString());

            if (File.Exists(XmlPath))
            {
                DataSet XmlDs = new DataSet();
                err = XmlMethods.ReadXMLFile(ref XmlDs, XmlPath);

                if (err == "")
                {
                    if (XmlDs.Tables[0].Rows[0]["ODBCDriverName"].ToString() != "")
                        cb_DsnDrivers.Text = XmlDs.Tables[0].Rows[0]["ODBCDriverName"].ToString();

                    if (XmlDs.Tables[0].Rows[0]["HostName"].ToString() != "")
                        txt_HostName.Text = XmlDs.Tables[0].Rows[0]["HostName"].ToString();

                    if (XmlDs.Tables[0].Rows[0]["ServerName"].ToString() != "")
                        txt_ServerName.Text = XmlDs.Tables[0].Rows[0]["ServerName"].ToString();

                    if (XmlDs.Tables[0].Rows[0]["ServiceName"].ToString() != "")
                        txt_ServiceName.Text = XmlDs.Tables[0].Rows[0]["ServiceName"].ToString();

                    if (XmlDs.Tables[0].Rows[0]["Protocol"].ToString() != "")
                        cb_Protocol.Text = XmlDs.Tables[0].Rows[0]["Protocol"].ToString();

                    if (XmlDs.Tables[0].Rows[0]["DatabaseName"].ToString() != "")
                        txt_DatabaseName.Text = XmlDs.Tables[0].Rows[0]["DatabaseName"].ToString();

                    if (XmlDs.Tables[0].Rows[0]["UserId"].ToString() != "")
                        txt_UserId.Text = XmlDs.Tables[0].Rows[0]["UserId"].ToString();

                    if (XmlDs.Tables[0].Rows[0]["Password"].ToString() != "")
                    {
                        txt_Password.Text = XmlDs.Tables[0].Rows[0]["Password"].ToString();
                        _Password = XmlDs.Tables[0].Rows[0]["Password"].ToString();
                    }

                    txt_ClientLocale.Text = XmlDs.Tables[0].Rows[0]["ClientLocale"].ToString();
                    txt_DatabaseLocale.Text = XmlDs.Tables[0].Rows[0]["DatabaseLocale"].ToString();

                    err = "";
                }
            }
            else
            {
                err = "Fail konfigurasi Saga tidak dijumpai.<br>Program tidak dapat diteruskan.";
                popupMsg_Label.Text = err;
                popupMsg.ShowOnPageLoad = true;
            }

            return err;
        }

        void FormDataTable(ref DataTable _Dt)
        {
            DataColumn ODBCDriverName = _Dt.Columns.Add("ODBCDriverName", typeof(String));
            DataColumn HostName = _Dt.Columns.Add("HostName", typeof(String));
            DataColumn ServerName = _Dt.Columns.Add("ServerName", typeof(String));
            DataColumn ServiceName = _Dt.Columns.Add("ServiceName", typeof(String));
            DataColumn Protocol = _Dt.Columns.Add("Protocol", typeof(String));
            DataColumn DatabaseName = _Dt.Columns.Add("DatabaseName", typeof(String));
            DataColumn UserId = _Dt.Columns.Add("UserId", typeof(String));
            DataColumn Password = _Dt.Columns.Add("Password", typeof(String));
            DataColumn ClientLocale = _Dt.Columns.Add("ClientLocale", typeof(String));
            DataColumn DatabaseLocale = _Dt.Columns.Add("DatabaseLocale", typeof(String));
        }

        void PopulateDt(ref DataTable _Dt)
        {
            DataRow dr = _Dt.NewRow();

            dr["ODBCDriverName"] = cb_DsnDrivers.Text;
            dr["HostName"] = txt_HostName.Text;
            dr["ServerName"] = txt_ServerName.Text;
            dr["ServiceName"] = txt_ServiceName.Text;
            dr["Protocol"] = cb_Protocol.Text;
            dr["DatabaseName"] = txt_DatabaseName.Text;
            dr["UserId"] = txt_UserId.Text;
            dr["Password"] = txt_Password.Text;
            dr["ClientLocale"] = txt_ClientLocale.Text;
            dr["DatabaseLocale"] = txt_DatabaseLocale.Text;

            _Dt.Rows.Add(dr);
        }

        protected void cbp_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbp.JSProperties["cpMode"] = e.Parameter;

            switch (e.Parameter)
            {
                case "LOAD": LoadSagaConfig(); break;
                case "SAVE": SaveSagaConfig(); break;
            }
        }

        void TestSagaConfig()
        {
            try
            {
                DataTable TestDt = new DataTable();
                FormDataTable(ref TestDt);
                PopulateDt(ref TestDt);
                string err = InformixMethods.TestInformixConnection(ref TestDt);

                if (err == "")
                {
                    cbp_Test.JSProperties["cpErrMsg"] = "";
                }
                else
                {
                    cbp_Test.JSProperties["cpErrMsg"] = "Sistem telah menghadapi masalah teknikal (DB returned error).<br>Masalah : " + err;
                }
            }
            catch (Exception err)
            {
                cbp_Test.JSProperties["cpErrMsg"] = "Sistem telah menghadapi masalah teknikal (Caught by exceptions).<br>Masalah : " + err.Message;
            }
        }

        void SaveSagaConfig()
        {
            DataTable TestDt = new DataTable();

            try
            {
                FormDataTable(ref TestDt);
                PopulateDt(ref TestDt);
                String XmlPath = Server.MapPath(ConfigurationManager.AppSettings["SagaXmlFilePath"].ToString());
                string err = XmlMethods.UpdateSagaXMLFile(ref TestDt, XmlPath);

                if (err == "")
                {
                    cbp.JSProperties["cpErrMsg"] = "";
                    cbp.JSProperties["cpPass"] = TestDt.Rows[0]["Password"].ToString();
                }
                else
                {
                    cbp.JSProperties["cpErrMsg"] = "Sistem telah menghadapi masalah teknikal (DB returned error).<br>Masalah : " + err;
                }
            }
            catch (Exception err)
            {
                cbp.JSProperties["cpErrMsg"] = "Sistem telah menghadapi masalah teknikal (Caught by exceptions).<br>Masalah : " + err.Message;
            }
            finally
            { TestDt.Dispose(); }
        }

        void LoadSagaConfig()
        {
            string err = string.Empty;
            DataSet XmlDs = new DataSet();

            try
            {
                String XmlPath = Server.MapPath(ConfigurationManager.AppSettings["SagaXmlFilePath"].ToString());

                if (File.Exists(XmlPath))
                {   
                    err = XmlMethods.ReadXMLFile(ref XmlDs, XmlPath);

                    if (err == "")
                    {
                        if (XmlDs.Tables[0].Rows[0]["ODBCDriverName"].ToString() != "")
                            cb_DsnDrivers.Text = XmlDs.Tables[0].Rows[0]["ODBCDriverName"].ToString();

                        if (XmlDs.Tables[0].Rows[0]["HostName"].ToString() != "")
                            txt_HostName.Text = XmlDs.Tables[0].Rows[0]["HostName"].ToString();

                        if (XmlDs.Tables[0].Rows[0]["ServerName"].ToString() != "")
                            txt_ServerName.Text = XmlDs.Tables[0].Rows[0]["ServerName"].ToString();

                        if (XmlDs.Tables[0].Rows[0]["ServiceName"].ToString() != "")
                            txt_ServiceName.Text = XmlDs.Tables[0].Rows[0]["ServiceName"].ToString();

                        if (XmlDs.Tables[0].Rows[0]["Protocol"].ToString() != "")
                            cb_Protocol.Text = XmlDs.Tables[0].Rows[0]["Protocol"].ToString();

                        if (XmlDs.Tables[0].Rows[0]["DatabaseName"].ToString() != "")
                            txt_DatabaseName.Text = XmlDs.Tables[0].Rows[0]["DatabaseName"].ToString();

                        if (XmlDs.Tables[0].Rows[0]["UserId"].ToString() != "")
                            txt_UserId.Text = XmlDs.Tables[0].Rows[0]["UserId"].ToString();

                        if (XmlDs.Tables[0].Rows[0]["Password"].ToString() != "")
                        {
                            txt_Password.Text = XmlDs.Tables[0].Rows[0]["Password"].ToString();
                        }

                        txt_ClientLocale.Text = XmlDs.Tables[0].Rows[0]["ClientLocale"].ToString();
                        txt_DatabaseLocale.Text = XmlDs.Tables[0].Rows[0]["DatabaseLocale"].ToString();

                        cbp.JSProperties["cpErrMsg"] = string.Empty;
                        cbp.JSProperties["cpPass"] = XmlDs.Tables[0].Rows[0]["Password"].ToString();
                    }
                }
                else
                {
                    cbp.JSProperties["cpErrMsg"] = "Fail konfigurasi Saga tidak dijumpai.<br>Program tidak dapat diteruskan.";
                }
            }
            catch (Exception errMsg)
            {
                cbp.JSProperties["cpErrMsg"] = "Sistem telah menghadapi masalah teknikal (Caught by exceptions).<br>Masalah : " + errMsg.Message;
            }
            finally
            { XmlDs.Dispose(); }
        }

        protected void cbp_Test_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            TestSagaConfig();
        }
    }
}