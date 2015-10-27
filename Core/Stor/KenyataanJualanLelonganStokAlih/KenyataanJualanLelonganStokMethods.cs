using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Stor.KenyataanJualanLelonganStokAlih
{
    public class KenyataanJualanLelonganStokAlihMethods
    {

        public static string SP_KenyataanJualanLelonganStokAlihSave(Data.KenyataanJualanLelonganStokAlih KJLS)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_KenyataanJualanLelonganStokAlihSave";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;


                SqlParameter parm = new SqlParameter("@TarikhMula", SqlDbType.Date);
                parm.Value = KJLS.TarikhMula;
                parm.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm);

                SqlParameter parm1 = new SqlParameter("@TarikhTamat", SqlDbType.Date);
                parm1.Value = KJLS.TarikhTamat;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Alamat", SqlDbType.NVarChar);
                parm2.Value = KJLS.Alamat;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@PadaJam", SqlDbType.NVarChar);
                parm3.Value = KJLS.PadaJam;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@TamatJam", SqlDbType.NVarChar);
                parm4.Value = KJLS.TamatJam;
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
