using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using Core.Utility;

namespace Core.VerifikasiPengguna.LogMasuk
{
    public class LogMasukMethod
    {
        public static void AuthenticateUser(string UserId, string Password, ref int ErrCode, ref string ErrMsg, ref DataTable ReturnDt)
        {
            SqlConnection sqlConn = new SqlConnection();
            SqlCommand sqlCmd = new SqlCommand();
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Master].[dbo].[V_User] V WHERE V.User_EmployeeId = '" + UserId + "'";
                sqlCmd.Connection = sqlConn;
                sqlCmd.CommandType = CommandType.Text;

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(ReturnDt);

                if (ReturnDt.Rows.Count == 1)
                {
                    if (ReturnDt.Rows[0]["User_StatusCode"].ToString() == "1")
                    {
                        if ((EncryptDecryptMethod.DecryptString(ReturnDt.Rows[0]["UserCre_Password"].ToString(), "UPNM")) == Password)
                        { ErrCode = 0; }
                        else
                        { ErrCode = 1; }  //invalid password entered
                    }
                    else
                    { ErrCode = 5; } //inactive user
                }
                else
                { ErrCode = 2; }  //more than 1 record for user
            }
            catch (Exception err)
            {
                ErrCode = -1;
                ErrMsg = err.Message;
            }
            finally
            {
                sqlAdap.Dispose();
                sqlCmd.Dispose();
                sqlConn.Close();
                sqlConn.Dispose();
            }
        }

        public static string SP_LoginHistory_Insert(string CurrUser, string IpAddress)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_AuditConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LoginHistory_Insert";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@IpAddress", SqlDbType.VarChar);
                parm2.Value = IpAddress;
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
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string SP_LoginHistory_GetLastLogin(string CurrUser, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_AuditConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LoginHistory_GetLastLogin";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
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

        public static string SP_UserAuthentication_ResetPassword(string EmployeeID, string Email, string NewPassword)
        {
            SqlConnection sqlConn = new SqlConnection();
            SqlCommand sqlCmd = new SqlCommand();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_UserAuthentication_ResetPassword";
                sqlCmd.Connection = sqlConn;
                sqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parm1 = new SqlParameter("@EmployeeID", SqlDbType.VarChar);
                parm1.Value = EmployeeID;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Email", SqlDbType.VarChar);
                parm2.Value = Email;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@NewPassword", SqlDbType.VarChar);
                parm3.Value = NewPassword;
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
            {
                sqlCmd.Dispose();
                sqlConn.Close();
                sqlConn.Dispose();
            }
        }

        public static string GenerateTempPassword(int PassLength)
        {
            string allowedChars = "0123456789abcdefghijklmnopqrstuvwxyz";
            char[] chars = new char[PassLength];
            Random rd = new Random();

            for (int i = 0; i < PassLength; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }

            return new string(chars);
        }

        public static String GetLanIPAddress()
        {
            //The X-Forwarded-For (XFF) HTTP header field is a de facto standard for identifying the originating IP address of a 
            //client connecting to a web server through an HTTP proxy or load balancer
            String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (string.IsNullOrEmpty(ip))
            {
                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }

            return ip;
        }
    }
}
