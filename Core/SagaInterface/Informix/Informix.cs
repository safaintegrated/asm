using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Web.Security;
using System.Data.Odbc;
using System.Net.NetworkInformation;

namespace Core.SagaInterface.Informix
{
    public class InformixMethods
    {
        public static string TestInformixConnection(ref DataTable _ConnectionDt)
        {
            OdbcConnection odbc_Conn = new OdbcConnection();
            string ErrMsg = "";

            try
            {
                Ping ping = new Ping();
                PingReply pingReply = ping.Send(_ConnectionDt.Rows[0]["HostName"].ToString(),3);

                if (pingReply.Status == IPStatus.TimedOut)
                {
                    ErrMsg = "Pangkalan data SAGA tidak dapat dicapai.  Semak semula alamat IP.";
                }
                else
                {
                    string SagaConnectionString = "Driver={" + _ConnectionDt.Rows[0]["ODBCDriverName"].ToString() + "};" +
                                                  "host=" + _ConnectionDt.Rows[0]["HostName"].ToString() + ";" +
                                                  "server=" + _ConnectionDt.Rows[0]["ServerName"].ToString() + ";" +
                                                  "service=" + _ConnectionDt.Rows[0]["ServiceName"].ToString() + ";" +
                                                  "protocol=" + _ConnectionDt.Rows[0]["Protocol"].ToString() + ";" +
                                                  "database=" + _ConnectionDt.Rows[0]["DatabaseName"].ToString() + ";" +
                                                  "uid=" + _ConnectionDt.Rows[0]["UserId"].ToString() + ";" +
                                                  "pwd=" + _ConnectionDt.Rows[0]["Password"].ToString() + ";" +
                                                  "client_locale=" + _ConnectionDt.Rows[0]["ClientLocale"].ToString() + ";" +
                                                  "db_locale=" + _ConnectionDt.Rows[0]["DatabaseLocale"].ToString() + ";";

                    odbc_Conn.ConnectionString = SagaConnectionString;
                    odbc_Conn.ConnectionTimeout = 3;
                    odbc_Conn.Open();
                    odbc_Conn.Close();
                    ErrMsg = "";
                }

                return ErrMsg;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { odbc_Conn.Dispose(); }
        }

        private static string MakeInformixConnection(ref DataTable _ConnectionDt, ref OdbcConnection odbc_Conn)
        {
            string ErrMsg = string.Empty;

            try
            {
                Ping ping = new Ping();
                PingReply pingReply = ping.Send(_ConnectionDt.Rows[0]["HostName"].ToString(),3);

                if (pingReply.Status == IPStatus.TimedOut)
                {
                    ErrMsg = "Pangkalan data SAGA tidak dapat dicapai.  Sila dapatkan bantuan teknikal.";
                }
                else
                {
                    string SagaConnectionString = "Driver={" + _ConnectionDt.Rows[0]["ODBCDriverName"].ToString() + "};" +
                                                  "host=" + _ConnectionDt.Rows[0]["HostName"].ToString() + ";" +
                                                  "server=" + _ConnectionDt.Rows[0]["ServerName"].ToString() + ";" +
                                                  "service=" + _ConnectionDt.Rows[0]["ServiceName"].ToString() + ";" +
                                                  "protocol=" + _ConnectionDt.Rows[0]["Protocol"].ToString() + ";" +
                                                  "database=" + _ConnectionDt.Rows[0]["DatabaseName"].ToString() + ";" +
                                                  "uid=" + _ConnectionDt.Rows[0]["UserId"].ToString() + ";" +
                                                  "pwd=" + _ConnectionDt.Rows[0]["Password"].ToString() + ";" +
                                                  "client_locale=" + _ConnectionDt.Rows[0]["ClientLocale"].ToString() + ";" +
                                                  "db_locale=" + _ConnectionDt.Rows[0]["DatabaseLocale"].ToString() + ";";

                    odbc_Conn.ConnectionString = SagaConnectionString;
                    odbc_Conn.ConnectionTimeout = 3;
                    odbc_Conn.Open();
                }

                return ErrMsg;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string GetSagaCommandText(int SagaCommandNumber, string SagaCommandXmlFilePath, ref string SagaCommandText)
        {
            try
            {
                DataSet _XMLDs = new DataSet();
                _XMLDs.ReadXml(SagaCommandXmlFilePath);

                string DsSelection = "Code = '" + SagaCommandNumber + "'";

                DataRow[] dr = _XMLDs.Tables[0].Select(DsSelection);

                if (dr.Length == 1)
                {
                    SagaCommandText = dr[0]["Command"].ToString();
                    return string.Empty;
                }
                else
                    return "more than 1 record";
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string GetDataTable(ref DataTable _ConnectionDt, ref DataTable ReturnDt, int SagaCommandNumber, string SagaCommandXmlFilePath)
        {
            OdbcConnection odbc_Conn = new OdbcConnection();
            OdbcDataAdapter odbcAdap = new OdbcDataAdapter();
            OdbcCommand odbcCmd = new OdbcCommand();

            string ErrMsg = string.Empty;

            try
            {
                ErrMsg = MakeInformixConnection(ref _ConnectionDt, ref odbc_Conn);

                if (ErrMsg == string.Empty)
                {
                    string SagaCommandText = string.Empty;
                    ErrMsg = GetSagaCommandText(SagaCommandNumber, SagaCommandXmlFilePath, ref SagaCommandText);

                    if (ErrMsg == string.Empty)
                    {
                        odbcCmd.Connection = odbc_Conn;
                        odbcCmd.CommandText = SagaCommandText;
                        odbcAdap.SelectCommand = odbcCmd;
                        odbcAdap.Fill(ReturnDt);
                        odbc_Conn.Close();
                    }
                }
                return ErrMsg;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { odbcAdap.Dispose(); odbcCmd.Dispose(); odbc_Conn.Dispose(); }
        }

        public static string GetDataTable(ref DataTable _ConnectionDt, ref DataTable ReturnDt, string SelectCommand)
        {
            OdbcConnection odbc_Conn = new OdbcConnection();
            OdbcDataAdapter odbcAdap = new OdbcDataAdapter();
            OdbcCommand odbcCmd = new OdbcCommand();

            string ErrMsg = string.Empty;

            try
            {
                ErrMsg = MakeInformixConnection(ref _ConnectionDt, ref odbc_Conn);

                if (ErrMsg == string.Empty)
                {
                        odbcCmd.Connection = odbc_Conn;
                        odbcCmd.CommandText = SelectCommand;
                        odbcAdap.SelectCommand = odbcCmd;
                        odbcAdap.Fill(ReturnDt);
                        odbc_Conn.Close();
                }
                return ErrMsg;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { odbcAdap.Dispose(); odbcCmd.Dispose(); odbc_Conn.Dispose(); }
        }        
    }
}
