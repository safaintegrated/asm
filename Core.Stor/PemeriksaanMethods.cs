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
    public class PemeriksaanMethods
    {
        public static string SP_FindNameStockLoad(ref DataTable dt, int storeId)
        {
            DataSet ds = new DataSet();
            using (SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString()))
            {
                SqlCommand sqlCmd = new SqlCommand();
                sqlCmd.CommandText =
                "SELECT TOP 1000 [StockReg_Id] ,StockStore.Stock_RegisterNo ,StockStore.Stock_Detail,[Balance]," +
                "[CurrentPrice] FROM [AMS_Stock].[dbo].[StockRegistration]" +
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

        public static string SP_PemeriksaanLoad(string id, ref DataSet ds)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PemeriksaanLoad";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@PemeriksaanId", SqlDbType.Int);
                parm1.Value = id;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(ds);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_PemeriksaanSave(int userId, Data.Pemeriksaan p)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                DataTable dtPemeriksaanHeader = Converter.ParseToDataTable(p);
                DataTable dtPemeriksaanDetail = Converter.ParseToDataTable(p.Details);

                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_SavePemeriksaan";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@CurrUser",
                    SqlDbType = SqlDbType.Int,
                    Value = userId,
                    Direction = ParameterDirection.Input
                });


                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TVP_Header",
                    SqlDbType = SqlDbType.Structured,
                    Value = dtPemeriksaanHeader,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TVP_Detail",
                    SqlDbType = SqlDbType.Structured,
                    Value = dtPemeriksaanDetail,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Return_Message",
                    SqlDbType = SqlDbType.VarChar,
                    Size = 1024,
                    Direction = ParameterDirection.Output
                });

                sqlCmd.ExecuteNonQuery();
                return "";

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_FindPemeriksaanById(string id, out Data.Pemeriksaan p)
        {
            p = null;
            SqlConnection sqlConn = new SqlConnection();
            SqlCommand sqlCmd = new SqlCommand();
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_FindPemeriksaanById";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@Id", SqlDbType.Int);
                parm1.Value = int.Parse(id);
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                DataSet ds = new DataSet();
                sqlAdap.Fill(ds);

                DataRow dr = ds.Tables[0].Rows[0];
                p = new Data.Pemeriksaan
                {
                    Id = (int)dr["Id"],
                    LembagaId = dr["LembagaId"].ToString()
                };

                for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                {
                    Data.PemeriksaanDetail pd = new Data.PemeriksaanDetail
                    {
                        Id = int.Parse(ds.Tables[1].Rows[i]["Id"].ToString()),
                        StockRegId = int.Parse(ds.Tables[1].Rows[i]["StockRegId"].ToString()),
                        CurrentBalance = int.Parse(ds.Tables[1].Rows[i]["Balance"].ToString()),
                        ParasMenokok = int.Parse(ds.Tables[1].Rows[i]["ParasMenokok"].ToString()),
                        StockId = int.Parse(ds.Tables[1].Rows[i]["StockId"].ToString()),
                        StockCode = ds.Tables[1].Rows[i]["StockRegNo"].ToString(),
                        StockName = ds.Tables[1].Rows[i]["StockDetail"].ToString()

                    };
                    p.Details.Add(pd);
                }
                //DataRow drDetail = ds.Tables[0].Rows[0];


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
