using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Core.Aset.Tender
{
    public class TenderMethods
    {
        public static string SP_Tender_FindRecord(string ProcessId, ref DataSet ReturnDs)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Tender_FindRecord";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(ReturnDs);

                return string.Empty;

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); }
        }

        public static string SP_Tender_SaveDelete(ref DataTable TVP_Header, ref DataTable TVP_Detail, string CurrUser, int Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Tender_SaveDelete";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@TVP_Header", SqlDbType.Structured);
                parm1.Value = TVP_Header;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP_Detail", SqlDbType.Structured);
                parm2.Value = TVP_Detail;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm3.Value = CurrUser;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Mode", SqlDbType.Int);
                parm4.Value = Mode;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm5.Size = 1024;
                parm5.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm5);

                sqlCmd.ExecuteNonQuery();
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_Tender_GetReference(string ProcessId, ref DataTable ReturnDt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Tender_GetReference";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(ReturnDt);

                return string.Empty;

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); }
        }

        public static string GetProcessId(ref string ProcessId, string TenderNumber)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT  [TH_ProcessID] FROM [AMS_Master].[dbo].[Tender_Header] H WHERE [TH_NoTender] = '" + TenderNumber + "'";
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                ProcessId = sqlCmd.ExecuteScalar().ToString();
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); }
        }
    }
}
