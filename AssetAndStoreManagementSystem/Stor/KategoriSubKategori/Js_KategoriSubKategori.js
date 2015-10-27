function AddNewSubCat() {
    cbp_SubCatInfo.PerformCallback('ADD');
}

//function RemoveSubCat(SubCatIdToRemove) {
//    cbp_SubCatInfo.PerformCallback('DELETE*' + SubCatIdToRemove.toString());
//}
function RemoveSubCat(SubCatIdToRemove) {
    popupDeleteConfirmation.Hide();
    LoadingPanel.SetText('Sistem sedang memadam rekod pengguna sistem yang dipilih.  Sila tunggu sebentar');
    LoadingPanel.Show();
    cbp_SubCatInfo.PerformCallback('DELETE*' + SubCatIdToRemove.toString());
}

function AuditDetailSelected(ProcessId) {
    GridAuditDetails.PerformCallback(ProcessId);
}

function PelupusanSelected(Id) {
    Stock_Id.SetText(Id.toString());
    LoadingPanel.SetText('Sistem sedang membuka maklumat Pelupusan yang dipilih.  Sila tunggu..');
    LoadingPanel.Show();
    cbp.PerformCallback('LOAD')

}

function cbp_CatInfo_EndCallback(s, e) {
    if (s.cpErrMsg.toString() == '') {
        FormCatInfo.SetEnabled(false);
        PopupSearchCatSubCat.Hide();
        cbp_SubCatInfo.PerformCallback('LOAD');
    }
    else {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
}

function cbp_SubCatInfo_EndCallback(s, e)
{
    if (s.cpErrMsg.toString() == '')
    {
        if (s.cpMode.toString() == 'LOAD')
        {
            FormSubCatListing.SetEnabled(false);
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        }
        else if (s.cpMode.toString() == 'NEW')
        {
            FormSubCatListing.SetEnabled(true);
            ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
            PelupusanDaftarStor.Focus();
        }
    }
    else {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
}

function cbp_Save_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() != '') {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
    else {
        if (s.cpMode.toString() == 'SAVE') {
            popupMsg_Label.SetText('Rekod Kategori telah berjaya dikemaskini.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();

            PelupusanId.SetText(s.cpPelupusanId.toString());
            cbp_CatInfo.PerformCallback();
        }
        else {
            
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            popupMsg_Label.SetText('Rekod Kategori telah berjaya dipadam.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();

            PelupusanKeteranganStor.SetValue(null);
            //PelupusanKeteranganStor.SetText('');
            PelupusanDaftarStor.SetText('');
            PelupusanId.SetText('');
            cbp_CatInfo.PerformCallback();

            //refresh the grid
            GridCatInfoCredentials.PerformCallback('false');

            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }

}


function OnPageLoad() {
    FormCatInfo.SetEnabled(false);
    FormSubCatListing.SetEnabled(false);
    MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
    MainRibbon.GetItemByName("Gambar").SetEnabled(false);
    MainRibbon.GetItemByName("Impot").SetEnabled(false);
    MainRibbon.GetItemByName("Lulus").SetEnabled(false);
    MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
}


//function ProceedWithDelete()
//{
//    popupDeleteConfirmation.Hide();
//    LoadingPanel.SetText('Sistem sedang memadam rekod pengguna sistem yang dipilih.  Sila tunggu sebentar');
//    LoadingPanel.Show();
//    cbp_Save_PerformCallback('DELETE');
////}
function MainRibbon_CommandExecuted(s, e) {
    switch (e.item.name) {
        case 'Kemaskini': KemaskiniClicked(); break;
        case 'Lulus': LulusClicked(); break;
        case 'Kuiri': KuiriClicked(); break;
        case 'Tutup': TutupClicked(); break;
        case 'Tambah': TambahClicked(); break;
        case 'Simpan': SimpanClicked(); break;
        case 'Hantar': HantarClicked(); break;
        case 'Padam': PadamClicked(); break;
        case 'Batal': BatalCicked(); break;
        case 'Cetak': CetakClicked(); break;
        case 'Carian': CarianClicked(); break;
        case 'Audit': AuditClicked(); break;
        case 'Lampiran': LampiranClicked(); break;
        case 'Gambar': GambarClicked(); break;
        case 'Impot': ImpotClicked(); break;
    }
}

function LulusClicked()
{ }

function KuiriClicked()
{ }

function KemaskiniClicked() {
    FormCatInfo.SetEnabled(true);
    FormSubCatListing.SetEnabled(true);
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'true');
}

function TambahClicked() {
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
    PelupusanKeteranganStor.SetValue(null);
    //Stock_Detail.SetText('');
    PelupusanDaftarStor.SetText('');
    PelupusanId.SetText('');
    FormCatInfo.SetEnabled(true);
   // cbp_SubCatInfo.PerformCallback('NEW');

    //refresh the grid
    cbp_SubCatInfo.PerformCallback('true');
   // .PerformCallback('NEW');
   // LookupEmployee.SetVisible(true);

   // UserGroupId.Focus();
}

function SimpanClicked() {
    alert('1');
    if (CheckHeader() && CheckSubCatGrid()) {
        LoadingPanel.SetText('Sistem sedang meyimpan maklumat kategori & sub-kategori.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Save.PerformCallback('SAVE');
    }
}

function CheckHeader() {
    if (PelupusanKeteranganStor.GetValue().toString() == '' || PelupusanDaftarStor.GetText() == '' || PelupusanDaftarStor.GetText() == '') {
        popupMsg_Label.SetText('Sila pastikan semua medan kategori telah diisi.<br>Sila semak dan cuba sekali lagi');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
        return false;
    }
    else
        return true;
}

function CheckSubCatGrid()
{
    var lpass = true;

    var SubCatName;
    var SubCatCode;
    
    for (var i = 0; i < GridSubCatList.GetVisibleRowsOnPage() ; i++)
    {
        SubCatName = ASPxClientControl.GetControlCollection().GetByName('SubCatName_' + i.toString());
        SubCatCode = ASPxClientControl.GetControlCollection().GetByName('SubCatCode_' + i.toString());

        if (SubCatName.GetText() == '' || SubCatCode.GetText() == '')
        {
            lpass = false;
            popupMsg_Label.SetText('Sila pastikan semua medan Nama & Kod <br>untuk setiap Sub-Kategori telah diisi.<br><br>Sila semak dan cuba sekali lagi');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }

        if (!lpass)
            break;
    }

    return lpass;
}

function HantarClicked()
{ }

function PadamClicked()
{
    popupDeleteConfirmation.Show();
    popupDeleteConfirmation_BtnOk.Focus();
}

function BatalCicked() {
    if (PelupusanId.GetText() == '')
    {

        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        PelupusanKeteranganStor.SetValue(null);
        //CatName.SetText('');
        PeluusanDaftarStor.SetText('');
        PelupusanId.SetText('');
        cbp_CatInfo.PerformCallback();

        EnableDisableMainForm('false');

        GridCatInfoCredentials.PerformCallback('false');
    }
    else
    {
        LoadingPanel.SetText('Sistem sedang membuka kembali maklumat yang terakhir disimpan.  Sila tunggu sebentar');
        LoadingPanel.Show();
        cbp_CatInfo.PerformCallback();
    }
}


//function PrintClicked() {
//    //alert('print this STOR only');
//    cbp_Report.PerformCallback('Kategori');
//}

//function PrintListClicked() {
//    //alert('print STOR Listing');
//    cbp_Report.PerformCallback('LIST');
//}


function CetakClicked()
{ 
    cbp_Report.PerformCallback(); 
}

function CarianClicked()
 {
    GridSearchCatSubCat.PerformCallback();
}

function AuditClicked() {
    PopupAuditTrail.SetWidth(screen.width * 0.85);
    PopupAuditTrail.SetContentUrl('AuditIndex.aspx');
    PopupAuditTrail.Show();
}

function TutupClicked() {
    window.close();
    return true;
}

function LampiranClicked()
{ }

function GambarClicked()
{ }

function ImpotClicked()
{ }

function ManageMainRibbonUtamaTab(Kemaskini, Tambah, Simpan, Hantar, Padam, Batal, Cetak, Carian, Audit, Tutup) {
    if (Kemaskini == 'true')
        MainRibbon.GetItemByName("Kemaskini").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Kemaskini").SetEnabled(false);

    if (Tambah == 'true')
        MainRibbon.GetItemByName("Tambah").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Tambah").SetEnabled(false);

    if (Simpan == 'true')
        MainRibbon.GetItemByName("Simpan").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Simpan").SetEnabled(false);

    if (Hantar == 'true')
        MainRibbon.GetItemByName("Hantar").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Hantar").SetEnabled(false);



    //if (EnableDelete.GetText() == 'True')
    //{
    //    if (Padam == 'true')
    //        MainRibbon.GetItemByName("Padam").SetEnabled(true);
    //    else
    //        MainRibbon.GetItemByName("Padam").SetEnabled(false);

    //}

    if (Padam == 'true')
        MainRibbon.GetItemByName("Padam").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Padam").SetEnabled(false);

    if (Batal == 'true')
        MainRibbon.GetItemByName("Batal").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Batal").SetEnabled(false);

    if (Cetak == 'true')
        MainRibbon.GetItemByName("Cetak").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Cetak").SetEnabled(false);

    if (Carian == 'true')
        MainRibbon.GetItemByName("Carian").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Carian").SetEnabled(false);

    if (Audit == 'true')
        MainRibbon.GetItemByName("Audit").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Audit").SetEnabled(false);

    if (Tutup == 'true')
        MainRibbon.GetItemByName("Tutup").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Tutup").SetEnabled(false);
}
