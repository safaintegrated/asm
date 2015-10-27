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

function SelectMember() {
    LoadingPanel.SetText('Sistem sedang mendaftar Ali Lembaga Pemeriksa yang telah dipilih.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_LembagaPemeriksa.PerformCallback('ADDMEMBER')
}

function LookupAhliLembaga() {
    popupSearchEmployee.SetWidth(screen.width * 0.85);
    popupSearchEmployee.Show();
    GridEmpLookup.PerformCallback();
}

function BeforeDeleteMember(EmpId, EmpName) {
    DeleteMemberTemp.SetText(EmpId.toString());
    popupDeleteGridRowConfirmation_Label.SetText('Padam ahli lembaga ini (' + EmpName.toString() + ')?');
    popupDeleteGridRowConfirmation.Show();
    popupDeleteGridRowConfirmation_BtnOk.Focus();
}

function ProceedWithMemberDelete() {
    LoadingPanel.SetText('Sistem sedang memadam Ali Lembaga Pemeriksa yang telah dipilih.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_LembagaPemeriksa.PerformCallback('DELETEMEMBER')
}

function LoadSelectedLembaga(U) {
    txtUniqueId.SetText(U.toString());
    LoadingPanel.SetText('Sistem sedang membuka maklumat Lembaga Pemeriksa yang telah dipilih.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_LembagaPemeriksa.PerformCallback('LOAD');
}

function cbp_SavePostDelete_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() != '') {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
    else {
        if (s.cpMode.toString() == 'SAVE') {
            EnableDisableHeaderForm('false');
            EnableDisableLembagaMembersGrid('false');
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'true', 'true');
            popupMsg_Label.SetText('Rekod Lembaga Pemeriksa telah disimpan dengan jayanya.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
            cbp_LembagaPemeriksa.PerformCallback('REFRESHSTATUS');
        }
        else if (s.cpMode.toString() == 'POST') {
            EnableDisableHeaderForm('false');
            EnableDisableLembagaMembersGrid('false');
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            popupMsg_Label.SetText('Rekod Lembaga Pemeriksa telah dihantar dengan jayanya.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
            cbp_LembagaPemeriksa.PerformCallback('REFRESHSTATUS');
        }
    }
}

function cbp_LembagaPemeriksa_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() != '') {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
    else {
        if (s.cpMode.toString() == 'LOAD') {
            EnableDisableHeaderForm('false');
            EnableDisableLembagaMembersGrid('false');

            if (txtUniqueId.GetText() == '')
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            else
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            popupSearchLembagaPemeriksa.Hide();
        }
        else if (s.cpMode.toString() == 'ADD') {
            EnableDisableHeaderForm('true');
            EnableDisableLembagaMembersGrid('true');
            ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
            txtNamaPemeriksaan.Focus();
        }
        else if (s.cpMode.toString() == 'ADDMEMBER')
        { popupSearchEmployee.Hide(); }
        else if (s.cpMode.toString() == 'DELETEMEMBER')
        { popupDeleteGridRowConfirmation.Hide(); }
        else if (s.cpMode.toString() == 'DELETEHEADER') {
            EnableDisableHeaderForm('false');
            EnableDisableLembagaMembersGrid('false');
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            popupMsg_Label.SetText('Rekod Lembaga Pemeriksa telah dipadam dengan jayanya.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else if (s.cpMode.toString() == 'REFRESHSTATUS') {
            EnableDisableHeaderForm('false');
            EnableDisableLembagaMembersGrid('false');
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        }
    }
}

function ProceedWithDeleteHeader() {
    LoadingPanel.SetText('Sistem sedang memadam maklumat Lembaga Pemeriksa yang dipilih.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_LembagaPemeriksa.PerformCallback('DELETEHEADER')
}

function OnPageLoadEvents() {
    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
    MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
    MainRibbon.GetItemByName("Gambar").SetEnabled(false);
    MainRibbon.GetItemByName("Impot").SetEnabled(false);
    MainRibbon.GetItemByName("Lulus").SetEnabled(false);
    MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
    EnableDisableHeaderForm('false');
}

function EnableDisableHeaderForm(EnableDisable) {
    if (EnableDisable == 'true') {
        txtNamaPemeriksaan.SetEnabled(true);
        glPtj.SetEnabled(true);
        seTahunPemeriksaan.SetEnabled(true);
        deTarikhMula.SetEnabled(true);
        deTarikhTamat.SetEnabled(true);
        LinkLookupEmployee.SetEnabled(true);
        glStor.SetEnabled(true);
    }
    else {
        txtNamaPemeriksaan.SetEnabled(false);
        glPtj.SetEnabled(false);
        seTahunPemeriksaan.SetEnabled(false);
        deTarikhMula.SetEnabled(false);
        deTarikhTamat.SetEnabled(false);
        LinkLookupEmployee.SetEnabled(false);
        glStor.SetEnabled(false);
    }
}


function LulusClicked()
{ }

function KuiriClicked()
{ }

function KemaskiniClicked() {
    EnableDisableHeaderForm('true');
    EnableDisableLembagaMembersGrid('true');
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'true', 'true', 'false', 'false', 'false', 'true');
}

function TambahClicked() {
    LoadingPanel.SetText('Sistem sedang bersedia untuk menerima maklumat Lembaga Pemeriksa baharu.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_LembagaPemeriksa.PerformCallback('ADD');
}

function SimpanClicked() {
    if (CheckHeaderForm()) {
        LoadingPanel.SetText('Sistem sedang menyimpan maklumat Lembaga Pemeriksa.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_SavePostDelete.PerformCallback('SAVE')
    }
}

function HantarClicked() {
    if (CheckHeaderForm() && CheckLembagaMembers() && CheckLembagaMembersRole()) {
        EnableDisableHeaderForm('true');
        EnableDisableLembagaMembersGrid('true');
        LoadingPanel.SetText('Sistem sedang menghantar maklumat Lembaga Pemeriksa.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_SavePostDelete.PerformCallback('POST')
    }
}

function PadamClicked() {
    popupDeleteHeaderConfirmation_Label.SetText('Padam rekod Lembaga Pemeriksa ini (' + txtNamaPemeriksaan.GetText() + ') .<br>Anda pasti?');
    popupDeleteHeaderConfirmation.Show();
    popupDeleteHeaderConfirmation_BtnOk.Focus();
}

function BatalCicked() {
    if (txtUniqueId.GetText() == '') {
        LoadingPanel.SetText('Sistem sedang membatalkan rekod Lembaga Pemeriksa ini.  Sila tunggu sebentar..');
    }
    else { LoadingPanel.SetText('Sistem sedang membuka kembali maklumat Lembaga Pemeriksa ini yang terakhir disimpan.  Sila tunggu sebentar..'); }

    LoadingPanel.Show();
    cbp_LembagaPemeriksa.PerformCallback('LOAD')
}

function CetakClicked()
{ }

function CarianClicked() {
    popupSearchLembagaPemeriksa.SetWidth(screen.width * 0.85);
    popupSearchLembagaPemeriksa.SetContentUrl('Lookup/Index.aspx');
    popupSearchLembagaPemeriksa.Show();
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

function CheckHeaderForm() {
    if (txtNamaPemeriksaan.GetText() == '' || glPtj.GetText() == '' || glStor.GetText() == '' || seTahunPemeriksaan.GetText() == '' || deTarikhMula.GetText() == '' || deTarikhTamat.GetText() == '') {
        popupMsg_Label.SetText('Semua medan untuk Lembaga Pemeriksa perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
        return false;
    }
    else
        return true;
}

function CheckLembagaMembers() {
    if (GridLembagaPemeriksa.GetVisibleRowsOnPage() > 0)
        return true;
    else {
        popupMsg_Label.SetText('Sekurang-kurangnya 1 kakitangan diperlukan sebagai ahli Lembaga Pemeriksa.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
        return false;
    }
}

function CheckLembagaMembersRole() {
    var lpass = true;

    var LPD_MIR_Id;

    for (var i = 0; i < GridLembagaPemeriksa.GetVisibleRowsOnPage() ; i++) {
        LPD_MIR_Id = ASPxClientControl.GetControlCollection().GetByName('LPD_MIR_Id' + i.toString());

        if (LPD_MIR_Id.GetText() == '') {
            lpass = false;
            popupMsg_Label.SetText('Setiap ahli lembaga perlu mempunyai peranan.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }

        if (!lpass)
            break;
    }

    return lpass;
}

function EnableDisableLembagaMembersGrid(EnableDisable) {
    var LPD_MIR_Id;
    var LPD_EmpId;

    for (var i = 0; i < GridLembagaPemeriksa.GetVisibleRowsOnPage() ; i++) {
        LPD_MIR_Id = ASPxClientControl.GetControlCollection().GetByName('LPD_MIR_Id' + i.toString());
        LPD_EmpId = ASPxClientControl.GetControlCollection().GetByName('LPD_EmpId' + i.toString());

        if (EnableDisable == 'true') {
            LPD_MIR_Id.SetEnabled(true);
            LPD_EmpId.SetVisible(true);
        }
        else {
            LPD_MIR_Id.SetEnabled(false);
            LPD_EmpId.SetVisible(false);
        }
    }
}