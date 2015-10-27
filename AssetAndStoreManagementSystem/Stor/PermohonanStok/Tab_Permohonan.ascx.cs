using Core;
using Data;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.PermohonanStok
{
    public partial class Tab_Permohonan : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public string ReportProcessId
        {
            get { return (string)txtNoPemohon.Text; }
            set { txtNoPemohon.Text = value; }
        }

        protected void cbpHeader_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                cbpHeader.JSProperties["cpMode"] = e.Parameter;

                switch (e.Parameter)
                {
                    case "ADD": AddHeader(); break;
                    case "LOAD": LoadHeader(); break;
                    case "SAVE": SaveHeader(ticket.Name); break;
                    //                   case "POST": PostHeader(ticket.Name); break;
                }
            }
            else
            {
                cbpHeader.JSProperties["cpErrMsg"] = "Session Expired.";
            }
        }

        private void LoadHeader()
        {
            Data.PermohonanStok ps;

            try
            {
                string pId = txtNoPemohon.Text;
                string err = PermohonanStokMethods.SP_FindPermohonanStokByProcessId(out ps, pId);

                if (err != "")
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpHeader.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    return;
                }
                cbpHeader.JSProperties["cpErrMsg"] = string.Empty;

                UpdatePermohonanStokInfo(ps);

            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpHeader.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        private void SaveHeader(string user)
        {
            try
            {
                Data.PermohonanStok ps = new Data.PermohonanStok
                {
                    ProcessIdTemp = txtProcessIdTemp.Text,
                    PermohonanTujuan = mmTujuan.Text,
                    PermohonanTarikhDiKehendaki = deTarikhDiperlukan.Date,
                    PtjDiPohon = (int)glPtjDiPohon.Value,
                    StorDiPohon = (int)glPtjDiPohon.Value,
                    StokDiPohon = (int)glStokDiPohon.Value,
                    PermohonanKuantitiDiPohon = int.Parse(txtKuantitiDiPohon.Text),
                    PermohonanToJenis = cbPenerima.SelectedIndex
                };

                if (cbPenerima.SelectedIndex == 0)
                {
                    ps.PermohonanToPtj = (int)glPermohonanToPtj.Value;
                    ps.PermohonanToStor = (int)glPermohonanToStor.Value;
                }
                else
                {
                    ps.PermohonanToNama = (int)glPermohonanToNama.Value;
                }




                string err = PermohonanStokMethods.SP_UpdatePermohonanStok(int.Parse(user), ps);

                if (err == string.Empty)
                {
                    cbpHeader.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpHeader.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpHeader.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        private void AddHeader()
        {
            try
            {
                string processIdTemp = txtProcessIdTemp.Text;
                Data.PermohonanStok ps;
                string err = PermohonanStokMethods.SP_GetPermohonanStockByProcessIdTemp(out ps, processIdTemp);

                if (err == "")
                {
                    cbpHeader.JSProperties["cpErrMsg"] = string.Empty;

                    txtPemohonNama.Text = ps.PemohonNama;
                    txtPemohonJabatan.Text = ps.PemohonJabatan;
                    txtPemohonJawatan.Text = ps.PemohonJawatan;
                    txtPemohonNoKakitangan.Text = ps.PemohonNoKakitangan;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpHeader.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpHeader.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        protected void cbp_AddNewPermohonan_Callback(object sender, CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (ticket.Expired)
            {
                cbp_AddNewPermohonan.JSProperties["cpErrMsg"] = "Session Expired.";
                return;
            }


            try
            {
                string processIdTemp = Guid.NewGuid().ToString();
                string err = PermohonanStokMethods.SP_PermohonanStokCreateNewEntry(int.Parse(ticket.Name), processIdTemp);

                if (err == "")
                {
                    //string StatusDesc = string.Empty;
                    ProcessState ps;
                    PermohonanStokMethods.SP_GetStatusDescription(out ps, ProcessStateType.New);
                    cbp_AddNewPermohonan.JSProperties["cpErrMsg"] = string.Empty;
                    cbp_AddNewPermohonan.JSProperties["cpProcessId"] = processIdTemp;
                    cbp_AddNewPermohonan.JSProperties["cpRevision"] = 1;
                    cbp_AddNewPermohonan.JSProperties["cpStatusText"] = ps.Description;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp_AddNewPermohonan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp_AddNewPermohonan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        public string ProcessId
        {
            get { return txtNoPemohon.Text; }
            set { txtNoPemohon.Text = value; }
        }

        public void UpdatePermohonanStokInfo(Data.PermohonanStok ps)
        {
            txtProcessIdTemp.Text = ps.ProcessIdTemp;

            //Maklumat Pemohon
            txtPemohonNama.Text = ps.PemohonNama;
            txtPemohonJabatan.Text = ps.PemohonJabatan;
            txtPemohonNoKakitangan.Text = ps.PemohonNoKakitangan;
            txtPemohonJawatan.Text = ps.PemohonJawatan;

            //Maklumat Permohonan
            glPtjDiPohon.Value = ps.PtjDiPohon;
            glStorDiPohon.GridView.DataBind();
            glStorDiPohon.Value = ps.StorDiPohon;
            glStokDiPohon.Value = ps.StokDiPohon;
            txtKuantitiDiPohon.Text = ps.PermohonanKuantitiDiPohon.ToString();
            deTarikhDiperlukan.Date = ps.PermohonanTarikhDiKehendaki;
            mmTujuan.Text = ps.PermohonanTujuan;

            //Maklumat Permohonan Kepada
            cbPenerima.SelectedIndex = ps.PermohonanToJenis;
            if (cbPenerima.SelectedIndex == 0)
            {
                glPermohonanToPtj.Value = ps.PermohonanToPtj;
                glPermohonanToPtj.GridView.DataBind();
                glPermohonanToStor.Value = ps.PermohonanToStor;
                glPermohonanToNama.Value = 0;
            }
            else
            {
                glPermohonanToPtj.Value = 0;
                glPermohonanToStor.Value = 0;
                glPermohonanToNama.Value = ps.PermohonanToNama;
                glPermohonanToNama.GridView.DataBind();
            }
            //txtNamaPemohon.ReadOnly = true;
            //glPTJ.ReadOnly = true;
            //txtNoKakitangan.ReadOnly = true;

        }
    }
}