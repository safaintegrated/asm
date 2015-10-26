using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.IO;
using Core.Components;

namespace AssetAndStoreManagementSystem.DocumentViewer
{
    /// <summary>
    /// Summary description for Index
    /// </summary>
    public class Index : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            System.Web.HttpRequest request = System.Web.HttpContext.Current.Request;
            string RowId = request.QueryString["RowId"].ToString();
            string FileName = string.Empty;
            string FileFullPath = string.Empty;

            DocumentUploaderMethods.GetSystemFileNameFromRowId(RowId, ref FileName);
            FileFullPath = Path.Combine(ConfigurationManager.AppSettings["DocumentUploadPath"].ToString(), FileName);

            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            response.ClearContent();
            response.Clear();
            response.ContentType = "text/plain";
            response.AddHeader("Content-Disposition", "attachment; filename=" + FileName + ";");
            response.TransmitFile(FileFullPath);
            response.Flush();
            response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}