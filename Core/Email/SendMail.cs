using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Data;
using System.Configuration;
using Core.Utility;


namespace Core.Email
{
    public class SendMail
    {
        #region Permohonan Pembelian
        public static string PermohonanPembelian_NotifyVerfier(ref DataTable VerifierDt, string XMLPhysicalPath, string ApplicantName)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);
               

                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < VerifierDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(VerifierDt.Rows[x]["EmployeeEmail"].ToString(), VerifierDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Kelulusan Ketua Pusat Tanggungjawab Untuk Permohonan Pembelian";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApplicantName + "</b> telah menghantar permohonan untuk Permohonan Pembelian pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Permohonan ini memerlukan Tuan/Puan untuk menyemaknya.<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string PermohonanPembelian_KuiriStatus(ref DataTable VerifierDt, string XMLPhysicalPath, string ApproverName, string PRNUmber)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < VerifierDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(VerifierDt.Rows[x]["EmployeeEmail"].ToString(), VerifierDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Status KUIRI Untuk Permohonan Pembelian (" + PRNUmber + ")";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApproverName + "</b> telah memberi status KUIRI untuk Permohonan Pembelian anda (" + PRNUmber + ") pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string PermohonanPembelian_BendahariOneAndTwo(ref DataTable VerifierDt, string XMLPhysicalPath, string ApproverName, string PRNUmber)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < VerifierDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(VerifierDt.Rows[x]["EmployeeEmail"].ToString(), VerifierDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Status KUIRI Untuk Permohonan Pembelian (" + PRNUmber + ")";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApproverName + "</b> telah memberi status LULUS untuk Permohonan Pembelian (" + PRNUmber + ") pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Permohonan Pembelian ini memerlukan Tuan/Puan untuk memeriksanya.<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string PermohonanPembelian_LulusStatus(ref DataTable VerifierDt, string XMLPhysicalPath, string ApproverName, string PRNUmber)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < VerifierDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(VerifierDt.Rows[x]["EmployeeEmail"].ToString(), VerifierDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Status LULUS Untuk Permohonan Pembelian (" + PRNUmber + ")";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApproverName + "</b> telah memberi status LULUS untuk Permohonan Pembelian anda (" + PRNUmber + ") pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }
        #endregion

        #region GRN
        public static string GRN_NotifyVerfier(ref DataTable VerifierDt, string XMLPhysicalPath, string ApplicantName)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < VerifierDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(VerifierDt.Rows[x]["EmployeeEmail"].ToString(), VerifierDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Kelulusan Ketua Pusat Tanggungjawab Untuk Terimaan Barang";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApplicantName + "</b> telah menghantar permohonan untuk Terimaan Barang pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Permohonan ini memerlukan Tuan/Puan untuk menyemaknya.<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string GRN_KuiriStatus(ref DataTable VerifierDt, string XMLPhysicalPath, string ApproverName, string GrnNumber)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < VerifierDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(VerifierDt.Rows[x]["EmployeeEmail"].ToString(), VerifierDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Status KUIRI Untuk Terimaan Barang (" + GrnNumber + ")";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApproverName + "</b> telah memberi status KUIRI untuk Terimaan Barang anda (" + GrnNumber + ") pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string GRN_LulusStatus(ref DataTable VerifierDt, string XMLPhysicalPath, string ApproverName, string GrnNumber)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < VerifierDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(VerifierDt.Rows[x]["EmployeeEmail"].ToString(), VerifierDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Status LULUS Untuk Terimaan Barang (" + GrnNumber + ")";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApproverName + "</b> telah memberi status LULUS untuk Terimaan Barang anda (" + GrnNumber + ") pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        #endregion

        #region Penempatan
        public static string Penempatan_NotifyReceipient(ref DataTable AssetInvListing, string XMLPhysicalPath, string ReceipientName, string ReceipientEmailAddress)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);
                int x = 1;
                bool OddRow = false;


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    mail.To.Add(new MailAddress(ReceipientEmailAddress, ReceipientName)); 

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Penempatan Aset Alih";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa aset-aset alih yang tersenarai di bawah telah ditempatkan kepada anda.<br>";
                    EmailNotification = EmailNotification + "Aset-aset alih yang dimaksudkan adalah seperti berikut;<br><br>";
                    EmailNotification = EmailNotification + "<table style='width:700px; vertical-align:top; text-align:left;'>";
                    EmailNotification = EmailNotification + "<tr>";
                    EmailNotification = EmailNotification + "<td style='width:40px; vertical-align:top; text-align:left;border-width:2px;'><b>No.</b></td>";
                    EmailNotification = EmailNotification + "<td style='width:250px; vertical-align:top; text-align:left;border-width:2px;'><b>No. Siri Pendaftaran</b></td>";
                    EmailNotification = EmailNotification + "<td style='width:410px; vertical-align:top; text-align:left;border-width:2px;'><b>Keterangan</b></td>";
                    EmailNotification = EmailNotification + "</tr>";

                    for (int i = 0; i < AssetInvListing.Rows.Count; i++)
                    {
                        if (OddRow)
                        {
                            EmailNotification = EmailNotification + "<tr>";
                            EmailNotification = EmailNotification + "<td style='width:40px; vertical-align:top; text-align:left;background-color:whitesmoke;border-width:2px;'>" + x.ToString() + "</td>";
                            EmailNotification = EmailNotification + "<td style='width:250px; vertical-align:top; text-align:left;background-color:whitesmoke;border-width:2px;'>" + AssetInvListing.Rows[i]["AssInvRegNum"].ToString() + "</td>";
                            EmailNotification = EmailNotification + "<td style='width:410px; vertical-align:top; text-align:left;background-color:whitesmoke;border-width:2px;'>" + AssetInvListing.Rows[i]["AssInvDesc"].ToString() + "</td>";
                            EmailNotification = EmailNotification + "</tr>";
                            OddRow = false;
                        }
                        else
                        {
                            EmailNotification = EmailNotification + "<tr>";
                            EmailNotification = EmailNotification + "<td style='width:40px; vertical-align:top; text-align:left;background-color:white;border-width:2px;'>" + x.ToString() + "</td>";
                            EmailNotification = EmailNotification + "<td style='width:250px; vertical-align:top; text-align:left;background-color:white;border-width:2px;'>" + AssetInvListing.Rows[i]["AssInvRegNum"].ToString() + "</td>";
                            EmailNotification = EmailNotification + "<td style='width:410px; vertical-align:top; text-align:left;background-color:white;border-width:2px;'>" + AssetInvListing.Rows[i]["AssInvDesc"].ToString() + "</td>";
                            EmailNotification = EmailNotification + "</tr>";
                            OddRow = true;
                        }
                        x = x + 1;
                    }

                    EmailNotification = EmailNotification + "</table><br><br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }
        #endregion

        #region Lembaga Pemeriksa
        public static string LembagaPemeriksa_NotifyMembers(ref DataTable MembersDt, string XMLPhysicalPath, string LembagaName, string PTJName, string Year, string StartDate, string EndDate, string CreatorName)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);
                int q = 1;
                bool OddRow = false;

                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < MembersDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(MembersDt.Rows[x]["Email"].ToString(), MembersDt.Rows[x]["Name"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Lantikan Sebagai Ahli Lembaga Pemeriksa";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + CreatorName + "</b> telah mendaftarkan anda sebagai Ahli Lembaga Pemerika pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Berikut adalah maklumat Lembaga Pemeriksa anda;<br><br>";
                    EmailNotification = EmailNotification + "Nama Lembaga Pemeriksa: <b>" + LembagaName + "</b><br>";
                    EmailNotification = EmailNotification + "PTJ Yang Dipertanggungjawabkan: <b>" + PTJName + "</b><br>";
                    EmailNotification = EmailNotification + "Tahun Pemeriksaan: <b>" + Year + "</b><br>";
                    EmailNotification = EmailNotification + "Tarikh Mula Lantikan: <b>" + StartDate + "</b><br>";
                    EmailNotification = EmailNotification + "Tarikh Tamat Lantikan: <b>" + EndDate + "</b><br><br>";
                    EmailNotification = EmailNotification + "Berikut pula adalah senarai ahli yang terdapat di dalam lembaga anda.<br><br>";
                    EmailNotification = EmailNotification + "<table style='width:700px; vertical-align:top; text-align:left;'>";
                    EmailNotification = EmailNotification + "<tr>";
                    EmailNotification = EmailNotification + "<td style='width:40px; vertical-align:top; text-align:left;border-width:2px;'><b>No.</b></td>";
                    EmailNotification = EmailNotification + "<td style='width:410px; vertical-align:top; text-align:left;border-width:2px;'><b>Nama Kakitangan</b></td>";
                    EmailNotification = EmailNotification + "<td style='width:410px; vertical-align:top; text-align:left;border-width:2px;'><b>Peranan</b></td>";
                    EmailNotification = EmailNotification + "</tr>";

                    for (int i = 0; i < MembersDt.Rows.Count; i++)
                    {
                        if (OddRow)
                        {
                            EmailNotification = EmailNotification + "<tr>";
                            EmailNotification = EmailNotification + "<td style='width:40px; vertical-align:top; text-align:left;background-color:whitesmoke;border-width:2px;'>" + q.ToString() + "</td>";
                            EmailNotification = EmailNotification + "<td style='width:410px; vertical-align:top; text-align:left;background-color:whitesmoke;border-width:2px;'>" + MembersDt.Rows[i]["Name"].ToString() + "</td>";
                            EmailNotification = EmailNotification + "<td style='width:410px; vertical-align:top; text-align:left;background-color:whitesmoke;border-width:2px;'>" + MembersDt.Rows[i]["Peranan"].ToString() + "</td>";
                            EmailNotification = EmailNotification + "</tr>";
                            OddRow = false;
                        }
                        else
                        {
                            EmailNotification = EmailNotification + "<tr>";
                            EmailNotification = EmailNotification + "<td style='width:40px; vertical-align:top; text-align:left;background-color:white;border-width:2px;'>" + q.ToString() + "</td>";
                            EmailNotification = EmailNotification + "<td style='width:410px; vertical-align:top; text-align:left;background-color:white;border-width:2px;'>" + MembersDt.Rows[i]["Name"].ToString() + "</td>";
                            EmailNotification = EmailNotification + "<td style='width:410px; vertical-align:top; text-align:left;background-color:white;border-width:2px;'>" + MembersDt.Rows[i]["Peranan"].ToString() + "</td>";
                            EmailNotification = EmailNotification + "</tr>";
                            OddRow = true;
                        }
                        q = q + 1;
                    }

                    EmailNotification = EmailNotification + "</table><br><br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }
        #endregion

        #region Aduan Kerosakan
        public static string AduanKerosakan_NotifyPegawaiAset(ref DataTable PegawaiAsetDs, string XMLPhysicalPath, string RefNumber, string ApplicantName)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < PegawaiAsetDs.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(PegawaiAsetDs.Rows[x]["EmployeeEmail"].ToString(), PegawaiAsetDs.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Aduan Kerosakan - Pengesahan Pegawai Aset PTJ";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApplicantName + "</b> telah menghantar Aduan Kerosakan (No. rujukan: "+ RefNumber +") pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Permohonan ini memerlukan Tuan/Puan untuk menyemaknya.<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string AduanKerosakan_NotifyKetuaPtj(ref DataTable PegawaiAsetDs, string XMLPhysicalPath, string RefNumber, string ApplicantName)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < PegawaiAsetDs.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(PegawaiAsetDs.Rows[x]["EmployeeEmail"].ToString(), PegawaiAsetDs.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Aduan Kerosakan - Pengesahan Ketua PTJ";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApplicantName + "</b> telah menghantar mengesahkan kerosakan aset alih (No. rujukan: " + RefNumber + ") pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Permohonan ini memerlukan Tuan/Puan untuk memberi kelulusan.<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string AduanKerosakan_NotifySenderNonDamageAssetInventory(ref DataTable ReceipientDt, string XMLPhysicalPath, string RefNumber, string ApplicantName)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < ReceipientDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(ReceipientDt.Rows[x]["EmployeeEmail"].ToString(), ReceipientDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Aduan Kerosakan - Pengesahan Ketua PTJ";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApplicantName + "</b> telah mengesahkan kerosakan aset alih (No. rujukan: " + RefNumber + ") adalah <br>TIDAK ROSAK</b> pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";

                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string AduanKerosakan_KetuaPtjApproveQuiry(ref DataTable ReceipientDt, string XMLPhysicalPath, string RefNumber, string ApplicantName, string Approve)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < ReceipientDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(ReceipientDt.Rows[x]["EmployeeEmail"].ToString(), ReceipientDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Aduan Kerosakan - Pengesahan Ketua PTJ";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";

                    if(Approve == "1")
                        EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApplicantName + "</b> telah memberi status LULUS untuk aduan kerosakan (No. rujukan: " + RefNumber + ") pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    else
                        EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApplicantName + "</b> telah memberi status KUIRI untuk aduan kerosakan (No. rujukan: " + RefNumber + ") pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";

                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }
        #endregion

        #region Laporan Kerosakan
        public static string LaporanKerosakan_KetuaPtjApprovalOne(ref DataTable VerifierDt, string XMLPhysicalPath, string ApplicantName, string RefNumber)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < VerifierDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(VerifierDt.Rows[x]["EmployeeEmail"].ToString(), VerifierDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Kelulusan Ketua Pusat Tanggungjawab Untuk Laporan Kehilangan";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + ApplicantName + "</b> telah menghantar permohonan untuk Laporan Kehilangan (No. Rujukan: <b>" + RefNumber + "</b>) pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Permohonan ini memerlukan Tuan/Puan untuk menyemaknya.<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string LaporanKerosakan_LantikanPegawaiPenyiasat(ref DataTable VerifierDt, string XMLPhysicalPath, string KetuaPtjName, string RefNumber)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < VerifierDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(VerifierDt.Rows[x]["EmployeeEmail"].ToString(), VerifierDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Lantikan Pegawai Penyiasat Untuk Laporan Kehilangan";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + KetuaPtjName + "</b> telah meluluskan Laporan Kehilangan (No. Rujukan: <b>" + RefNumber + "</b>) pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Permohonan ini memerlukan Tuan/Puan untuk melantik Pegawai Penyiasat bagi menyiasat laporan ini.<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string LaporanKerosakan_PegawaiPenyiasatTelahDilantik(ref DataTable VerifierDt, string XMLPhysicalPath, string BendahariName, string RefNumber)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < VerifierDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(VerifierDt.Rows[x]["EmployeeEmail"].ToString(), VerifierDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Lantikan Sebagai Pegawai Penyiasat Untuk Laporan Kehilangan";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + BendahariName + "</b> telah melantik Tuan/Puan sebagai Pegawai Penyiasat untuk Laporan Kehilangan (No. Rujukan: <b>" + RefNumber + "</b>) pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Mohon maklum.<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        public static string LaporanKerosakan_Surcaj(ref DataTable VerifierDt, string XMLPhysicalPath, string InvestigatorName, string RefNumber)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < VerifierDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(VerifierDt.Rows[x]["EmployeeEmail"].ToString(), VerifierDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Tindakan Tatatertib / Surcaj Terhadap Pegawai Bertanggungjawab Untuk Laporan Kehilangan";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa <b>" + InvestigatorName + "</b> telah melengkap laporan siasatan untuk Laporan Kehilangan (No. Rujukan: <b>" + RefNumber + "</b>) pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Tuan/Puan dikehendaki untuk memasukkan tindakan tatatertib atau surcaj kepada Pegawai yang bertanggungjawab.<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }
        #endregion

        #region Pemeriksaan
        public static string Pemeriksaan_NotifyLembagaPemeriksa(ref DataTable LembagaDt, string XMLPhysicalPath, string PemeriksaanName, DateTime StartDate, DateTime EndDate, string RefNumber)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();

                    for (int x = 0; x < LembagaDt.Rows.Count; x++)
                    { mail.To.Add(new MailAddress(LembagaDt.Rows[x]["EmployeeEmail"].ToString(), LembagaDt.Rows[x]["EmployeeName"].ToString())); }

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Notis Pemberitahuan Pemeriksaan Aset Alih";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa Tuan/Puan telah diarahkan untuk membuat Pemeriksaan Aset Alih (No. Rujukan: <b>" + RefNumber + "</b>).<br>";
                    EmailNotification = EmailNotification + "Pemeriksaan ini dijadualkan bermula pada " + StartDate.ToString("dd/MM/yyyy") + " dan berakhir pada " + EndDate.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Sila login ke " + ConfigurationManager.AppSettings["ProgramTitle"].ToString() + " untuk mendapatkan maklumat penuh dan senarai aset untuk pemeriksaan.<br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }

        #endregion

        #region ResetEmail
        public static string ResetEmail_SendMail(string EmailAddress, string NewPassword, string StaffName, string XMLPhysicalPath)
        {
            DataSet ds = new DataSet();

            try
            {
                string err = "";
                err = XmlMethods.ReadXMLFile(ref ds, XMLPhysicalPath);


                if (err == "")
                {
                    MailMessage mail = new MailMessage();


                    mail.To.Add(new MailAddress(EmailAddress, StaffName)); 

                    mail.From = new MailAddress(ds.Tables[0].Rows[0]["NetworkId"].ToString(), ds.Tables[0].Rows[0]["SenderName"].ToString());
                    mail.Subject = ConfigurationManager.AppSettings["ProgramTitle"].ToString() + "- Reset Kata Laluan";
                    mail.IsBodyHtml = true;

                    string EmailNotification = "<style> p {font-family:arial;} </style>";
                    EmailNotification = EmailNotification + "Tuan/Puan<br><br>";
                    EmailNotification = EmailNotification + "Emel ini adalah sebagai notis bahawa anda telah memohon untuk menukar kata laluan anda pada " + DateTime.Now.ToString("dd/MM/yyyy") + ".<br>";
                    EmailNotification = EmailNotification + "Kata Laluan baharu anda: <b>" + NewPassword + "</b><br><br>";
                    EmailNotification = EmailNotification + "Terima kasih dan harap maklum<br><br><br>";
                    EmailNotification = EmailNotification + "Daripada,<br>";
                    EmailNotification = EmailNotification + "<b><em>" + ds.Tables[0].Rows[0]["SenderName"].ToString() + "</em></b><br><br>";
                    EmailNotification = EmailNotification + "Ini adalah email daripada sistem dan ianya automatik.";
                    mail.Body = EmailNotification;

                    err = SendEmail(mail, ref ds);

                    return err;
                }
                else
                    return err;
            }
            catch (Exception err)
            {
                return err.Message;
            }
        }
        #endregion

        private static string SendEmail(MailMessage xMail, ref DataSet EmailConfigDs)
        {
            try
            {
                //SmtpClient smtpClient = new SmtpClient(EmailConfigDs.Tables[0].Rows[0]["HostName"].ToString(), Convert.ToInt32(EmailConfigDs.Tables[0].Rows[0]["PortNumber"].ToString()));

                //if (EmailConfigDs.Tables[0].Rows[0]["EnableSsl"].ToString() == "Ya")
                //    smtpClient.EnableSsl = true;
                //else
                //    smtpClient.EnableSsl = false;

                //smtpClient.UseDefaultCredentials = true;
                //smtpClient.Credentials = new System.Net.NetworkCredential(EmailConfigDs.Tables[0].Rows[0]["NetworkId"].ToString(), EmailConfigDs.Tables[0].Rows[0]["NetworkPasword"].ToString());

                //if (EmailConfigDs.Tables[0].Rows[0]["BypassSecurityValidation"].ToString() == "True")
                //{
                //    System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate(object s,
                //    System.Security.Cryptography.X509Certificates.X509Certificate certificate,
                //    System.Security.Cryptography.X509Certificates.X509Chain chain,
                //    System.Net.Security.SslPolicyErrors sslPolicyErrors)
                //    {
                //        return true;
                //    };
                //}

                //smtpClient.Send(xMail);

                SmtpClient smtpClient = new SmtpClient(EmailConfigDs.Tables[0].Rows[0]["HostName"].ToString(), Convert.ToInt32(EmailConfigDs.Tables[0].Rows[0]["PortNumber"]));

                smtpClient.EnableSsl = Convert.ToBoolean(EmailConfigDs.Tables[0].Rows[0]["EnableSsl"]);
               
                smtpClient.UseDefaultCredentials = true;
                smtpClient.Credentials = new System.Net.NetworkCredential(EmailConfigDs.Tables[0].Rows[0]["NetworkId"].ToString(), EmailConfigDs.Tables[0].Rows[0]["NetworkPasword"].ToString());


                if (Convert.ToBoolean(EmailConfigDs.Tables[0].Rows[0]["BypassSecurityValidation"]) == true)
                {
                    System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate(object s,
                    System.Security.Cryptography.X509Certificates.X509Certificate certificate,
                    System.Security.Cryptography.X509Certificates.X509Chain chain,
                    System.Net.Security.SslPolicyErrors sslPolicyErrors)
                    {
                        return true;
                    };
                }

                smtpClient.Send(xMail);

                return string.Empty;
            }
            catch (Exception err)
            {
                return err.Message;
            }

        }
    }
}
