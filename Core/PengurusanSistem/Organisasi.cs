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
    public class OrganisasiMethods
    {
        public static string SP_LoadUpdate_Organisation(ref DataTable TVP, string CurrUser, string Mode)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do
            SqlDataAdapter sqlAdap = new SqlDataAdapter();  //to fill required data

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SP_LoadUpdate_Organisation";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm1.Value = TVP;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                SqlParameter parm2 = new SqlParameter("@OrgId", SqlDbType.Int);
                parm2.Value = ConfigurationManager.AppSettings["OrgId"].ToString();
                parm2.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm2);

                SqlParameter parm3 = new SqlParameter("@CurrUser", SqlDbType.Int);
                parm3.Value = CurrUser;
                parm3.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm3);

                SqlParameter parm4 = new SqlParameter("@Mode", SqlDbType.VarChar);
                parm4.Value = Mode;
                parm4.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm4);

                SqlParameter parm5 = new SqlParameter("@Return_Message", SqlDbType.VarChar);
                parm5.Size = 1024;
                parm5.Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add(parm5);


                if (Mode == "LOAD")
                {
                    sqlAdap.SelectCommand = sqlCmd;
                    sqlAdap.Fill(TVP);
                    return string.Empty;
                }
                else
                {
                    sqlCmd.ExecuteNonQuery();
                    return sqlCmd.Parameters["@Return_Message"].Value.ToString();
                }
            }
            catch (Exception err)
            {
                return err.Message;
            }
            finally
            { sqlConn.Dispose(); }
        }

        public static string UpdateOrganizationLogo(string LogoFileName)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "UPDATE [dbo].[Organization] SET [Org_Logo] = '" + LogoFileName + "' WHERE [Org_ID] = " + ConfigurationManager.AppSettings["OrgId"].ToString();
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;
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

        public static string GetOrganizationLogo(ref string LogoFileName)
        {
            SqlConnection sqlConn = new SqlConnection();  //defines database connection
            SqlCommand sqlCmd = new SqlCommand();  //defines what to do

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_MasterConnectionString"].ToString();
                sqlConn.Open();

                sqlCmd.CommandText = "SELECT [Org_Logo] FROM [dbo].[Organization] WHERE [Org_ID] = " + ConfigurationManager.AppSettings["OrgId"].ToString();
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = sqlConn;
                LogoFileName = sqlCmd.ExecuteScalar().ToString();
                return string.Empty;
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
