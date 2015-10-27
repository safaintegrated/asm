using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Stor.KenyataanTawaranTender
{
    public class KenyataanTawaranTenderMethods
    {
        public static string LoadKenyataanTawaranTender(ref DataTable Dt, string TawaranTenderId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Stock].[dbo].[KenyataanTawaranTender] WHERE [TawaranTenderId] = " + TawaranTenderId;
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


        //public static string SP_KenyataanTawaranTenderLoad(string id, ref DataSet dt)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do
        //    SqlDataAdapter sqlAdap = new SqlDataAdapter();
        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SP_KenyataanTawaranTenderLoad";
        //        sqlCmd.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.Connection = sqlConn;

        //        SqlParameter parm1 = new SqlParameter("@TawaranTenderId", SqlDbType.Int);
        //        parm1.Value = id;
        //        parm1.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm1);


        //        sqlAdap.SelectCommand = sqlCmd;
        //        sqlAdap.Fill(dt);

        //        return string.Empty;
        //    }
        //    catch (Exception err)
        //    {
        //        return err.Message;
        //    }
        //    finally
        //    { sqlConn.Close(); sqlConn.Dispose(); }
        //}


        public static string SP_KenyataanTawaranTenderPelupusanSave(Data.KenyataanTawaranTender KTT)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_KenyataanTawaranTenderPelupusanSave";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm = new SqlParameter("@NoTender", SqlDbType.NVarChar);
                parm.Value = KTT.NoTender;
                parm.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm);

                SqlParameter parm1 = new SqlParameter("@TarikhLihatPada", SqlDbType.Date);
                parm1.Value = KTT.TarikhLihatPada;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TarikhLihatHingga", SqlDbType.Date);
                parm2.Value = KTT.TarikhLihatHingga;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@JamLihatPada", SqlDbType.Date);
                parm3.Value = KTT.JamLihatPada;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@JamLihatHingga", SqlDbType.Date);
                parm4.Value = KTT.JamLihatHingga;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@TenderTutup", SqlDbType.Date);
                parm5.Value = KTT.TenderTutup;
                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@PetiTender", SqlDbType.NVarChar);
                parm6.Value = KTT.PetiTender;
                parm6.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm6);

      

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

        public static string SP_KenyataanTawaranTenderLoad(string KenyataanTawaranId, ref DataSet Ds)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();
            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_KenyataanTawaranTenderLoad";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@TawaranTenderId", SqlDbType.Int);
                parm1.Value = KenyataanTawaranId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);


                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Ds);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }


        public static object NoTender { get; set; }
    }
}
