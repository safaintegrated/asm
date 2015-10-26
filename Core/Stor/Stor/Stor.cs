using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Core.Stor.Stor
{
    public class StorMethods
    {
        public static string SP_Store_SaveDelete(ref DataTable TVP, string CurrUser, int Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Store_SaveDelete";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm1.Value = TVP;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm2.Value = CurrUser;
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
    }
}
