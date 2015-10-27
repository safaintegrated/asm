function BlankStart() {
    PageControl.SetActiveTabIndex(0);
    PageControl.SetVisible(true);
    MainRibbon.GetItemByName("Gambar").SetEnabled(false);
    MainRibbon.GetItemByName("Impot").SetEnabled(false);
    MainRibbon.GetItemByName("Lulus").SetEnabled(false);
    MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
    MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
    EnableHeaderForm('false');    
}

function SelectedPrWithWorkflow()
{ }

function ManageMainRibbonUtamaTab(Kemaskini, Tambah, Simpan, Hantar, Padam, Batal, PrintPr, PrintList, Carian, Audit, Tutup) {
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

    if (PrintPr == 'true')
        MainRibbon.GetItemByName("PrintPr").SetEnabled(true);
    else
        MainRibbon.GetItemByName("PrintPr").SetEnabled(false);

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
        case 'PrintPr': PrintPrClicked(); break;
        case 'PrintList': PrintListClicked(); break;
        case 'Carian': CarianClicked(); break;
        case 'Audit': AuditClicked(); break;
        case 'Lampiran': LampiranClicked(); break;
        case 'Gambar': GambarClicked(); break;
        case 'Impot': ImpotClicked(); break;
    }
}

function LulusClicked()
{ WorkflowApproveReject('1');}

function KuiriClicked()
{ WorkflowApproveReject('0'); }

function KemaskiniClicked()
{
    if (PRH_Status.GetText() == '2')
    {
        //toolbar
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'false', 'false', 'false', 'false', 'false', 'true');

        //header
        EnableHeaderForm('true');

        //list
        LinkAddNewPrItem.SetEnabled(true);
        EnableDisablePrItemListGrid('true');
        TabItemListing_EditMode.SetText('1');

        //details
        TabItemDetail_EditMode.SetText('1');

        if (PRI_PurchaseType.GetText() != '')
            PRFormSettings(PRI_PurchaseType.GetValue().toString());
    }
    else if (PRH_Status.GetText() == '4' || PRH_Status.GetText() == '6' || PRH_Status.GetText() == '8')
    {
        cbp_EditPr.PerformCallback();
    }
}

function TambahClicked()
{
    LoadingPanel.SetText('Sistem sedang menyediakan rekod Permohonan Belian yang baru.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_AddNewPR.PerformCallback();
}

function SimpanClicked()
{
    if (CheckHeaderBeforePosting()) {
        LoadingPanel.SetText('Sistem sedang menyimpan rekod permohonan pembelian.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Header.PerformCallback('SAVE');
    }
}

function HantarClicked()
{
    if (CheckHeaderBeforePosting() && CheckPR_ItemsBeforePosting() && ChecklistVerified())
    {
        LoadingPanel.SetText('Sistem sedang menghantar permohonan pembelian untuk kelulusan.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Header.PerformCallback('POST');
    }
}

function ChecklistVerified()
{
    if (CHK_CheckedBy.GetText() == '') {
        popupMsg_Label.SetText('Senarai semak belum disahkan.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
        return false;
    }
    else
        return true;
}

function CheckHeaderBeforePosting()
{
    if (PRH_PtjId.GetText() == '' ||
PRH_Purpose.GetText() == '' ||
PRH_SetVen_Name.GetText() == '' ||
PRH_ProcurementITypeId.GetText() == '' ||
PRH_ProcurementMethodId.GetText() == '' ||
PRH_ProcurementCatId.GetText() == '')
    {
        popupMsg_Label.SetText('Pastikan semua medan Permohonan Belian Utama telah diisi.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
        return false;
    }
    else
        return true;
}

function CheckPR_ItemsBeforePosting()
{
    if (GridPRItemListing.GetVisibleRowsOnPage() == 0)
    {
        popupMsg_Label.SetText('Sekurang-kurangnya 1 item diperlukan untuk Permohonan Belian.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
        return false;
    }
    else
        return true;
}

function PadamClicked()
{ }

function BatalCicked()
{
    cbp.PerformCallback('CANCEL');
    
}

function PrintPrClicked()
{
    alert('print this PR only');
}

function PrintListClicked()
{
    alert('print PR Listing');
}

function CarianClicked()
{
    popupLookupPr.SetContentUrl('Lookup/Index.aspx');
    popupLookupPr.Show();
}

function AuditClicked()
{ }

function TutupClicked()
{
    window.close();
    return true;
}

function LampiranClicked()
{ AttachmentGrid.PerformCallback(); }

function GambarClicked()
{ }

function ImpotClicked()
{ }

function cbp_AddNewPR_EndCallback(s, e)
{
    //tab header
    LoadingPanel.Hide();
    PRH_ProcessId.SetText(s.cpProcessId.toString());
    TabPermohonan_ProcessId.SetText(s.cpProcessId.toString());
    TabPermohonan_Revision.SetText(s.cpRevision.toString());
    cbp_Header.PerformCallback('ADD');

    //listing
    TabItemListing_PRProcessId.SetText(s.cpProcessId.toString());
    TabItemListing_PrRevision.SetText(s.cpRevision.toString());
    TabItemListing_EditMode.SetText('1');
    GridPRItemListing.PerformCallback();

    //workflow
    Wf_ProcessId.SetText(s.cpProcessId.toString());
    GridPrWorkflow.PerformCallback();

    //checklist
    chkList_ProcessId.SetText(s.cpProcessId.toString());
    cbp_PR_Checklist.PerformCallback('LOAD');

    //details
    PRI_Revision.SetText(s.cpRevision.toString());
    PRI_ProcessId.SetText(s.cpProcessId.toString());
    TabItemDetail_EditMode.SetText('1');

    //reference
    PRH_Revision.SetText(s.cpRevision.toString());
    PRH_ProcessId.SetText(s.cpProcessId.toString());
    cbp_PrRef.PerformCallback();

    
}

function AttachmentGrid_EndCallback() {
    popupAttachment.Show();
}

function PRUpload_FileUploadComplete(s, e)
{
    if (e.isValid)
    {
        if (s.cpErrMsg.toString() == '')
        {
            AttachmentGrid.PerformCallback();
        }
        else
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }
    else {
        popupInvalidAttachment.Show();
    }
}