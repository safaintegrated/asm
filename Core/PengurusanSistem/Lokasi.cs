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
    public class PtjMethods
    {
        public static string SP_PusatTanggungjawab_SaveDelete(string CurrUser, ref DataTable TVP, int Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PusatTanggungjawab_SaveDelete";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm2.Value = TVP;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Mode", SqlDbType.Int);
                parm3.Value = Mode;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm4.Size = 1024;
                parm4.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm4);
               
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

        public static string LoadPtj(string PtjCode, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Master].[dbo].[PusatTanggungJawab] WHERE [PTJ_SagaCode] = '" + PtjCode + "'";
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
            { sqlAdap.Dispose();  sqlCmd.Dispose(); sqlConn.Close(); sqlConn.Dispose(); }
        }
    }

    public class DepartmentMethods
    {
        public static string SP_PusatBahagianJabatan_SaveDelete(string CurrUser, ref DataTable TVP, int Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PusatBahagianJabatan_SaveDelete";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm2.Value = TVP;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Mode", SqlDbType.Int);
                parm3.Value = Mode;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm4.Size = 1024;
                parm4.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm4);

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

        public static string LoadDept(string DeptCode, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Master].[dbo].[PusatBahagianJabatan] WHERE [PBJ_SmpCode] = '" + DeptCode + "'";
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
            { sqlAdap.Dispose(); sqlCmd.Dispose(); sqlConn.Close(); sqlConn.Dispose(); }
        }
    }

    public class BuildingMethods
    {
        public static string SP_Building_SaveDelete(string CurrUser, ref DataTable TVP, int Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Building_SaveDelete";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm2.Value = TVP;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Mode", SqlDbType.Int);
                parm3.Value = Mode;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm4.Size = 1024;
                parm4.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm4);

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

        public static string LoadBuilding(string BuildId, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Master].[dbo].[Building] WHERE [Build_Id] = " + BuildId;
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
            { sqlAdap.Dispose(); sqlCmd.Dispose(); sqlConn.Close(); sqlConn.Dispose(); }
        }
    }

    public class FloorMethods
    {
        public static string SP_Floor_SaveDelete(string CurrUser, ref DataTable TVP, int Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Floor_SaveDelete";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm2.Value = TVP;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Mode", SqlDbType.Int);
                parm3.Value = Mode;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm4.Size = 1024;
                parm4.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm4);

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

        public static string LoadFloor(string BuildId, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Master].[dbo].[Floor] WHERE [Floor_Id] = " + BuildId;
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
            { sqlAdap.Dispose(); sqlCmd.Dispose(); sqlConn.Close(); sqlConn.Dispose(); }
        }
    }

    public class SpaceMethods
    {
        public static string SP_Space_SaveDelete(string CurrUser, ref DataTable TVP, int Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_Space_SaveDelete";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm2.Value = TVP;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Mode", SqlDbType.Int);
                parm3.Value = Mode;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm4.Size = 1024;
                parm4.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm4);

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

        public static string LoadSpace(string BuildId, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT * FROM [AMS_Master].[dbo].[Space] WHERE [Space_Id] = " + BuildId;
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
            { sqlAdap.Dispose(); sqlCmd.Dispose(); sqlConn.Close(); sqlConn.Dispose(); }
        }
    }
}
