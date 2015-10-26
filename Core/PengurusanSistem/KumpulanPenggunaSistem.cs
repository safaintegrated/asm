using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Core.PengurusanSistem
{
    public class KumpulanPenggunaSistemMethods
    {  
        public static string SP_LoadSaveDelete_SystemUserGroup(ref DataTable TVP_Header, ref DataTable TVP_Detail, string UserGroupId, string CurrUser, string Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LoadSaveDelete_SystemUserGroup";
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

                SqlParameter parm3 = new SqlParameter("@UserGroupId", SqlDbType.Int);

                if(UserGroupId == "")
                    parm3.Value = DBNull.Value;
                else
                    parm3.Value = UserGroupId;

                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm4.Value = CurrUser;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Mode", SqlDbType.VarChar);
                parm5.Value = Mode;
                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm6.Size = 1024;
                parm6.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm6);
                
                if (Mode == "LOAD")
                {
                    sqlAdap.SelectCommand = sqlCmd;
                    sqlAdap.Fill(TVP_Header);
                    return string.Empty;
                }
                else
                {
                    sqlCmd.ExecuteNonQuery();
                    return sqlCmd.Parameters["@Return_Message"].Value.ToString();
                }
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string GetUserGroupId(ref string UserGroupId, string UserDefinedId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [UserGroupId] FROM [dbo].[SystemUserGroup] SUG where SUG.UserDefinedId = '" + UserDefinedId + "'";
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                UserGroupId = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_SystemUserGroup_LoadRecord(string UserGroupId, ref DataSet Ds)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_SystemUserGroup_LoadRecord";
                sqlCmd.CommandType = CommandType.StoredProcedure;  
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@UserGroupId", SqlDbType.Int);
                parm1.Value = UserGroupId;
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
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_SystemUserGroup_NewCredentials(ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_SystemUserGroup_NewCredentials";
                sqlCmd.CommandType = CommandType.StoredProcedure;
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
            { sqlConn.Close(); sqlConn.Dispose(); }
        }
    }
}
