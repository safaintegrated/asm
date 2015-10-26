using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Core.Informix;
using System.IO;

namespace SAGApumper
{
    class Program
    {
        static void Main(string[] args)
        {
            string ImportErr = string.Empty;
            //1. copy all delivery locations
            ImportErr = GetAllDeliveryPersons();

        }

        static string GetAllDeliveryPersons()
        {
            string FuncImportError = string.Empty;

            DataTable ReturnDt = new DataTable();
            string InformixXmlPhysicalPath = ConfigurationManager.AppSettings["SagaXmlFilePath"].ToString();
            string SagaCommandText = string.Empty;

            SagaCommandText = "SELECT puda_purchaserid,puda_delivaddress1,puda_delivaddress2,puda_delivaddress3 FROM pu_deliveryadd,pu_purchaser group by puda_purchaserid,puda_delivaddress1,puda_delivaddress2,puda_delivaddress3";

            FuncImportError =  InformixMethods.FetchTable(SagaCommandText, InformixXmlPhysicalPath, ref ReturnDt);

            if (FuncImportError == string.Empty)
                SaveToMsSql(1, ref ReturnDt); 

            return FuncImportError;
        }

        static string SaveToMsSql(int ProcessId, ref DataTable TableToInsert)
        {
            SqlConnection sqlConn = new SqlConnection(); 
            SqlCommand sqlCmd = new SqlCommand(); 
            SqlDataAdapter sqlAdap = new SqlDataAdapter();

            try
            {
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["AMS_SAGAConnectionString"].ToString();
                sqlConn.Open();


                switch (ProcessId)
                {
                    case 1: sqlCmd.CommandText = "SP_PU_Deliveryadd_Backend"; break;
                }
                
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                SqlParameter parm1 = new SqlParameter("@TVP", SqlDbType.Structured);
                parm1.Value = TableToInsert;
                parm1.Direction = ParameterDirection.Input;
                sqlCmd.Parameters.Add(parm1);

                sqlCmd.ExecuteNonQuery();
                return string.Empty;
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
