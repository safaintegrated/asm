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
    public class PermohonanBelianMethods
    {
        #region Old Code During Roni's Time
        public static string SP_PermohonanBelian_LoadHeader(ref DataTable Dt, string ProcessId, string Revision)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanBelian_LoadHeader";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm2 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm2.Value = ProcessId;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm4 = new SqlParameter("@Revision", SqlDbType.Int);
                parm4.Value = Revision;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm3 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm3.Size = 1024;
                parm3.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm3);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Dt);
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        //public static string SP_PermohonanBelian_LoadHeader_GetRef(ref DataTable Dt, string ProcessId, string Revision)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do
        //    SqlDataAdapter sqlAdap = new SqlDataAdapter();

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SP_PermohonanBelian_LoadHeader_GetRef";
        //        sqlCmd.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.Connection = sqlConn;

        //        SqlParameter parm2 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
        //        parm2.Value = ProcessId;
        //        parm2.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm2);

        //        SqlParameter parm1 = new SqlParameter("@Revision", SqlDbType.Int);
        //        parm1.Value = Revision;
        //        parm1.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm1);

        //        sqlAdap.SelectCommand = sqlCmd;
        //        sqlAdap.Fill(Dt);
        //        return string.Empty;
        //    }
        //    catch (Exception err)
        //    {
        //        return err.Message;
        //    }
        //    finally
        //    { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        //}

        //public static string SP_PermohonanBelian_SaveItem(ref DataTable ItemTVP, ref DataTable Components_TVP, string ProcessId, string Revision)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SP_PermohonanBelian_SaveItem";
        //        sqlCmd.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.Connection = sqlConn;

        //        SqlParameter parm1 = new SqlParameter("@ItemTVP", SqlDbType.Structured);
        //        parm1.Value = ItemTVP;
        //        parm1.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm1);

        //        SqlParameter parm2 = new SqlParameter("@Components_TVP", SqlDbType.Structured);
        //        parm2.Value = Components_TVP;
        //        parm2.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm2);

        //        SqlParameter parm3 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
        //        parm3.Value = ProcessId;
        //        parm3.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm3);

        //        SqlParameter parm5 = new SqlParameter("@Revision", SqlDbType.Int);
        //        parm5.Value = Revision;
        //        parm5.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm5);

        //        SqlParameter parm4 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
        //        parm4.Size = 1024;
        //        parm4.Direction = ParameterDirection.Output;
        //        sqlCmd.Parameters.Add(parm4);

        //        sqlCmd.ExecuteNonQuery();
        //        return sqlCmd.Parameters["@Return_Message"].Value.ToString();

        //    }
        //    catch (Exception err)
        //    {
        //        return err.Message;
        //    }
        //    finally
        //    { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        //}

        //public static string SP_PermohonanBelian_LoadItem(ref DataSet Ds, string ProcessId, string ItemNumber, string Revision)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do
        //    SqlDataAdapter sqlAdap = new SqlDataAdapter();

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SP_PermohonanBelian_LoadItem";
        //        sqlCmd.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.Connection = sqlConn;

        //        SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
        //        parm1.Value = ProcessId;
        //        parm1.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm1);

        //        SqlParameter parm2 = new SqlParameter("@ItemNumber", SqlDbType.Int);
        //        parm2.Value = ItemNumber;
        //        parm2.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm2);

        //        SqlParameter parm3 = new SqlParameter("@Revision", SqlDbType.Int);
        //        parm3.Value = Revision;
        //        parm3.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm3);

        //        sqlAdap.SelectCommand = sqlCmd;
        //        sqlAdap.Fill(Ds);

        //        return string.Empty;

        //    }
        //    catch (Exception err)
        //    {
        //        return err.Message;
        //    }
        //    finally
        //    { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); sqlAdap.Dispose(); }
        //}

        public static string SP_PermohonanBelian_SavePostHeader(string CurrUser, string ProcessId, ref DataTable Dt, int Post, ref DataTable WorkflowDt, string Revision)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanBelian_SavePostHeader";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm2.Value = ProcessId;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm3.Value = Dt;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Post", SqlDbType.Int);
                parm4.Value = Post;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm6 = new SqlParameter("@Revision", SqlDbType.Int);
                parm6.Value = Revision;
                parm6.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm6);

                SqlParameter parm5 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm5.Size = 1024;
                parm5.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm5);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(WorkflowDt);
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        //public static string GetStatusDescription(ref string StatusDescription, string StatusId)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do
        //    SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SELECT [StatusName] FROM [AMS_Master].[dbo].[MasterStatus] WHERE [StatusId] = " + StatusId;
        //        sqlCmd.CommandType = CommandType.Text;
        //        sqlCmd.Connection = sqlConn;

        //        StatusDescription = sqlCmd.ExecuteScalar().ToString();

        //        return string.Empty;
        //    }
        //    catch (Exception err)
        //    {
        //        return err.Message;
        //    }
        //    finally
        //    { sqlConn.Close(); sqlConn.Dispose(); }
        //}

        //public static string SP_PermohonanBelian_RemoveItem(string ProcessId, string ItemNumber)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SP_PermohonanBelian_RemoveItem";
        //        sqlCmd.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.Connection = sqlConn;

        //        SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
        //        parm1.Value = ProcessId;
        //        parm1.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm1);

        //        SqlParameter parm2 = new SqlParameter("@ItemNumber", SqlDbType.Int);
        //        parm2.Value = ItemNumber;
        //        parm2.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm2);

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
        //    { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        //}

        //public static string SP_PermohonanBelian_SaveChecklist(string ProcessId, string CheckedBy, ref DataTable TVP)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SP_PermohonanBelian_SaveChecklist";
        //        sqlCmd.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.Connection = sqlConn;

        //        SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
        //        parm1.Value = ProcessId;
        //        parm1.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm1);

        //        SqlParameter parm2 = new SqlParameter("@CheckedBy", SqlDbType.VarChar);
        //        parm2.Value = CheckedBy;
        //        parm2.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm2);

        //        SqlParameter parm3 = new SqlParameter("@TVP", SqlDbType.Structured);
        //        parm3.Value = TVP;
        //        parm3.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm3);

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
        //    { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        //}

        //public static string SP_PermohonanBelian_GetChecklist(string ProcessId, ref DataSet Ds)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do
        //    SqlDataAdapter sqlAdap = new SqlDataAdapter();

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SP_PermohonanBelian_GetChecklist";
        //        sqlCmd.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.Connection = sqlConn;

        //        SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
        //        parm1.Value = ProcessId;
        //        parm1.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm1);

        //        sqlAdap.SelectCommand = sqlCmd;
        //        sqlAdap.Fill(Ds);
        //        return string.Empty;
        //    }
        //    catch (Exception err)
        //    {
        //        return err.Message;
        //    }
        //    finally
        //    { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        //}

        //public static string SP_PermohonanBelian_CheckWorkflowAvailability(string ProcessId, string Revision, string CurrUser, string CheckType, ref string WfCount)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SP_CheckWorkflowAvailability";
        //        sqlCmd.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.Connection = sqlConn;

        //        SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
        //        parm1.Value = ProcessId;
        //        parm1.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm1);

        //        SqlParameter parm2 = new SqlParameter("@Revision", SqlDbType.Int);
        //        parm2.Value = Revision;
        //        parm2.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm2);

        //        SqlParameter parm3 = new SqlParameter("@CurrUser", SqlDbType.Int);
        //        parm3.Value = CurrUser;
        //        parm3.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm3);

        //        SqlParameter parm4 = new SqlParameter("@CheckType", SqlDbType.Int);
        //        parm4.Value = CheckType;
        //        parm4.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm4);

        //        WfCount = sqlCmd.ExecuteScalar().ToString();
        //        return string.Empty;
        //    }
        //    catch (Exception err)
        //    {
        //        return err.Message;
        //    }
        //    finally
        //    { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        //}

        public static string SP_PermohonanBelian_WorkflowProcessing(string ProcessId, string Revision, string CurrUser, string Result, string Comments, string WfType, ref DataTable Dt)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanBelian_WorkflowProcessing";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Revision", SqlDbType.Int);
                parm2.Value = Revision;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm3.Value = CurrUser;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Result", SqlDbType.Int);
                parm4.Value = Result;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Comments", SqlDbType.VarChar);
                parm5.Value = Comments;
                parm5.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@WfType", SqlDbType.Int);
                parm6.Value = WfType;
                parm6.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm6);

                SqlParameter parm7 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm7.Size = 1024;
                parm7.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm7);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Dt);

                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        //public static string GetPrNumber(ref string PrNumber, string ProcessId, string Revision)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do
        //    SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SELECT [PRH_PRnumber] FROM [AMS_Transaction].[dbo].[PermohonanBelian_Header] H where H.PRH_ProcessId = '"+ ProcessId +"' AND H.PRH_Revision = "+Revision;
        //        sqlCmd.CommandType = CommandType.Text;
        //        sqlCmd.Connection = sqlConn;

        //        PrNumber = sqlCmd.ExecuteScalar().ToString();

        //        return string.Empty;
        //    }
        //    catch (Exception err)
        //    {
        //        return err.Message;
        //    }
        //    finally
        //    { sqlConn.Close(); sqlConn.Dispose(); }
        //}

        public static string SP_PR_GetGlCode(int PurchaseType, int SubCatId, Decimal UnitPrice, ref string GlCode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PR_GetGlCode";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@PurchaseType", SqlDbType.Int);
                parm1.Value = PurchaseType;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@SubCatId", SqlDbType.Int);
                parm2.Value = SubCatId;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@UnitPrice", SqlDbType.Decimal);
                parm3.Value = UnitPrice;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                GlCode = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        //public static string SP_PermohonanBelian_EditPesananBelian(string CurrUser, string ProcessId, string Revision)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SP_PermohonanBelian_EditPesananBelian";
        //        sqlCmd.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.Connection = sqlConn;

        //        SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
        //        parm1.Value = @CurrUser;
        //        parm1.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm1);

        //        SqlParameter parm2 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
        //        parm2.Value = @ProcessId;
        //        parm2.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm2);

        //        SqlParameter parm3 = new SqlParameter("@Revision", SqlDbType.Int);
        //        parm3.Value = Revision;
        //        parm3.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm3);

        //        SqlParameter parm4 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
        //        parm4.Size = 1024;
        //        parm4.Direction = ParameterDirection.Output;
        //        sqlCmd.Parameters.Add(parm4);

        //        sqlCmd.ExecuteNonQuery();

        //        return sqlCmd.Parameters["@Return_Message"].Value.ToString();
        //    }
        //    catch (Exception err)
        //    {
        //        return err.Message;
        //    }
        //    finally
        //    { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        //}
        #endregion

        public static string GetPrNumber(ref string PrNumber, string ProcessId, string Revision)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [PRH_PRnumber] FROM [AMS_Transaction].[dbo].[PermohonanBelian_Header] H where H.PRH_ProcessId = '" + ProcessId + "' AND H.PRH_Revision = " + Revision;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                PrNumber = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }
        public static string GetStatusDescription(ref string StatusDescription, string StatusId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [StatusName] FROM [AMS_Master].[dbo].[MasterStatus] WHERE [StatusId] = " + StatusId;
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;

                StatusDescription = sqlCmd.ExecuteScalar().ToString();

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_PermohonanBelian_CreateNewEntry(string CurrUser, string ProcessId)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanBelian_CreateNewEntry";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm2.Value = ProcessId;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm3.Size = 1024;
                parm3.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm3);

                sqlCmd.ExecuteNonQuery();
                return sqlCmd.Parameters["@Return_Message"].Value.ToString();

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string SP_PermohonanBelian_EditPesananBelian(string CurrUser, string ProcessId, string Revision)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanBelian_EditPesananBelian";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = @CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm2.Value = @ProcessId;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Revision", SqlDbType.Int);
                parm3.Value = Revision;
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
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string SP_PermohonanBelian_GetChecklist(string ProcessId, ref DataSet Ds)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanBelian_GetChecklist";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Ds);
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string SP_PermohonanBelian_LoadItem(ref DataSet Ds, string ProcessId, string ItemNumber, string Revision)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PermohonanBelian_LoadItem";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@ItemNumber", SqlDbType.Int);
                parm2.Value = ItemNumber;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@Revision", SqlDbType.Int);
                parm3.Value = Revision;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Ds);

                return string.Empty;

            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); sqlAdap.Dispose(); }
        }

        //  public static string SP_PermohonanBelian_LoadItem(ref DataSet Ds, string ProcessId, string ItemNumber, string Revision)
        //{
        //    SqlConnection sqlConn = new SqlConnection();  //defines database connection
        //    SqlCommand sqlCmd = new SqlCommand();  //defines what to do
        //    SqlDataAdapter sqlAdap = new SqlDataAdapter();

        //    try
        //    {
        //        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
        //        sqlConn.Open();

        //        sqlCmd.CommandText = "SP_PermohonanBelian_LoadItem";
        //        sqlCmd.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.Connection = sqlConn;

        //        SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
        //        parm1.Value = ProcessId;
        //        parm1.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm1);

        //        SqlParameter parm2 = new SqlParameter("@ItemNumber", SqlDbType.Int);
        //        parm2.Value = ItemNumber;
        //        parm2.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm2);

        //        SqlParameter parm3 = new SqlParameter("@Revision", SqlDbType.Int);
        //        parm3.Value = Revision;
        //        parm3.Direction = ParameterDirection.Input;
        //        sqlCmd.Parameters.Add(parm3);

        //        sqlAdap.SelectCommand = sqlCmd;
        //        sqlAdap.Fill(Ds);

        //        return string.Empty;

        //    }
        //    catch (Exception err)
        //    {
        //        return err.Message;
        //    }
        //    finally
        //    { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); sqlAdap.Dispose(); }
        //}

          public static string SP_PermohonanBelian_LoadHeader_GetRef(ref DataTable Dt, string ProcessId, string Revision)
          {
              SqlConnection sqlConn = new SqlConnection();  //defines database connection
              SqlCommand sqlCmd = new SqlCommand();  //defines what to do
              SqlDataAdapter sqlAdap = new SqlDataAdapter();

              try
              {
                  sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                  sqlConn.Open();

                  sqlCmd.CommandText = "SP_PermohonanBelian_LoadHeader_GetRef";
                  sqlCmd.CommandType = CommandType.StoredProcedure;
                  sqlCmd.Connection = sqlConn;

                  SqlParameter parm2 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                  parm2.Value = ProcessId;
                  parm2.Direction = ParameterDirection.Input;
                  sqlCmd.Parameters.Add(parm2);

                  SqlParameter parm1 = new SqlParameter("@Revision", SqlDbType.Int);
                  parm1.Value = Revision;
                  parm1.Direction = ParameterDirection.Input;
                  sqlCmd.Parameters.Add(parm1);

                  sqlAdap.SelectCommand = sqlCmd;
                  sqlAdap.Fill(Dt);
                  return string.Empty;
              }
              catch (Exception err)
              {
                  return err.Message;
              }
              finally
              { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
          }

          public static string SP_PermohonanBelian_RemoveItem(string ProcessId, string ItemNumber)
          {
              SqlConnection sqlConn = new SqlConnection();  //defines database connection
              SqlCommand sqlCmd = new SqlCommand();  //defines what to do

              try
              {
                  sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                  sqlConn.Open();

                  sqlCmd.CommandText = "SP_PermohonanBelian_RemoveItem";
                  sqlCmd.CommandType = CommandType.StoredProcedure;
                  sqlCmd.Connection = sqlConn;

                  SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                  parm1.Value = ProcessId;
                  parm1.Direction = ParameterDirection.Input;
                  sqlCmd.Parameters.Add(parm1);

                  SqlParameter parm2 = new SqlParameter("@ItemNumber", SqlDbType.Int);
                  parm2.Value = ItemNumber;
                  parm2.Direction = ParameterDirection.Input;
                  sqlCmd.Parameters.Add(parm2);

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
              { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
          }

          public static string SP_PermohonanBelian_SaveChecklist(string ProcessId, string CheckedBy, ref DataTable TVP)
          {
              SqlConnection sqlConn = new SqlConnection();  //defines database connection
              SqlCommand sqlCmd = new SqlCommand();  //defines what to do

              try
              {
                  sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                  sqlConn.Open();

                  sqlCmd.CommandText = "SP_PermohonanBelian_SaveChecklist";
                  sqlCmd.CommandType = CommandType.StoredProcedure;
                  sqlCmd.Connection = sqlConn;

                  SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                  parm1.Value = ProcessId;
                  parm1.Direction = ParameterDirection.Input;
                  sqlCmd.Parameters.Add(parm1);

                  SqlParameter parm2 = new SqlParameter("@CheckedBy", SqlDbType.VarChar);
                  parm2.Value = CheckedBy;
                  parm2.Direction = ParameterDirection.Input;
                  sqlCmd.Parameters.Add(parm2);

                  SqlParameter parm3 = new SqlParameter("@TVP", SqlDbType.Structured);
                  parm3.Value = TVP;
                  parm3.Direction = ParameterDirection.Input;
                  sqlCmd.Parameters.Add(parm3);

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
              { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
          }

          public static string SP_PermohonanBelian_SaveItem(ref DataTable ItemTVP, ref DataTable Components_TVP, string ProcessId, string Revision)
          {
              SqlConnection sqlConn = new SqlConnection();  //defines database connection
              SqlCommand sqlCmd = new SqlCommand();  //defines what to do

              try
              {
                  sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                  sqlConn.Open();

                  sqlCmd.CommandText = "SP_PermohonanBelian_SaveItem";
                  sqlCmd.CommandType = CommandType.StoredProcedure;
                  sqlCmd.Connection = sqlConn;

                  SqlParameter parm1 = new SqlParameter("@ItemTVP", SqlDbType.Structured);
                  parm1.Value = ItemTVP;
                  parm1.Direction = ParameterDirection.Input;
                  sqlCmd.Parameters.Add(parm1);

                  SqlParameter parm2 = new SqlParameter("@Components_TVP", SqlDbType.Structured);
                  parm2.Value = Components_TVP;
                  parm2.Direction = ParameterDirection.Input;
                  sqlCmd.Parameters.Add(parm2);

                  SqlParameter parm3 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                  parm3.Value = ProcessId;
                  parm3.Direction = ParameterDirection.Input;
                  sqlCmd.Parameters.Add(parm3);

                  SqlParameter parm5 = new SqlParameter("@Revision", SqlDbType.Int);
                  parm5.Value = Revision;
                  parm5.Direction = ParameterDirection.Input;
                  sqlCmd.Parameters.Add(parm5);

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
              { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
          }

        public static string SP_PermohonanBelian_CheckWorkflowAvailability(string ProcessId, string Revision, string CurrUser, string CheckType, ref string WfCount)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_CheckWorkflowAvailability";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Revision", SqlDbType.Int);
                parm2.Value = Revision;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm3.Value = CurrUser;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@CheckType", SqlDbType.Int);
                parm4.Value = CheckType;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                WfCount = sqlCmd.ExecuteScalar().ToString();
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string SP_PR_Header_SaveSubmitCancel(string CurrUser, int Mode, ref DataTable TVP, ref string ReturnProcessId, ref int ReturnRevNumber)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PR_Header_SaveSubmitCancel";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm1.Value = @CurrUser;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Mode", SqlDbType.Int);
                parm2.Value = Mode;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("TVP", SqlDbType.Structured);
                parm3.Value = TVP;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm4.Size = 1024;
                parm4.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@ReturnProcessId", SqlDbType.VarChar);
                parm5.Size = 20;
                parm5.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm5);

                SqlParameter parm6 = new SqlParameter("@ReturnRevNumber", SqlDbType.Int);
                parm6.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm6);

                sqlCmd.ExecuteNonQuery();

                ReturnProcessId = sqlCmd.Parameters["@ReturnProcessId"].Value.ToString();
                ReturnRevNumber = Convert.ToInt32(sqlCmd.Parameters["@ReturnRevNumber"].Value);

                return sqlCmd.Parameters["@Return_Message"].Value.ToString();
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlCmd.Dispose(); sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string LoadPrUtamaRecord(string ProcessId, string RevNumber, ref DataTable Dt) 
        {
            SqlConnection sqlConn = new SqlConnection();  
            SqlCommand sqlCmd = new SqlCommand();
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "  SELECT * FROM [AMS_Transaction].[dbo].[PR_Header] H WHERE H.PRH_ProcessId = '" + ProcessId + "' AND H.PRH_Revision = " + RevNumber;
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

        public static string SP_PR_GLDistribution(ref DataTable Dt, int Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PR_GLDistribution";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm1.Value = Dt;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Mode", SqlDbType.Int);
                parm2.Value = Mode;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                sqlCmd.ExecuteNonQuery();
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlCmd.Dispose(); sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_PR_ProjDistribution(ref DataTable Dt, int Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PR_ProjDistribution";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm1.Value = Dt;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@Mode", SqlDbType.Int);
                parm2.Value = Mode;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                sqlCmd.ExecuteNonQuery();
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlCmd.Dispose(); sqlConn.Close(); sqlConn.Dispose(); }
        }

        public static string SP_PR_Items_NewAsset_SaveDelete(string PRI_ProcessId, string PRI_ItemNumber, string PRI_Revision, ref DataTable TVP, ref DataTable TVPC)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PR_Items_NewAsset_SaveDelete";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@PRI_ProcessId", SqlDbType.VarChar);
                parm1.Value = PRI_ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@PRI_ItemNumber", SqlDbType.Int);
                parm2.Value = PRI_ItemNumber;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@PRI_Revision", SqlDbType.Int);
                parm3.Value = PRI_Revision;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm4.Value = TVP;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@TVPC", SqlDbType.Structured);
                parm5.Value = TVPC;
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
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }


        public static string SP_PR_GetChecklist(string ProcessId, ref DataSet Ds)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();
            
            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PR_GetChecklist";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlAdap.SelectCommand = sqlCmd;
                sqlAdap.Fill(Ds);
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }

        public static string SP_PR_SaveChecklist(string ProcessId, string CheckedBy, ref DataTable TVP)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_TransactionConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_PR_SaveChecklist";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@ProcessId", SqlDbType.VarChar);
                parm1.Value = ProcessId;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@CheckedBy", SqlDbType.VarChar);
                parm2.Value = CheckedBy;
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm3.Value = TVP;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

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
            { sqlConn.Close(); sqlConn.Dispose(); sqlCmd.Dispose(); }
        }
    }
}
