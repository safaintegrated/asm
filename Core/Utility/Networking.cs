using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Data;
using System.Net.NetworkInformation;
using System.Net;

namespace Core.Utility
{
    public class Networking
    {
        public static string GetClientIpAddress()
        {
            //WebClient client = new WebClient();
            //// Add a user agent header in case the requested URI contains a query.
            //client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR1.0.3705;)");
            //string baseurl = "http://checkip.dyndns.org/";
            //Stream data = client.OpenRead(baseurl);
            //StreamReader reader = new StreamReader(data);
            //string s = reader.ReadToEnd();
            //data.Close();
            //reader.Close();
            //s = s.Replace("<html><head><title>Current IP Check</title></head><body>", "").Replace("</body></html>", "").ToString();
            //s = s.Replace("Current IP Address: ","");
            //s = s.Replace("\r\n", "");
            //return  s.ToString();
            return GetIPAddress();
        }

        private static string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }

            return context.Request.ServerVariables["REMOTE_ADDR"];
        }

        public static string GetServerActiveIpAddress()
        {
            DataTable dt = new DataTable();
            DataColumn OperationalStatus = dt.Columns.Add("OperationalStatus", typeof(String));
            DataColumn Description = dt.Columns.Add("Description", typeof(String));
            DataColumn NetworkInterfaceType = dt.Columns.Add("NetworkInterfaceType", typeof(String));
            DataColumn MAC = dt.Columns.Add("MAC", typeof(String));
            DataColumn Id = dt.Columns.Add("Id", typeof(String));
            DataColumn BytesReceived = dt.Columns.Add("BytesReceived", typeof(String));
            DataColumn IpAddress = dt.Columns.Add("IpAddress", typeof(String));
            DataColumn DnsSuffix = dt.Columns.Add("DnsSuffix", typeof(String));

            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();

            foreach (NetworkInterface nic in nics)
            {
                DataRow Dr = dt.NewRow();
                Dr["OperationalStatus"] = nic.OperationalStatus.ToString();
                Dr["Description"] = nic.Description.ToString();
                Dr["NetworkInterfaceType"] = nic.NetworkInterfaceType.ToString();
                Dr["MAC"] = nic.GetPhysicalAddress().ToString();
                Dr["Id"] = nic.Id.ToString();
                Dr["BytesReceived"] = Convert.ToDecimal(nic.GetIPv4Statistics().BytesReceived);
                Dr["DnsSuffix"] = nic.GetIPProperties().DnsSuffix.ToString();

                foreach (UnicastIPAddressInformation ip in nic.GetIPProperties().UnicastAddresses)
                {
                    if (ip.Address.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                    {
                        Dr["IpAddress"] = ip.Address.ToString();
                    }
                }

                dt.Rows.Add(Dr);


                dt.AcceptChanges();
            }

            DataRow[] drs = dt.Select("OperationalStatus = 'UP' AND BytesReceived > 0 AND Description NOT LIKE '%Virtual%'");

            if (drs.Length > 0)
            {
                return drs[0]["IpAddress"].ToString();
            }
            else
                return "Unknown IP";
        }
    }
}
