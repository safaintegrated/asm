using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Services
{
    public class AuthenticateService
    {
        public AuthenticateService()
        {

        }

        public void AuthenticateUser(string userId, string password)
        {
            //SqlConnection sqlConn = new SqlConnection();
            //SqlCommand sqlCmd = new SqlCommand();
            //SqlDataAdapter sqlAdap = new SqlDataAdapter();

            //try
            //{
            //    sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
            //    sqlConn.Open();

            //    sqlCmd.CommandText = "SELECT * FROM [AMS_Master].[dbo].[V_User] V WHERE V.User_EmployeeId = '" + UserId + "'";
            //    sqlCmd.Connection = sqlConn;
            //    sqlCmd.CommandType = CommandType.Text;

            //    sqlAdap.SelectCommand = sqlCmd;
            //    sqlAdap.Fill(ReturnDt);

            //    if (ReturnDt.Rows.Count == 1)
            //    {
            //        if (ReturnDt.Rows[0]["User_StatusCode"].ToString() == "1")
            //        {
            //            if ((EncryptDecryptMethod.DecryptString(ReturnDt.Rows[0]["UserCre_Password"].ToString(), "UPNM")) == Password)
            //            { ErrCode = 0; }
            //            else
            //            { ErrCode = 1; }  //invalid password entered
            //        }
            //        else
            //        { ErrCode = 5; } //inactive user
            //    }
            //    else
            //    { ErrCode = 2; }  //more than 1 record for user
            //}
            //catch (Exception err)
            //{
            //    ErrCode = -1;
            //    ErrMsg = err.Message;
            //}
            //finally
            //{
            //    sqlAdap.Dispose();
            //    sqlCmd.Dispose();
            //    sqlConn.Close();
            //    sqlConn.Dispose();
            //}
        }

    }
}
