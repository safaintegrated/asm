function cbp_MainEndCallBack(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() != '') {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        return;
    }

    if (s.cpMode.toString() == 'ADDSTOCK') {
        popupSearchStock.Hide();
        return;
    }

    if (s.cpMode.toString() == 'DOWNLOAD_PEMERIKSAAN_LIST') {
        return;
    }

    if (s.cpMode.toString() == 'SAVE') {

        EnableDisablePemeriksaanTab('false');
        ManageMainRibbonUtamaTab('true', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'false', 'true');
        popupMsg_Label.SetText('Rekod Pemeriksaan telah disimpan dengan jayanya.');
        popupMsg.Show();
        RefreshReferenceSection();
        return;
    }
    if (s.cpMode.toString() == 'POST') {
        EnableDisablePemeriksaanTab('false');
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
        RefreshReferenceSection();
        RefreshAliranKerja();

        if (s.cpMailErr.toString() == '')
        { popupMsg_Label.SetText('Rekod Pemeriksaan telah dihantar dengan jayanya.'); }
        else
        { popupMsg_Label.SetText(s.cpMailErr.toString()); }

        popupMsg.Show();
        return;
    }

    if (s.cpMode.toString() == 'LOAD') {
        popupSearch.Hide();
        glLembagaName_ValueChanged();
        RefreshReferenceSection();
        //EnableDisablePemeriksaanTab('false');
        ManagePage();
        return;
    }
}
    
    function OnHasilPemeriksaanEndCallBack(s, e) {
    ManageMainRibbonUtamaTab('true', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
}

function PemeriksaanFileUploadComplete(s, e) {
    txtFileName.SetText(e.callbackData);
    cbp_HasilPemeriksaan.PerformCallback();
}

function SelectStock() {
    LoadingPanel.SetText('Sistem sedang mendaftar stok yang telah dipilih.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    //cbp_TabPemeriksaan.PerformCallback('ADDSTOCK')
    cbp_Main.PerformCallback('ADDSTOCK');
}

function RefreshReferenceSection() {
    //Ref_RowId.SetText(PEMH_RowId.GetText());
    //cbp_Ref.PerformCallback();
}

function PemeriksaanSelected(id) {
    LoadingPanel.SetText('Sistem sedang membuka maklumat Pemeriksaan.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    alert('1');
    txtPemeriksaanId.SetText(id.toString());
    alert('2');
    //cbp_TabPemeriksaan.PerformCallback('LOAD');
    cbp_Main.PerformCallback('LOAD');
    alert('31');
}

function OnPageLoadEvents() {
    PageControl.SetActiveTabIndex(0);
    PageControl.SetVisible(true);

    //PageControl.GetTab(1).SetVisible(false);
    //PageControl.GetTab(2).SetVisible(false);
    //PageControl.GetTab(3).SetVisible(false);
    //PageControl.GetTab(4).SetVisible(false);

    ManageMainRibbonUtamaTab('false', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
    glLembagaName.SetEnabled(false);
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
    //var index = tabCtrl.GetActiveTabIndex();
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'false');
    EnableDisablePemeriksaanTab('true');
}

function TambahClicked() {
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
    cbp_TabPemeriksaan.PerformCallback('ADD');
}

function SimpanClicked() {
    if (CheckPemeriksaanForm()) {
        LoadingPanel.SetText('Sistem sedang menyimpan rekod pemeriksaan. Sila tunggu..');
        LoadingPanel.Show();
        cbp_TabPemeriksaan.PerformCallback('SAVE');
    }
}

function cbp_EndCallback(s, e) {
    LoadingPanel.Hide();
}


function HantarClicked() {
    if (CheckPemeriksaanForm() && CheckAssetInvList()) {
        LoadingPanel.SetText('Sistem sedang menghantar rekod pemeriksaan.  Sila tunggu..');
        LoadingPanel.Show();
        cbp_TabPemeriksaan.PerformCallback('POST');
    }
}


function PadamClicked()
{ }

function BatalCicked()
{ }

function CetakClicked()
{ }

function CarianClicked() {
    popupSearch.SetWidth(screen.width * 0.85);
    popupSearch.Show();
    GridSearch.PerformCallback();
}

function AuditClicked()
{ }

function TutupClicked()
{ window.close(); }

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

function LookupStok() {
    var storeId = txtStoreId.GetText();
    txtPemeriksaanStoreId.SetText(storeId);
    popupSearchStock.SetWidth(screen.width * 0.85);
    popupSearchStock.Show();
    gvSearchStockReg.PerformCallback();

    //cbp_Main.PerformCallback('LOAD_STOCK');
}

function DownloadListForPemeriksaan() {
    cbp_TabPemeriksaan.PerformCallback('DOWNLOAD_PEMERIKSAAN_LIST');
}

function glLembagaName_ValueChanged() {
    if (glLembagaName.GetText() != '') {
        LoadingPanel.SetText('Sistem sedang menyenaraikan semua ahli Lembaga Pemeriksa.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Main.PerformCallback('LOAD_LEMBAGA_PEMERIKSAAN');
    }
}

function FillPemeriksaanInfo(Values) {
    //txtStoreId.SetText(Values);
}

function BtnSubmit_Click() {

    //cbp_TabPemeriksaan.PerformCallback('REFRESH_MAKLUMAT_STOR');
}


function S_Name_Valued() {
    if (S_Name.GetText() != '')
        Loadingpanel.setText('Sistem sedang menyenaraikan semua stock. Sila tunggu sebentar..');
    Loadingpanel.show();
    cbp_TabPmeriksaan.PerformCallback('STOCK');

}

function btnGenerateAssInvList_Click() {
    LoadingPanel.SetText('Sistem sedang mennyenaraikan semua aset alih mengikut kriteria carian.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_TabPemeriksaan.PerformCallback('ASSETINV');
}

function cbp_TabPemeriksaan_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() != '') {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        return;
    }

    if (s.cpMode.toString() == 'ADDSTOCK') {
        popupSearchStock.Hide();
        return;
    }

    if (s.cpMode.toString() == 'DOWNLOAD_PEMERIKSAAN_LIST') {
        return;
    }

    if (s.cpMode.toString() == 'SAVE') {

        EnableDisablePemeriksaanTab('false');
        ManageMainRibbonUtamaTab('true', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'false', 'true');
        popupMsg_Label.SetText('Rekod Pemeriksaan telah disimpan dengan jayanya.');
        popupMsg.Show();
        RefreshReferenceSection();
        return;
    }
    if (s.cpMode.toString() == 'POST') {
        EnableDisablePemeriksaanTab('false');
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
        RefreshReferenceSection();
        RefreshAliranKerja();

        if (s.cpMailErr.toString() == '')
        { popupMsg_Label.SetText('Rekod Pemeriksaan telah dihantar dengan jayanya.'); }
        else
        { popupMsg_Label.SetText(s.cpMailErr.toString()); }

        popupMsg.Show();
        return;
    }

    if (s.cpMode.toString() == 'LOAD') {
        popupSearch.Hide();
        glLembagaName_ValueChanged();
        RefreshReferenceSection();
        //EnableDisablePemeriksaanTab('false');
        ManagePage();
        return;
    }
}

function ManagePage() {
    //if (PEMH_Status.GetText() == "2") {
    //    ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
    //}
    //else if (PEMH_Status.GetText() == "37") {
    //    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
    //    PEM_WFD_PEMH_RowId.SetText(PEMH_RowId.GetText());
    //    GridWorkflow.PerformCallback();
    //    RefreshAliranKerja();

    //    var HasilPemeriksaan = PageControl.GetTab(1);
    //    HasilPemeriksaan.SetVisible(true);
    //    Result_RowId.SetText(PEMH_RowId.GetText());
    //    Result_CsvFileName.SetText('');
    //}
}

function CheckPemeriksaanForm() {
    if (glLembagaName.GetText() == '') {
        popupMsg_Label.SetText('Nama Pemeriksaan, Tarikh Mula, Tarikh Tamat dan Nama Lembaga Pemeriksa perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    return true;
}


function EnableDisablePemeriksaanTab(truefalse) {
    if (truefalse == 'true') {

        txtNamaPemeriksaan.SetEnabled(true);
        mmKeterangan.SetEnabled(true);
        deTarikhMula.SetEnabled(true);
        deTarikhTamat.SetEnabled(true);
        //PEMH_LembagaPemeriksaUniqueId.SetEnabled(true);
        //PEMH_PTJ.SetEnabled(true);
        //PEMH_Dept.SetEnabled(true);
        //PEMH_Block.SetEnabled(true);
        //PEMH_Floor.SetEnabled(true);
        //PEMH_Space.SetEnabled(true);
        //btnGenerateAssInvList.SetEnabled(true);
    }
    else {
        txtNamaPemeriksaan.SetEnabled(false);
        mmKeterangan.SetEnabled(false);
        deTarikhMula.SetEnabled(false);
        deTarikhTamat.SetEnabled(false);
        //PEMH_LembagaPemeriksaUniqueId.SetEnabled(false);
        //PEMH_PTJ.SetEnabled(false);
        //PEMH_Dept.SetEnabled(false);
        //PEMH_Block.SetEnabled(false);
        //PEMH_Floor.SetEnabled(false);
        //PEMH_Space.SetEnabled(false);
        //btnGenerateAssInvList.SetEnabled(false);
    }
}