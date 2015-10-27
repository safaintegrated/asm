
function OnPageLoad() {
    //ManageForm('false');
    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');

    //MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
    //MainRibbon.GetItemByName("Gambar").SetEnabled(false);
    //MainRibbon.GetItemByName("Impot").SetEnabled(false);
    //MainRibbon.GetItemByName("Lulus").SetEnabled(false);
    //MainRibbon.GetItemByName("Kuiri").SetEnabled(false);

}

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
        case 'CetakKewPs3': CetakKewPs3Clicked(); break;
        case 'CetakKewPs3A': CetakKewPs3AClicked(); break;
        case 'CetakKewPs4': CetakKewPs4Clicked(); break;
        case 'CetakKewPs5': CetakKewPs5Clicked(); break;
        case 'CetakKewPs13': CetakKewPs13Clicked(); break;
        case 'Carian': CarianClicked(); break;
        case 'Audit': AuditClicked(); break;
        case 'Lampiran': LampiranClicked(); break;
        case 'Gambar': GambarClicked(); break;
        case 'Impot': ImpotClicked(); break;
    }
}
function CetakKewPs3Clicked() {
    //cbp_Report.PerformCallback('STOR-DAFTARSTOK-KEW.PS-3');

    cbp_Report2.PerformCallback('STOR-DAFTARSTOK-KEW.PS-3B');
}

function CetakKewPs3AClicked() {

    cbp_Report.PerformCallback('STOR-DAFTARSTOK-KEW.PS-3');
}


function CetakKewPs4Clicked() {
    cbp_Report.PerformCallback('STOR-DAFTARSTOK-KEW.PS-4');
}

function CetakKewPs5Clicked() {
    cbp_Report.PerformCallback('STOR-DAFTARSTOK-KEW.PS-5');
}


function CetakKewPs13Clicked() {

    cbp_Report.PerformCallback('STOR-DAFTARSTOK-KEW.PS-13');
}

function LulusClicked()
{ }

function KuiriClicked()
{ }

function KemaskiniClicked() {
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'true');
    ManageForm('true');
}

function TambahClicked() {
    ManageForm('true');
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
    ResetControlText();
}

function SimpanClicked() {
    if (!ValidateInfo()) {
        return;
    }
    LoadingPanel.SetText('Sistem sedang menyimpan maklumat item pendaftaran.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_save.PerformCallback('SAVE')
}

function HantarClicked()
{ }

function PadamClicked()
{ }

function BatalCicked() {
    if (txtStockRegId.GetText() == '') {
        cbp_save.PerformCallback('CANCEL');
    } else {
        LoadingPanel.SetText('Sistem sedang membuka kembali maklumat stor yang terakhir disimpan.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_save.PerformCallback('LOAD');
    }

}

function CetakClicked() {
    cbp_Report.PerformCallback();
}

function CarianClicked() {
    pcSearch.Show();
    gvSearch.PerformCallback();
}

function AuditClicked()
{ }

function TutupClicked()
{ }

function LampiranClicked()
{ }

function GambarClicked()
{ }

function ImpotClicked()
{ }

function ValidateInfo() {
    if (glPtj.GetText() == '') {
        popupMsg_Label.SetText('Pusat Tanggungjawab mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (glStore.GetText() == '') {
        popupMsg_Label.SetText('Stor mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (glLocation.GetText() == '') {
        popupMsg_Label.SetText('Lokasi mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (glStock.GetText() == '') {
        popupMsg_Label.SetText('No Pendaftaran Stok mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }
    //if (cbTransactionType.GetText() == '') {
    //    popupMsg_Label.SetText('Jenis Transaksi mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
    //    popupMsg.Show();
    //    return false;
    //}

    //if (cbTransactionType.GetText() == 'Masuk') {
    //    if (txtInQuantity.GetText() == '') {
    //        popupMsg_Label.SetText('Kuantiti Di Terima mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
    //        popupMsg.Show();
    //        return false;
    //    }
    //}
    //else if (cbTransactionType.GetText() == 'Keluar') {
    //    if (txtOutQuantity.GetText() == '') {
    //        popupMsg_Label.SetText('Kuantiti Di Keluar mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
    //        popupMsg.Show();
    //        return false;
    //    }
    //}
    //else {
    //    popupMsg_Label.SetText('Jenis Transaksi mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
    //    popupMsg.Show();
    //    return false;
    //}

    if (txtParasMenokok.GetText() == '') {
        popupMsg_Label.SetText('Paras Menokok mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    return true;
}

function ResetControlText() {

    glPtj.SetValue(null);
    glStore.SetValue(null);
    glLocation.SetValue(null);
    glStock.SetValue(null);
    txtStockDetail.SetText('');
    txtStockGroup.SetText('');
    txtStockMeasurement.SetText('');
    txtStockCategory.SetText('');
    txtStockSubCategory.SetText('');
    //cbTransactionType.SetText('');
    txtNoPkBppsBtb.SetText('');
    //txtCurrentBalance.SetText('');
    txtParasMenokok.SetText('');
    txtInTo.SetText('');
    txtInQuantityRequest.SetText('');
    txtInQuantity.SetText('');
    txtInUnitPrice.SetText('');
    //txtOutTo.SetText('');
    //txtOutQuantityRequest.SetText('');
    //txtOutQuantity.SetText('');
}

function FillStockInfo(Values) {
    alert(Values);
    txtStockDetail.SetText(Values[0].toString());
    txtStockMeasurement.SetText(Values[1].toString());
    txtStockSubCategory.SetText(Values[3].toString());
    txtStockCategory.SetText(Values[4].toString());
    txtStockGroup.SetText(Values[2].toString());
}

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

function ManageForm(truefalse) {
    if (truefalse == 'true') {
        glPtj.SetEnabled(true);
        glStore.SetEnabled(true);
        glLocation.SetEnabled(true);
        glStock.SetEnabled(true);
        txtStockDetail.SetEnabled(true);
        txtStockGroup.SetEnabled(true);
        txtStockMeasurement.SetEnabled(true);
        txtStockCategory.SetEnabled(true);
        txtStockSubCategory.SetEnabled(true);
        txtNoPkBppsBtb.SetEnabled(true);
        txtParasMenokok.SetEnabled(true);
        txtInTo.SetEnabled(true);
        txtInQuantityRequest.SetEnabled(true);
        txtInQuantity.SetEnabled(true);
        txtInUnitPrice.SetEnabled(true);
    }
    else {
        glPtj.SetEnabled(false);
        glStore.SetEnabled(false);
        glLocation.SetEnabled(false);
        glStock.SetEnabled(false);
        txtStockDetail.SetEnabled(false);
        txtStockGroup.SetEnabled(false);
        txtStockMeasurement.SetEnabled(false);
        txtStockCategory.SetEnabled(false);
        txtStockSubCategory.SetEnabled(false);
        //cbTransactionType.SetEnabled(false);
        txtNoPkBppsBtb.SetEnabled(false);
        //txtCurrentBalance.SetEnabled(false);
        txtParasMenokok.SetEnabled(false);
        txtInTo.SetEnabled(false);
        txtInQuantityRequest.SetEnabled(false);
        txtInQuantity.SetEnabled(false);
        txtInUnitPrice.SetEnabled(false);
        //txtOutTo.SetEnabled(false);
        //txtOutQuantityRequest.SetEnabled(false);
        //txtOutQuantity.SetEnabled(false);
    }
}

function cbp_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() != '') {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        return;
    }

    if (s.cpMode.toString() == 'SAVE') {
        popupMsg_Label.SetText('Rekod stor telah berjaya disiampan.');
        popupMsg.Show();
    }
    else if (s.cpMode.toString() == 'DELETE') {
        popupMsg_Label.SetText('Rekod stor telah berjaya dipadam.');
        popupMsg.Show();
    }
    else if (s.cpMode.toString() == 'LOAD') {
        cbp_LocationInfo.PerformCallback('LOAD');
        PopupSearch.Hide();
        ManageForm('false');
        ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
    }
    else if (s.cpMode.toString() == 'CANCEL') {
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        ManageForm('false');
    }
}