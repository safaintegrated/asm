using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Stor.SijilPengesahanPemusnahanStokAlih
{
    public class SijilPengesahanPemusnahanStokAlihMethods
    {
        public static string SP_SaveSijilPengesahanPemusnahanStokAlih(Data.SijilPengesahanPemusnahanStokAlih SPPSA)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_SaveSijilPengesahanPemusnahanStokAlih";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;


                SqlParameter parm = new SqlParameter("@FakultiAtauPTJ", SqlDbType.NVarChar);
                parm.Value = SPPSA.FakultiAtauPTJ;
                parm.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm);

                SqlParameter parm1 = new SqlParameter("@UnitAtauMakmal", SqlDbType.NVarChar);
                parm1.Value = SPPSA.UnitAtauMakmal;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@JenisAset", SqlDbType.NVarChar);
                parm2.Value = SPPSA.JenisAset;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Kuantiti", SqlDbType.NVarChar);
                parm3.Value = SPPSA.Kuantiti;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Secara", SqlDbType.NVarChar);
                parm4.Value = SPPSA.Secara;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Tarikh", SqlDbType.Date);
                parm5.Value = SPPSA.Tarikh;
                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@Tempat", SqlDbType.NVarChar);
                parm6.Value = SPPSA.Tempat;
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

        public static string SP_SaveSijilPengesahanPemusnahanStokAlih(object SPPSA)
        {
            throw new NotImplementedException();
        }
    }
}
