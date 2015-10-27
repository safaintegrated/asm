using Core.Stor.KenyataanTawaranTender;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.TawaranTender
{
    public partial class Tab_KenyataanTawaranTenderPelupusan : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvSenaraiAsetTenderPelupusan_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void gvSenaraiAsetTenderPelupusan_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

        }

        protected void deTarikhBolehLihat_DateChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhBolehLihatHingga_DateChanged(object sender, EventArgs e)
        {

        }


        protected void deTenderAkanDitutupPada_DateChanged(object sender, EventArgs e)
        {

        }

        protected void txtNoTender_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtPetiAlamatTender_TextChanged(object sender, EventArgs e)
        {

        }

        protected void glSenaraiTawaranTender_AfterPerformCallback(object sender, DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs e)
        {

        }

        protected void glSenaraiTawaranTender_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void cbpTawaranTender_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            {
                cbpTawaranTender.JSProperties["cpMode"] = e.Parameter;

                FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
                FormsAuthenticationTicket ticket = id.Ticket;

                if (!ticket.Expired)
                {
                    switch (e.Parameter)
                    {
                        case "SAVE": Save(ticket.Name); break;
                        //case "POST": SavePostMode(ticket.Name, 1); break;
                        //case "ASSETINV": LoadAssetInv(); break;
                        case "LOAD": Load(); break;
                        //case "REFRESH_SENARAI_STOR_PELUPUSAN": RefreshNamaSenaraiStorPelupusan(); break;
                        //case "LOAD_AHLI_LEMBAGA": LoadAhliLembaga(); break;

                    }
                }
                else
                    cbpTawaranTender.JSProperties["cpErrMsg"] = "Session Expired";
            }

        }

        private void Save(string CurrUser)
        {
            try
            {
                Data.KenyataanTawaranTender KTT = new Data.KenyataanTawaranTender
                {

                    TarikhLihatPada = deTarikhBolehLihat.Date,
                    TarikhLihatHingga = deTarikhBolehLihatHingga.Date,
                    JamLihatPada = deJamLihatPada.DateTime,
                    JamLihatHingga = deJamLihatPadaHingga.DateTime,
                    TenderTutup = deTenderAkanDitutupPada.Date,
                    NoTender = txtNoTender.Text,
                    PetiTender = txtPetiAlamatTender.Text



                };

                string err = Core.Stor.KenyataanTawaranTender.KenyataanTawaranTenderMethods.SP_KenyataanTawaranTenderPelupusanSave(KTT);

                if (err == "")
                {
                    cbpTawaranTender.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpTawaranTender.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpTawaranTender.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { }
        }

        private void Load()
        {
            DataSet Ds = new DataSet();
            DataTable KenyataanTawaranListDt = new DataTable();
            DataTable KenyataanTawaranTenderDt = new DataTable();

            try
            {
                string DbErr = KenyataanTawaranTenderMethods.SP_KenyataanTawaranTenderLoad(txtTawaranTenderId.Text, ref Ds);

                if (DbErr == string.Empty)
                {

                    //txtNamaPemeriksaan.Text = Ds.Tables[0].Rows[0]["NamaPemeriksaan"].ToString();
                    //deTarikhMula.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["BeginDate"]);

                    txtTawaranTenderId.Value = Convert.ToInt32(Ds.Tables[0].Rows[0]["TawaranTenderId"]);

                    txtNoTender.Text = Ds.Tables[0].Rows[0]["NoTender"].ToString();
                    deTarikhBolehLihat.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["TarikhLihatPada"]);
                    deTarikhBolehLihatHingga.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["TarikhLihatHingga"]);
                    deJamLihatPada.DateTime = Convert.ToDateTime(Ds.Tables[0].Rows[0]["JamLihatPada"]);
                    deJamLihatPadaHingga.DateTime = Convert.ToDateTime(Ds.Tables[0].Rows[0]["JamLihatHingga"]);
                    deTenderAkanDitutupPada.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["TenderTutup"]);
                    txtPetiAlamatTender.Text = Ds.Tables[0].Rows[0]["PetiTender"].ToString();


                    //txtNamaPemeriksaan.Text = Ds.Tables[0].Rows[0]["NamaPemeriksaan"].ToString();
                    //mmKeterangan.Text = Ds.Tables[0].Rows[0]["Details"].ToString();
                    //deTarikhMula.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["BeginDate"]);
                    //deTarikhTamat.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["EndDate"]);
                    //glLembagaName.Text = Ds.Tables[0].Rows[0]["LembagaId"].ToString();


                    //ST_StorePTJId.Value = Convert.ToInt32(Dt.Rows[0]["ST_StorePTJId"]);

                    //St_StoreId.Text = Dt.Rows[0]["ST_StoreId"].ToString();
                    //ST_StoreName.Text = Dt.Rows[0]["ST_StoreName"].ToString();
                    //ST_StoreAdd1.Text = Dt.Rows[0]["ST_StoreAdd1"].ToString();
                    //ST_StoreAdd2.Text = Dt.Rows[0]["ST_StoreAdd2"].ToString();
                    //ST_StoreAdd3.Text = Dt.Rows[0]["ST_StoreAdd3"].ToString();
                    //ST_StoreAdd4.Text = Dt.Rows[0]["ST_StoreAdd4"].ToString();


                    cbpTawaranTender.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpTawaranTender.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpTawaranTender.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Ds.Dispose(); KenyataanTawaranListDt.Dispose(); KenyataanTawaranTenderDt.Dispose(); }
        }

 

        protected void txtTawaranTenderId_TextChanged(object sender, EventArgs e)
        {

        }

        protected void teJamBolehLihat_DateChanged(object sender, EventArgs e)
        {

        }

        protected void teJamBolehLihatHingga_DateChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhLihatPadaHingga_DateChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhLihatPada_DateChanged(object sender, EventArgs e)
        {

        }

        protected void deJamLihatPada_DateChanged(object sender, EventArgs e)
        {

        }

        protected void deJamLihatPadaHingga_DateChanged(object sender, EventArgs e)
        {

        }



    }
}