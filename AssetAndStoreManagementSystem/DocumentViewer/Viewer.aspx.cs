using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Configuration;
using Core.Components;
using System.IO;

namespace AssetAndStoreManagementSystem.DocumentViewer
{
    public partial class Viewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                System.Web.HttpRequest request = System.Web.HttpContext.Current.Request;
                string RowId = request.QueryString["RowId"].ToString();
                string FileName = string.Empty;
                string FileFullPath = string.Empty;

                DocumentUploaderMethods.GetSystemFileNameFromRowId(RowId, ref FileName);
                FileFullPath = Path.Combine(ConfigurationManager.AppSettings["DocumentUploadPath"].ToString(), FileName);

                WebClient client = new WebClient();
                Byte[] buffer = client.DownloadData(FileFullPath);

                string[] FileType = FileName.Split('.');

                if (FileType[FileType.Length - 1].ToString().ToUpper() == "PDF")
                    Response.ContentType = "application/pdf";
                else if (FileType[FileType.Length - 1].ToString().ToUpper() == "DOC")
                    Response.ContentType = "application/msword";
                else if (FileType[FileType.Length - 1].ToString().ToUpper() == "DOCX")
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
                else if (FileType[FileType.Length - 1].ToString().ToUpper() == "XLS")
                    Response.ContentType = "application/vnd.ms-excel";
                else if (FileType[FileType.Length - 1].ToString().ToUpper() == "XLSX")
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                else if (FileType[FileType.Length - 1].ToString().ToUpper() == "ZIP")
                    Response.ContentType = "application/zip";
                else if (FileType[FileType.Length - 1].ToString().ToUpper() == "7Z")
                    Response.ContentType = "application/x-7z-compressed";
                else if (FileType[FileType.Length - 1].ToString().ToUpper() == "RAR")
                    Response.ContentType = "application/x-rar-compressed";

                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }
        }
    }
}