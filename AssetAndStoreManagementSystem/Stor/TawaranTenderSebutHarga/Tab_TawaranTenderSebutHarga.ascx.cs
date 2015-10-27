using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.TawaranTenderSebutHarga
{
    public partial class Tab_TawaranTenderSebutHarga : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbpTawaranSebutharga_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {

            {
                cbpTawaranSebutharga.JSProperties["cpMode"] = e.Parameter;

                FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
                FormsAuthenticationTicket ticket = id.Ticket;

                if (!ticket.Expired)
                {
                    switch (e.Parameter)
                    {
                        case "SAVE": Save(ticket.Name); break;
                        //case "POST": SavePostMode(ticket.Name, 1); break;
                        //case "ASSETINV": LoadAssetInv(); break;
                        //case "LOAD": Load(); break;
                        //case "REFRESH_SENARAI_STOR_PELUPUSAN": RefreshNamaSenaraiStorPelupusan(); break;
                        //case "LOAD_AHLI_LEMBAGA": LoadAhliLembaga(); break;

                    }
                }
                else
                    cbpTawaranSebutharga.JSProperties["cpErrMsg"] = "Session Expired";
            }
        }

        private void Save(string CurrUser)
        {
            try
            {
                Data.KenyataanTawaranSebutharga K = new Data.KenyataanTawaranSebutharga
                {

                    TarikhLihatPadaSebutharga = deTarikhBolehLihatSebutharga.Date,
                    TarikhLihatHinggaSebutharga = deTarikhBolehLihatHinggaSebutharga.Date,
                    NoSebutharga = txtNoSebutharga.Text,
                    PetiAlamatSebutharga = txtPetiAlamatTenderSebutharga.Text,
                    TarikhTutupSebutharga = deTarikhTutupSebutharga.Date,


                };

                string err = Core.Stor.KenyataanTawaranSebutharga.KenyataanTawaranSebuthargaMethods.SP_KenyataanTawaranSebuthargaSave(K);

                if (err == "")
                {
                    cbpTawaranSebutharga.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpTawaranSebutharga.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpTawaranSebutharga.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { }
        }


        
        protected void GridSearch_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearch.DataBind();
        }

        protected void GridSearch_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            //if (e.DataColumn.FieldName == "TawaranTenderId")
            //{
            //    GridViewDataColumn gvc = GridSearch.DataColumns["TawaranTenderId"] as GridViewDataColumn;

            //    var obj = GridSearch.FindRowCellTemplateControl(e.VisibleIndex, gvc, "TawaranTenderId");

            //    ASPxHyperLink link = (ASPxHyperLink)obj;

            //    //ASPxHyperLink link = (ASPxHyperLink)GridSearch.FindRowCellTemplateControl(e.VisibleIndex, GridSearch.DataColumns["Nama Pemeriksaan"] as GridViewDataColumn, "Nama Pemeriksaan");

            //    if (link != null)
            //    {
            //        string TawaranTenderId = GridSearch.GetRowValues(e.VisibleIndex, "TawaranTenderId").ToString();
            //        link.ClientInstanceName = "TawaranTenderId" + e.VisibleIndex.ToString();
            //        link.Text = e.CellValue.ToString();
            //        link.NavigateUrl = "javascript: TawaranTenderSelected('" + TawaranTenderId + "');";
            //    }
            //}
        }

        protected void deTarikhBolehLihatSebutharga_DateChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhBolehLihatHinggaSebutharga_DateChanged(object sender, EventArgs e)
        {

        }

        protected void txtNoSebutharga_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtPetiAlamatTenderSebutharga_TextChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhTutupSebutharga_DateChanged(object sender, EventArgs e)
        {

        }

        protected void gvSenaraiAsetTawaranSebutharga_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void gvSenaraiAsetTawaranSebutharga_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

        }

        protected void glSenaraiTawaranSebutharga_AfterPerformCallback(object sender, DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs e)
        {

        }

        protected void glSenaraiTawaranSebutharga_AfterPerformCallback1(object sender, DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs e)
        {

        }

        protected void glSenaraiTawaranSebutharga_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

        }

    }
}