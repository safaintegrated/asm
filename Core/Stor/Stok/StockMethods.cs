using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Core.Stor.Stok
{
    public class StockMethods
    {
        public static string LoadStock(ref DataTable Dt, string stockId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Stock].[dbo].[StockStore] WHERE [Stock_Id] = " + stockId;
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
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); }
        }

        public static string SP_StockSave(Data.Stock dtStock)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_StockSave";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@StockRegNo", SqlDbType.NVarChar);
                parm1.Value = dtStock.StockRegisterNo;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Stock_Detail", SqlDbType.NVarChar);
                parm2.Value = dtStock.StockDetail;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@StockGroup", SqlDbType.NVarChar);
                parm3.Value = dtStock.StockGroup;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@CatId", SqlDbType.Int);
                parm4.Value = dtStock.CatId;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Stock_unitMeasurament", SqlDbType.Int);
                parm5.Value = dtStock.StockMeasurament ;
                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);


                SqlParameter parm6 = new SqlParameter("@SubCatId", SqlDbType.Int);
                parm6.Value = dtStock.SubCatId;
                parm6.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm6);


                SqlParameter parm7 = new SqlParameter("@Stock_StatusExpiryDate", SqlDbType.Int);
                parm7.Value = dtStock.StockStatusExpiryDate;
                parm7.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm7);

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

        public static string SP_StockSaveDelete(ref DataTable TVP, string CurrUser, int Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_StockSaveDelete";
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










//        public static string SP_Store_SaveDelete(ref DataTable TVP, string CurrUser, int Mode)
//        {
//            SqlConnection sqlConn = new SqlConnection();  //defines database connection
//            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
//            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

//            try
//            {
//                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
//                sqlConn.Open();

//                sqlCmd.CommandText = "SP_Store_SaveDelete";
//                sqlCmd.CommandType = CommandType.StoredProcedure;
//                sqlCmd.Connection = sqlConn;

//                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
//                parm1.Value = TVP;
//                parm1.Direction = ParameterDirection.Input;
//                sqlCmd.Parameters.Add(parm1);

//                SqlParameter parm2 = new SqlParameter("@CurrUser", SqlDbType.Int);
//                parm2.Value = CurrUser;
//                parm2.Direction = ParameterDirection.Input;
//                sqlCmd.Parameters.Add(parm2);

//                SqlParameter parm3 = new SqlParameter("@Mode", SqlDbType.Int);
//                parm3.Value = Mode;
//                parm3.Direction = ParameterDirection.Input;
//                sqlCmd.Parameters.Add(parm3);                

//                SqlParameter parm4 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
//                parm4.Size = 1024;
//                parm4.Direction = ParameterDirection.Output;
//                sqlCmd.Parameters.Add(parm4);

//                sqlCmd.ExecuteNonQuery();
//                return sqlCmd.Parameters["@Return_Message"].Value.ToString();

//            }
//            catch (Exception err)
//            {
//                return err.Message;
//            }
//            finally
//            { sqlConn.Close(); sqlConn.Dispose(); }
//        }
//    }
//}

