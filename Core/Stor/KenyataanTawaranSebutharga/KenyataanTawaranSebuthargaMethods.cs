using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Stor.KenyataanTawaranSebutharga
{
    public class KenyataanTawaranSebuthargaMethods
    {
        public static string SP_KenyataanTawaranSebuthargaSave(Data.KenyataanTawaranSebutharga K)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_KenyataanTawaranSebuthargaSave";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;


                SqlParameter parm = new SqlParameter("@TarikhLihatPadaSebutharga", SqlDbType.Date);
                parm.Value = K.TarikhLihatPadaSebutharga;
                parm.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm);

                SqlParameter parm1 = new SqlParameter("@TarikhLihatHinggaSebutharga", SqlDbType.Date);
                parm1.Value = K.TarikhLihatHinggaSebutharga;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@NoSebutharga", SqlDbType.NVarChar);
                parm2.Value = K.NoSebutharga;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@PetiAlamatSebutharga", SqlDbType.NVarChar);
                parm3.Value = K.PetiAlamatSebutharga;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@TarikhTutupSebutharga", SqlDbType.Date);
                parm4.Value = K.TarikhTutupSebutharga;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);


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
    }
}
