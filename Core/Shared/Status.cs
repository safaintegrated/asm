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
    public class StatusMethods
    {
        public static string GetStatusName(ref string StatusName, string StatusId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [StatusName] FROM [AMS_Master].[dbo].[MasterStatus] WHERE [StatusId] = " + StatusId;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                StatusName = sqlCmd.ExecuteScalar().ToString();

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
