using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Stor
{
    public class GeneralStokMethods
    {
        public static string SP_GetEmployeeById(out Data.Entity.Employee e, int userId)
        {
            e = null;
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GetEmployeeById";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = userId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                DataSet ds = new DataSet();
                sqlAdap.Fill(ds);

                DataRow dr = ds.Tables[0].Rows[0];
                e = new Data.Entity.Employee
                {
                    EmployeeSysId = (int)dr["EmployeeSystemId"],
                    EmployeeId = dr["EmployeeId"].ToString(),
                    EmployeeName = dr["EmployeeName"].ToString(),
                    EmployeeDesignation = dr["EmployeeDesignation"].ToString(),
                    EmployeeEmail = dr["EmployeeEmail"].ToString(),
                    EmploeeTelephone = dr["EmployeeTelephone"].ToString(),
                    EmployeeIdNo = dr["EmployeeIdNo"].ToString(),
                    PtjCode = dr["PTJ_Code"].ToString(),
                    PtjName = dr["PTJ_Name"].ToString(),

                };


                return string.Empty;
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
