<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Laporan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.LaporanKehilangan.Laporan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function cbp_GetMissingItemDt_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {            
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        { cbp_ProceedWithWorkflow.PerformCallback(); }
    }

    function SelectAssetInv() {
        LoadingPanel.SetText('Sistem sedang memuatkan aset-aset alih yang telah dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Laporan.PerformCallback('ASSETINVSELECTED');
    }

    function OpenLookupWindow() {
        popupSearchAssetInv.SetWidth(screen.width * 0.85);
        popupSearchAssetInv.Show();
        GridSearchAssetInv.PerformCallback();
    }

    function CheckBeforeSave() {
        if (
            LKH_MissingDate.GetText() == '' ||
            LKH_MissingLocation.GetText() == '' ||
            LKH_MissingReason.GetText() == '' ||
            LKH_OfficerInchargeEmpId.GetText() == ''
            ) {
            popupMsg_Label.SetText('Tarikh Kehilangan, Lokasi, Punca Kehilangan dan Nama Pegawai Bertanggungjawab perlu diisi terlebih dahulu.<br><br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        else
            return true;
    }

    function CalculateMissingItems()
    {
        if (GridMissingItems.GetVisibleRowsOnPage() == 0) {
            popupMsg_Label.SetText('Aset Alih belum dipilih.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        else
            return true;
    }

    function CheckCurrentValue() {
        var LKMI_CurrentValue;
        var lpass = true;

        for (var i = 0; i < GridMissingItems.GetVisibleRowsOnPage() ; i++) {
            LKMI_CurrentValue = ASPxClientControl.GetControlCollection().GetByName('LKMI_CurrentValue' + i.toString());

            if (LKMI_CurrentValue.GetText() == '') {
                lpass = false;
                popupMsg_Label.SetText('Anggaran nilai semasa aset alih perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
                popupMsg.Show();
            }

            if (!lpass)
                break;
        }
        return lpass;
    }

    function cbp_CheckWf_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            switch (LKH_Status.GetText())
            {
                case "3": KetuaPtjWfMode(); break;
                case "32": LantikanPegawaiPenyiasatMode(); break;
                case "35": LaporanPenyiasatMode(); break;
            }
        }        
    }

    function KetuaPtjWfMode()
    {
        if (WfCount.GetText() != '0')
        {
            EnableDisableMissingGridCurrentValueOnly('true');
            MainRibbon.SetActiveTabIndex(3);
            MainRibbon.GetItemByName("Lulus").SetEnabled(true);
            MainRibbon.GetItemByName("Kuiri").SetEnabled(true);
            MainRibbon.GetItemByName("Lampiran").SetEnabled(true);
            popupAttachDocument_CallerName.SetText('LAPORAN KEROSAKAN');
        }
        else
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
    }

    function LantikanPegawaiPenyiasatMode()
    {
        if (WfCount.GetText() != '0') {
           
            MainRibbon.GetItemByName("Lulus").SetEnabled(false);
            MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'true', 'true');
            LookupPP.SetEnabled(true);
            PP_EditMode.SetText('1');
            MainRibbon.GetItemByName("Lampiran").SetEnabled(true);
            popupAttachDocument_CallerName.SetText('LAPORAN KEROSAKAN');
        }
        else
        {
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            LookupPP.SetEnabled(false);
            PP_EditMode.SetText('0');
        }

        PP_ProcessId.SetText(LKH_ProcessId.GetText());
        PP_Rev.SetText(LKH_RevNumber.GetText());
        GridSelectedPegawaiPenyiasat.PerformCallback('LOAD');
    }

    function LaporanPenyiasatMode()
    {
        if (WfCount.GetText() != '0') {

            MainRibbon.GetItemByName("Lulus").SetEnabled(false);
            MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'true', 'true');
            LookupPP.SetEnabled(false);
            PP_EditMode.SetText('0');
            HPP_EditMode.SetText('1');
            MainRibbon.GetItemByName("Lampiran").SetEnabled(true);
            popupAttachDocument_CallerName.SetText('LAPORAN KEROSAKAN');
        }
        else {
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            LookupPP.SetEnabled(false);
            PP_EditMode.SetText('0');
            HPP_EditMode.SetText('0');
        }

        PP_ProcessId.SetText(LKH_ProcessId.GetText());
        PP_Rev.SetText(LKH_RevNumber.GetText());
        GridSelectedPegawaiPenyiasat.PerformCallback('LOAD');
        cbp_HPP.PerformCallback('LOAD');
    }

    function RemoveItem(Id, Reg)
    {
        tempDelete.SetText(Id.toString());
        popupDeleteConfirmation_Label.SetText('Padam item ini (<b>' + Reg.toString() + '</b>)?<br>Anda pasti?');
        popupDeleteConfirmation.Show();        
    }

    function ProceedWithDeleteItem()
    {
        popupDeleteConfirmation.Hide();
        LoadingPanel.SetText('Sistem sedang memadam rekod aset alih yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Laporan.PerformCallback('DELETEITEM');
    }

    function EmpGridLookup_RowClick(s, e)
    {
        if (LKH_OfficerInchargeEmpId.GetText() != '')
        {
            var grid = LKH_OfficerInchargeEmpId.GetGridView();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'EmployeeDesignation;EmployeeEmploymentType', EmpGridLookupOnGetRowValues);
        }        
    }

    function EmpGridLookupOnGetRowValues(values) {
        LKH_OfficerInchargeDesignation.SetText(values[0].toString());
        LKH_OfficerInChargeDesignationType.SetText(values[1].toString());
    }

    function cbp_Laporan_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'ADD')
            {
                MainRibbon.GetItemByName("Lampiran").SetEnabled(true);
                popupAttachDocument_CallerName.SetText('LAPORAN KEROSAKAN');
                EnableDisableForm('true');
                LKH_SurchargeAction.SetEnabled(false);
                LKH_SurchargeDate.SetEnabled(false);
                LKH_DiciplinaryAction.SetEnabled(false);
                LKH_DiciplinaryDate.SetEnabled(false);
                ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');

                PageControl.SetActiveTabIndex(0);
                PageControl.SetVisible(true);

                var PenyiasatTab = PageControl.GetTab(1);
                PenyiasatTab.SetVisible(false);

                var LaporanPenyiasatTab = PageControl.GetTab(2);
                LaporanPenyiasatTab.SetVisible(false);

                var AliranKerjaTab = PageControl.GetTab(3);
                AliranKerjaTab.SetVisible(false);

                Ref_ProcessId.SetText(LKH_ProcessId.GetText());
                Ref_RevNumber.SetText(LKH_RevNumber.GetText());
                popupAttachDocument_ProcessId.SetText(LKH_ProcessId.GetText());
                cbp_Ref.PerformCallback('REF');
            }
            else if (s.cpMode == 'POST')
            {
                MainRibbon.GetItemByName("Lampiran").SetEnabled(false);

                if (LKH_Status.GetText() == '2')  //first time posting
                {
                    //main form management
                    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                    Ref_ProcessId.SetText(LKH_ProcessId.GetText());
                    Ref_RevNumber.SetText(LKH_RevNumber.GetText());
                    EnableDisableForm('false');

                    //reference side
                    cbp_Ref.PerformCallback('REF');

                    //aliran kerja
                    AliranKerja_ProcessId.SetText(LKH_ProcessId.GetText());
                    GridAkWorkflow.PerformCallback();
                    var AliranKerjaTab = PageControl.GetTab(3);
                    AliranKerjaTab.SetVisible(true);
                    PageControl.SetActiveTabIndex(3);

                    if (s.cpMailError.toString() != '') {
                        popupMsg_Label.SetText('Laporan Kerosakan telah berjaya dihantar tetapi email notifikasi gagal dihantar.<br>Masalah: ' + s.cpMailError.toString());
                        popupMsg.Show();
                    }
                    else {
                        popupMsg_Label.SetText('Laporan Kerosakan telah berjaya dihantar kepada <b>' + s.cpVerifier.toString() + '</b> untuk semakan.');
                        popupMsg.Show();
                    }
                }                
            }
            else if (s.cpMode == 'SAVE')
            {
                MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
                EnableDisableForm('false');
                popupMsg_Label.SetText('Laporan Kerosakan telah berjaya disimpan.');
                popupMsg.Show();                
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            }
            else if (s.cpMode == 'LOAD')
            {
               
                popupSearch.Hide();
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                EnableDisableForm('false');                
                ManageStatusDisplay();
                Ref_ProcessId.SetText(LKH_ProcessId.GetText());
                Ref_RevNumber.SetText(LKH_RevNumber.GetText());
                popupAttachDocument_ProcessId.SetText(LKH_ProcessId.GetText());
                cbp_Ref.PerformCallback('REF');

                if (LKH_Status.GetText() != '2')
                    cbp_CheckWf.PerformCallback();
            }
            else if (s.cpMode.toString() == 'ASSETINVSELECTED')
            { popupSearchAssetInv.Hide();}
        }
    }

    function ManageStatusDisplay()
    {
        switch (LKH_Status.GetText())
        {
            case "2": NotSubmittedMode(); break;
            case "3": KetuaPtjApproval1Mode(); break;
            case "32": LantikanPegawaiPenyiasatModeScreenSetting(); break;
            case "35": LaporanPegawaiPenyiasatModeScreenSetting(); break;
        }
    }

    function NotSubmittedMode()
    {
        var PenyiasatTab = PageControl.GetTab(1);
        PenyiasatTab.SetVisible(false);

        var LaporanPenyiasatTab = PageControl.GetTab(2);
        LaporanPenyiasatTab.SetVisible(false);

        var AliranKerjaTab = PageControl.GetTab(3);
        AliranKerjaTab.SetVisible(false);

        PageControl.SetActiveTabIndex(0);
    }

    function KetuaPtjApproval1Mode()
    {
        AliranKerja_ProcessId.SetText(LKH_ProcessId.GetText());
        GridAkWorkflow.PerformCallback();

        PageControl.SetVisible(true);

        var PenyiasatTab = PageControl.GetTab(1);
        PenyiasatTab.SetVisible(false);

        var LaporanPenyiasatTab = PageControl.GetTab(2);
        LaporanPenyiasatTab.SetVisible(false);

        var AliranKerjaTab = PageControl.GetTab(3);
        AliranKerjaTab.SetVisible(true);

        PageControl.SetActiveTabIndex(3);      
    }

    function LantikanPegawaiPenyiasatModeScreenSetting()
    {
        AliranKerja_ProcessId.SetText(LKH_ProcessId.GetText());
        GridAkWorkflow.PerformCallback();

        PageControl.SetVisible(true);

        var PenyiasatTab = PageControl.GetTab(1);
        PenyiasatTab.SetVisible(true);             

        var LaporanPenyiasatTab = PageControl.GetTab(2);
        LaporanPenyiasatTab.SetVisible(false);

        var AliranKerjaTab = PageControl.GetTab(3);
        AliranKerjaTab.SetVisible(true);

        PageControl.SetActiveTabIndex(1);
    }

    function LaporanPegawaiPenyiasatModeScreenSetting()
    {
        PageControl.SetVisible(true);

        var PenyiasatTab = PageControl.GetTab(1);
        PenyiasatTab.SetVisible(true);
        PP_ProcessId.SetText(LKH_ProcessId.GetText());
        PP_Rev.SetText(LKH_RevNumber.GetText());
        GridSelectedPegawaiPenyiasat.PerformCallback('LOAD');

        var LaporanPenyiasatTab = PageControl.GetTab(2);
        LaporanPenyiasatTab.SetVisible(true);
        HPP_ProcessId.SetText(LKH_ProcessId.GetText());
        HPP_Rev.SetText(LKH_RevNumber.GetText());

        var AliranKerjaTab = PageControl.GetTab(3);
        AliranKerjaTab.SetVisible(true);
        AliranKerja_ProcessId.SetText(LKH_ProcessId.GetText());
        GridAkWorkflow.PerformCallback();

        PageControl.SetActiveTabIndex(2);
    }

    function EnableDisableForm(truefalse)
    {
        if (truefalse == 'true')
        {
            LKH_MissingDate.SetEnabled(true);
            LKH_MissingLocation.SetEnabled(true);
            LKH_MissingReason.SetEnabled(true);
            LKH_PoliceRptNumber.SetEnabled(true);
            LKH_PolieRptDate.SetEnabled(true);
            LKH_OfficerInchargeEmpId.SetEnabled(true);
            LKH_SurchargeAction.SetEnabled(true);
            LKH_SurchargeDate.SetEnabled(true);
            LKH_DiciplinaryAction.SetEnabled(true);
            LKH_DiciplinaryDate.SetEnabled(true);
            LKH_ExistingPrecautionMethods.SetEnabled(true);
            LKH_FuturePrecautionMethods.SetEnabled(true);
            LookupAssetInv.SetEnabled(true);
            EnableDisableMissingGridAll('true');
        }
        else
        {
            LKH_MissingDate.SetEnabled(false);
            LKH_MissingLocation.SetEnabled(false);
            LKH_MissingReason.SetEnabled(false);
            LKH_PoliceRptNumber.SetEnabled(false);
            LKH_PolieRptDate.SetEnabled(false);
            LKH_OfficerInchargeEmpId.SetEnabled(false);
            LKH_SurchargeAction.SetEnabled(false);
            LKH_SurchargeDate.SetEnabled(false);
            LKH_DiciplinaryAction.SetEnabled(false);
            LKH_DiciplinaryDate.SetEnabled(false);
            LKH_ExistingPrecautionMethods.SetEnabled(false);
            LKH_FuturePrecautionMethods.SetEnabled(false);
            LookupAssetInv.SetEnabled(false);
            EnableDisableMissingGridAll('false');
        }
    }

    function EnableDisableMissingGridAll(truefalse)
    {
        var LKMI_AssetInvUniqueId;
        var LKMI_CurrentValue;

        for (var i = 0; i < GridMissingItems.GetVisibleRowsOnPage() ; i++)
        {
            LKMI_AssetInvUniqueId = ASPxClientControl.GetControlCollection().GetByName('LKMI_AssetInvUniqueId' + i.toString());
            LKMI_CurrentValue = ASPxClientControl.GetControlCollection().GetByName('LKMI_CurrentValue' + i.toString());

            if (truefalse == 'true')
            {
                LKMI_AssetInvUniqueId.SetVisible(true);
                LKMI_CurrentValue.SetEnabled(true);
            }
            else
            {
                LKMI_AssetInvUniqueId.SetVisible(false);
                LKMI_CurrentValue.SetEnabled(false);
            }
        }
    }

    function EnableDisableMissingGridCurrentValueOnly(truefalse)
    {
        var LKMI_CurrentValue;

        for (var i = 0; i < GridMissingItems.GetVisibleRowsOnPage() ; i++)
        {
            LKMI_CurrentValue = ASPxClientControl.GetControlCollection().GetByName('LKMI_CurrentValue' + i.toString());

            if (truefalse == 'true')
            {
                LKMI_CurrentValue.SetEnabled(true);
            }
            else
            {
                LKMI_CurrentValue.SetEnabled(false);
            }
        }
    }

    function CheckMissingItemCurrentValue()
    {
        var lpass = true;
        var LKMI_CurrentValue;

        for (var i = 0; i < GridMissingItems.GetVisibleRowsOnPage() ; i++)
        {
            LKMI_CurrentValue = ASPxClientControl.GetControlCollection().GetByName('LKMI_CurrentValue' + i.toString());

            if (LKMI_CurrentValue.GetNumber() < 1)
            {
                lpass = false;
                popupMsg_Label.SetText('Sila semak nilai anggaran semasa untuk aset alih yang hilang.<br>Nilai anggaran yang paling minimum ialah RM1.<br><br>Sila semak dan cuba sekali lagi');
                popupMsg.Show();
            }

            if (!lpass)
                break;           
        }

        return lpass;
    }
</script>
<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<dx:ASPxCallbackPanel ID="cbp_Laporan" runat="server" ClientInstanceName="cbp_Laporan" OnCallback="cbp_Laporan_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Laporan_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Maklumat Pengadu" Width="50%">
                <Items>
                    <dx:LayoutItem Caption="Nama">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="EmployeeName" runat="server" ClientEnabled="False" ClientInstanceName="EmployeeName" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Pusat Tanggungjawab">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="CreatorPtjName" runat="server" ClientEnabled="False" ClientInstanceName="CreatorPtjName" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No. Telefon">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="EmployeeTelephone" runat="server" ClientEnabled="False" ClientInstanceName="EmployeeTelephone" EnableClientSideAPI="True" Width="150px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="LKH_CreatorEmpId" runat="server" ClientInstanceName="LKH_CreatorEmpId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Maklumat Kehilangan" ColCount="2" Width="50%">
                <Items>
                    <dx:LayoutItem Caption="Tarikh Kehilangan" Width="20%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="LKH_MissingDate" runat="server" ClientInstanceName="LKH_MissingDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="120px">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Lokasi" Width="80%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="LKH_MissingLocation" runat="server" ClientInstanceName="LKH_MissingLocation" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Punca Kehilangan" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="LKH_MissingReason" runat="server" ClientInstanceName="LKH_MissingReason" EnableClientSideAPI="True" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Laporan Polis" ColCount="3" ColSpan="2" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Tarikh Laporan" Width="10%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="LKH_PolieRptDate" runat="server" ClientInstanceName="LKH_PolieRptDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="120px">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No. Laporan" Width="10%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="LKH_PoliceRptNumber" runat="server" ClientInstanceName="LKH_PoliceRptNumber" EnableClientSideAPI="True" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem Width="80%">
                    </dx:EmptyLayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Pegawai Bertanggungjawab" ColCount="2" Width="50%">
                <Items>
                    <dx:LayoutItem Caption="Nama Pegawai" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="LKH_OfficerInchargeEmpId" runat="server" AutoGenerateColumns="False" ClientInstanceName="LKH_OfficerInchargeEmpId" DataSourceID="EmpDs" EnableClientSideAPI="True" KeyFieldName="EmployeeId" TextFormatString="{1}" Width="100%">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <GridViewClientSideEvents FocusedRowChanged="function(s, e) {
	EmpGridLookup_RowClick(s, e);
}" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="EmployeeId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nama" FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="1" Width="50%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Jawatan" FieldName="EmployeeDesignation" ShowInCustomizationForm="True" VisibleIndex="2" Width="35%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Taraf Jawatan" FieldName="EmployeeEmploymentType" ShowInCustomizationForm="True" VisibleIndex="3" Width="15%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(650);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="EmpDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [EmployeeId], [EmployeeName], [EmployeeDesignation], [EmployeeEmploymentType] FROM [V_Employee_PTJ] WHERE ([EmployeeStatus] = @EmployeeStatus) ORDER BY [EmployeeName]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="Aktif" Name="EmployeeStatus" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Jawatan" Width="70%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="LKH_OfficerInchargeDesignation" runat="server" ClientEnabled="False" ClientInstanceName="LKH_OfficerInchargeDesignation" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Taraf Jawatan" Width="30%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="LKH_OfficerInChargeDesignationType" runat="server" ClientEnabled="False" ClientInstanceName="LKH_OfficerInChargeDesignationType" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Tindakan Surcaj &amp; Tatatertib" ColCount="2" Width="50%">
                <Items>
                    <dx:LayoutItem Caption="Tindakan Surcaj" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="LKH_SurchargeAction" runat="server" ClientInstanceName="LKH_SurchargeAction" DisplayFormatString="n" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0">
                                    <SpinButtons ShowIncrementButtons="False">
                                    </SpinButtons>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="LKH_SurchargeDate" runat="server" ClientInstanceName="LKH_SurchargeDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="120px">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tindakan Tatatertib" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="LKH_DiciplinaryAction" runat="server" ClientInstanceName="LKH_DiciplinaryAction" DataSourceID="TataDs" EnableClientSideAPI="True" TextField="TT_Desc" ValueField="TT_Id" ValueType="System.Int32" Width="100%">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="TataDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [TT_Id], [TT_Desc] FROM [Master_TindakanTataTertib] ORDER BY [TT_Desc]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="LKH_DiciplinaryDate" runat="server" ClientInstanceName="LKH_DiciplinaryDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="120px">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Senarai Aset Yang Hilang &amp; Anggaran Nilai Semasa" ColSpan="2" Width="100%">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxHyperLink ID="LookupAssetInv" ClientInstanceName="LookupAssetInv" runat="server" CssClass="myHyperlink" EnableClientSideAPI="True" Text="Carian aset yang hilang" NavigateUrl="javascript: OpenLookupWindow();">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridView ID="GridMissingItems" runat="server" AutoGenerateColumns="False" Width="100%" KeyFieldName="LKMI_AssetInvUniqueId" ClientInstanceName="GridMissingItems" OnHtmlDataCellPrepared="GridMissingItems_HtmlDataCellPrepared">
                                    <Columns>
                                        <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="8" FieldName="LKMI_ProcessId" ReadOnly="True" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="9" FieldName="LKMI_Revision" ReadOnly="True" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Padam" ShowInCustomizationForm="True" VisibleIndex="7" Width="3%" FieldName="LKMI_AssetInvUniqueId" ReadOnly="True">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="LKMI_AssetInvUniqueId" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink" ImageUrl="~/Public/Images/GridIcons/GridDelete.png">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="10" FieldName="LKMI_AssetInvType" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Anggaran Nilai Semasa" ShowInCustomizationForm="True" VisibleIndex="6" Width="8%" FieldName="LKMI_CurrentValue">
                                             <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                            <DataItemTemplate>
                                                <dx:ASPxSpinEdit ID="LKMI_CurrentValue" EnableClientSideAPI="true" DisplayFormatString="n" SpinButtons-ShowIncrementButtons="false" HorizontalAlign="Right" runat="server" Number="0" Width="100%">
                                                </dx:ASPxSpinEdit>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" ShowInCustomizationForm="True" VisibleIndex="0" Width="14%" FieldName="AssetInvRegNumber" ReadOnly="True">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan" ShowInCustomizationForm="True" VisibleIndex="1" Width="19%" FieldName="AssetInvDesc" ReadOnly="True">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Jenama" ShowInCustomizationForm="True" VisibleIndex="2" Width="20%" FieldName="AssetInvBrand" ReadOnly="True">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Model" FieldName="AssetInvModel" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="20%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="Tarikh Belian" FieldName="AssetInvReceivedDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="8%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="Harga Perolehan Asal" FieldName="AssetInvPurchasePrice" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="8%" PropertiesTextEdit-DisplayFormatString="n">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                                            <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowClientEventsOnLoad="False" AllowDragDrop="False" AllowGroup="False" />
                                    <SettingsPager Visible="False">
                                    </SettingsPager>
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    <Styles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </Styles>
                                </dx:ASPxGridView>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Pencegahan" ColCount="2" ColSpan="2" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Langkah-Langkah Sedia Ada" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="LKH_ExistingPrecautionMethods" runat="server" ClientInstanceName="LKH_ExistingPrecautionMethods" EnableClientSideAPI="True" Rows="4" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Langkah-Langkah Pencegahan" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="LKH_FuturePrecautionMethods" runat="server" ClientInstanceName="LKH_FuturePrecautionMethods" EnableClientSideAPI="True" Rows="4" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="LKH_ProcessId" runat="server" ClientInstanceName="LKH_ProcessId" EnableClientSideAPI="True" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="LKH_Status" runat="server" ClientInstanceName="LKH_Status" EnableClientSideAPI="True" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="LKH_RevNumber" runat="server" ClientInstanceName="LKH_RevNumber" EnableClientSideAPI="True" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
    </dx:ASPxFormLayout>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


<dx:ASPxPopupControl ID="popupDeleteConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol4" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupDeleteConfirmation_Label" runat="server" ClientInstanceName="popupDeleteConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:15%"></td>
                        <td style="width:35%; text-align:right; vertical-align:middle; padding-right:6px;">
                            <dx:aspxbutton ID="popupDeleteConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteConfirmation_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	ProceedWithDeleteItem();
}" />
                            </dx:aspxbutton>
                        </td>
                         <td style="width:35%; text-align:left; vertical-align:middle; padding-left:6px;">
                            <dx:aspxbutton ID="popupDeleteConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteConfirmation_BtnCancel" Text="Batal" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupDeleteConfirmation.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:15%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>


<dx:ASPxTextBox ID="tempDelete" ClientInstanceName="tempDelete" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px"></dx:ASPxTextBox>



<dx:ASPxCallbackPanel ID="cbp_CheckWf" runat="server" ClientInstanceName="cbp_CheckWf" ClientVisible="False" OnCallback="cbp_CheckWf_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_CheckWf_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxTextBox ID="WfCount" runat="server" ClientInstanceName="WfCount" EnableClientSideAPI="True" Width="170px">
    </dx:ASPxTextBox>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>

<dx:ASPxPopupControl ID="popupSearchAssetInv" runat="server" AllowDragging="True" ClientInstanceName="popupSearchAssetInv" EnableClientSideAPI="True" HeaderText="Carian Aset Alih" MaxHeight="650px" MinHeight="450px" MinWidth="650px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <FooterContentTemplate>
         <div style="width:100%; padding:8px 0px 8px 0px; text-align:center; margin-left:auto; margin-right:auto;">
             <dx:ASPxButton ID="btnWorkflowProceed" runat="server" AutoPostBack="False" Text="Ok" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	SelectAssetInv();
}" />
             </dx:ASPxButton>
             &nbsp;
              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Batal" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	popupSearchAssetInv.Hide();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxGridView ID="GridSearchAssetInv" runat="server" ClientInstanceName="GridSearchAssetInv" Width="100%" AutoGenerateColumns="False" DataSourceID="SearchDs" KeyFieldName="AssInvUniqueId" EnableCallbackAnimation="True" OnCustomCallback="GridSearchAssetInv_CustomCallback">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AssInvUniqueId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="AssInvRegNum" ShowInCustomizationForm="True" VisibleIndex="2" Width="11%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="AssInvDesc" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Jenama" FieldName="AIRMI_Brand" ShowInCustomizationForm="True" VisibleIndex="4" Width="6%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Model" FieldName="AIRMI_Model" ShowInCustomizationForm="True" VisibleIndex="5" Width="6%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_PtjId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_DeptId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_BuildId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_FloorId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_SpaceID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_EmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Penempatan Semasa" ShowInCustomizationForm="True" VisibleIndex="13">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Nama Kakitangan" FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="0" Width="12%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="12%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pusat, Bahagian dan Jabatan" FieldName="Dept_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Bangunan dan Blok" FieldName="Build_Name" ShowInCustomizationForm="True" VisibleIndex="3" Width="9%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Aras" FieldName="Floor_Name" ShowInCustomizationForm="True" VisibleIndex="4" Width="6%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ruang" FieldName="Space_Name" ShowInCustomizationForm="True" VisibleIndex="5" Width="9%">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                        
                    </dx:GridViewDataTextColumn>
                </Columns>
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
            </dx:GridViewBandColumn>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0" Width="2%">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AssetInvType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AIRMI_Cat" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AIRMI_SubCat" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CatName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SubCatName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status" FieldName="StatusName" ShowInCustomizationForm="True" VisibleIndex="18" Width="7%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AIRMI_ReceivedDate" ShowInCustomizationForm="True" VisibleIndex="19" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AIRMI_PurchasePrice" ShowInCustomizationForm="True" Visible="False" VisibleIndex="20">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsLoadingPanel Mode="Disabled" ShowImage="False" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
        <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMSDbConnectionString %>" SelectCommand="SELECT * FROM [V_LookupAssetAndInventoryForLaporanKehilangan] ORDER BY [AssInvRegNum]"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<dx:ASPxCallbackPanel ID="cbp_GetMissingItemDt" runat="server" ClientInstanceName="cbp_GetMissingItemDt" ClientVisible="False" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px" OnCallback="cbp_GetMissingItemDt_Callback">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_GetMissingItemDt_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>



