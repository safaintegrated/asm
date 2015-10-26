<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Permohonan.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pinjaman.Tab_Permohonan" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function cbp_Workflow_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else {
            if (txtWorkflowCount.GetText() != '0')
            {
                MainRibbon.GetItemByName("Lulus").SetEnabled(true);
                MainRibbon.GetItemByName("Kuiri").SetEnabled(true);
                MainRibbon.SetActiveTabIndex(3);
            }
            else
                MainRibbon.SetActiveTabIndex(0);
            
        }
    }

    function RemoveAssetInv(UniqueId, RegNumber)
    {
        TempDelete.SetText(UniqueId.toString());
        popupDeleteConfirmation_Label.SetText('Padam rekod ini (<b>' + RegNumber.toString() + '</b>)?<br>Anda pasti?');
        popupDeleteConfirmation.Show();
    }

    function ProceedWithDelete() {
        LoadingPanel.SetText();
        LoadingPanel.Show();
        cbp_Permohonan.PerformCallback('DELETEASSETINV');
    }

    function SelectAssetInv()
    {
        LoadingPanel.SetText('Sistem memasukkan rekod aset alih yang telah anda pilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Permohonan.PerformCallback('ASSETINVSELECTED');
    }

    function cbp_Permohonan_EndCallback(s, e)
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
                EnableDisableHeaderForm('true');
                ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');

                MainRibbon.SetActiveTabIndex(0);
                PageControl.SetActiveTabIndex(0);
                PageControl.SetVisible(true);

                var PengeluaranTab = PageControl.GetTab(1);
                PengeluaranTab.SetVisible(false);

                var PemulanganTab = PageControl.GetTab(2);
                PemulanganTab.SetVisible(false);

                var AliranKerjaTab = PageControl.GetTab(3);
                AliranKerjaTab.SetVisible(false);

                Ref_RefProcessId.SetText(PP_ProcessId.GetText());
                Ref_RefRevNumber.SetText(PP_Revision.GetText());
                cbp_Ref.PerformCallback();
            }
            else if (s.cpMode.toString() == 'ASSETINVSELECTED') {
                popupSearchAssetInv.Hide();
            }
            else if (s.cpMode.toString() == 'DELETEASSETINV')
            { popupDeleteConfirmation.Hide(); }
            else if (s.cpMode.toString() == 'SAVE')
            {
                EnableDisableHeaderForm('true');
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                popupMsg_Label.SetText('Permohonan anda telah disimpan dengan jayanya.');
                popupMsg.Show();
            }
            else if (s.cpMode.toString() == 'POST')
            {
                EnableDisableHeaderForm('true');
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                popupMsg_Label.SetText('Permohonan anda telah berjaya dihantar kepada XXX untuk kelulusan.');
                popupMsg.Show();
            }
            else if (s.cpMode.toString() == 'LOAD')
            {
                EnableDisableHeaderForm('false');                
                popupLookupPP.Hide();

                Wf_ProcessId.SetText(PP_ProcessId.GetText());
                GridPrWorkflow.PerformCallback();

                Ref_RefProcessId.SetText(PP_ProcessId.GetText());
                Ref_RefRevNumber.SetText(PP_Revision.GetText());
                cbp_Ref.PerformCallback();

                if (PP_Status.GetText() ==  '2')
                { 
                    ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                    PageControl.SetActiveTabIndex(0);
                    var PengeluaranTab = PageControl.GetTab(1);
                    PengeluaranTab.SetVisible(false);
                    var PemulanganTab = PageControl.GetTab(2);
                    PemulanganTab.SetVisible(false);
                    var AliranKerjaTab = PageControl.GetTab(3);
                    AliranKerjaTab.SetVisible(false);
                }
                else if (PP_Status.GetText() == '15')
                {
                    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'ftrue', 'true', 'true', 'true');
                    PageControl.SetActiveTabIndex(0);
                    var PengeluaranTab = PageControl.GetTab(1);
                    PengeluaranTab.SetVisible(false);
                    var PemulanganTab = PageControl.GetTab(2);
                    PemulanganTab.SetVisible(false);
                    var AliranKerjaTab = PageControl.GetTab(3);
                    AliranKerjaTab.SetVisible(true);

                    cbp_Workflow.PerformCallback();
                }
                else if (PP_Status.GetText() == '17')
                {
                    var PengeluaranTab = PageControl.GetTab(1);
                    PengeluaranTab.SetVisible(true);

                    var AliranKerjaTab = PageControl.GetTab(3);
                    AliranKerjaTab.SetVisible(true);

                    //prepare pengeluaran listing
                    txtWithdrawProcessId.SetText(Ref_RefProcessId.GetText());
                    txtWithdrawRev.SetText(Ref_RefRevNumber.GetText());
                    GridWithdrawalList.PerformCallback();

                    PageControl.SetActiveTabIndex(1);
                    cbp_AssetOfficerWithdraw.PerformCallback('CHECK');
                }
                else if (PP_Status.GetText() == '18') {
                    var PengeluaranTab = PageControl.GetTab(1);
                    PengeluaranTab.SetVisible(true);

                    var AliranKerjaTab = PageControl.GetTab(3);
                    AliranKerjaTab.SetVisible(true);

                    var PemulanganTab = PageControl.GetTab(2);
                    PemulanganTab.SetVisible(true);

                    //prepare pengeluaran listing
                    txtWithdrawProcessId.SetText(Ref_RefProcessId.GetText());
                    txtWithdrawRev.SetText(Ref_RefRevNumber.GetText());
                    GridWithdrawalList.PerformCallback();

                    PageControl.SetActiveTabIndex(2);

                    //pengeluaran
                    chkAssetOfficer.SetEnabled(false);
                    btnAssetOfficerWithdraw.SetEnabled(false);
                    cbp_AssetOfficerWithdraw.PerformCallback('LOAD');

                    //pemulangan
                    RetRevision.SetText(Ref_RefRevNumber.GetText());
                    RetProcessId.SetText(Ref_RefProcessId.GetText());
                    GridReturnList.PerformCallback();
                    cbp_Return.PerformCallback('LOAD');
                }
                else if (PP_Status.GetText() == '19')
                {
                    var PengeluaranTab = PageControl.GetTab(1);
                    PengeluaranTab.SetVisible(true);

                    var AliranKerjaTab = PageControl.GetTab(3);
                    AliranKerjaTab.SetVisible(true);

                    var PemulanganTab = PageControl.GetTab(2);
                    PemulanganTab.SetVisible(true);

                    //prepare pengeluaran listing
                    txtWithdrawProcessId.SetText(Ref_RefProcessId.GetText());
                    txtWithdrawRev.SetText(Ref_RefRevNumber.GetText());
                    GridWithdrawalList.PerformCallback();
                    cbp_AssetOfficerWithdraw.PerformCallback('LOAD');

                    //pemulangan
                    RetRevision.SetText(Ref_RefRevNumber.GetText());
                    RetProcessId.SetText(Ref_RefProcessId.GetText());
                    GridReturnList.PerformCallback();
                    cbp_Return.PerformCallback('LOAD');
                }
            }
        }
    }

    function ShowAssetInvPopup() {
        popupSearchAssetInv.SetWidth(screen.width * 0.85);
        popupSearchAssetInv.Show();
        GridSearchAssetInv.PerformCallback('OPEN');
    }

    function EnableDisableHeaderForm(truefalse)
    {
        if (truefalse == 'true') {
            LinkLookupAsset.SetEnabled(true);
            PP_Purpose.SetEnabled(true);            
        }
        else {
            LinkLookupAsset.SetEnabled(false);
            PP_Purpose.SetEnabled(false);
        }
        EnableDisableGridList(truefalse);
    }

    function EnableDisableGridList(truefalse)
    {
        var PPD_AssetInvUniqueId;

        for (var i = 0; i < GridList.GetVisibleRowsOnPage() ; i++)
        {
            PPD_AssetInvUniqueId = ASPxClientControl.GetControlCollection().GetByName('PPD_AssetInvUniqueId' + i.toString());

            if (truefalse == 'true')
                PPD_AssetInvUniqueId.SetVisible(true);
            else
                PPD_AssetInvUniqueId.SetVisible(false);
        }
    }
</script>

<style type="text/css">
    .auto-style1 {
        border: 1px dotted transparent;
        padding-left: 7px;
        padding-right: 7px;
        padding-top: 2px;
        padding-bottom: 3px;
    }
</style>

<dx:ASPxCallbackPanel ID="cbp_Permohonan" runat="server" ClientInstanceName="cbp_Permohonan" EnableClientSideAPI="True" OnCallback="cbp_Permohonan_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Permohonan_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Maklumat Pemohon" ColCount="2" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Nama" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="EmployeeName" runat="server" ClientEnabled="False" ClientInstanceName="EmployeeName" EnableClientSideAPI="True" Width="90%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Pusat Tanggungjawab" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="EmployeePTJ" runat="server" ClientEnabled="False" ClientInstanceName="EmployeePTJ" EnableClientSideAPI="True" Width="90%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Alamat Emel" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="EmployeeEmail" runat="server" ClientEnabled="False" ClientInstanceName="EmployeeEmail" EnableClientSideAPI="True" Width="90%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No. Telefon" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="EmployeeTelephone" runat="server" ClientEnabled="False" ClientInstanceName="EmployeeTelephone" EnableClientSideAPI="True" Width="250px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="PP_ProcessId" ShowCaption="False" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PP_ProcessId" runat="server" ClientInstanceName="PP_ProcessId" Width="170px" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="PP_RefNumber" ShowCaption="False" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PP_RefNumber" runat="server" ClientInstanceName="PP_RefNumber" Width="170px" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="PP_CreatedByEmpId" ShowCaption="False" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PP_CreatedByEmpId" runat="server" ClientInstanceName="PP_CreatedByEmpId" Width="170px" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="PP_Status" ShowCaption="False" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PP_Status" runat="server" ClientInstanceName="PP_Status" Width="170px" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="PP_Revision" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PP_Revision" runat="server" ClientInstanceName="PP_Revision" EnableClientSideAPI="True" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Tujuan &amp; Senarai Aset Yang Ingin Dipinjam" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Tujuan" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="PP_Purpose" runat="server" ClientInstanceName="PP_Purpose" EnableClientSideAPI="True" Rows="3" Width="50%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxHyperLink ID="LinkLookupAsset" runat="server" ClientInstanceName="LinkLookupAsset" CssClass="myHyperlink" EnableClientSideAPI="True" NavigateUrl="javascript: ShowAssetInvPopup();" Text="Carian aset">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridView ID="GridList" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridList" OnHtmlDataCellPrepared="GridList_HtmlDataCellPrepared" Width="100%">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="PPD_ProcessId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_AssetType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Padam" FieldName="PPD_AssetInvUniqueId" ShowInCustomizationForm="True" VisibleIndex="17" Width="4%">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="PPD_AssetInvUniqueId" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink" ImageUrl="~/Public/Images/GridIcons/GridDelete.png">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriPtj" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="PPD_AssetInvUniqueId" runat="server" EnableClientSideAPI="true" ImageUrl="~/Public/Images/GridIcons/GridDelete.png" Text="ASPxHyperLink" />
                                            </DataItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriDept" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriBuild" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriFloor" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriSpace" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriEmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="AssInvRegNum" ShowInCustomizationForm="True" VisibleIndex="8" Width="14%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="AssInvDesc" ShowInCustomizationForm="True" VisibleIndex="9" Width="14%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewBandColumn Caption="Penempatan Semasa" ShowInCustomizationForm="True" VisibleIndex="16">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Nama Kakitangan" FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="0" Width="14%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="14%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pusat, Bahagian dan Jabatan" FieldName="Dept_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Bangunan dan Blok" FieldName="Build_Name" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Aras" FieldName="Floor_Name" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Ruang" FieldName="Space_Name" ShowInCustomizationForm="True" VisibleIndex="5" Width="10%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                    <SettingsBehavior AllowClientEventsOnLoad="False" AllowDragDrop="False" AllowGroup="False" AllowSort="False" />
                                    <SettingsPager Mode="ShowAllRecords">
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
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
        <Paddings Padding="0px" />
        <Border BorderStyle="None" />
    </dx:ASPxFormLayout>
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
    <dx:ASPxGridView ID="GridSearchAssetInv" runat="server" ClientInstanceName="GridSearchAssetInv" Width="100%" AutoGenerateColumns="False" DataSourceID="SearchDs" KeyFieldName="AssInvUniqueId" EnableCallbackAnimation="True" OnCustomCallback="GridSearchAssetInv_CustomCallback" OnAfterPerformCallback="GridSearchAssetInv_AfterPerformCallback">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AssInvUniqueId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="AssInvRegNum" ShowInCustomizationForm="True" VisibleIndex="2" Width="12%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="AssInvDesc" ShowInCustomizationForm="True" VisibleIndex="3" Width="11%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Pesanan Belian" FieldName="AIRMI_PoNumber" ShowInCustomizationForm="True" VisibleIndex="4" Width="7%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. GRN" FieldName="AIRMI_GRNnumber" ShowInCustomizationForm="True" VisibleIndex="5" Width="7%">
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
                    <dx:GridViewDataTextColumn Caption="Nama Kakitangan" FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="0" Width="13%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="13%">
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
                    <dx:GridViewDataTextColumn Caption="Aras" FieldName="Floor_Name" ShowInCustomizationForm="True" VisibleIndex="4" Width="7%">
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
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsLoadingPanel Mode="Disabled" ShowImage="False" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
        <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMSDbConnectionString %>" SelectCommand="SP_PermohonanPinjaman_SearchAvailableAssetInventory" OnSelecting="SearchDs_Selecting" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="mk" Name="EmpId" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

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
	ProceedWithDelete();
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

<dx:ASPxTextBox ID="TempDelete" runat="server" ClientInstanceName="TempDelete" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
</dx:ASPxTextBox>





<dx:ASPxCallbackPanel ID="cbp_Workflow" runat="server" ClientInstanceName="cbp_Workflow" ClientVisible="False" OnCallback="cbp_Workflow_Callback" Width="200px" ShowLoadingPanel="False" ShowLoadingPanelImage="False">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Workflow_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxTextBox ID="txtWorkflowCount" runat="server" ClientInstanceName="txtWorkflowCount" EnableClientSideAPI="True" Width="170px">
    </dx:ASPxTextBox>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>






