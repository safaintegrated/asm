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
    public class PelupusanMethods
    {

        public static string SP_FindNameStockPelupusanLoad(ref DataTable dt, int StoreId)
        {
            DataSet ds = new DataSet();
            //DataTable   dt = new DataTable();
            using (SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString()))
            {

                SqlCommand sqlCmd = new SqlCommand();

                sqlCmd.CommandText =
                "SELECT TOP 1000 [StockReg_Id] ,StockStore.Stock_RegisterNo ,StockStore.Stock_Detail,[Balance]," +
                "Pelupusan.PelupusanStatus AS 'Status Pelupusan' ,FROM [AMS_Stock].[dbo].[StockRegistration]" +
                "INNER JOIN [Store] ON Store.ST_StoreId = StockRegistration.Store_Id" +
                "INNER JOIN [StockStore] ON StockStore.Stock_Id = StockRegistration.Stock_Id" +
                "INNER JOIN [Pelupusan] ON Pelupusan.PelupusanId = StockRegistration.PelupusanId " +
                "WHERE [StockRegistration].Store_Id = " + StoreId;

                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;


                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sqlCmd;

                da.Fill(dt);
            }

            return "";
        }


        public static string SP_PelupusanSave(Data.Pelupusan p)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PelupusanSave";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;


                SqlParameter parm = new SqlParameter("@TarikhPelupusan", SqlDbType.Date);
                parm.Value = p.TarikhPelupusan;
                parm.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm);

                SqlParameter parm1 = new SqlParameter("@Keterangan", SqlDbType.NVarChar);
                parm1.Value = p.Status;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@PelupusanDaftarStok", SqlDbType.NVarChar);
                parm2.Value = p.PelupusanDaftarStok;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@KeteranganStok", SqlDbType.NVarChar);
                parm3.Value = p.KeteranganStok;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@HargaSeunit", SqlDbType.NVarChar);
                parm4.Value = p.HargaSeunit;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@KuantitiDilupuskan", SqlDbType.NVarChar);
                parm5.Value = p.KuantitiDilupuskan;
                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@NilaiPerolehan", SqlDbType.NVarChar);
                parm6.Value = p.NilaiPerolehan;
                parm6.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm6);

                SqlParameter parm7 = new SqlParameter("@HasilPerolehan", SqlDbType.NVarChar);
                parm7.Value = p.HasilPerolehan;
                parm7.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm7);

                SqlParameter parm8 = new SqlParameter("@KaedahDanNilai", SqlDbType.NVarChar);
                parm8.Value = p.KaedahDanNilai;
                parm8.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm8);

                sqlCmd.ExecuteNonQuery();

                //PEMH_RowId = sqlCmd.Parameters["@PEMH_RowId"].Value.ToString();
                //RefNumber = sqlCmd.Parameters["@RefNumber"].Value.ToString();
                return "";// sqlCmd.Parameters["@Return_Message"].Value.ToString();

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }


        public static string SP_LupusSave(Data.Pelupusan p)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LupusSave";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;


                SqlParameter parm = new SqlParameter("@TarikhPelupusan", SqlDbType.Date);
                parm.Value = p.TarikhPelupusan;
                parm.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm);

                SqlParameter parm1 = new SqlParameter("@PTJ_Id", SqlDbType.NVarChar);
                parm1.Value = p.PTJ_Id;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@KategoriStok", SqlDbType.NVarChar);
                parm2.Value = p.KategoriStok;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                sqlCmd.ExecuteNonQuery();

                //PEMH_RowId = sqlCmd.Parameters["@PEMH_RowId"].Value.ToString();
                //RefNumber = sqlCmd.Parameters["@RefNumber"].Value.ToString();
                return "";// sqlCmd.Parameters["@Return_Message"].Value.ToString();

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_FindNameStockPelupusanLoad(string p, ref DataSet Ds)
        {
            throw new NotImplementedException();
        }
    }
}
