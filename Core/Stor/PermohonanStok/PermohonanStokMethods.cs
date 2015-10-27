using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core
{
    public class PermohonanStokMethods
    {
        public static string SP_PermohonanStokCreateNewEntry(int userId, string processIdTemp)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanStokCreateNewEntry";
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
                    ParameterName = "@ProcessIdTemp",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = processIdTemp,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@ProcessId",
                    SqlDbType = SqlDbType.Int,
                    Direction = ParameterDirection.Output
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Return_Message",
                    SqlDbType = SqlDbType.NVarChar,
                    Size = 1024,
                    Direction = ParameterDirection.Output
                });

                sqlCmd.ExecuteNonQuery();
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();

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


        public static string SP_GetPermohonanStockByProcessIdTemp(out Data.PermohonanStok ps, string pid)
        {
            ps = null;
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GetPermohonanStockByProcessIdTemp";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessIdTemp", SqlDbType.VarChar);
                parm1.Value = pid;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                DataSet ds = new DataSet();
                sqlAdap.Fill(ds);

                DataRow dr = ds.Tables[0].Rows[0];
                ps = new Data.PermohonanStok
                {
                    ProcessId = (int)dr["ProcessId"],
                    ProcessIdTemp = dr["ProcessIdTemp"].ToString(),

                    PemohonJabatan = dr["PemohonJabatan"].ToString(),
                    PemohonJawatan = dr["PemohonJawatan"].ToString(),
                    PemohonNama = dr["PemohonNama"].ToString(),
                    PemohonNoKakitangan = dr["PemohonNoKakitangan"].ToString(),
                    PemohonEmpSysId = (int)dr["PemohonEmpSysId"],

                    PermohonanTarikhDiKehendaki = dr["RequiredDate"] == DBNull.Value ? DateTime.MinValue : DateTime.Parse(dr["RequiredDate"].ToString()),
                    PtjId = (int)dr["PtjId"],
                    PermohonanTujuan = dr["Purpose"] == DBNull.Value ? "" : dr["Purpose"].ToString(),
                    CreationDate = dr["CreationDate"] == DBNull.Value ? DateTime.MinValue : DateTime.Parse(dr["CreationDate"].ToString()),
                    Status = (int)dr["Status"],
                };

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string SP_GetStatusDescription(out Data.ProcessState ps, Data.ProcessStateType pst)
        {
            ps = new Data.ProcessState();
            ps.State = pst;
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [Description] FROM [AMS_Stock].[dbo].[ProcessState] WHERE [State] = " + (int)pst;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                ps.Description = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_UpdatePermohonanStok(int userId, Data.PermohonanStok ps)
        {

            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_UpdatePermohonanStok";
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
                    ParameterName = "@ProcessIdTemp",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = ps.ProcessIdTemp,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@RequiredDate",
                    SqlDbType = SqlDbType.DateTime,
                    Value = ps.PermohonanTarikhDiKehendaki,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Purpose",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = ps.PermohonanTujuan,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PtjDiPohon",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.PtjDiPohon,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@StorDiPohon",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.StorDiPohon,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@StokDiPohon",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.StokDiPohon,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@KuantitDiPohon",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.PermohonanKuantitiDiPohon,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PermohonanToPtj",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.PermohonanToPtj,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PermohonanToStor",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.PermohonanToStor,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PermohonanToNama",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.PermohonanToNama,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PermohonanToJenis",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.PermohonanToJenis,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Return_Message",
                    SqlDbType = SqlDbType.NVarChar,
                    Size = 1024,
                    Direction = ParameterDirection.Output
                });

                sqlCmd.ExecuteNonQuery();
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();

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

        public static string SP_FindPermohonanStokByProcessId(out Data.PermohonanStok ps, string pId)
        {
            ps = null;
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_GetPermohonanStockByProcessId";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.Int);
                parm1.Value = int.Parse(pId);
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                DataSet ds = new DataSet();
                sqlAdap.Fill(ds);

                DataRow dr = ds.Tables[0].Rows[0];
                ps = new Data.PermohonanStok();
                ps.ProcessId = (int)dr["ProcessId"];
                ps.ProcessIdTemp = dr["ProcessIdTemp"].ToString();
                //Pemohon
                ps.PemohonEmpSysId = (int)dr["PemohonEmpSysId"];
                ps.PemohonNama = dr["PemohonNama"].ToString();
                ps.PemohonNoKakitangan = dr["PemohonNoKakitangan"].ToString();
                ps.PemohonJawatan = dr["PemohonJawatan"].ToString();
                ps.PemohonJabatan = dr["PemohonJabatan"].ToString();

                ps.PtjId = (int)dr["PtjId"];
                ps.CreationDate = dr["CreationDate"] == DBNull.Value ? DateTime.MinValue : DateTime.Parse(dr["CreationDate"].ToString());
                ps.Status = (int)dr["Status"];
                ps.PtjDiPohon = (int)dr["PtjDiPohon"];
                ps.PermohonanKuantitiDiPohon = (int)dr["KuantitDiPohon"];
                ps.StokDiPohon = (int)dr["StokDiPohon"];
                ps.StorDiPohon = (int)dr["StorDiPohon"];
                ps.PermohonanPtjDipohonNama = dr["PermohonanPtjDipohonNama"].ToString();
                ps.PermohonanStokDiPohonNama = dr["PermohonanStokDiPohonNama"].ToString();
                ps.PermohonanStorDiPohonNama = dr["PermohonanStorDiPohonNama"].ToString();
                ps.PermohonanTujuan = dr["Purpose"] == DBNull.Value ? "" : dr["Purpose"].ToString();
                ps.PermohonanTarikhDiKehendaki = dr["RequiredDate"] == DBNull.Value ? DateTime.MinValue : DateTime.Parse(dr["RequiredDate"].ToString());
                ps.PermohonanToJenis = (int)dr["PermohonanToJenis"];
                ps.PermohonanToNama = dr["PermohonanToNama"] == DBNull.Value ? 0 : (int)dr["PermohonanToNama"];
                ps.PermohonanToPtj = dr["PermohonanToPtj"] == DBNull.Value ? 0 : (int)dr["PermohonanToPtj"];
                ps.PermohonanToStor = dr["PermohonanToStor"] == DBNull.Value ? 0 : (int)dr["PermohonanToStor"];

                ps.PegawaiKelulusanEmpSysId = dr["PegawaiKelulusanEmpSysId"] == DBNull.Value ? 0 : (int)dr["PegawaiKelulusanEmpSysId"];
                ps.TarikhDiluluskan = dr["TarikhDiluluskan"] == DBNull.Value ? DateTime.MinValue : DateTime.Parse(dr["TarikhDiluluskan"].ToString());
                ps.KuantitiDiluluskan = dr["KuantitiDiluluskan"] == DBNull.Value ? 0 : (int)dr["KuantitiDiluluskan"];

                ps.PengeluaranEmpSysId = dr["PengeluaranEmpSysId"] == DBNull.Value ? 0 : (int)dr["PengeluaranEmpSysId"];
                ps.PengeluaranTarikh = dr["PengeluaranTarikh"] == DBNull.Value ? DateTime.MinValue : DateTime.Parse(dr["PengeluaranTarikh"].ToString());
                ps.PengeluaranKuantiti = dr["PengeluaranKuantiti"] == DBNull.Value ? 0 : (int)dr["PengeluaranKuantiti"];
                ps.PengeluaranCatatan = dr["PengeluaranCatatan"].ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string SP_UpdatePermohonanStokKelulusan(int userId, Data.PermohonanStok ps)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_UpdatePermohonanStokKelulusan";
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
                    ParameterName = "@ProcessId",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.ProcessId,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@ProcessIdTemp",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = ps.ProcessIdTemp,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PegawaiKelulusanEmpSysId",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.PegawaiKelulusanEmpSysId,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@KuantitiDiluluskan",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.KuantitiDiluluskan,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Status",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.Status,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TarikhDiluluskan",
                    SqlDbType = SqlDbType.DateTime,
                    Value = ps.TarikhDiluluskan,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Return_Message",
                    SqlDbType = SqlDbType.NVarChar,
                    Size = 1024,
                    Direction = ParameterDirection.Output
                });

                sqlCmd.ExecuteNonQuery();
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();

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

        public static string SP_UpdatePermohonanStokPengeluaran(int userId, Data.PermohonanStok ps)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_UpdatePermohonanStokPengeluaran";
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
                    ParameterName = "@ProcessId",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.ProcessId,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PengeluaranEmpSysId",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.PengeluaranEmpSysId,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PengeluaranKuantiti",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.PengeluaranKuantiti,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Status",
                    SqlDbType = SqlDbType.Int,
                    Value = ps.Status,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PengeluaranTarikh",
                    SqlDbType = SqlDbType.DateTime,
                    Value = ps.PengeluaranTarikh,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PengeluaranCatatan",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = ps.PengeluaranCatatan,
                    Direction = ParameterDirection.Input
                });

                sqlCmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Return_Message",
                    SqlDbType = SqlDbType.NVarChar,
                    Size = 1024,
                    Direction = ParameterDirection.Output
                });

                sqlCmd.ExecuteNonQuery();
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();

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
    }
}
