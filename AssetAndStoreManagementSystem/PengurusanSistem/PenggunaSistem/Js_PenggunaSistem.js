function GridSystemUserRole_EndCallback(s, e)
{
    if (s.cpEnableForm.toString() == 'true')
    {
        EnableDisableMainForm('true');
        EmployeeId.SetEnabled(false);
        EmployeeSystemId.SetEnabled(false);
        EmployeeName.SetEnabled(false);
    }
    else
    {
        EnableDisableMainForm('false');
    }
}

function ProceedWithDelete() {
    popupDeleteConfirmation.Hide();
    LoadingPanel.SetText('Sistem sedang memadam rekod pengguna sistem yang dipilih.  Sila tunggu sebentar');
    LoadingPanel.Show();
    cbp_Save.PerformCallback('DELETE');
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
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'true');
    EnableDisableMainForm('true');
}

function EnableDisableMainForm(truefalse)
{
    if (truefalse == 'true')
    {
        UserGroupId.SetEnabled(true);
        AllPtjAccess.SetEnabled(true);
        Status.SetEnabled(true);
    }
    else
    {
        UserGroupId.SetEnabled(false);
        AllPtjAccess.SetEnabled(false);
        Status.SetEnabled(false);
    }
}

function TambahClicked() {
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
    //reset the entry form
    UserSystemId.SetText('');    
    EmployeeId.SetText('');
    EmployeeSystemId.SetText('')
    EmployeeName.SetValue(null);
    UserGroupId.SetValue(null);
    AllPtjAccess.SetValue(null);
    Status.SetValue(null);
    EnableDisableMainForm('true');

    //refresh the grid
    GridSystemUserRole.PerformCallback('true');
    LookupEmployee.SetVisible(true);
    
    UserGroupId.Focus();
}

function SimpanClicked() {
    //check mandatoty fields
    if (EmployeeSystemId.GetText() == '' || UserGroupId.GetText() == '' || AllPtjAccess.GetValue().toString() == '' || Status.GetValue().toString() == '') {
        popupMsg_Label.SetText('Sila pastikan semua medan telah diisi.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
    else {
        LoadingPanel.SetText('Sistem sedang menyimpan rekod.  Sila tunggu');
        LoadingPanel.Show();
        cbp_Save.PerformCallback('SAVE');
    }
}

function HantarClicked()
{ }

function PadamClicked()
{ popupDeleteConfirmation.Show(); popupDeleteConfirmation_BtnOk.Focus(); }

function BatalCicked() {
    if (UserSystemId.GetText() == '')
    {
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');

        //reset the entry form
        UserSystemId.SetText('');
        EmployeeId.SetText('');
        EmployeeSystemId.SetText('')
        EmployeeName.SetValue(null);
        UserGroupId.SetValue(null);
        AllPtjAccess.SetValue(null);
        Status.SetValue(null);
        LookupEmployee.SetVisible(false);

        EnableDisableMainForm('false');

        //refresh the grid
        GridSysUserCredentials.PerformCallback('false');
    }
    else {
        LoadingPanel.SetText('Sistem sedang membuka kembali maklumat yang terakhir disimpan.  Sila tunggu sebentar');
        LoadingPanel.Show();
        cbp_Load.PerformCallback();
    }
}

function CetakClicked()
{ cbp_Report.PerformCallback(); }

function CarianClicked() {
    GridSearchSystemUser.PerformCallback();
    PopupSearchSystemUser.Show();
}

function AuditClicked() {
    PopupAuditTrail.SetWidth(screen.width * 0.85);
    PopupAuditTrail.Show()
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

function cbp_Save_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() == '') {
        if (s.cpMode.toString() == 'SAVE') {
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            EnableDisableMainForm('false');

            if (s.cpUserSystemId.toString() != "")
                UserSystemId.SetText(s.cpUserSystemId.toString());

            popupMsg_Label.SetText('Rekod telah berjaya disimpan.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else {
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            popupMsg_Label.SetText('Rekod telah berjaya dipadam.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();

            //reset the entry form
            EmployeeId.SetText('');
            EmployeeSystemId.SetText('')
            EmployeeName.SetValue(null);
            UserGroupId.SetValue(null);
            AllPtjAccess.SetValue(null);
            Status.SetValue(null);

            //refresh the grid
            GridSystemUserRole.PerformCallback('false');
        }
    }
    else {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
}

function cbp_Load_EndCallback(s, e)
{
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() == '') {
        ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        GridSystemUserRole.PerformCallback('false');
        LookupEmployee.SetVisible(false);
    }
    else {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
    }
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

function UserGroupSelected(UserGroupIdValue) {
    UserGroupId.SetText(UserGroupIdValue.toString());
    PopupSearchSystemUserGroup.Hide();
    LoadingPanel.SetText('Sistem sedang membuka maklumat kumpulan pengguna sistem yang telah dipilih.  Sila tunggu sebentar');
    LoadingPanel.Show();
    cbp_Load.PerformCallback();
}

function AuditDetailSelected(ProcessId) {
    GridAuditHeaderDetails.PerformCallback(ProcessId);
}

function LoadEmployeeLookupWindow() {
    PopupLookupEmployee.SetContentUrl('../../SharedControls/EmployeeLookup_SingleRecord/Index.aspx');
    PopupLookupEmployee.Show();
}

function SetSelectedEmployee(EmpSysId)
{ }

function cbp_Report_EndCallback(s, e)
{
    window.open('../../Report/Viewer/Index.aspx');
}