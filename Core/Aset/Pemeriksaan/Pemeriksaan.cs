using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Core.Aset.Pemeriksaan
{
    public class PemeriksaanMethods
    {
        public static string SP_Pemeriksaan_SavePost(string CurrUser, ref DataTable TVP_Header, int Post, ref string PEMH_RowId, ref string RefNumber)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Pemeriksaan_SavePost";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP_Header", SqlDbType.Structured);
                parm2.Value = TVP_Header;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Post", SqlDbType.Int);
                parm3.Value = Post;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@PEMH_RowId", SqlDbType.Int);
                parm4.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm5.Size = 1024;
                parm5.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@RefNumber", SqlDbType.VarChar);
                parm6.Size = 1024;
                parm6.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm6);

                sqlCmd.ExecuteNonQuery();

                PEMH_RowId = sqlCmd.Parameters["@PEMH_RowId"].Value.ToString();
                RefNumber = sqlCmd.Parameters["@RefNumber"].Value.ToString();
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_Pemeriksaan_LoadPemeriksaanTab(string RowId, ref DataSet ReturnDs)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Pemeriksaan_LoadPemeriksaanTab";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@RowId", SqlDbType.Int);
                parm1.Value = RowId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(ReturnDs);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_Pemeriksaan_LookupAssetInv(ref DataTable ReturnDt, object Ptj, object Dept, object Block, object Floor, object Space)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Pemeriksaan_LookupAssetInv";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@PTJ", SqlDbType.Int);

                if (Ptj == null)
                    parm1.Value = DBNull.Value;
                else
                    parm1.Value = Convert.ToInt32(Ptj);

                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Dept", SqlDbType.Int);

                if (Dept == null)
                    parm2.Value = DBNull.Value;
                else
                    parm2.Value = Convert.ToInt32(Dept);

                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Block", SqlDbType.Int);

                if (Block == null)
                    parm3.Value = DBNull.Value;
                else
                    parm3.Value = Convert.ToInt32(Block);

                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Floor", SqlDbType.Int);

                if (Floor == null)
                    parm4.Value = DBNull.Value;
                else
                    parm4.Value = Convert.ToInt32(Floor);

                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Space", SqlDbType.Int);

                if (Space == null)
                    parm5.Value = DBNull.Value;
                else
                    parm5.Value = Convert.ToInt32(Space);

                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(ReturnDt);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); }
        }

        public static string V_LembagaPemeriksa_Detail(ref DataTable Dt, string LPH_UniqueId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Master].[dbo].[V_LembagaPemeriksa_Detail] WHERE LPH_UniqueId = '" + LPH_UniqueId + "'";
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

        public static string V_Pemeriksaan_Header(ref DataTable Dt, string RowId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Transaction].[dbo].[V_Pemeriksaan_Header] WHERE PEMH_RowId = " + RowId;
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
    }
}
