using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Core.Aset.Pendaftaran
{
    public class AccountsMethods
    {
        public static string LoadAcoounts(string UniqueId, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_DBConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_DB].[dbo].[V_AssetInventoryAccounting] C where C.AIA_UniqueId = '" + UniqueId + "'";
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

        public static string SP_Save_AssetInventoryAccounting(ref DataTable TVP, string CurrUser)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_DBConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Save_AssetInventoryAccounting";
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
            { sqlConn.Close(); sqlConn.Dispose(); }
        }
    }
}
