using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Core.Shared
{
    public class KategoriSubKategoriMethods
    {
        public static string Load_Categori(ref DataTable TVP, string CatId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [dbo].[Category] WHERE [CatId] = " + CatId;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(TVP);
                sqlConn.Close();
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlAdap.Dispose(); sqlCmd.Dispose(); sqlConn.Dispose(); }
        }

        public static string Load_SubCategori(ref DataTable TVP, string CatId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT *, (SELECT COUNT(*) FROM [AMS_DB].[dbo].[AssetInventoryRegistration_MainInformation] WHERE AIRMI_SubCat = SubCatId) [Countx] FROM [dbo].[SubCategory] WHERE [CatId] = " + CatId;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(TVP);
                sqlConn.Close();
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlAdap.Dispose(); sqlCmd.Dispose(); sqlConn.Dispose(); }
        }

        public static string SP_SaveDelete_CategorySubCategory(ref DataTable TVP_Header, ref DataTable TVP_Detail, string CatId, string CurrUser, string Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_SaveDelete_CategorySubCategory";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@TVP_Header", SqlDbType.Structured);
                parm1.Value = TVP_Header;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP_Detail", SqlDbType.Structured);
                parm2.Value = TVP_Detail;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@CatId", SqlDbType.Int);

                if (CatId == "")
                    parm3.Value = DBNull.Value;
                else
                    parm3.Value = CatId;

                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm4.Value = CurrUser;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Mode", SqlDbType.VarChar);
                parm5.Value = Mode;
                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm6.Size = 1024;
                parm6.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm6);
                
                sqlCmd.ExecuteNonQuery();
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlAdap.Dispose(); sqlCmd.Dispose(); }
        }

        public static string GetCatId(ref string CategoryId, string CategoryName)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [CatId] FROM [AMS_Master].[dbo].[Category] where [CatName] = '" + CategoryName + "'";
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                CategoryId = sqlCmd.ExecuteScalar().ToString();
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlCmd.Dispose(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string GetSubCatGlCode(string SubCatId, ref string SubCatGlCode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [SubCatGL] FROM [AMS_Master].[dbo].[SubCategory] where [SubCatId] = " + SubCatId;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                SubCatGlCode = sqlCmd.ExecuteScalar().ToString();
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlCmd.Dispose(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

    }
}
