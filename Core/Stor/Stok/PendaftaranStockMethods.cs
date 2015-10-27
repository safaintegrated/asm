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
    public class PendaftaranStockMethods
    {
        public static string SP_DaftarStockLoad(ref DataTable dt, int storeId)
        {
            DataSet ds = new DataSet();
            //DataTable   dt = new DataTable();
            using (SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString()))
            {
                //SqlCommand sqlComm = new SqlCommand("SP_Store_FindStockRegistration", conn);
                //sqlComm.Parameters.AddWithValue("@StoreId", storeId);
                //sqlComm.CommandType = CommandType.StoredProcedure;
                SqlCommand sqlCmd = new SqlCommand();

                sqlCmd.CommandText =
"SELECT TOP 1000 [StockReg_Id] ,StockStore.Stock_RegisterNo ,StockStore.Stock_Detail,[CurrentPrice] ,[Balance]," +
"[QuantityRequest],[QuantityOut] ,[ParasMenokok],[TotalIn],[TotalOut],[TotalBalance] FROM [AMS_Stock].[dbo].[StockRegistration]" +
"INNER JOIN [Store] ON Store.ST_StoreId = StockRegistration.Store_Id " +
"INNER JOIN [StockStore] ON StockStore.Stock_Id = StockRegistration.Stock_Id " +
"WHERE [StockRegistration].Store_Id = " + storeId;

                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;


                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sqlCmd;

                da.Fill(dt);
            }

            return "";
        }

        public static string SP_DaftarStockSave(Data.StockRegistration dtStock)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_SaveStockRegistration";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PtjId",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.PtjId,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@StoreId",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.StoreId,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@LocationId",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.LocationId,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@StockId",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.StockId,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@NoPkBppsBtb",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = dtStock.NoPkBppsBtb,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@CurrentBalance",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.CurrentBalance,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@ParasMenokok",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.ParasMenokok,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TransactionType",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.TransactionType,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TransInFrom",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = dtStock.TransInFrom,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TransInQuantity",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.TransInQuantity,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TransInQuantityRequest",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.TransInQuantityRequest,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TransInUnitPrice",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.TransInUnitPrice,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TransOutTo",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = dtStock.TransOutTo,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TransOutQuantityRequest",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.TransOutQuantityRequest,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TransOutUnitPrice",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.TransOutUnitPrice,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TransOutQuantity",
                    SqlDbType = SqlDbType.Int,
                    Value = dtStock.TransOutQuantity,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@DateTime",
                    SqlDbType = SqlDbType.DateTime,
                    Value = dtStock.DateTime,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.ExecuteNonQuery();
                return "";

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            {
                sqlConn.Close(); sqlConn.Dispose();
            }

        }

        public static string GetCurrentBalance(int storeId, int stockId, out int balance)
        {
            balance = 0;
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GetStockRegistrationCurrentBalance";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@StoreId", SqlDbType.Int);
                parm1.Value = storeId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@StockId", SqlDbType.Int);
                parm2.Value = stockId;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);


                sqlAdap.SelectCommand = sqlCmd;
                DataSet ds = new DataSet();
                sqlAdap.Fill(ds);

                balance = (int)ds.Tables[0].Rows[0]["CurrentBalance"];
                
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
