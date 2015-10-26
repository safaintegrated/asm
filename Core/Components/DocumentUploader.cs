using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using Core.Utility;

namespace Core.Components
{
    public class DocumentUploaderMethods
    {
        public static string SP_DocumentAttachments_SaveUpdateDelete(int ProcessType, ref DataTable TVP)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_AttachmentsConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_DocumentAttachments_SaveUpdateDelete";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessType", SqlDbType.Int);
                parm1.Value = ProcessType;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm2.Value = TVP;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm3.Size = 1024;
                parm3.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm3);

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

        public static string SP_DocumentAttachments_GetDocumentNames(ref DataTable TVP, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_AttachmentsConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_DocumentAttachments_GetDocumentNames";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm1.Value = TVP;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Dt);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string DocumentInfo(string RowId, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_AttachmentsConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Attachments].[dbo].[DocumentAttachments] where [RowId] = " + RowId;
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
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string GetSystemFileNameFromRowId(string RowId, ref string FileName)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_AttachmentsConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT DocumentFileSystemName FROM [AMS_Attachments].[dbo].[DocumentAttachments] where [RowId] = " + RowId;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                FileName = sqlCmd.ExecuteScalar().ToString();
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
