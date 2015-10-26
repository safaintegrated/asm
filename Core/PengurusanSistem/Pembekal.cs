using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Core.PengurusanSistem
{
    public class PembekalMethods
    {
        public static string SP_Import_Vendor(ref DataTable TVP_Vendor)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Import_Vendor";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@TVP_Vendor", SqlDbType.Structured);
                parm1.Value = TVP_Vendor;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm2.Size = 1024;
                parm2.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm2);
                
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

        public static string LoadVendor(ref DataSet Ds, string VendorSagaCode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_SAGA].[dbo].[V_AP_Supplier] where [apsu_suppid] = '" + VendorSagaCode + "'; SELECT '" + VendorSagaCode + "' [SetVen_SAGACode],  [Item] ,[ItemCode] FROM [AMS_Master].[dbo].[MasterKodBidang] WHERE ItemCode IN (SELECT [ItemCode] FROM [AMS_Master].[dbo].[VendorAndKodBidang] WHERE [SetVen_SAGACode] = '" + VendorSagaCode + "')";
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

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

        public static string LoadVendorKodBidangInformation(ref DataSet TVP_Vendor, string VendorSagaCode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Master].[dbo].[Vendor_Certificate] C where C.SetVen_SAGACode = '" + VendorSagaCode + "'; SELECT V.ItemCode, (SELECT [Item] FROM [AMS_Master].[dbo].[MasterKodBidang] B where B.ItemCode = V.ItemCode) [Item] FROM [AMS_Master].[dbo].[VendorAndKodBidang] V where [SetVen_SAGACode] = '" + VendorSagaCode + "' ORDER BY V.ItemCode";
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(TVP_Vendor);
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        //public static string SP_Update_Vendor(ref DataTable TVP_Cert, ref DataTable TVP_KodBidang, string SetVen_SAGACode, string CurrUser)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do
        //    SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SP_Update_Vendor";
        //        sqlCmd.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.Connection = sqlConn;

        //        SqlParameter parm1 = new SqlParameter("@TVP_Cert", SqlDbType.Structured);
        //        parm1.Value = TVP_Cert;
        //        parm1.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm1);

        //        SqlParameter parm2 = new SqlParameter("@TVP_KodBidang", SqlDbType.Structured);
        //        parm2.Value = TVP_KodBidang;
        //        parm2.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm2);

        //        SqlParameter parm3 = new SqlParameter("@SetVen_SAGACode", SqlDbType.VarChar);
        //        parm3.Value = SetVen_SAGACode;
        //        parm3.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm3);

        //        SqlParameter parm4 = new SqlParameter("@CurrUser", SqlDbType.Int);
        //        parm4.Value = CurrUser;
        //        parm4.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm4);

        //        SqlParameter parm5 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
        //        parm5.Size = 1024;
        //        parm5.Direction = ParameterDirection.Output;
        //        sqlCmd.Parameters.Add(parm5);

        //        sqlCmd.ExecuteNonQuery();
        //        return sqlCmd.Parameters["@Return_Message"].Value.ToString();
        //    }
        //    catch (Exception err)
        //    {
        //        return err.Message;
        //    }
        //    finally
        //    { sqlConn.Close(); sqlConn.Dispose(); }
        //}

        public static string AP_Supplier_Update(ref DataTable TVP_AP_Supplier, ref DataTable TVP_VendorKodBidang, string CurrUser)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_SAGAConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "AP_Supplier_Update";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@TVP_AP_Supplier", SqlDbType.Structured);
                parm1.Value = TVP_AP_Supplier;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP_VendorKodBidang", SqlDbType.Structured);
                parm2.Value = TVP_VendorKodBidang;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm4 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm4.Value = CurrUser;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm5.Size = 1024;
                parm5.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm5);

                sqlCmd.ExecuteNonQuery();
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlCmd.Dispose(); sqlConn.Close(); sqlConn.Dispose(); }
        }
    }
}
