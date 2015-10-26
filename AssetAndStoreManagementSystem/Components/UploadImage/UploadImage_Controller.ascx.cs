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

namespace AssetAndStoreManagementSystem.Components.UploadImage
{
    public partial class UploadImage_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageUploader_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                if (e.IsValid)
                {
                    try
                    {
                        string UploadLocation = ConfigurationManager.AppSettings["ImageUploadFolder"].ToString();
                        string NewFileName = DateTime.Now.ToString("ddMMyyHHmmss") + e.UploadedFile.FileName;
                        e.UploadedFile.SaveAs(MapPath(UploadLocation) + NewFileName);

                        ImageUploader.JSProperties["cppopupAttachImage_SystemFileName"] = NewFileName;
                        ImageUploader.JSProperties["cppopupAttachImage_UserFileName"] = e.UploadedFile.FileName;
                        ImageUploader.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    catch (Exception err)
                    {
                        ImageUploader.JSProperties["cpErrMsg"] = err.Message;
                    }
                }
                else
                { ImageUploader.JSProperties["cpErrMsg"] = e.ErrorText; }
            }
            else
            { ImageUploader.JSProperties["cpErrMsg"] = "Session Expired."; }            
        }

        void FormImageTvp(ref DataTable Dt)
        {
            DataColumn ProcessId = Dt.Columns.Add("ProcessId", typeof(String));
            DataColumn RowId = Dt.Columns.Add("RowId", typeof(Int32));
            DataColumn ImageFileSystemName = Dt.Columns.Add("ImageFileSystemName", typeof(String));
            DataColumn ImageFileUserName = Dt.Columns.Add("ImageFileUserName", typeof(String));
            DataColumn UploadedBy = Dt.Columns.Add("UploadedBy", typeof(String));
            DataColumn UploadedDate = Dt.Columns.Add("UploadedDate", typeof(DateTime));
            DataColumn Notes = Dt.Columns.Add("Notes", typeof(String));
            Dt.AcceptChanges();
        }

        protected void GridImageListing_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridImageListing.DataBind();
            GridImageListing.JSProperties["cpTotalRows"] = GridImageListing.VisibleRowCount.ToString();

        }

        protected void GridImageListing_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

        }

        protected void ImageList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@ProcessId"].Value = popupAttachImage_ProcessId.Text;
        }

        protected void cbp_popupAttachImage_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string[] param = e.Parameter.Split('*');

            switch (param[0])
            {
                case "1": SaveImage(); break;
                case "2": UpdateImageInfo(); break;
                case "3": DeleteImage(param[1].ToString()); break;
            }
        }

        void SaveImage()
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
                    FormImageTvp(ref Dt);

                    DataRow Dr = Dt.NewRow();
                    Dr["ProcessId"] = popupAttachImage_ProcessId.Text;
                    Dr["RowId"] = DBNull.Value;
                    Dr["ImageFileSystemName"] = popupAttachImage_SystemFileName.Text;
                    Dr["ImageFileUserName"] = popupAttachImage_UserFileName.Text;
                    Dr["UploadedBy"] = UploaderName;
                    Dr["UploadedDate"] = DateTime.Now;
                    Dr["Notes"] = DBNull.Value;
                    Dt.Rows.Add(Dr);
                    Dt.AcceptChanges();

                    cbp_popupAttachImage.JSProperties["cpErrMsg"] = ImageUploaderMethods.SP_ImageAttachments_SaveUpdateDelete(1, ref Dt);
                }
                catch (Exception err)
                { cbp_popupAttachImage.JSProperties["cpErrMsg"] = "Sistem menghadapi masalah untuk menyimpan rekod gambar yang dimuatnaik.<br>Masalah: "+err.Message; }
            }
            else
                cbp_popupAttachImage.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void UpdateImageInfo()
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
                    FormImageTvp(ref Dt);

                    DataRow Dr = Dt.NewRow();
                    Dr["ProcessId"] = popupAttachImage_ProcessId.Text;
                    Dr["RowId"] = Convert.ToInt32(RowId.Text);
                    Dr["ImageFileSystemName"] = DBNull.Value;
                    Dr["ImageFileUserName"] = ImageFileUserName.Text.Trim();
                    Dr["UploadedBy"] = UploaderName;
                    Dr["UploadedDate"] = DateTime.Now;
                    Dr["Notes"] = Notes.Text.Trim();
                    Dt.Rows.Add(Dr);
                    Dt.AcceptChanges();

                    cbp_popupAttachImage.JSProperties["cpErrMsg"] = ImageUploaderMethods.SP_ImageAttachments_SaveUpdateDelete(2, ref Dt);
                }
                catch (Exception err)
                { cbp_popupAttachImage.JSProperties["cpErrMsg"] = "Sistem menghadapi masalah untuk mengemaskini maklumat gambar yang dimuatnaik.<br>Masalah: " + err.Message; }
            }
            else
                cbp_popupAttachImage.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        void DeleteImage(string Listing)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                DataTable Dt = new DataTable();
                DataTable DtImageNames = new DataTable();

                string UploadLocation = ConfigurationManager.AppSettings["ImageUploadFolder"].ToString();

                try
                {
                    FormImageTvp(ref Dt);
                    string[] List = Listing.Split('-');

                    for (int i = 0; i < List.Length; i++)
                    {
                        DataRow Dr = Dt.NewRow();
                        Dr["RowId"] = Convert.ToInt32(List[i].ToString());
                        Dt.Rows.Add(Dr);
                    }                      

                    Dt.AcceptChanges();

                    ImageUploaderMethods.SP_ImageAttachments_GetImageNames(ref Dt, ref DtImageNames);

                    if (DtImageNames.Rows.Count > 0)
                    {
                        for (int z = 0; z < DtImageNames.Rows.Count; z++)
                        {
                            string FileFullPath = Path.Combine(Server.MapPath(UploadLocation), DtImageNames.Rows[z]["ImageFileSystemName"].ToString());

                            if (File.Exists(FileFullPath))
                            {
                                File.Delete(FileFullPath);
                            }
                        }
                    }

                    cbp_popupAttachImage.JSProperties["cpErrMsg"] = ImageUploaderMethods.SP_ImageAttachments_SaveUpdateDelete(3, ref Dt);
                }
                catch (Exception err)
                { cbp_popupAttachImage.JSProperties["cpErrMsg"] = "Sistem menghadapi masalah untuk mengemaskini maklumat gambar yang dimuatnaik.<br>Masalah: " + err.Message; }
            }
            else
                cbp_popupAttachImage.JSProperties["cpErrMsg"] = "Session Expired.";
        }

        protected void cbp_UploadImage_Loader_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            DataTable Dt = new DataTable();

            try
            {
                string err = ImageUploaderMethods.ImageInfo(RowId.Text, ref Dt);

                if (err == string.Empty)
                {
                    if (Dt.Rows.Count == 1)
                    {
                        ImageFileUserName.Text = Dt.Rows[0]["ImageFileUserName"].ToString();
                        UploadedBy.Text = Dt.Rows[0]["UploadedBy"].ToString();
                        Notes.Text = Dt.Rows[0]["Notes"].ToString();
                        UploadedDate.Text = Convert.ToDateTime(Dt.Rows[0]["UploadedDate"]).ToString("dd/MM/yyyy HH:mm");
                        CurrImage.ImageUrl = Path.Combine(ConfigurationManager.AppSettings["ImageUploadFolder"].ToString(), Dt.Rows[0]["ImageFileSystemName"].ToString());
                        cbp_UploadImage_Loader.JSProperties["cpErrMsg"] = string.Empty;
                    }
                    else
                    { cbp_UploadImage_Loader.JSProperties["cpErrMsg"] = "Sistem tidak dapat membuka info gambar yang telah dipilih."; }
                }
                else
                { cbp_UploadImage_Loader.JSProperties["cpErrMsg"] = err; }
            }
            catch (Exception err)
            {
                cbp_UploadImage_Loader.JSProperties["cpErrMsg"] = err.Message;
            }
            finally
            { Dt.Dispose(); }
        }
    }
}