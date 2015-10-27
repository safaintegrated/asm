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
    public class LaporanLembagaPemeriksaMethods
    {
        


        public static string SP_SaveLaporanLembagaPemeriksa(Data.LaporanLembagaPemeriksa SLLP)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_SaveLaporanLembagaPemeriksa";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm = new SqlParameter("@JabatanAtauFakulti", SqlDbType.NVarChar);
                parm.Value = SLLP.JabatanAtauFakulti;
                parm.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm);

                SqlParameter parm1 = new SqlParameter("@LokasiAtauBlok", SqlDbType.NVarChar);
                parm1.Value = SLLP.LokasiAtauBlok;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@RujukanPemohonan", SqlDbType.NVarChar);
                parm2.Value = SLLP.RujukanPemohonan;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@TarikhPemeriksaan", SqlDbType.Date);
                parm3.Value = SLLP.TarikhPmeriksaan;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);


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
