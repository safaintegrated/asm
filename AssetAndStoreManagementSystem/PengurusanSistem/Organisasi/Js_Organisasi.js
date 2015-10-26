function LogoSelector_FileUploadComplete(s, e)
{
    if (e.isValid)
    {
        if (s.cpErrMsg.toString() == '')
        {
            PopupUploadLogo.Hide();
            cbp_OrgLogo.PerformCallback();
        }
        else {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }
    else {
        popupInvalidAttachment.Show();
    }
}

function LogoSelector_TextChanged(s, e) {
    LogoSelector.Upload();
}

function AuditDetailSelected(ProcessId)
{
    GridAuditDetails.PerformCallback(ProcessId);
}

function OnPageLoad() {
    LoadingPanel.SetText('Membuka maklumat organisasi yang terakhir disimpan.  Sila tunggu sebentar..');
    cbp_Save.PerformCallback('LOAD');
    MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
    MainRibbon.GetItemByName("Gambar").SetEnabled(false);
    MainRibbon.GetItemByName("Impot").SetEnabled(false);
    MainRibbon.GetItemByName("Lulus").SetEnabled(false);
    MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
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
    FormOrganization.SetEnabled(true);
}

function TambahClicked()
{ }

function SimpanClicked() {
    //check mandatoty fields
    if (Org_Name.GetText() == '' || Org_Add1.GetText() == '' || Org_Website.GetText() == '') {
        popupMsg_Label.SetText('Sila pastikan Nama, Alamat 1 dan Laman Sesawang telah diisi.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
    else {
        LoadingPanel.SetText('Sistem sedang menyimpan rekod.  Sila tunggu');
        LoadingPanel.Show();
        cbp_SaveOrg.PerformCallback();
    }
}

function HantarClicked()
{ }

function PadamClicked()
{ }

function BatalCicked()
{
    LoadingPanel.SetText('Membuka maklumat organisasi yang terakhir disimpan.  Sila tunggu sebentar..');
    cbp_Save.PerformCallback('LOAD');
}

function CetakClicked()
{ }

function CarianClicked()
{ }

function AuditClicked()
{
    PopupAuditTrail.SetWidth(screen.width * 0.7);
    PopupAuditTrail.Show();
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

function ManageMainRibbonUtamaTab(Kemaskini, Tambah, Simpan, Hantar, Padam, Batal, Cetak, Carian, Audit, Tutup)
{
    if (EnableUpdate.GetText() == 'True')
    {
        if (Kemaskini == 'true')
            MainRibbon.GetItemByName("Kemaskini").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Kemaskini").SetEnabled(false);
    }   

    if (EnableCreate.GetText() == 'True')
    {
        if (Tambah == 'true')
            MainRibbon.GetItemByName("Tambah").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Tambah").SetEnabled(false);
    }   

    if (Simpan == 'true')
        MainRibbon.GetItemByName("Simpan").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Simpan").SetEnabled(false);

    if (Hantar == 'true')
        MainRibbon.GetItemByName("Hantar").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Hantar").SetEnabled(false);

    if (EnableDelete.GetText() == 'True')
    {
        if (Padam == 'true')
            MainRibbon.GetItemByName("Padam").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Padam").SetEnabled(false);
    }   

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

function cbp_Save_BeginCallback()
{ LoadingPanel.Show(); }

function cbp_Save_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() == '') {
        ManageMainRibbonUtamaTab('true', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'true', 'true');
        FormOrganization.SetEnabled(false);

        if (s.cpMode.toString() == 'SAVE') {
            popupMsg_Label.SetText('Rekod telah berjaya disimpan.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }
    else {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
}

function cbp_SaveOrg_EndCallback(s, e)
{
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() == '')
    {
        ManageMainRibbonUtamaTab('true', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'true', 'true');
        FormOrganization.SetEnabled(false);       
        popupMsg_Label.SetText('Rekod telah berjaya disimpan.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
    else
    {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
}