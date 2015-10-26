function cbp_Test_EndCallback(s, e)
{
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() == '')
    {
        PopupTestEmailConfig.Hide();
        popupMsg_Label.SetText('Emel ujian telah berjaya dihantar.');
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

function btnTest_Clicked()
{
    if (testEmailAddress.GetText() == '')
    { }
    else
    {
        LoadingPanel.SetText('Sistem sedang menghantar emel ujian.  Sila tunggu');
        LoadingPanel.Show();
        cbp_Test.PerformCallback();
    }
}

function cbp_EndCallback(s, e)
{
    LoadingPanel.Hide();

    if (s.cpMode.toString() == 'LOAD')
    {
        if (s.cpErrMsg.toString() == '') {
            EnableDisableMainForm('false');
            ManageMainRibbonUtamaTab('true', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'true');
            NetworkPasword.SetText(s.cpPassword.toString());
        }
        else
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }
    else
    {
        if (s.cpErrMsg.toString() == '')
        {
            EnableDisableMainForm('false');
            ManageMainRibbonUtamaTab('true', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'true');
            NetworkPasword.SetText(s.cpPassword.toString());
            LastModBy.SetText(s.cpLastModBy.toString());
            LastModDate.SetText(s.cpLastModDate.toString());
            popupMsg_Label.SetText('Konfigurasi emel telah berjaya disimpan.');
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
}

function EnableDisableMainForm(Enable)
{
    if (Enable == 'true') {
        HostName.SetEnabled(true);
        SenderName.SetEnabled(true);
        NetworkId.SetEnabled(true);
        NetworkPasword.SetEnabled(true);
        PortNumber.SetEnabled(true);
        EnableSsl.SetEnabled(true);
        BypassSecurityValidation.SetEnabled(true);
        MainFormBtnTest.SetEnabled(true);
    }
    else {
        HostName.SetEnabled(false);
        SenderName.SetEnabled(false);
        NetworkId.SetEnabled(false);
        NetworkPasword.SetEnabled(false);
        PortNumber.SetEnabled(false);
        EnableSsl.SetEnabled(false);
        BypassSecurityValidation.SetEnabled(false);
        MainFormBtnTest.SetEnabled(false);
    }

}


function OnPageLoad() {
    MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
    MainRibbon.GetItemByName("Gambar").SetEnabled(false);
    MainRibbon.GetItemByName("Impot").SetEnabled(false);
    MainRibbon.GetItemByName("Lulus").SetEnabled(false);
    MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
    LoadingPanel.SetText('Sistem sedang membuka kembali konfigurasi emel yang terakhir disimpan.  Sila tunggu');
    LoadingPanel.Show();
    cbp.PerformCallback('LOAD');
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

function KemaskiniClicked()
{
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
    EnableDisableMainForm('true');
}

function TambahClicked()
{ }

function SimpanClicked()
{
    LoadingPanel.SetText('Sistem sedang menyimpan konfigurasi emel.  Sila tunggu');
    LoadingPanel.Show();
    cbp.PerformCallback('SAVE');
}

function HantarClicked()
{ }

function PadamClicked()
{ }

function BatalCicked()
{
    LoadingPanel.SetText('Sistem sedang membuka kembali konfigurasi emel yang terakhir disimpan.  Sila tunggu');
    LoadingPanel.Show();
    cbp.PerformCallback('LOAD');
}

function CetakClicked()
{ }

function CarianClicked()
{ }

function AuditClicked()
{ }

function TutupClicked()
{
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
