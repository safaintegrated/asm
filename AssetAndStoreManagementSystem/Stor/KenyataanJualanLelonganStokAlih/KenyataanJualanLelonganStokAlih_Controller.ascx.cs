using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.KenyataanJualanLelonganStokAlih
{
    public partial class KenyataanJualanLelonganStokAlih_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxPageControl1_ActiveTabChanged(object source, DevExpress.Web.TabControlEventArgs e)
        {

        }

        protected void gvSenaraiStokYangDilelong_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void gvSenaraiStokYangDilelong_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

        }

        protected void cbpKenyataanJualanLelonganAsetAlih_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbpKenyataanJualanLelonganAsetAlih.JSProperties["cpMode"] = e.Parameter;

            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (!ticket.Expired)
            {
                switch (e.Parameter)
                {

                    //case "ADD": PelupusanNewMode(ticket.Name); break;
                    //case "ADDMEMBER": LembagaPemeriksaAddMemberMode(); break;
                    //case "DELETEMEMBER": LembagaPemeriksaDeleteMemberMode(); break;
                    //case "LOAD": LembagaPemeriksaLoadMode(); break;
                    //case "DELETEHEADER": LembagaPemeriksaDeleteMode(3, ticket.Name); break;
                    //case "REFRESHSTATUS": LembagaPemeriksaRefresh(); break;
                    case "SAVE": Save(ticket.Name); break;
                    //case "ADDPELUPUSAN": AddPelupusan(); break;


                }
            }
            else
                cbpKenyataanJualanLelonganAsetAlih.JSProperties["cpErrMsg"] = "Session Expired.";

        }

        private void Save(string CurrUser)
        {
            try
            {
                Data.KenyataanJualanLelonganStokAlih KJLSA = new Data.KenyataanJualanLelonganStokAlih
                {

                    TarikhMula = deTarikhMula.Date,
                    TarikhTamat = deTarikhTamat.Date,
                    Alamat = txtAlamat.Text,
                    PadaJam = txtJamPada.Text,
                    TamatJam = txtJamTamat.Text,

 
 
                };

                string err = Core.Stor.KenyataanJualanLelonganStokAlih.KenyataanJualanLelonganStokAlihMethods.SP_KenyataanJualanLelonganStokAlihSave(KJLSA);

                if (err == "")
                {
                    cbpKenyataanJualanLelonganAsetAlih.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpKenyataanJualanLelonganAsetAlih.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpKenyataanJualanLelonganAsetAlih.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { }
        }

        protected void deTarikhMula_DateChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhTamat_DateChanged(object sender, EventArgs e)
        {

        }

        protected void txtAlamat_TextChanged(object sender, EventArgs e)
        {

        }

        protected void teMulaJam_DateChanged(object sender, EventArgs e)
        {

        }

        protected void teTamatJam_DateChanged(object sender, EventArgs e)
        {

        }

        protected void txtJamPada_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtJamTamat_TextChanged(object sender, EventArgs e)
        {

        }
    }
}