using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Xml;

namespace Core.Utility
{
    public class XmlMethods
    {
        public static string ReadXMLFile(ref DataSet _XMLDs, string PhysicalXmlFilePath)
        {
            try
            {
                _XMLDs.ReadXml(PhysicalXmlFilePath);
                return "";
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string UpdateEmailXMLFile(ref DataTable _XMLDt, string PhysicalXmlEmailFilePath)
        {
            try
            {
                XmlDocument xmldoc = new XmlDocument();
                xmldoc.Load(PhysicalXmlEmailFilePath);
                XmlNode xmlnode = xmldoc.DocumentElement.ChildNodes[0];
                xmlnode["HostName"].InnerText = _XMLDt.Rows[0]["HostName"].ToString();
                xmlnode["PortNumber"].InnerText = _XMLDt.Rows[0]["PortNumber"].ToString();
                xmlnode["SenderName"].InnerText = _XMLDt.Rows[0]["SenderName"].ToString();
                xmlnode["NetworkId"].InnerText = _XMLDt.Rows[0]["NetworkId"].ToString();
                xmlnode["NetworkPasword"].InnerText = _XMLDt.Rows[0]["NetworkPasword"].ToString();
                xmlnode["EnableSsl"].InnerText = _XMLDt.Rows[0]["EnableSsl"].ToString();
                xmlnode["BypassSecurityValidation"].InnerText = _XMLDt.Rows[0]["BypassSecurityValidation"].ToString();
                xmlnode["LastModBy"].InnerText = _XMLDt.Rows[0]["LastModBy"].ToString();
                xmlnode["LastModDate"].InnerText = _XMLDt.Rows[0]["LastModDate"].ToString();
                xmldoc.Save(PhysicalXmlEmailFilePath);
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

        public static string UpdateSmpXMLFile(ref DataTable _XMLDt, string PhysicalXmlSmpFilePath)
        {
            try
            {
                XmlDocument xmldoc = new XmlDocument();
                xmldoc.Load(PhysicalXmlSmpFilePath);
                XmlNode xmlnode = xmldoc.DocumentElement.ChildNodes[0];
                xmlnode["ConnString"].InnerText = _XMLDt.Rows[0]["ConnString"].ToString();
                xmlnode["LastModBy"].InnerText = _XMLDt.Rows[0]["LastModBy"].ToString();
                xmlnode["LastModDate"].InnerText = _XMLDt.Rows[0]["LastModDate"].ToString();
                xmldoc.Save(PhysicalXmlSmpFilePath);
                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }
    }
}
