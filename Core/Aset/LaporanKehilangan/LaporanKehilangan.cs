using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Core.Aset.LaporanKehilangan
{
    public class LaporanKehilanganMethods
    {
        public static string SP_LaporanKehilangan_CreateNewEntry(string ProcessId, string CurrUser, ref DataTable ReturnDt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LaporanKehilangan_CreateNewEntry";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm2.Value = CurrUser;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

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

        public static string SP_LaporanKehilangan_SavePost(string CurrUser, ref DataTable TVP_Header, ref DataTable TVP_Detail, int Post)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LaporanKehilangan_SavePost";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP_Header", SqlDbType.Structured);
                parm2.Value = TVP_Header;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@TVP_Detail", SqlDbType.Structured);
                parm3.Value = TVP_Detail;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Post", SqlDbType.Int);
                parm4.Value = Post;
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

        public static string SP_LaporanKerosakan_GetRef(string ProcessId, string Rev, ref DataTable ReturnDt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LaporanKerosakan_GetRef";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Revision", SqlDbType.Int);
                parm2.Value = Rev;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

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

        public static string SP_LaporanKerosakan_GetKetuaPtj(string ProcessId, string Rev, ref DataTable ReturnDt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LaporanKerosakan_GetKetuaPtj";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Revision", SqlDbType.Int);
                parm2.Value = Rev;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

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

        public static string GetRefNumber(string ProcessId, string Rev, ref string RefNumber)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [LKH_REfNumber] FROM [AMS_Transaction].[dbo].[LaporanKehilangan_Header] H WHERE H.LKH_ProcessId = '" + ProcessId + "' AND H.LKH_RevNumber = " + Rev;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                RefNumber = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string GetLaporanKehilanganInfo(string ProcessId, string Rev, ref DataTable HeaderDt, ref DataTable DetailDt)
        {
           
            try
            {
                GetHeaderInfo(ProcessId, Rev, ref HeaderDt);
                GetMissingItemsListing(ProcessId, Rev, ref DetailDt);
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        private static string GetHeaderInfo(string ProcessId, string Rev, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Transaction].[dbo].[V_LaporanKehilangan_Header] V WHERE V.LKH_ProcessId = '"+ ProcessId +"' AND V.LKH_RevNumber = " + Rev;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Dt);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); }
        }

        private static string GetMissingItemsListing(string ProcessId, string Rev, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Transaction].[dbo].[V_LaporanKehilangan_MissingItems] V WHERE V.LKMI_ProcessId = '"+ ProcessId +"' AND V.LKMI_Revision = " + Rev;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Dt);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); }
        }

        public static string SP_LaporanKerosakan_CheckWorkflow(string CurrLkStatus, string CurrUser, ref string WfCount, string ProcessId, string Rev)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LaporanKerosakan_CheckWorkflow";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrLkStatus", SqlDbType.Int);
                parm1.Value = CurrLkStatus;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm2.Value = CurrUser;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm3.Value = ProcessId;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Rev", SqlDbType.Int);
                parm4.Value = Rev;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                WfCount = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_LaporanKehilangan_KetuaPTJ_FirstApproval(string CurrUser, string ProcessId, string Revision, int Approve, string Notes, ref string RefNumber, ref DataTable @TVP, ref DataTable ReturnDt, ref string KetuaPtjName)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LaporanKehilangan_KetuaPTJ_FirstApproval";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.VarChar);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm2.Value = ProcessId;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Revision", SqlDbType.Int);
                parm3.Value = Revision;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Approve", SqlDbType.Int);
                parm4.Value = Approve;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Notes", SqlDbType.VarChar);
                parm5.Value = Notes;
                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@RefNumber", SqlDbType.VarChar);
                parm6.Size = 1024;
                parm6.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm6);

                SqlParameter parm7 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm7.Value = TVP;
                parm7.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm7);

                SqlParameter parm8 = new SqlParameter("@KetuaPtjName", SqlDbType.VarChar);
                parm8.Size = 1024;
                parm8.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm8);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(ReturnDt);

                RefNumber = sqlCmd.Parameters["@RefNumber"].Value.ToString();
                KetuaPtjName = sqlCmd.Parameters["@KetuaPtjName"].Value.ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); }
        }

        public static string GetPegawaiPenyiasat(string ProcessId, string Rev, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Transaction].[dbo].[V_LaporanKehilangan_InvestigationBoard] V WHERE V.LKIB_ProcessId = '" + ProcessId + "' AND V.LKIB_Rev = " + Rev;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Dt);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); }
        }

        public static string SP_LaporanKehilangan_LantikanPegawaiPenyiasat(string CurrUser, ref DataTable TVP, int Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LaporanKehilangan_LantikanPegawaiPenyiasat";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm2.Value = TVP;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Mode", SqlDbType.Int);
                parm3.Value = Mode;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm4.Size = 1024;
                parm4.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm4);

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

        public static string V_LaporanKehilangan_InvestigatorReport(string ProcessId, string Rev, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Transaction].[dbo].[V_LaporanKehilangan_InvestigatorReport] WHERE [LKIR_ProcessId] = '" + ProcessId + "' AND [LKIR_Revision] = " + Rev;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Dt);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); }
        }

        public static string SP_LaporanKehilangan_LaporanPegawaiPenyiasat(string CurrUser, ref DataTable TVP, int Mode, ref string RefNumber)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LaporanKehilangan_LaporanPegawaiPenyiasat";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm2.Value = TVP;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Mode", SqlDbType.Int);
                parm3.Value = Mode;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);
               
                SqlParameter parm4 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm4.Size = 1024;
                parm4.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@RefNumber", SqlDbType.VarChar);
                parm5.Size = 1024;
                parm5.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm5);

                sqlCmd.ExecuteNonQuery();

                RefNumber = sqlCmd.Parameters["@RefNumber"].Value.ToString();
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_LaporanKerosakan_GetPegawaiAset(string ProcessId, ref DataTable Dt, int Rev)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LaporanKerosakan_GetPegawaiAset";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Rev", SqlDbType.Int);
                parm2.Value = Rev;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Dt);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }
        
    }
}
