using Core.Stor;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.Stor.PelupusanOld
{
    public partial class Tab_Pelupusan : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void cbpPelupusanStor_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cbpPelupusanStor.JSProperties["cpMode"] = e.Parameter;

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
                    case "REFRESH_SENARAI_STOR_PELUPUSAN": RefreshNamaSenaraiStorPelupusan(); break;
                    //case "LOAD_AHLI_LEMBAGA": LoadAhliLembaga(); break;

                }
            }
            else
                cbpPelupusanStor.JSProperties["cpErrMsg"] = "Session Expired";
        }

        private void Load()
        {
            DataSet Ds = new DataSet();
            //DataTable AssetListDt = new DataTable();
            //DataTable InspectorDt = new DataTable();

            try
            {
                string DbErr = Core.Stor.PelupusanMethods.SP_FindNameStockPelupusanLoad(txtPelupusan1.Text, ref Ds);

                if (DbErr == string.Empty)
                {
                    //txtRefNumber.Text = Ds.Tables[0].Rows[0]["RefNumber"].ToString();

                    deTarikhPelupusan.Date = Convert.ToDateTime(Ds.Tables[0].Rows[0]["[TarikhPelupusan"]);
                    txtStatus.Text = Ds.Tables[0].Rows[0]["Keterangan"].ToString();

                    cbpPelupusanStor.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpPelupusanStor.JSProperties["cpErrMsg"] = errMsg + " " + DbErr;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpPelupusanStor.JSProperties["cpErrMsg"] = errMsg + " " + err.Message;
            }
            finally
            { Ds.Dispose(); }
        }


        private void RefreshNamaSenaraiStorPelupusan()
        {
            DataSet Ds = new DataSet();
            DataTable Dt = new DataTable();


            int storeId = int.Parse(txtStoreId.Text.Trim());

            SenaraiStorPelupusan.SelectParameters["StoreId"].DefaultValue = storeId.ToString();
            SenaraiStorPelupusan.DataBind();
            gvSenaraiStorPelupusan.DataBind();

            return;

            try
            {


                string err = PelupusanMethods.SP_FindNameStockPelupusanLoad(ref Dt, storeId);

                if (err == "")
                {
                    gvSenaraiStorPelupusan.DataSource = Dt;
                    gvSenaraiStorPelupusan.DataBind();

                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                   
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                //cbp_SavePRItem.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { Ds.Dispose(); Dt.Dispose(); }
        }


        private void Save(string CurrUser)
        {
            try
            {
                Data.Pelupusan pelupusan = new Data.Pelupusan
                {

                    TarikhPelupusan = deTarikhPelupusan.Date,
                    Status = txtStatus.Text,
                    PelupusanDaftarStok = txtPelupusanDaftarStok.Text,
                    KeteranganStok = txtKeteranganStok.Text,
                    HargaSeunit = txtHargaSeunit.Text,
                    KuantitiDilupuskan = txtKuantitiDilupuskan.Text,
                    NilaiPerolehan = txtNilaiPerolehan.Text,
                    HasilPerolehan = txtHasilPerolehan.Text,
                    KaedahDanNilai = txtKaedahDanNilai.Text


                };

                string err = Core.Stor.PelupusanMethods.SP_PelupusanSave(pelupusan);

                if (err == "")
                {
                    cbpPelupusanStor.JSProperties["cpErrMsg"] = string.Empty;
                }
                else
                {
                    string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceDBError"].ToString();
                    errMsg = errMsg.Replace("BR", "<br><br>");
                    cbpPelupusanStor.JSProperties["cpErrMsg"] = errMsg + " " + err;
                }
            }
            catch (Exception err)
            {
                string errMsg = ConfigurationManager.AppSettings["ErrorMessageStaringSentenceCaughtByExceptions"].ToString();
                errMsg = errMsg.Replace("BR", "<br><br>");
                cbpPelupusanStor.JSProperties["cpErrMsg"] = errMsg + " " + err;
            }
            finally
            { }
        }

        


        protected void SenaraiStorPelupusan_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (string.IsNullOrEmpty(txtStoreId.Text))
                return;
            e.Command.Parameters["@StoreId"].Value = Convert.ToInt32(txtStoreId.Text);
        }

        protected void gvSenaraiStorPelupusan_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void btnSubmitClick(object sender, EventArgs e)
        {

        }


        protected void txtPelupusan1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtPelupusan2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtStatus_TextChanged(object sender, EventArgs e)
        {

        }

        protected void deTarikhPelupusan_DateChanged(object sender, EventArgs e)
        {

        }



        protected void txtKeteranganStok_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtHargaSeunit_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtKuantitiDilupuskan_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtNilaiPerolehan_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtHasilPerolehan_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtKaedahDanNilai_TextChanged(object sender, EventArgs e)
        {

        }


        protected void txtPelupusanDaftarStok_TextChanged(object sender, EventArgs e)
        {

        }

        

       
    }
}