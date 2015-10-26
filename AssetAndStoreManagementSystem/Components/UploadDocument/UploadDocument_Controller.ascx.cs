using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using System.IO;
using System.Data;
using Core.Components;
using Core.PengurusanSistem;

namespace AssetAndStoreManagementSystem.Components.UploadDocument
{
    public partial class UploadDocument_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DocumentUploader_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                if (e.IsValid)
                {
                    try
                    {
                        string UploadLocation = ConfigurationManager.AppSettings["DocumentUploadPath"].ToString();
                        string NewFileName = DateTime.Now.ToString("ddMMyyHHmmss") + e.UploadedFile.FileName;
                        e.UploadedFile.SaveAs(Path.Combine(UploadLocation,NewFileName));

                        DocumentUploader.JSProperties["cppopupAttachDocument_SystemFileName"] = NewFileName;
                        DocumentUploader.JSProperties["cppopupAttachDocument_UserFileName"] = e.UploadedFile.FileName;
                        DocumentUploader.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    catch (Exception err)
                    {
                        DocumentUploader.JSProperties["cpErrMsg"] = err.Message;
                    }
                }
                else
                { DocumentUploader.JSProperties["cpErrMsg"] = e.ErrorText; }
            }
            else
            { DocumentUploader.JSProperties["cpErrMsg"] = "Session Expired."; }
        }

        void FormDocumentTvp(ref DataTable Dt)
        {
            DataColumn ProcessId = Dt.Columns.Add("ProcessId", typeof(String));
            DataColumn RowId = Dt.Columns.Add("RowId", typeof(Int32));
            DataColumn DocumentFileSystemName = Dt.Columns.Add("DocumentFileSystemName", typeof(String));
            DataColumn DocumentFileUserName = Dt.Columns.Add("DocumentFileUserName", typeof(String));
            DataColumn UploadedBy = Dt.Columns.Add("UploadedBy", typeof(String));
            DataColumn UploadedDate = Dt.Columns.Add("UploadedDate", typeof(DateTime));
            DataColumn Notes = Dt.Columns.Add("Notes", typeof(String));
            Dt.AcceptChanges();
        }

        protected void GridDocumentListing_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridDocumentListing.DataBind();
            GridDocumentListing.JSProperties["cpTotalRows"] = GridDocumentListing.VisibleRowCount.ToString();
        }

        protected void GridDocumentListing_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

        }

        protected void DocumentList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@ProcessId"].Value = popupAttachDocument_ProcessId.Text;
        }

        protected void cbp_popupAttachDocument_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string[] param = e.Parameter.Split('*');

            switch (param[0])
            {
                case "1": SaveDocument(); break;
                case "2": UpdateDocumentInfo(); break;
                case "3": DeleteDocument(param[1].ToString()); break;
            }
        }

        void SaveDocument()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {

                DataTable Dt = new DataTable();

                string UploaderName = string.Empty;
                PenggunaSistemMethods.GetSystemUserName(ref UploaderName, ticket.Name);

                try
                {
                    FormDocumentTvp(ref Dt);

                    DataRow Dr = Dt.NewRow();
                    Dr["ProcessId"] = popupAttachDocument_ProcessId.Text;
                    Dr["RowId"] = DBNull.Value;
                    Dr["DocumentFileSystemName"] = popupAttachDocument_SystemFileName.Text;
                    Dr["DocumentFileUserName"] = popupAttachDocument_UserFileName.Text;
                    Dr["UploadedBy"] = UploaderName;
                    Dr["UploadedDate"] = DateTime.Now;
                    Dr["Notes"] = DBNull.Value;
                    Dt.Rows.Add(Dr);
                    Dt.AcceptChanges();

                    cbp_popupAttachDocument.JSProperties["cpErrMsg"] = DocumentUploaderMethods.SP_DocumentAttachments_SaveUpdateDelete(1, ref Dt);
                }
                catch (Exception err)
                { cbp_popupAttachDocument.JSProperties["cpErrMsg"] = "Sistem menghadapi masalah untuk menyimpan rekod gambar yang dimuatnaik.<br>Masalah: " + err.Message; }
            }
            else
                cbp_popupAttachDocument.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void UpdateDocumentInfo()
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {

                DataTable Dt = new DataTable();

                string UploaderName = string.Empty;
                PenggunaSistemMethods.GetSystemUserName(ref UploaderName, ticket.Name);

                try
                {
                    FormDocumentTvp(ref Dt);

                    DataRow Dr = Dt.NewRow();
                    Dr["ProcessId"] = popupAttachDocument_ProcessId.Text;
                    Dr["RowId"] = Convert.ToInt32(RowId.Text);
                    Dr["DocumentFileSystemName"] = DBNull.Value;
                    Dr["DocumentFileUserName"] = DocumentFileUserName.Text.Trim();
                    Dr["UploadedBy"] = UploaderName;
                    Dr["UploadedDate"] = DateTime.Now;
                    Dr["Notes"] = Notes.Text.Trim();
                    Dt.Rows.Add(Dr);
                    Dt.AcceptChanges();

                    cbp_popupAttachDocument.JSProperties["cpErrMsg"] = DocumentUploaderMethods.SP_DocumentAttachments_SaveUpdateDelete(2, ref Dt);
                }
                catch (Exception err)
                { cbp_popupAttachDocument.JSProperties["cpErrMsg"] = "Sistem menghadapi masalah untuk mengemaskini maklumat dokumen yang dimuatnaik.<br>Masalah: " + err.Message; }
            }
            else
                cbp_popupAttachDocument.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void DeleteDocument(string Listing)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();
                DataTable DtDocumentNames = new DataTable();

                string UploadLocation = ConfigurationManager.AppSettings["DocumentUploadPath"].ToString();

                try
                {
                    FormDocumentTvp(ref Dt);
                    string[] List = Listing.Split('-');

                    for (int i = 0; i < List.Length; i++)
                    {
                        DataRow Dr = Dt.NewRow();
                        Dr["RowId"] = Convert.ToInt32(List[i].ToString());
                        Dt.Rows.Add(Dr);
                    }

                    Dt.AcceptChanges();

                    DocumentUploaderMethods.SP_DocumentAttachments_GetDocumentNames(ref Dt, ref DtDocumentNames);

                    if (DtDocumentNames.Rows.Count > 0)
                    {
                        for (int z = 0; z < DtDocumentNames.Rows.Count; z++)
                        {
                            string FileFullPath = Path.Combine(Server.MapPath(UploadLocation), DtDocumentNames.Rows[z]["DocumentFileSystemName"].ToString());

                            if (File.Exists(FileFullPath))
                            {
                                File.Delete(FileFullPath);
                            }
                        }
                    }

                    cbp_popupAttachDocument.JSProperties["cpErrMsg"] = DocumentUploaderMethods.SP_DocumentAttachments_SaveUpdateDelete(3, ref Dt);
                }
                catch (Exception err)
                { cbp_popupAttachDocument.JSProperties["cpErrMsg"] = "Sistem menghadapi masalah untuk mengemaskini maklumat dokumen yang dimuatnaik.<br>Masalah: " + err.Message; }
            }
            else
                cbp_popupAttachDocument.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        protected void cbp_UploadDocument_Loader_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = DocumentUploaderMethods.DocumentInfo(RowId.Text, ref Dt);

                if (err == string.Empty)
                {
                    if (Dt.Rows.Count == 1)
                    {
                        DocumentFileUserName.Text = Dt.Rows[0]["DocumentFileUserName"].ToString();
                        UploadedBy.Text = Dt.Rows[0]["UploadedBy"].ToString();
                        Notes.Text = Dt.Rows[0]["Notes"].ToString();
                        UploadedDate.Text = Convert.ToDateTime(Dt.Rows[0]["UploadedDate"]).ToString("dd/MM/yyyy HH:mm");
                        cbp_UploadDocument_Loader.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    { cbp_UploadDocument_Loader.JSProperties["cpErrMsg"] = "Sistem tidak dapat membuka info gambar yang telah dipilih."; }
                }
                else
                { cbp_UploadDocument_Loader.JSProperties["cpErrMsg"] = err; }
            }
            catch (Exception err)
            {
                cbp_UploadDocument_Loader.JSProperties["cpErrMsg"] = err.Message;
            }
            finally
            { Dt.Dispose(); }
        }
    }
}