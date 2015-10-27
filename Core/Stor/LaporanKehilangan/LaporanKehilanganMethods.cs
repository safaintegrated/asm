using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Stor.LaporanKehilangan
{
    public class LaporanKehilanganMethods
    {
        public static string SP_LaporanKehilanganSave(Data.LaporanKehilangan LK)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_StockConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LaporanKehilanganSave";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;


                SqlParameter parm = new SqlParameter("@JenisAset", SqlDbType.NVarChar);
                parm.Value = LK.JenisAset;
                parm.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm);

                SqlParameter parm1 = new SqlParameter("@JenamaDanModel", SqlDbType.NVarChar);
                parm1.Value = LK.JenamaDanModel;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Kuantiti", SqlDbType.NVarChar);
                parm2.Value = LK.Kuantiti;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@TarikhPerolehan", SqlDbType.Date);
                parm3.Value = LK.TarikhPerolehan;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@TarikhLaporan", SqlDbType.Date);
                parm4.Value = LK.TarikhLaporan;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Status", SqlDbType.NVarChar);
                parm5.Value = LK.Status;
                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@JenisAsetAlihStok", SqlDbType.NVarChar);
                parm6.Value = LK.JenisAsetAlihStok;
                parm6.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm6);

                SqlParameter parm7 = new SqlParameter("@NoDaftarStok", SqlDbType.NVarChar);
                parm7.Value = LK.NoDaftarStok;
                parm7.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm7);

                SqlParameter parm8 = new SqlParameter("@KeteranganStok", SqlDbType.NVarChar);
                parm8.Value = LK.Keterangan;
                parm8.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm8);

                SqlParameter parm9 = new SqlParameter("@SubKategori", SqlDbType.NVarChar);
                parm9.Value = LK.SubKategori;
                parm9.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm9);

                SqlParameter parm10 = new SqlParameter("@TarikhBeli", SqlDbType.NVarChar);
                parm10.Value = LK.TarikhBeli;
                parm10.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm10);

                SqlParameter parm11 = new SqlParameter("@HargaPerolehanAsal", SqlDbType.NVarChar);
                parm11.Value = LK.HargaPerolehanAsal;
                parm11.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm11);

                SqlParameter parm12 = new SqlParameter("@KuantitiKehilangan", SqlDbType.NVarChar);
                parm12.Value = LK.KuantitiKehilangan;
                parm12.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm12);

                SqlParameter parm13 = new SqlParameter("@AnggaranNilaiSemasa", SqlDbType.NVarChar);
                parm13.Value = LK.AnggaranNilaiSemasa;
                parm13.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm13);

                SqlParameter parm14 = new SqlParameter("@TempatKehilangan", SqlDbType.NVarChar);
                parm14.Value = LK.TempatKehilangan;
                parm14.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm14);

                SqlParameter parm15 = new SqlParameter("@PuncaKehilangan", SqlDbType.NVarChar);
                parm15.Value = LK.PuncaKehilangan;
                parm15.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm15);

                SqlParameter parm16 = new SqlParameter("@PegawaiYangBertanggungjawab", SqlDbType.NVarChar);
                parm16.Value = LK.PegawaiYangBertanggungjawab;
                parm16.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm16);

                SqlParameter parm17 = new SqlParameter("@JawatanPegawaiYangBertanggungjawab", SqlDbType.NVarChar);
                parm17.Value = LK.JawatanPegawaiYangBertanggungjawab;
                parm17.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm17);

                SqlParameter parm18 = new SqlParameter("@TarafJawatan", SqlDbType.NVarChar);
                parm18.Value = LK.TarafJawatan;
                parm18.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm18);

                SqlParameter parm19 = new SqlParameter("@NoLaporanPolis", SqlDbType.NVarChar);
                parm19.Value = LK.NoLaporanPolis;
                parm19.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm19);

                SqlParameter parm20 = new SqlParameter("@TarikhLaporanPolis", SqlDbType.Date);
                parm20.Value = LK.TarikhLaporanPolis;
                parm20.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm20);

                SqlParameter parm22 = new SqlParameter("@LangkahlangkahSediaAda", SqlDbType.NVarChar);
                parm22.Value = LK.LangkahLangkahSediaAda;
                parm22.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm22);

                SqlParameter parm23 = new SqlParameter("@LangkahlangkahPencegahan", SqlDbType.NVarChar);
                parm23.Value = LK.LangkahLangkahPencegahan;
                parm23.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm23);

                SqlParameter parm24 = new SqlParameter("@TindakanKeatasPegawaiYangBertanggungjawab", SqlDbType.NVarChar);
                parm24.Value = LK.TindakanKepadaPegawaiYangBertanggungjawab;
                parm24.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm24);

                SqlParameter parm25 = new SqlParameter("@Catatan", SqlDbType.NVarChar);
                parm25.Value = LK.Catatan;
                parm25.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm25);

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
