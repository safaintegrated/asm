using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Xml;

namespace Core.Utility
{
    public class UtilityMethods
    {
        public static string ReadXMLFile(ref DataSet _XMLDs, string XMLpath)
        {
            try
            {
                _XMLDs.ReadXml(XMLpath);
                return "";
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string UpdateSagaXMLFile(ref DataTable _XMLDt, string XMLpath)
        {
            try
            {
                XmlDocument xmldoc = new XmlDocument();
                xmldoc.Load(XMLpath);

                XmlNode xmlnode = xmldoc.DocumentElement.ChildNodes[0];
                xmlnode["ODBCDriverName"].InnerText = _XMLDt.Rows[0]["ODBCDriverName"].ToString();
                xmlnode["HostName"].InnerText = _XMLDt.Rows[0]["HostName"].ToString();
                xmlnode["ServerName"].InnerText = _XMLDt.Rows[0]["ServerName"].ToString();
                xmlnode["ServiceName"].InnerText = _XMLDt.Rows[0]["ServiceName"].ToString();
                xmlnode["Protocol"].InnerText = _XMLDt.Rows[0]["Protocol"].ToString();
                xmlnode["DatabaseName"].InnerText = _XMLDt.Rows[0]["DatabaseName"].ToString();
                xmlnode["UserId"].InnerText = _XMLDt.Rows[0]["UserId"].ToString();
                xmlnode["Password"].InnerText = _XMLDt.Rows[0]["Password"].ToString();
                xmlnode["ClientLocale"].InnerText = _XMLDt.Rows[0]["ClientLocale"].ToString();
                xmlnode["DatabaseLocale"].InnerText = _XMLDt.Rows[0]["DatabaseLocale"].ToString();

                xmldoc.Save(XMLpath);

                return "";
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static Int32 FormNextSortingId(ref DataTable Dt, string ColumnIdName)
        {
            int maxSortId = int.MinValue;

            if (Dt.Rows.Count > 0)
            {

                foreach (DataRow dr in Dt.Rows)
                {
                    int M_EmpDependent_SortId = dr.Field<int>(ColumnIdName);
                    maxSortId = Math.Max(maxSortId, M_EmpDependent_SortId);
                }

                return maxSortId + 1;
            }
            else
                return 1;
        }
    }
}
