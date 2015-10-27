using Core;
using Core.Stor;
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

namespace AssetAndStoreManagementSystem.Stor.PengeluaranStok
{
    public partial class PengeluaranStokController : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["ProcessId"] == null)
                {
                    //OpenFromMyTask.Text = "0";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "OnPageLoadEvents();", true);
                }
                else
                {
                    //OpenFromMyTask.Text = "1";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OnLoad", "PemeriksaanSelected('" + Request.QueryString["ProcessId"].ToString() + "');", true);
                }

            }
        }


        protected void cbp_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;
            cbp.JSProperties["cpMode"] = e.Parameter;
            cbp.JSProperties["cpErrMsg"] = string.Empty;

            if (ticket.Expired)
            {
                cbp.JSProperties["cpErrMsg"] = "Session Expired.";
                return;
            }

            switch (e.Parameter)
            {
                case "ADD": 
                    AddPengeluaran(); 
                    break;
                case "CANCEL":
                    Batal(); 
                    break;
                case "LOAD_PERMOHONAN":
                    LoadPermohonan(ticket.Name);
                    break;
                case "KEMASKINI":
                    KemaskiniPermohonan(ticket.Name);
                    break;
                case "UPDATE":
                    break;
                case "SAVE":
                    KemaskiniPermohonan(ticket.Name);
                    //SavePermohonan(ticket.Name);
                    break;
            }

        }

        private void SavePermohonan(string user)
        {
            //try
            //{
            //    Data.PermohonanStok ps = new Data.PermohonanStok
            //    {
            //        ProcessIdTemp = txtProcessIdTemp.Text,
            //        PermohonanTujuan = mmTujuan.Text,
            //        PermohonanTarikhDiKehendaki = deTarikhDiperlukan.Date,
            //        PtjDiPohon = (int)glPtjDiPohon.Value,
            //        StorDiPohon = (int)glPtjDiPohon.Value,
            //        StokDiPohon = (int)glStokDiPohon.Value,
            //        PermohonanKuantitiDiPohon = int.Parse(txtKuantitiDiPohon.Text),
            //        PermohonanToJenis = cbPenerima.SelectedIndex
            //    };

            //    if (cbPenerima.SelectedIndex == 0)
            //    {
            //        ps.PermohonanToPtj = (int)glPermohonanToPtj.Value;
            //        ps.PermohonanToStor = (int)glPermohonanToStor.Value;
            //    }
            //    else
            //    {
            //        ps.PermohonanToNama = (int)glPermohonanToNama.Value;
            //    }




            //    string err = PermohonanStokMethods.SP_UpdatePermohonanStok(int.Parse(user), ps);

            //    if (err == string.Empty)
            //    {
            //        cbpHeader.JSProperties["cpErrMsg"] = string.Empty;
            //    }
            //    else
            //    {
            //        string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
            //        errMsg = errMsg.Replace("BR", "<br><br>");
            //        cbpHeader.JSProperties["cpErrMsg"] = errMsg + " " + err;
            //    }
            //}
            //catch (Exception err)
            //{
            //    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
            //    errMsg = errMsg.Replace("BR", "<br><br>");
            //    cbpHeader.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            //}
        }

        private void AddPengeluaran()
        {
            ResetAllControl();
            EnableControl(true);
        }

        private void Batal()
        {
            ResetAllControl();
        }



        private void KemaskiniPermohonan(string userId)
        {
            try
            {
                Data.PermohonanStok ps = new Data.PermohonanStok
                {
                    ProcessId = int.Parse(txtNoPermohonan.Text),
                    PengeluaranKuantiti = int.Parse(txtPermohonanKuantitiDiKeluarkan.Text),
                    Status = (int)ProcessStateType.Pengeluaran,
                    PengeluaranTarikh = DateTime.Now,
                    PengeluaranEmpSysId = (int)glPengeluarNama.Value,
                    PengeluaranCatatan = mmPermohonanCatatan.Text
                };


                string err = PermohonanStokMethods.SP_UpdatePermohonanStokPengeluaran(int.Parse(userId), ps);

                if (err == string.Empty)
                {
                    cbp.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        private void LoadPermohonan(string userId)
        {
            Data.PermohonanStok ps;

            try
            {
                string pId = txtNoPermohonan.Text;
                string err = PermohonanStokMethods.SP_FindPermohonanStokByProcessId(out ps, pId);

                Data.Entity.Employee currentUser;
                err = GeneralStokMethods.SP_GetEmployeeById(out currentUser, int.Parse(userId));

                if (err != "")
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbp.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    return;
                }

            //    EnableControl(true);

                //Permohonan details
                txtNoPermohonan.Text = ps.ProcessId.ToString();
                txtProcessIdTemp.Text = ps.ProcessIdTemp;

                dePermohonanTarikhDiKehendaki.Date = ps.PermohonanTarikhDiKehendaki;
                glPermohonanPtj.Value = ps.PtjDiPohon;
                glPermohonanPtj.GridView.DataBind();
                glPermohonanStor.Value = ps.StorDiPohon;
                glPermohonanStor.GridView.DataBind();
                glPermohonanStok.Value = ps.StokDiPohon;
                glPermohonanStok.GridView.DataBind();

                mmPermohonanTujuan.Value = ps.PermohonanTujuan;
                txtPermohonanKuantitiDiPohon.Text = ps.PermohonanKuantitiDiPohon.ToString();
                dePermohonanTarikh.Date = ps.CreationDate;
                glPermohonanToPtj.Value = ps.PermohonanToPtj;
                glPermohonanToStor.Value = ps.PermohonanToStor;
                glPermohonanToStor.GridView.DataBind();
                glPermohonanToNama.Value = ps.PermohonanToNama;
                cbPermohonanToJenis.SelectedIndex = ps.PermohonanToJenis;


                //Maklumat pemohon
                glPemohonNama.Value = ps.PemohonEmpSysId;
                txtPemohonJawatan.Text = ((System.Data.DataRowView)(glPemohonNama.GridView.GetRow((int)glPemohonNama.Value))).Row["EmployeeDesignation"].ToString();
                txtPemohonJabatan.Text = ((System.Data.DataRowView)(glPemohonNama.GridView.GetRow((int)glPemohonNama.Value))).Row["PTJ_Name"].ToString();
                txtPemohonNoKakitangan.Text = ((System.Data.DataRowView)(glPemohonNama.GridView.GetRow((int)glPemohonNama.Value))).Row["EmployeeIdNo"].ToString();

                //Maklumat kelulusan
                glKelulusanNama.Value = ps.PegawaiKelulusanEmpSysId;
                txtKelulusanNoKakitangan.Text = ((System.Data.DataRowView)(glKelulusanNama.GridView.GetRow((int)glKelulusanNama.Value))).Row["EmployeeIdNo"].ToString();
                txtKelulusanJawatan.Text = ((System.Data.DataRowView)(glKelulusanNama.GridView.GetRow((int)glKelulusanNama.Value))).Row["EmployeeDesignation"].ToString();
                txtKelulusanJabatan.Text = ((System.Data.DataRowView)(glKelulusanNama.GridView.GetRow((int)glKelulusanNama.Value))).Row["EmployeeDesignation"].ToString();
                txtKelulusanKuantiti.Text = ps.KuantitiDiluluskan.ToString();
                deKelulusanTarikh.Date = ps.TarikhDiluluskan;

                EnableControl(false);

             glPengeluarNama.Value = currentUser.EmployeeSysId;
             txtPengeluarJawatan.Text = currentUser.EmployeeDesignation;
             txtPengeluarJabatan.Text = currentUser.PtjName;
             txtPengeluarNoKakitangan.Text = currentUser.EmployeeIdNo;
             mmPermohonanCatatan.Text = ps.PengeluaranCatatan;


             EnableGroupPengeluaran(true);

                cbp.JSProperties["cpErrMsg"] = string.Empty;


            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbp.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }

        }

        private void EnableGroupPengeluaran(bool flag)
        {
            glPengeluarNama.Enabled = flag;
            txtPengeluarNoKakitangan.Enabled = flag;
            txtPengeluarJawatan.Enabled = flag;
            txtPengeluarJabatan.Enabled = flag;
            txtPermohonanKuantitiDiKeluarkan.Enabled = flag;
            mmPermohonanCatatan.Enabled = flag;
        }



        private void EnableControl(bool flag)
        {
            dePermohonanTarikhDiKehendaki.Enabled = flag;
            glPermohonanPtj.Enabled = flag;
            glPermohonanStor.Enabled = flag;
            glPermohonanStok.Enabled = flag;

            mmPermohonanTujuan.Enabled = flag;
            txtPermohonanKuantitiDiPohon.Enabled = flag;
            dePermohonanTarikh.Enabled = flag;
            glPermohonanToPtj.Enabled = flag;
            glPermohonanToStor.Enabled = flag;
            glPermohonanToNama.Enabled = flag;
            cbPermohonanToJenis.Enabled = flag;


            //Maklumat pemohon
            glPemohonNama.Enabled = flag;
            txtPemohonJawatan.Enabled = flag;
            txtPemohonJabatan.Enabled = flag;
            txtPemohonNoKakitangan.Enabled = flag;

            //Maklumat kelulusan
            glKelulusanNama.Enabled = flag;
            txtKelulusanNoKakitangan.Enabled = flag;
            txtKelulusanJawatan.Enabled = flag;
            txtKelulusanJabatan.Enabled = flag;
            txtKelulusanKuantiti.Enabled = flag;
            deKelulusanTarikh.Enabled = flag;

            // Maklumat pengeluaran

            glPengeluarNama.Enabled = flag;
            txtPengeluarNoKakitangan.Enabled = flag;
            txtPengeluarJawatan.Enabled = flag;
            txtPengeluarJabatan.Enabled = flag;
            txtPermohonanKuantitiDiKeluarkan.Enabled = flag;
            mmPermohonanCatatan.Enabled = flag;
        }

        protected void gvPermohonan_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName != "ProcessId")
                return;

            GridViewDataColumn gvc = gvPermohonan.DataColumns["ProcessId"] as GridViewDataColumn;
            if (gvc == null)
                return;

            ASPxHyperLink link = gvPermohonan.FindRowCellTemplateControl(e.VisibleIndex, gvc, "hlProcessId") as ASPxHyperLink;
            if (link == null)
                return;


            string pId = gvPermohonan.GetRowValues(e.VisibleIndex, "ProcessId").ToString();
            link.ClientInstanceName = "ProcessId" + e.VisibleIndex.ToString();
            link.Text = e.CellValue.ToString();
            link.NavigateUrl = "javascript: PermohonanSelected('" + pId + "');";

        }

        private void ResetAllControl()
        {
            txtNoPermohonan.Text = "";
            dePermohonanTarikhDiKehendaki.Text = "";
            glPermohonanPtj.Value = 0;
            glPermohonanStor.Value = 0;
            glPermohonanStok.Value = 0;
            mmPermohonanTujuan.Text = "";
            txtPermohonanKuantitiDiKeluarkan.Text = "";
            dePermohonanTarikh.Date = DateTime.Now;
            glPermohonanToPtj.Value = 0;
            glPermohonanToStor.Value = 0;
            glPermohonanToNama.Value = 0;
            cbPermohonanToJenis.SelectedIndex = 0;
        }

        protected void gvPermohonan_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            gvPermohonan.DataBind();
        }

        protected void glPemohonNama_ValueChanged(object sender, EventArgs e)
        {

        }

        protected void cbp_Report_Callback(object sender, CallbackEventArgsBase e)
        {
            Session["ReportName"] = e.Parameter;

            switch (e.Parameter)
            {
                case "STOR-PENGELUARAN-KEW.PS-10":

                    Session["ProcessId"] = txtNoPermohonan.Text;
                    break;

                case "STOR-PENGELUARAN-KEW.PS-9":

                    Session["ProcessId"] = txtNoPermohonan.Text;
                    break;

                case "STOR-PENGELUARAN-KEW.PS-1":

                   Session["ProcessId"] = txtNoPermohonan.Text;
                    break;


                case "STOR-PENGELUARAN-KEW.PS-2":

                    Session["ProcessId"] = txtNoPermohonan.Text;
                    break;


                case "STOR-PENGELUARAN-KEW.PS-11":

                    Session["ProcessId"] = txtNoPermohonan.Text;
                    break;

                case "STOR-PENGELUARAN-KEW.PS-12":

                    Session["ProcessId"] = txtNoPermohonan.Text;
                    break;


                
                default:
                    break;

            }
        }
    }
}