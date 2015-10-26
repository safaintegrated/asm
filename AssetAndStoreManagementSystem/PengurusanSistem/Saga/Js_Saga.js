function cbp_Test_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() == '') {
        popupMsg_Label.SetText('Ujian konfigurasi SAGA telah berjaya.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
    else {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
}

function TestConfig() {
    LoadingPanel.SetText('Sistem sedang menguji konfigurasi SAGA.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_Test.PerformCallback();
}

function OnPageLoad(ErrMsg, Pass) {
    MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
    MainRibbon.GetItemByName("Gambar").SetEnabled(false);
    MainRibbon.GetItemByName("Impot").SetEnabled(false);
    MainRibbon.GetItemByName("Lulus").SetEnabled(false);
    MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
    MainForm.SetEnabled(false);

    if (ErrMsg.toString() == '') {
        ManageMainRibbonUtamaTab('true', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'true');
        txt_Password.SetText(Pass.toString());
    }
    else {
        ManageMainRibbonUtamaTab('false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'true');
    }
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
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
    MainForm.SetEnabled(true);
}

function TambahClicked()
{ }

function SimpanClicked() {
    LoadingPanel.SetText('Sistem sedang menyimpan konfigurasi SAGA.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp.PerformCallback('SAVE');
}

function HantarClicked()
{ }

function PadamClicked()
{ }

function BatalCicked() {
    LoadingPanel.SetText('Sistem sedang membuka kembali konfigurasi SAGA yang terakhir disimpan.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp.PerformCallback('LOAD');
}

function CetakClicked()
{ }

function CarianClicked()
{ }

function AuditClicked() {
    GridAuditListing.PerformCallback();
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