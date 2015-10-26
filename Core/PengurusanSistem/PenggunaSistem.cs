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
    public class PenggunaSistemMethods
    {
        public static string SP_LoadSaveDelete_SystemUser(ref DataTable TVP_Header, ref DataTable TVP_Detail, string UserSystemId, string CurrUser, string Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LoadSaveDelete_SystemUser";
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

                SqlParameter parm3 = new SqlParameter("@UserSystemId", SqlDbType.Int);

                if (UserSystemId == "")
                    parm3.Value = DBNull.Value;
                else
                    parm3.Value = UserSystemId;

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

        public static string GetSystemUserId(ref string SystemUserId, string EmpSystemId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [UserSystemId] FROM [dbo].[SystemUser] SUG where SUG.[EmployeeSystemId] = '" + EmpSystemId + "'";
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                SystemUserId = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string GetSystemUserName(ref string SystemUserName, string UserSystemId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [User_Name] FROM [AMS_Master].[dbo].[V_User] WHERE [User_Id] = " + UserSystemId;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                SystemUserName = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string GetSystemUserPTJ(ref string PtjName, string UserSystemId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [PTJ_Name] FROM [AMS_Master].[dbo].[PusatTanggungJawab] where PTJ_Id = (SELECT [EmpPtjId] FROM [AMS_Master].[dbo].[V_SystemUser] where [UserSystemId] = "+ UserSystemId +")";
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                PtjName = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string CountSystemUserRole(ref int Count, string UserSystemId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT COUNT(*) FROM [AMS_Master].[dbo].[SystemUser_Roles] where [UserSystemId] = " + UserSystemId;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                Count = Convert.ToInt32(sqlCmd.ExecuteScalar().ToString());

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string UpdateSystemUserProfileImage(string UserSystemId, string ImageSystemFileName)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "UPDATE [AMS_Master].[dbo].[UserCredentials] SET [UserCre_ImageName] = '" + ImageSystemFileName + "' WHERE [UserCre_UserId] = " + UserSystemId;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                sqlCmd.ExecuteNonQuery();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string GetSystemUserProfileImage(string UserSystemId, ref string CurrImageSystemFileName)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [UserImage] FROM [AMS_Master].[dbo].[SystemUser] WHERE [UserSystemId] = " + UserSystemId;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                CurrImageSystemFileName = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string GetCurrUserInformation(string SystemUserId, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Master].[dbo].[V_SystemUser] WHERE [UserSystemId] = " + SystemUserId;
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
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string GetCurrentUserInfo(string UserId, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [User_Salutation] ,[UserCre_ImageName],[PTJ_FullName] FROM [AMS_Master].[dbo].[V_User] WHERE [User_Id] = " + UserId;
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
            { sqlAdap.Dispose(); sqlCmd.Dispose(); sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string LoadSystemUser(ref DataSet Ds, string UserId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Master].[dbo].[V_User] V WHERE V.User_Id = " + UserId + "; SELECT [RoleId] ,[RoleName] ,(SELECT COUNT(*) FROM [AMS_Master].[dbo].[UserRole] UR WHERE [User_Id] = " + UserId + " AND [User_RoleId] = R.[RoleId]) [RoleCount] FROM [AMS_Master].[dbo].[MasterRole] R";
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;
               
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

        public static string SP_UserRole_Update(string CurrUser, string User_Id, int UserCre_UserGroupId, bool UserCre_AllPtj, ref DataTable TVP)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_UserRole_Update";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@User_Id", SqlDbType.Int);
                parm2.Value = User_Id;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@UserCre_UserGroupId", SqlDbType.Int);
                parm3.Value = UserCre_UserGroupId;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm5 = new SqlParameter("@UserCre_AllPtj", SqlDbType.Bit);
                parm5.Value = UserCre_AllPtj;
                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm6.Value = TVP;
                parm6.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm6);

                SqlParameter parm7 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm7.Size = 1024;
                parm7.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm7);

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
    }
}
