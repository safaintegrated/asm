using Core;
using Core.Stor;
using Data;
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
    public partial class Tab_Pengeluaran : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string ProcessId { get; set; }

        protected void gvStokRequested_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
        }

        protected void cbpKelulusan_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                cbpKelulusan.JSProperties["cpMode"] = e.Parameter;

                switch (e.Parameter)
                {
                    case "LOAD": LoadKelulusanInfo(ticket.Name); break;
                   // case "KEMASKINI": KemaskiniKelulusan(ticket.Name); break;
                    case "LULUS": KemaskiniKelulusan(ticket.Name, ProcessStateType.Lulus); break;
                    case "TIDAKLULUS": KemaskiniKelulusan(ticket.Name, ProcessStateType.TidakLulus); break;
                }
            }
            else
            {
                cbpKelulusan.JSProperties["cpErrMsg"] = "Session Expired.";
            }

        }

        private void KemaskiniKelulusan(string userId, ProcessStateType pst)
        {
            try
            {
                Data.PermohonanStok ps = new Data.PermohonanStok
                {
                    ProcessIdTemp = txtKelulusanProcessIdTemp.Text,
                    ProcessId = int.Parse(txtKelulusanProcessId.Text),
                    KuantitiDiluluskan = int.Parse(txtKelulusanKuantiti.Text),
                    Status = (int)(pst),
                    TarikhDiluluskan = DateTime.Now,
                    PegawaiKelulusanEmpSysId = int.Parse(txtKelulusanEmpSysId.Text),
                };


                string err = PermohonanStokMethods.SP_UpdatePermohonanStokKelulusan(int.Parse(userId), ps);

                if (err == string.Empty)
                {
                    cbpKelulusan.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpKelulusan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpKelulusan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        private void LoadKelulusanInfo(string userId)
        {

            try
            {
                Data.Entity.Employee employee;
                string err = GeneralStokMethods.SP_GetEmployeeById(out employee, int.Parse(userId));

                Data.PermohonanStok ps;
                err = PermohonanStokMethods.SP_FindPermohonanStokByProcessId(out ps, txtKelulusanProcessId.Text);

                if (err != "")
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpKelulusan.JSProperties["cpErrMsg"] = errMsg + " " + err;
                    return;
                }

                txtKelulusanNama.Text = employee.EmployeeName;
                txtKelulusanJawatan.Text = employee.EmployeeDesignation;
                txtKelulusanJabatan.Text = employee.PtjName;
                txtKelulusanEmpSysId.Text = employee.EmployeeSysId.ToString();
                txtKelulusanKuantiti.Text = ps.KuantitiDiluluskan.ToString();
                gvStokRequested.DataBind();

            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpKelulusan.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
        }

        protected void btnTidakLulus_Click(object sender, EventArgs e)
        {

        }

    
    }
}