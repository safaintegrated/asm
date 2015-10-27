function OnPageLoad() {
    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'false', 'true');
}

function cbPenerimaValueChanged(s, e) {
    if (s.GetSelectedItem().value == 0) {
        glPermohonanToPtj.SetEnabled(true);
        glPermohonanToStor.SetEnabled(true);
        glPermohonanToNama.SetEnabled(false);
    } else {
        glPermohonanToPtj.SetEnabled(false);
        glPermohonanToStor.SetEnabled(false);
        glPermohonanToNama.SetEnabled(true);

    }
}

//TambahClicked

function KemaskiniKelulusan() {
    alert('a');
    cbpKelulusan.PerformCallback('KEMASKINI');
    alert('b');
    txtNewOrUpdate.SetText('update');
}

function KemaskiniLulus() {
    cbpKelulusan.PerformCallback('LULUS');
    txtNewOrUpdate.SetText('update');
}

function KemaskiniTidakLulus() {
    cbpKelulusan.PerformCallback('TIDAKLULUS');
    txtNewOrUpdate.SetText('update');
}

function PermohonanSelected(Id) {
    txtNoPemohon.SetText(Id.toString());
    txtKelulusanProcessId.SetText(Id.toString());
    LoadingPanel.SetText('Sistem sedang membuka maklumat permohonan yang dipilih.  Sila tunggu..');
    LoadingPanel.Show();
    txtNewOrUpdate.SetText('update');
    cbpHeader.PerformCallback('LOAD');
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
        case 'CetakKewPs10': CetakKewPs10Clicked(); break; //CetakKewPs10
        case 'CetakKewPs11': CetakKewPs11Clicked(); break; //CetakKewPs11
        case 'Carian': CarianClicked(); break;
        case 'Audit': AuditClicked(); break;
        case 'Lampiran': LampiranClicked(); break;
        case 'Gambar': GambarClicked(); break;
        case 'Impot': ImpotClicked(); break;
    }
}


function CetakKewPs10Clicked() {
    //cbp_Report.PerformCallback('STOR-DAFTARSTOK-KEW.PS-3');
    ('1')
    cbp_Report.PerformCallback('STOK-PERMOHONAN-KEW.PS-10');
}

function CetakKewPs11Clicked() {
    //cbp_Report.PerformCallback('STOR-DAFTARSTOK-KEW.PS-3');
    ('2')
    cbp_Report.PerformCallback('STOK-PERMOHONAN-KEW.PS-11');
}


function LulusClicked()
{ }

function KuiriClicked()
{ }

function KemaskiniClicked() {
    EnableDisableHeaderForm('true');
    EnableDisableSenaraiStok('true');
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'false');
    // EnableDisablePermohonanTab('true');
}

function TambahClicked() {
    LoadingPanel.SetText('Sistem sedang menyediakan rekod Permohonan Stok yang baru.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    txtNewOrUpdate.SetText('new');
    cbp_AddNewPermohonan.PerformCallback();
}

function SimpanClicked() {

    if (txtNewOrUpdate.GetText() == 'new') {
        if (CheckPermohonanForm()) {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod pemeriksaan.  Sila tunggu..');
            LoadingPanel.Show();
            cbpHeader.PerformCallback('SAVE');
        }
    }
    else {
        cbpKelulusan.PerformCallback('KEMASKINI');
    }
}


function cbp_EndCallback(s, e) {
    LoadingPanel.Hide();
}

function HantarClicked() {
    if (CheckPermohonanForm()) {
        LoadingPanel.SetText('Sistem sedang menghantar rekod permohonan.  Sila tunggu..');
        LoadingPanel.Show();
        cbp_Permohonan.PerformCallback('POST');
    }

}

function PadamClicked() {
    popupDeleteHeaderConfirmation_Label.SetText('Padam rekod Permohonan Stok ini (' + txtNoPermohonan.GetText() + ') .<br>Anda pasti?');
    popupDeleteHeaderConfirmation.Show();
    popupDeleteHeaderConfirmation_BtnOk.Focus();
}

function BatalCicked() {
    if (PermohonanId.GetText() == '') {
        LoadingPanel.SetText('Sistem sedang membatalkan rekod Permohonan Stok ini.  Sila tunggu sebentar..');
    }
    else { LoadingPanel.SetText('Sistem sedang membuka kembali maklumat Permohonan Stok ini yang terakhir disimpan.  Sila tunggu sebentar..'); }

    LoadingPanel.Show();
    cbp_Permohonan.PerformCallback('LOAD')
}

function CetakClicked()
{ }

function CarianClicked() {
    psPermohonanStok.SetWidth(screen.width * 0.85);
    psPermohonanStok.Show();
    //gvSearchPermohonanStok.PerformCallback();
}

function AuditClicked()
{ }

function TutupClicked() {
    window.close();
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

function SelectStok() {
    LoadingPanel.SetText('Sistem sedang memproses Stok yang telah dipilih.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_PermohonanStok.PerformCallback('ADDSTOK')
}

function LookupStok() {
    psStok.SetWidth(screen.width * 0.85);
    psStok.Show();
    glStok.PerformCallback();
}

function BeforeDeleteStok(Stock_Id, Stock_RegisterNo) {
    DeleteStokTemp.SetText(Stock_Id.toString());
    popupDeleteGridRowConfirmation_Label.SetText('Padam Stok ini (' + Stock_RegisterNo.toString() + ')?');
    popupDeleteGridRowConfirmation.Show();
    popupDeleteGridRowConfirmation_BtnOk.Focus();
}

function ProceedWithStokDelete() {
    LoadingPanel.SetText('Sistem sedang memadam Stok yang telah dipilih.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_PermohonanStok.PerformCallback('DELETESTOK')
}


function CheckPermohonanForm() {
    if (txtPemohonNama.GetText() == '') {
        popupMsg_Label.SetText('Nama Pemohon perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (glPtjDiPohon.GetText() == '') {
        popupMsg_Label.SetText('PTJ yang dipohon perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (glStorDiPohon.GetText() == '') {
        popupMsg_Label.SetText('Stor yang dipohon perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (glStokDiPohon.GetText() == '') {
        popupMsg_Label.SetText('Stok yang dipohon perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (txtKuantitiDiPohon.GetText() == '') {
        popupMsg_Label.SetText('Kuantiti yang dipohon perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (deTarikhDiperlukan.GetText() == '') {
        popupMsg_Label.SetText('Tarikh diperlukan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (mmTujuan.GetText() == '') {
        popupMsg_Label.SetText('Tujuan permohonan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    return true;
}

function cbp_PermohonanStok_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() != '') {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
        return;
    }
    if (s.cpMode.toString() == 'LOAD') {
        cbpKelulusan.PerformCallback('test');
        psPermohonanStok.Hide();
    }
    else if (s.cpMode.toString() == 'ADD') {
        EnableDisableHeaderForm('true');
        EnableDisableSenaraiStok('true');
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
        txtNamaPemohon.Focus();
    }
    else if (s.cpMode.toString() == 'ADDSTOK')
    { psStok.Hide(); }

    else if (s.cpMode.toString() == 'DELETESTOK')
    { popupDeleteGridRowConfirmation.Hide(); }

    else if (s.cpMode.toString() == 'DELETEHEADER') {
        EnableDisableHeaderForm('false');
        EnableDisableSenaraiStok('false');
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        popupMsg_Label.SetText('Rekod Permohonan Stok telah dipadam dengan jayanya.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }

    else if (s.cpMode.toString() == 'REFRESHSTATUS') {
        EnableDisableHeaderForm('false');
        EnableDisableSenaraiStok('false');
        ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
    }

}

function cbp_EndCallback(s, e) {
    LoadingPanel.Hide();
    (s.cpMode.toString());
    if (s.cpMode.toString() == 'LOAD') {
        psPermohonanStok.Hide();
        //MainForm.SetEnabled(false);
        //ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
    }
}

function ProceedWithDeleteHeader() {
    LoadingPanel.SetText('Sistem sedang memadam maklumat Permohonan Stok yang dipilih.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_PermohonanStok.PerformCallback('DELETEHEADER')
}

function EnableDisableHeaderForm(truefalse) {
    if (truefalse == 'true') {

        txtNamaPemohon.SetEnabled(true);
        glPTJ.SetEnabled(true);
        deTarikhDiperlukan.SetEnabled(true);
        deTarikhPermohonan.SetEnabled(true);
        txtNoPermohonan.SetEnabled(true);
        txtNoKakitangan.SetEnabled(true);
        mTujuan.SetEnabled(true);
        hlCarianStok.SetEnabled(true);
    }
    else {
        txtNamaPemohon.SetEnabled(false);
        glPTJ.SetEnabled(false);
        deTarikhDiperlukan.SetEnabled(false);
        deTarikhPermohonan.SetEnabled(false);
        txtNoPermohonan.SetEnabled(false);
        txtNoKakitangan.SetEnabled(false);
        mTujuan.SetEnabled(false);
        hlCarianStok.SetEnabled(false);

    }
}

function cbp_AddNewPermohonan_EndCallback(s, e) {
    LoadingPanel.Hide();
    txtProcessIdTemp.SetText(s.cpProcessId.toString());
    cbpHeader.PerformCallback('ADD');
}

function cbpHeader_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() != '') {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
        return;
    }

    if (s.cpMode.toString() == 'LOAD') {
        cbpKelulusan.PerformCallback('LOAD');
        psPermohonanStok.Hide();
        return;
    }

    if (s.cpMode.toString() == 'SAVE') {
        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else {
            EnableHeaderForm('false');
            TabItemDetail_EditMode.SetText('0');
            FormPRItemDetails.SetEnabled(false);
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'true', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            MainRibbon.GetItemByName("Lampiran").SetEnabled(false);

            popupMsg_Label.SetText('Rekod permohonan pembelian telah berjaya disimpan.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }
    else if (s.cpMode.toString() == 'POST') {
        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else {
            EnableHeaderForm('false');
            TabItemDetail_EditMode.SetText('0');
            FormPRItemDetails.SetEnabled(false);
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            MainRibbon.GetItemByName("Lampiran").SetEnabled(false);

            cbp_PrRef.PerformCallback();

            popupMsg_Label.SetText('Rekod permohonan pembelian telah berjaya dihantar kepada<br>' + s.cpReceipient.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus()


        }
    }
    else if (s.cpMode.toString() == 'ADD') {
        if (s.cpErrMsg.toString() == '') {
            ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'false', 'true');
            EnableHeaderForm('true');
            //MainRibbon.GetItemByName("Lampiran").SetEnabled(true);
        }
        else {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }
}
