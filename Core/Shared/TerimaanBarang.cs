using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Core.Shared
{
    public class TerimaanBarangMethods
    {
        public static string SP_GRN_CheckPrNumber(string PrNumber, string CurrUser, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GRN_CheckPrNumber";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@PrNumber", SqlDbType.VarChar);
                parm1.Value = PrNumber;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm2.Value = CurrUser;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm3.Size = 1024;
                parm3.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm3);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Dt);

                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); sqlAdap.Dispose(); }
        }

        public static string SP_GRN_LoadHeader_GetRef(string ProcessId, string Revision, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GRN_LoadHeader_GetRef";
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
                sqlAdap.Fill(Dt);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); sqlAdap.Dispose(); }
        }

        public static string SP_GRN_LoadHeader(string ProcessId, string Revision, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GRN_LoadHeader";
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
                sqlAdap.Fill(Dt);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); sqlAdap.Dispose(); }
        }

        public static string SP_GRN_SavePost(string CurrUser, ref DataTable TVP_Header, ref DataTable TVP_DETAIL, int POST, ref DataTable WfDt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GRN_SavePost";
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

                SqlParameter parm3 = new SqlParameter("@TVP_DETAIL", SqlDbType.Structured);
                parm3.Value = TVP_DETAIL;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@POST", SqlDbType.Int);
                parm4.Value = POST;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm5.Size = 1024;
                parm5.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm5);

                if (POST == 0)
                {
                    sqlCmd.ExecuteNonQuery();
                }
                else
                {
                    sqlAdap.SelectCommand = sqlCmd;
                    sqlAdap.Fill(WfDt);
                }

                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); sqlAdap.Dispose(); }
        }

        public static string SP_GRN_SaveChecklist(string ProcessId, string CheckedBy, ref DataTable TVP)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GRN_SaveChecklist";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@CheckedBy", SqlDbType.VarChar);
                parm2.Value = CheckedBy;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm3.Value = TVP;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

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
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string SP_GRN_GetChecklist(string ProcessId, ref DataSet Ds)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GRN_GetChecklist";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Ds);
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string SP_CheckWorkflowAvailability(string ProcessId, string Revision, string CurrUser, string CheckType, ref string WfCount)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_CheckWorkflowAvailability";
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

                SqlParameter parm3 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm3.Value = CurrUser;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@CheckType", SqlDbType.Int);
                parm4.Value = CheckType;
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
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string SP_GRN_WorkflowProcessing(string ProcessId, string Revision, string CurrUser, string Result, string Comments, string WfType, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GRN_WorkflowProcessing";
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

                SqlParameter parm3 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm3.Value = CurrUser;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Result", SqlDbType.Int);
                parm4.Value = Result;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Comments", SqlDbType.VarChar);
                parm5.Value = Comments;
                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@WfType", SqlDbType.Int);
                parm6.Value = WfType;
                parm6.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm6);

                SqlParameter parm7 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm7.Size = 1024;
                parm7.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm7);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Dt);

                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string GetGrnNumber(ref string GrnNumber, string ProcessId, string Revision)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [GRNH_GrnNumber] FROM [AMS_Transaction].[dbo].[GRN_Header] H where H.GRNH_ProcessId = '" + ProcessId + "' AND H.GRNH_Revision = " + Revision;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                GrnNumber = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_GRN_BeforeApproval(string ProcessId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GRN_BeforeApproval";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);
               
                SqlParameter parm2 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm2.Size = 1024;
                parm2.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm2);

                sqlCmd.ExecuteNonQuery();

                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }
    }
}
