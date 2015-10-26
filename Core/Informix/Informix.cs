using System;
using System.Data;
using System.Data.Odbc;
using System.Configuration;
using System.IO;
using System.Timers;
using System.Net.NetworkInformation;
using Core.Utility;


namespace Core.Informix
{
    public class InformixMethods
    {
        public static string InitializeODBCConnection(ref OdbcConnection _odbcConn, String XMLfilePath)
        {
            try
            {
                DataSet XmlDs = new DataSet();
                string errMsg = UtilityMethods.ReadXMLFile(ref XmlDs, XMLfilePath);

                if (errMsg == "")
                {
                    Ping ping = new Ping();
                    PingReply pingReply = ping.Send(XmlDs.Tables[0].Rows[0]["HostName"].ToString(), 2);

                    if (pingReply.Status == IPStatus.TimedOut || pingReply.Status == IPStatus.BadDestination || pingReply.Status == IPStatus.DestinationHostUnreachable || pingReply.Status == IPStatus.DestinationNetworkUnreachable || pingReply.Status == IPStatus.TimeExceeded || pingReply.Status == IPStatus.TtlExpired)
                    {
                        errMsg = "SAGA Host Server is unreachable.  Check Host Name / IP.";
                    }
                    else
                    {
                        string SagaConnectionString = "Driver={" + XmlDs.Tables[0].Rows[0]["ODBCDriverName"].ToString() + "};" +
                                                                 "host=" + XmlDs.Tables[0].Rows[0]["HostName"].ToString() + ";" +
                                                                 "server=" + XmlDs.Tables[0].Rows[0]["ServerName"].ToString() + ";" +
                                                                 "service=" + XmlDs.Tables[0].Rows[0]["ServiceName"].ToString() + ";" +
                                                                 "protocol=" + XmlDs.Tables[0].Rows[0]["Protocol"].ToString() + ";" +
                                                                 "database=" + XmlDs.Tables[0].Rows[0]["DatabaseName"].ToString() + ";" +
                                                                 "uid=" + XmlDs.Tables[0].Rows[0]["UserId"].ToString() + ";" +
                                                                 "pwd=" + XmlDs.Tables[0].Rows[0]["Password"].ToString() + ";" +
                                                                 "client_locale=" + XmlDs.Tables[0].Rows[0]["ClientLocale"].ToString() + ";" +
                                                                 "db_locale=" + XmlDs.Tables[0].Rows[0]["DatabaseLocale"].ToString() + ";";

                        _odbcConn.ConnectionString = SagaConnectionString;
                        _odbcConn.Open();
                    }
                    return errMsg;
                }
                else
                    return errMsg;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string FetchTable(string SelectCommand, string XMLconnectionPhysicalFilePath, ref DataTable Dt)
        {
            OdbcConnection OdbcConn = new OdbcConnection();
            OdbcCommand OdbcCmd = new OdbcCommand();
            OdbcDataAdapter OdbcAdap = new OdbcDataAdapter();

            try
            {
                string DbErr = InitializeODBCConnection(ref OdbcConn, XMLconnectionPhysicalFilePath);

                if (DbErr == string.Empty)
                {
                    OdbcCmd.Connection = OdbcConn;
                    OdbcCmd.CommandText = SelectCommand;
                    OdbcAdap.SelectCommand = OdbcCmd;
                    OdbcAdap.Fill(Dt);
                    return string.Empty;
                }
                else
                    return DbErr;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { OdbcAdap.Dispose(); OdbcCmd.Dispose(); OdbcConn.Close(); OdbcConn.Dispose(); }
        }
    }
}
