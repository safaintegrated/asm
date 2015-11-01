﻿function btnChecked_Click(s, e) {
    LoadingPanel.SetText('Sistem sedang menyimpan rekod permohonan belian.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_PermohonanBelian_PrHeader.PerformCallback('CHECKED');
}

function gvCheckListNonMandatory_RowClick(s, e) {
    gvCheckListNotMandatory.GetRowValues(e.visibleIndex, 'Id', UpdateNonMandatoryCheckList);

}
function UpdateNonMandatoryCheckList(values) {
    if (values == "")
        return;
    cbpUpdateCheckList.PerformCallback("UPDATE|" + values);
}

function gvCheckListMandatory_RowClick(s, e) {
    gvCheckListMandatory.GetRowValues(e.visibleIndex, 'Id', UpdateCheckList);
}
function UpdateCheckList(values) {
    if (values == "")
        return;
    cbpUpdateCheckList.PerformCallback("UPDATE|" + values);
}

function cbpUpdateCheckList_EndCallBack(s, e) {
    RefreshGrid();
}


function cbpChecklist_EndCallBack(s, e) {
    //if (s.cpErrMsg.toString() != '') {
    //    PopupMessageBox_Label.SetText(s.cpErrMsg.toString());
    //    PopupMessageBox.Show();
    //    return;
    //}
    switch (s.cpMode.toString()) {
        case 'REFRESH':
            RefreshGrid();
            //gvCheckListMandatory.Refresh();
            //gvCheckListNotMandatory.Refresh();
            break;
        case 'UPDATE':
            RefreshGrid();
            //gvCheckListMandatory.Refresh();
            //gvCheckListNotMandatory.Refresh();
            break;
        default:
            break;
    }
}


function gvPrListOnRowClick(s, e) {
    gvPrList.GetRowValues(e.visibleIndex, 'Id', OpenPurchaseRequest);
}

function OpenPurchaseRequest(values) {
    PRH_ProcessId.SetText(values.toString());
    txtPurchaseRequestId.SetText(values.toString());
    txtPrItemListPrId.SetText(values.toString());
    txtCheckListPrId.SetText(values.toString());
    txtWorkFlowPrId.SetText(values.toString());

    //PRH_Revision.SetText(r.toString());
    LoadingPanel.SetText('Sistem sedang membuka maklumat permohonan belian yang dipilih.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_PermohonanBelian_PrHeader.PerformCallback('VIEW');

}

function btnSelectPurchaseType_Click(s, e) {
    switch (CbPurchaseType.GetText()) {
        case "":
            popupMsg_Label.SetText('Sila pilih jenis pembelian terlebih dahulu.');
            popupMsg.Show();
            break;
        case "Aset Baharu":
            cbp_FormNextItemNumber.PerformCallback('NEW_ASSET'); break;   //Aset Baharu
        case "Penyelenggaraan": cbp_FormNextItemNumber.PerformCallback('NEW_MAINTENANCE'); break;   //Penyelenggaraan
        case "Alat Ganti": cbp_FormNextItemNumber.PerformCallback('NEW_SPARE'); break;   //Alat Ganti
        case "Tambahan": cbp_FormNextItemNumber.PerformCallback('NEW_ADDTIONAL'); break;   //Tambahan
        case "Stok": cbp_FormNextItemNumber.PerformCallback('NEW_STOCK'); break;   //Stok
        case "Lain-lain": cbp_FormNextItemNumber.PerformCallback('NEW_OTHERS'); break;   //Lain-lain
    }
}

function cbp_FormNextItemNumber_EndCallback(s, e) {
    switch (s.cpPurchaseType.toString()) {
        case "NEW_ASSET": NewAssetMode(s.cpNextItemNumber.toString()); break;   //Aset Baharu
        case "NEW_MAINTENANCE": NewMaintenanceMode(s.cpNextItemNumber.toString()); break;   //Penyelenggaraan
        case "NEW_SPARE": NewSparePartMode(s.cpNextItemNumber.toString()); break;   //Alat Ganti
        case "NEW_ADDTIONAL": NewAdditionalMode(s.cpNextItemNumber.toString()); break;   //Tambahan
        case "NEW_STOCK": NewStockMode(s.cpNextItemNumber.toString()); break;   //Stok
        case "NEW_OTHERS": NewOthersMode(s.cpNextItemNumber.toString()); break;   //Lain-lain

    }
}

function NewAssetMode(num) {
    //NewAsset_PRI_ProcessId.SetText(TabItem_ProcessId.GetText());
    //NewAsset_PRI_ItemNumber.SetText(num.toString());
    //NewAsset_PRI_Revision.SetText(TabItem_RevNum.GetText());
    //txtPurchaseRequestId.SetText(TabItem_PurchaseRequestId.GetText());
    cbp_LineItem_NewAsset.PerformCallback('NEW_ASSET');
}

function NewMaintenanceMode(num) {
    //NewAsset_PRI_ProcessId.SetText(TabItem_ProcessId.GetText());
    //NewAsset_PRI_ItemNumber.SetText(num.toString());
    //NewAsset_PRI_Revision.SetText(TabItem_RevNum.GetText());
    //txtPurchaseRequestId.SetText(TabItem_PurchaseRequestId.GetText());
    cbp_LineItem_NewAsset.PerformCallback('NEW_MAINT');
}

function NewSparePartMode(num) {
    //NewAsset_PRI_ProcessId.SetText(TabItem_ProcessId.GetText());
    //NewAsset_PRI_ItemNumber.SetText(num.toString());
    //NewAsset_PRI_Revision.SetText(TabItem_RevNum.GetText());
    //txtPurchaseRequestId.SetText(TabItem_PurchaseRequestId.GetText());
    cbp_LineItem_NewAsset.PerformCallback('NEW_SPARE_PART');
}


function NewOthersMode(num) {
    //NewAsset_PRI_ProcessId.SetText(TabItem_ProcessId.GetText());
    //NewAsset_PRI_ItemNumber.SetText(num.toString());
    //NewAsset_PRI_Revision.SetText(TabItem_RevNum.GetText());
    //txtPurchaseRequestId.SetText(TabItem_PurchaseRequestId.GetText());
    cbp_LineItem_NewAsset.PerformCallback('NEW_OTHERS');
}

function NewAdditionalMode(num) {
    //NewAsset_PRI_ProcessId.SetText(TabItem_ProcessId.GetText());
    //NewAsset_PRI_ItemNumber.SetText(num.toString());
    //NewAsset_PRI_Revision.SetText(TabItem_RevNum.GetText());
    //txtPurchaseRequestId.SetText(TabItem_PurchaseRequestId.GetText());
    cbp_LineItem_NewAsset.PerformCallback('NEW_ADDITIONAL');
}

function NewStockMode(num) {
    //NewAsset_PRI_ProcessId.SetText(TabItem_ProcessId.GetText());
    //NewAsset_PRI_ItemNumber.SetText(num.toString());
    //NewAsset_PRI_Revision.SetText(TabItem_RevNum.GetText());
    //txtPurchaseRequestId.SetText(TabItem_PurchaseRequestId.GetText());
    cbp_LineItem_NewAsset.PerformCallback('NEW_STOCK');
}

function EnableDisableItemForm(EnableDisable) {
    //CbPurchaseType.SetEnabled(EnableDisable);
    //btnSelectPurchaseType.SetEnabled(EnableDisable);
}

function NewAsset_GLAC_Account_ValueChanged(s, e) {
    if (s.GetText() != '') {
        var grid = s.GetGridView();
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'glac_desc', Fill_NewAsset_GLAC_Desc);
    }
}

function Fill_NewAsset_GLAC_Desc(value) {
    NewAsset_GLAC_Desc.SetText(Value.toString());
}

function NewAsset_PCAC_Account_ValueChanged(s, e) {
    if (s.GetText() != '') {
        var grid = s.GetGridView();
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'pcac_desc', NewAsset_FillProjectDesc);
    }
}

function NewAsset_FillProjectDesc(Values)
{ NewAsset_PCAC_Desc.SetText(Values.toString()); }

function NewAsset_BtnAddGl_Click()
{ cbp_NewAsset_PopupGLDistibution.PerformCallback('NEW'); }

function NewAsset_BtnAddProject_Click()
{ cbp_NewAsset_PopupProjectDistibution.PerformCallback('NEW'); }

function NewAsset_Popup_ProjectDistribution_ButtonOk_Click() {
    if (NewAsset_PCAC_Account.GetText() == '' || NewAsset_PCAC_Desc.GetText() == '' || NewAsset_PCAC_Amount.GetText() == '')
    { }
    else
    {
        cbp_NewAsset_PopupProjectDistibution.PerformCallback('SAVE');
    }
}

function NewAsset_Popup_ProjectDistribution_ButtonDelete_Click()
{ }

function cbp_NewAsset_PopupProjectDistibution_EndCallback(s, e) {
    if (s.cpMode.toString() == 'NEW')
    { NewAsset_Popup_ProjectDistribution.Show(); }
    else
    {
        NewAsset_ProjectDistributionGrid.PerformCallback();
        NewAsset_GLDistributionGrid.PerformCallback();
    }
}

function NewAsset_Popup_GLDistribution_ButtonOk_Click() {
    if (NewAsset_GLAC_Desc.GetText() != '') {
        cbp_NewAsset_PopupGLDistibution.PerformCallback('SAVE');
    }
}

function NewAsset_Popup_GLDistribution_ButtonDelete_Click()
{ }

function cbp_NewAsset_PopupGLDistibution_EndCallback(s, e) {
    if (s.cpMode.toString() == 'NEW')
    { NewAsset_Popup_GLDistribution.Show(); }
    else
    {
        NewAsset_ProjectDistributionGrid.PerformCallback();
        NewAsset_GLDistributionGrid.PerformCallback();
        NewAsset_Popup_GLDistribution.Hide();
    }
}

function NewAsset_PRI_TaxCode_ValueChanged(s, e) {
    if (NewAsset_PRI_TaxCode.GetText() != '') {
        var grid = s.GetGridView();
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'uttxl_perc', NewAsset_FillGstCode);
    }
}

function NewAsset_FillGstCode(Value) {
    NewAsset_PRI_TaxRate.SetNumber(Value);
    NewAsset_CalculateSubTotal();
}

function NewAsset_DeleteComponentConfirmation(Id, AccName) {
    NewAsset_TempDeleteComponent.SetText(Id.toString());
    NewAsset_DeleteCompConfirm_Label.SetText('Padam komponen / aksesori ini (' + AccName + ') ?');
    NewAsset_DeleteCompConfirm.Show();
}

function NewAsset_ProceedDeleteComponent() {
    NewAsset_DeleteCompConfirm.Hide();
    cbp_LineItem_NewAsset.PerformCallback('REMOVECOMPONENT');
}

function NewAsset_PRI_GLcode_EndCallback(s, e) {
    //if (s.cpErrMsg.toString() != '')
    //{
    //    PopupMessageBox_Label.SetText(s.cpErrMsg.toString());
    //    PopupMessageBox.Show();
    //}
}

function NewAsset_CalculateSubTotal() {
    NewAsset_C.SetNumber(NewAsset_PRI_Qty.GetNumber() * NewAsset_PRI_UnitPrice.GetNumber());
    NewAsset_E.SetNumber((NewAsset_PRI_Qty.GetNumber() * NewAsset_PRI_UnitPrice.GetNumber()) * (NewAsset_PRI_TaxRate.GetNumber() / 100.00));
    NewAsset_F.SetNumber((NewAsset_PRI_Qty.GetNumber() * NewAsset_PRI_UnitPrice.GetNumber()) + ((NewAsset_PRI_Qty.GetNumber() * NewAsset_PRI_UnitPrice.GetNumber()) * (NewAsset_PRI_TaxRate.GetNumber() / 100.00)));
}

function NewAsset_PRI_CatId_ValueChanged(s, e) {
    if (NewAsset_PRI_CatId.GetText() != '') {
        NewAsset_PRI_SubCatId.SetEnabled(true);
        NewAsset_PRI_SubCatId.GetGridView().PerformCallback();
    }
}

function NewAsset_PRI_SubCatId_ValueChanged(s, e) {
    if (NewAsset_PRI_SubCatId.GetValue() != null) {
        NewAsset_GLAC_Account.SetEnabled(true);
        NewAsset_GLAC_Account.GetGridView().PerformCallback();
    }
}

function Toolbar_PermohonanBelian_LineItem_NewAsset_ItemClick(s, e) {
    switch (e.item.name) {
        case "btnSave": SaveNewPrItem(); break;
        case "btnDelete": Item_NewAssetDelete(); break;
    }
}

function SaveNewPrItem() {
    LoadingPanel.SetText('sistem sedang menyimpan item aset baharu anda.  sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_LineItem_NewAsset.PerformCallback('SAVE');

    //if (NewAsset_PRI_Desc.GetText() == '') {
    //    PopupMessageBox_Label.SetText('Keterangan belum diisi.<br>Sila semak dan cuba sekali lagi.');
    //    PopupMessageBox.Show();
    //}
    //else {
    //    LoadingPanel.SetText('sistem sedang menyimpan item aset baharu anda.  sila tunggu sebentar..');
    //    LoadingPanel.Show();
    //    cbp_LineItem_NewAsset.PerformCallback('SAVE');
    //}
}

function cbp_LineItem_NewAsset_EndCallback(s, e) {

    LoadingPanel.Hide();
    if (s.cpErrMsg.toString() != '') {
        PopupMessageBox_Label.SetText(s.cpErrMsg.toString());
        PopupMessageBox.Show();
        return;
    }
    switch (s.cpMode.toString()) {
        case 'SAVE':
            cbpRefreshList.PerformCallback();
            Popup_LineItem_NewAsset.Hide();
            break;
        default:
            Popup_LineItem_NewAsset.SetWidth(screen.width * 0.85);
            Popup_LineItem_NewAsset.Show();
            break;
    }
    //else {
    //    if (s.cpMode.toString() == 'NEW') {
    //        Popup_LineItem_NewAsset.SetWidth(screen.width * 0.85);
    //        Popup_LineItem_NewAsset.Show();
    //    }
    //    else if (s.cpMode.toString() == 'SAVE') {
    //        ItemGrid.PerformCallback();
    //        GLDistribution_Grid.PerformCallback();
    //        Popup_LineItem_NewAsset.Hide();
    //    }
    //}
}

function Manage_LineItem_NewAsset_Toolbar(btnSave, btnDelete) {
    Toolbar_PermohonanBelian_LineItem_NewAsset.GetItemByName('btnSave').SetEnabled(btnSave);
    Toolbar_PermohonanBelian_LineItem_NewAsset.GetItemByName('btnDelete').SetEnabled(btnDelete);
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

function TambahClicked() {
    LoadingPanel.SetText('Sistem sedang bersedia untuk memproses rekod permohonan belian baharu.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_PermohonanBelian_PrHeader.PerformCallback('NEW');
}

function Toolbar_PopupPr_ItemClick(s, e) {
    switch (e.item.name) {
        case 'btnSave': Toolbar_SimpanClicked(); break;
        case 'btnApprove': Toolbar_ApproveClicked(); break;
        case 'btnReject': break;
        case 'btnSubmit': Toolbar_SubmitClicked(); break;
    }
}

function Toolbar_ApproveClicked() {
    //TODO: add validation before proceed with save
    LoadingPanel.SetText('Sistem sedang menyimpan rekod permohonan belian.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_PermohonanBelian_PrHeader.PerformCallback('APPROVED');
}

function Toolbar_SubmitClicked() {
    //TODO: add validation before proceed with save
    LoadingPanel.SetText('Sistem sedang menyimpan rekod permohonan belian.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_PermohonanBelian_PrHeader.PerformCallback('SUBMITTED');
}

function Toolbar_SimpanClicked() {
    //TODO: add validation before proceed with save
    LoadingPanel.SetText('Sistem sedang menyimpan rekod permohonan belian.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_PermohonanBelian_PrHeader.PerformCallback('SAVE');


    //alert('saving');

    //if (
    //    PRH_Purpose.GetText() == '' ||
    //    PRH_RequestBy.GetText() == '' ||
    //    PRH_ProcurementITypeId.GetText() == '' ||
    //    PRH_ProcurementCatId.GetText() == '' ||
    //    PRH_ProcurementMethodId.GetText() == '' ||
    //    //PRH_PurchaserId.GetText() == '' || 
    //    PRH_SupplierCode.GetText() == ''
    //    )
    //{
    //    popupMsg_Label.SetText('Semua medan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
    //    popupMsg.Show();
    //}
    //else {
    //alert('saving');
    //LoadingPanel.SetText('Sistem sedang menyimpan rekod permohonan belian.  Sila tunggu sebentar..');
    //LoadingPanel.Show();
    //cbp_PermohonanBelian_PrHeader.PerformCallback('SAVE');
    //}
}

function Manage_Toolbar_PopupPr(btnEdit, btnSave, btnSubmit, btnCancel, btnWithdraw, btnApprove, btnReject) {
    //Toolbar_PopupPr.GetItemByName('btnEdit').SetEnabled(btnEdit);
    //Toolbar_PopupPr.GetItemByName('btnSave').SetEnabled(btnSave);
    //Toolbar_PopupPr.GetItemByName('btnSubmit').SetEnabled(btnSubmit);
    //Toolbar_PopupPr.GetItemByName('btnCancel').SetEnabled(btnCancel);
    //Toolbar_PopupPr.GetItemByName('btnWithdraw').SetEnabled(btnWithdraw);
    //Toolbar_PopupPr.GetItemByName('btnApprove').SetEnabled(btnApprove);
    //Toolbar_PopupPr.GetItemByName('btnReject').SetEnabled(btnReject);

    Toolbar_PopupPr.GetItemByName('btnEdit').SetEnabled(true);
    Toolbar_PopupPr.GetItemByName('btnSave').SetEnabled(true);
    Toolbar_PopupPr.GetItemByName('btnSubmit').SetEnabled(true);
    Toolbar_PopupPr.GetItemByName('btnCancel').SetEnabled(true);
    Toolbar_PopupPr.GetItemByName('btnWithdraw').SetEnabled(true);
    Toolbar_PopupPr.GetItemByName('btnApprove').SetEnabled(true);
    Toolbar_PopupPr.GetItemByName('btnReject').SetEnabled(true);

}

function ViewPr(p, r) {
    PRH_ProcessId.SetText(p.toString());
    PRH_Revision.SetText(r.toString());
    LoadingPanel.SetText('Sistem sedang membuka maklumat permohonan belian yang dipilih.  Sila tunggu sebentar..');
    LoadingPanel.Show();
    cbp_PermohonanBelian_PrHeader.PerformCallback('VIEW');
}

function cbp_PermohonanBelian_PrHeader_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() != '') {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        return;
    }

    switch (s.cpMode.toString()) {
        case 'NEW':
            ProcessNew();
            break;
        case 'SAVE':
            ProcessSave();
            break;
        case 'VIEW':
            ProcessView();
            cbpWorkFlowList.PerformCallback();
            break;
        case 'CHECKED':
        case 'APPROVED':
        case 'SUBMITTED':
            cbpWorkFlowList.PerformCallback();
            break;
        default:
            break;
    }
}

function cbpWorkFlowList_EndCallBack(s, e) {
    RefreshGrid();
}

function RefreshGrid()
{
    GridPRWorkflow.Refresh();
    gvPrList.Refresh();
    gvCheckListMandatory.Refresh();
    gvCheckListNotMandatory.Refresh();
}


function ProcessView()
{
    //alert('here');
    //tab utama
    PageControl_PopupPr.SetActiveTab(PageControl_PopupPr.GetTab(0));  //focus on utama tab
    EnableDisableUtamaForm(false);

    //tab item
    PageControl_PopupPr.GetTab(1).SetVisible(true);  //hide item tab
    TabItem_ProcessId.SetText(PRH_ProcessId.GetText());
    TabItem_RevNum.SetText(PRH_Revision.GetText());
    TabItemGrid.PerformCallback();
    EnableDisableItemForm(false);

    PageControl_PopupPr.GetTab(2).SetVisible(true);  //hide senarai semak tab
    PageControl_PopupPr.GetTab(3).SetVisible(true);  //hide aliran kerja tab

    //popup management
    PopupPr.SetWidth(screen.width * 0.9);
    PopupPr.SetHeight(screen.height * 0.8);

    //alert(screen.height);
    //PopupPr.SetHeight(screen.height * 0.2);

    PopupPr.SetHeaderText('Permohonan Belian - No. Transaksi: ' + PRH_ProcessId.GetText());
    PopupPr.Show();
    PRH_Purpose.Focus();

    cbpChecklist.PerformCallback('REFRESH');
    //gvCheckListMandatory.Refresh();
    //gvCheckListNotMandatory.Refresh();
}



function ProcessSave(){
    //tab management
    PageControl_PopupPr.GetTab(1).SetVisible(true);  //hide item tab
    PageControl_PopupPr.GetTab(2).SetVisible(true);  //hide senarai semak tab
    PageControl_PopupPr.GetTab(3).SetVisible(true);  //hide aliran kerja tab

    //main grid management
    MainGrid.PerformCallback();

    //screen management
    if (PRH_ProcessId.GetText() == '')  //new PR mode
    {
        //tab utama
        PRH_ProcessId.SetText(s.cpReturnProcessId.toString());
        PRH_Revision.SetText(s.cpReturnRevNumber.toString());

        //tab item
        TabItem_ProcessId.SetText(s.cpReturnProcessId.toString());
        TabItem_RevNum.SetText(s.cpReturnRevNumber.toString());
        TabItem_RevNum.SetText(s.cpReturnPurchaseRequestId.toString());
        TabItemGrid.PerformCallback();
        EnableDisableItemForm(true);

        //show notifications
        popupMsg_Label.SetText('Rekod Permohonan Belian telah disimpan dengan jayanya.<br>Anda kini boleh memasukkan maklumat item untuk permohonan ini.');
        popupMsg.Show();
    }
    else //existing PR is being viewed
    {
        //show notifications
        popupMsg_Label.SetText('Rekod Permohonan Belian telah disimpan dengan jayanya.');
        popupMsg.Show();

        //tab utama
        EnableDisableUtamaForm(false);
    }
}

function ProcessNew() {
    //tab management
    PageControl_PopupPr.GetTab(1).SetVisible(false);  //hide item tab
    PageControl_PopupPr.GetTab(2).SetVisible(false);  //hide senarai semak tab
    PageControl_PopupPr.GetTab(3).SetVisible(false);  //hide aliran kerja tab
    PageControl_PopupPr.SetActiveTab(PageControl_PopupPr.GetTab(0));  //focus on utama tab

    //popup toolbar management
    Manage_Toolbar_PopupPr(false, true, true, false, false, false, false);

    //popup management
    PopupPr.SetWidth(screen.width * 0.9);
    PopupPr.SetHeight(screen.height * 0.8);
    PopupPr.SetHeaderText('Permohonan Belian - Rekod Baharu');
    PopupPr.Show();
    PRH_Purpose.Focus();
}

function PRH_SupplierCode_ValueChanged(s, e) {
    if (s.GetText() != '') {
        var grid = s.GetGridView();
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'Address1;Address2;Address3;Address4;GlacControlCode;GlacDescription', FillSupplierInformation);
    }
}

function FillSupplierInformation(Values) {
    PRH_VendorAddress1.SetText(Values[0].toString());

    if (Values[1] != null)
        PRH_VendorAddress2.SetText(Values[1].toString());

    if (Values[2] != null)
        PRH_VendorAddress3.SetText(Values[2].toString());

    if (Values[3] != null)
        PRH_VendorAddress4.SetText(Values[3].toString());

    if (Values[4] != null)
        PRH_SupplierGLCode.SetText(Values[4].toString());

    if (Values[5] != null)
        PRH_SupplierGLDesc.SetText(Values[5].toString());
}

function PRH_RequestBy_ValueChanged(s, e) {
    if (s.GetText() != '') {
        var grid = s.GetGridView();
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'utem_code', FillSagaCode);
    }
}

function FillSagaCode(Value) {
    PTJ_SagaCode.SetText(Value.toString());
}


function PRH_PurchaserId_ValueChanged(s, e) {
    if (s.GetText() != '') {
        var grid = s.GetGridView();
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'Address1;Address2;Address3', FillPurchaserAddress);
    }
}

function FillPurchaserAddress(Values) {
    if (Values[0] != null)
        PRH_DeliveryAdd1.SetText(Values[0].toString());

    if (Values[1] != null)
        PRH_DeliveryAdd2.SetText(Values[1].toString());

    if (Values[2] != null)
        PRH_DeliveryAdd3.SetText(Values[2].toString());
}

function EnableDisableUtamaForm(EnableDisable) {
    //PRH_Purpose.SetEnabled(EnableDisable);
    //PRH_DeliveryInstruction.SetEnabled(EnableDisable);
    //PRH_RequestBy.SetEnabled(EnableDisable);
    //PRH_ProcurementITypeId.SetEnabled(EnableDisable);
    //PRH_ProcurementCatId.SetEnabled(EnableDisable);
    //PRH_ProcurementMethodId.SetEnabled(EnableDisable);
    //PRH_PurchaserId.SetEnabled(EnableDisable);
    //PRH_SupplierCode.SetEnabled(EnableDisable);
}

//** TO EASE FUNCTION CALLING.  TO BE REMOVED BEFORE LIVE
//function Manage_Toolbar_PopupPr(btnEdit, btnSave, btnSubmit, btnCancel, btnWithdraw, btnApprove, btnReject) {
//    Toolbar_PopupPr.GetItemByName('btnEdit').SetEnabled(btnEdit);
//    Toolbar_PopupPr.GetItemByName('btnSave').SetEnabled(btnSave);
//    Toolbar_PopupPr.GetItemByName('btnSubmit').SetEnabled(btnSubmit);
//    Toolbar_PopupPr.GetItemByName('btnCancel').SetEnabled(btnCancel);
//    Toolbar_PopupPr.GetItemByName('btnWithdraw').SetEnabled(btnWithdraw);
//    Toolbar_PopupPr.GetItemByName('btnApprove').SetEnabled(btnApprove);
//    Toolbar_PopupPr.GetItemByName('btnReject').SetEnabled(btnReject);
//}