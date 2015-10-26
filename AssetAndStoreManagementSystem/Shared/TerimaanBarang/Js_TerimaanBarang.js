function OnPageLoadEvents()
{
    PageControl.SetActiveTabIndex(0);
    PageControl.SetVisible(true);
    MainRibbon.GetItemByName("Gambar").SetEnabled(false);
    MainRibbon.GetItemByName("Impot").SetEnabled(false);
    MainRibbon.GetItemByName("Lulus").SetEnabled(false);
    MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
    MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
    EnableDisableHeaderForm('false');
}

function ManageMainRibbonUtamaTab(Kemaskini, Tambah, Simpan, Hantar, Padam, Batal, PrintGRN, PrintList, Carian, Audit, Tutup) {
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

    if (PrintGRN == 'true')
        MainRibbon.GetItemByName("PrintGRN").SetEnabled(true);
    else
        MainRibbon.GetItemByName("PrintGRN").SetEnabled(false);

    if (PrintList == 'true')
        MainRibbon.GetItemByName("PrintList").SetEnabled(true);
    else
        MainRibbon.GetItemByName("PrintList").SetEnabled(false);

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
        case 'PrintGRN': PrintGRNClicked(); break;
        case 'PrintList': PrintListClicked(); break;
        case 'Carian': CarianClicked(); break;
        case 'Audit': AuditClicked(); break;
        case 'Lampiran': LampiranClicked(); break;
        case 'Gambar': GambarClicked(); break;
        case 'Impot': ImpotClicked(); break;
    }
}

function LulusClicked()
{ WorkflowApproveReject('1'); }

function KuiriClicked()
{ WorkflowApproveReject('0'); }

function KemaskiniClicked()
{
   
}

function TambahClicked() {
    LoadingPanel.SetText('Sistem sedang bersedia untuk memproses rekod permohonan belian baharu.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_GRN.PerformCallback('NEW');
    //PopupGRN.Show();
    //HeaderMode.SetText('1');
    //GRNH_PrNumber.GetGridView().Refresh();
    //GRNH_PrNumber.SetEnabled(true);
    //ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true', 'true');
}


function SimpanClicked() {
    if (CheckHeader())
    {
        cbp_GrnSavePost.PerformCallback('SAVE');
    }
}

function HantarClicked()
{
    if (CheckHeader() && CheckSenaraiSemak())
    {
        cbp_GrnSavePost.PerformCallback('POST');
    }
}

function PadamClicked()
{ }

function BatalCicked()
{ }

function PrintGRNClicked() {
    alert('print this GRN only');
}

function PrintListClicked() {
    alert('print GRN Listing');
}

function CarianClicked() {
    popupLookupGRN.SetContentUrl('Lookup/Index.aspx');
    popupLookupGRN.Show();
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

function CheckHeader()
{
    if(
        GRNH_PrNumber.GetText() == '' ||
        GRNH_SupplierRef.GetText() == '' ||
        GRNH_DeliveryDate.GetText() == '' ||
        GRNH_SetVenAddress.GetText() == ''
        )
    {
        popupMsg_Label.SetText('No. Pesanan Belian, No. Rujukan Pembekal, Tarikh Terimaan dan Alamat Pembekal mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
        return false;
    }
    else
        return true;
}

function CheckSenaraiSemak()
{
    if (CHK_CheckedBy.GetText() == '')
    {
        popupMsg_Label.SetText('Senarai semak belum diperakui.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
        return false;
    }
    else
        return true;
}

function WorkflowApproveReject(ApproveReject) {
    WF_Text.SetText('');
    WF_Result.SetText('');
    WF_Comment.SetText('');

    if (ApproveReject.toString() == '1') {
        WF_Text.SetText('LULUS');
        WF_Result.SetText('1');
    }
    else {
        WF_Text.SetText('KUIRI');
        WF_Result.SetText('0');
    }

    popupApprovalComments.Show();
}

function Manage_Toolbar_PopupGRN(btnEdit, btnSave, btnSubmit, btnDelete, btnCancel, btnPrint, btnAudit) {
    Toolbar_PopupGRN.GetItemByName('btnEdit').SetEnabled(btnEdit);
    Toolbar_PopupGRN.GetItemByName('btnSave').SetEnabled(btnSave);
    Toolbar_PopupGRN.GetItemByName('btnSubmit').SetEnabled(btnSubmit);
    Toolbar_PopupGRN.GetItemByName('btnDelete').SetEnabled(btnDelete);
    Toolbar_PopupGRN.GetItemByName('btnCancel').SetEnabled(btnCancel);
    Toolbar_PopupGRN.GetItemByName('btnSearch').SetEnabled(btnSearch);
    Toolbar_PopupGRN.GetItemByName('btnAudit').SetEnabled(btnAudit);
}

GRNH_PrNumber_ValueChanged(s, e);{
    if (s.GetText() != '') {
        var grid = s.GetGridView();
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'SupplierName;', FillSupplierInformation);
    }
}

function FillSupplierInformation(Values) {
    GRNH_SetVen_Name.SetText(Values[0].toString());
}