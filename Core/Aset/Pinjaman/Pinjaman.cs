using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Core.Aset.Pinjaman
{
    public class PinjamanMethods
    {
        public static string SP_PermohonanPinjaman_LoadDetail(string ProcessId, string Revision, ref DataTable ReturnDt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanPinjaman_LoadDetail";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Revision", SqlDbType.Int);
                parm2.Value = Revision;
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

        public static string SP_PermohonanPinjaman_GetCreatorInfo(string CurrUser, ref DataTable ReturnDt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanPinjaman_GetCreatorInfo";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
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

        public static string SP_PermohonanPinjaman_GetRef(string ProcessId, string Revision, ref DataTable ReturnDt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanPinjaman_GetRef";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Revision", SqlDbType.Int);
                parm2.Value = Revision;
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

        public static string SP_PermohonanPinjaman_CreateNewEntry(string ProcessId, string CurrUser)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanPinjaman_CreateNewEntry";
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

                sqlCmd.ExecuteNonQuery();
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose();  }
        }

        public static string SP_PermohonanPinjaman_SavePost(string CurrUser, ref DataTable TVP_Header, ref DataTable TVP_Detail, int Post)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanPinjaman_SavePost";
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

        public static string SP_PermohonanPinjaman_Load(string ProcessId, string Revision, ref DataSet ReturnDS)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanPinjaman_Load";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Revision", SqlDbType.Int);
                parm2.Value = Revision;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(ReturnDS);

                return string.Empty;

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); }
        }

        public static string SP_PermohonanPinjaman_CheckWorkflowAvailability(string ProcessId, string CurrUser, ref string WfCount)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanPinjaman_CheckWorkflowAvailability";
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

                WfCount = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose();}
        }

        public static string SP_PermohonanPinjaman_AssetOfficerApproveReject(string CurrUser, string ProcessId, string Rev, int Approve, string Notes)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanPinjaman_AssetOfficerApproveReject";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm2.Value = ProcessId;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Rev", SqlDbType.Int);
                parm3.Value = Rev;
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

                SqlParameter parm6 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm6.Size = 1024;
                parm6.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm6);

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

        public static string SP_PermohonanPinjaman_Pengeluaran(string CurrUser, string ProcessId, string Rev, ref string AssetOfficerName)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanPinjaman_Pengeluaran";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm2.Value = ProcessId;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Rev", SqlDbType.Int);
                parm3.Value = Rev;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);              

               AssetOfficerName =  sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string V_PermohonanPinjaman_Header(string ProcessId, string Rev, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Transaction].[dbo].[V_PermohonanPinjaman_Header] V WHERE V.PP_ProcessId = '" + ProcessId + "' AND V.PP_Revision = " + Rev;
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

        public static string SP_PermohonanPinjaman_Pemulangan(string CurrUser, string ProcessId, string Rev, ref DataTable TVP_Detail, ref string AssetOfficerName)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanPinjaman_Pemulangan";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm2.Value = ProcessId;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Revision", SqlDbType.Int);
                parm3.Value = Rev;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@TVP_Detail", SqlDbType.Structured);
                parm4.Value = TVP_Detail;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm5.Size = 1024;
                parm5.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm5);

                AssetOfficerName = sqlCmd.ExecuteScalar().ToString();

                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
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
