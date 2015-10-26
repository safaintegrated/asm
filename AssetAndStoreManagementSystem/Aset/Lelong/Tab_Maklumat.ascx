<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Maklumat.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Lelong.Tab_Maklumat" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function EnableDisableScreen(truefalse)
    {
        if(truefalse == 'true')
        {
            HeaderForm.SetEnabled(true);
            LinkSearchAssetInv.SetEnabled(true);
            EnableDisableListingGrid('true');
        }
        else
        {
            HeaderForm.SetEnabled(false);
            LinkSearchAssetInv.SetEnabled(false);
            EnableDisableListingGrid('false');
        }
    }

    function EnableDisableListingGrid(truefalse)
    {
        var KLD_AssetInvUniqueId;

        for (var i = 0; i < GridList.GetVisibleRowsOnPage() ; i++)
        {
            KLD_AssetInvUniqueId = ASPxClientControl.GetControlCollection().GetByName('KLD_AssetInvUniqueId' + i.toString());

            if (truefalse == 'true')
                KLD_AssetInvUniqueId.SetVisible(true);
            else
                KLD_AssetInvUniqueId.SetVisible(false);
        }
    }

    function cbp_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'ITEMSELECTED')
            {
                popupSearchAssetInv.Hide();
            }
            else if (s.cpMode.toString() == 'LOAD')
            {
                EnableDisableScreen('false');
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                popupSearch.Hide();
                Ref_RefProcessId.SetText(KLH_ProcessID.GetText());
                cbp_Ref.PerformCallback();
            }
            else if (s.cpMode.toString() == 'ADD') {
                EnableDisableScreen('true');
                ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
                Ref_RefProcessId.SetText('');
                cbp_Ref.PerformCallback();
            }
            else if (s.cpMode.toString() == 'DELETEITEM')
            {
                popupDeleteConfirmation.Hide();
            }
            else if (s.cpMode.toString() == 'DELETE') {
                popupDeleteHeaderConfirmation.Hide();
                EnableDisableScreen('false');
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                Ref_RefProcessId.SetText('');

                popupMsg_Label.SetText('Rekod Kenyataan Lelong telah dipadam dengan jayanya.');
                popupMsg.Show();

                cbp_Ref.PerformCallback();
            }
            else if (s.cpMode.toString() == 'SAVE') {
                popupDeleteConfirmation.Hide();
                EnableDisableScreen('false');
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true')
                Ref_RefProcessId.SetText(KLH_ProcessID.GetText());            

                cbp_Ref.PerformCallback();
                popupMsg_Label.SetText('Rekod Kenyataan Lelong telah disimpan dengan jayanya.');
                popupMsg.Show();
            }
            else if (s.cpMode.toString() == 'CANCEL') {
                EnableDisableScreen('false');
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                Ref_RefProcessId.SetText('');
                cbp_Ref.PerformCallback();
            }

        }
    }

    function LookupAssetInv()
    {
        popupSearchAssetInv.SetWidth(screen.width * 0.85);
        popupSearchAssetInv.Show();
        GridSearchAssetInv.PerformCallback();
    }

    function RemoveAssetInv(UniqueId,Desc)
    {
        TempDeleteAssetInv.SetText(UniqueId.toString());
        popupDeleteConfirmation_Label.SetText('Padam rekod ini (<b>' + Desc.toString() + '</b>)?<br>Anda pasti?')
        popupDeleteConfirmation.Show();
    }

    function ProceedWithDelete()
    {
        LoadingPanel.SetText('Sistem sedang memadam rekod yang dipilih.  Sila tunggu sebentar..')
        LoadingPanel.Show();
        cbp.PerformCallback('DELETEITEM')
    }

    function cbTimeEditFormat_SelectedIndexChanged(s, e) {
        if (s.GetText() == "Custom") {
            cbTimeEditFormatString.SetEnabled(true);
            e.processOnServer = false;
        }
    }
</script>

<dx:ASPxCallbackPanel ID="cbp" runat="server" ClientInstanceName="cbp" EnableCallbackAnimation="True" OnCallback="cbp_Callback" Width="100%" ShowLoadingPanel="False" ShowLoadingPanelImage="False">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="HeaderForm" runat="server" Width="100%" ClientInstanceName="HeaderForm">
        <Items>
            <dx:LayoutGroup Caption="Maklumat Kenyataan Lelong" ColCount="2" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="No. Kenyataan Lelong" Width="50%">
                          <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="KLH_NoLelongan" runat="server" ClientInstanceName="KLH_NoLelongan" CssClass="TextBoxForId" EnableClientSideAPI="True" Width="80%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Harga Simpanan (RM)" Width="50%">
                           <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="KLH_ReservedPrice" runat="server" AllowMouseWheel="False" ClientInstanceName="KLH_ReservedPrice" CssClass="SpinEditForMoney" DisplayFormatString="n" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" Width="80%">
                                    <SpinButtons ShowIncrementButtons="False">
                                    </SpinButtons>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh">
                         <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="KLH_AuctionDate" runat="server" UseMaskBehavior="True" ClientInstanceName="KLH_AuctionDate" DisplayFormatString="dd/MM/yyyy hh:mm tt" EditFormat="Custom" EnableClientSideAPI="True" EditFormatString="dd/MM/yyyy hh:mm tt" Width="80%">
                                <TimeSectionProperties Visible="True">
                                    <TimeEditProperties EditFormatString="hh:mm tt" />
                                </TimeSectionProperties>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                             </LayoutItemNestedControlCollection>                      
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Alamat">
                         <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="KLH_AuctionLocation" runat="server" ClientInstanceName="KLH_AuctionLocation" EnableClientSideAPI="True" Rows="5" Width="80%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>                     
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="KLH_ProcessID" ShowCaption="False" Width="35%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="KLH_ProcessID" runat="server" ClientInstanceName="KLH_ProcessID" Width="170px" ClientVisible="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Lihat Item Lelongan" ColCount="2">
                <Items>
                    <dx:LayoutItem Caption="Tarikh Mula" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="KLH_ViewStartDate" runat="server" UseMaskBehavior="True" ClientInstanceName="KLH_ViewStartDate" CssClass="DateEditor" DisplayFormatString="dd/MM/yyyy hh:mm tt" EditFormat="Custom" EnableClientSideAPI="True" EditFormatString="dd/MM/yyyy hh:mm tt" Width="80%">
                                <TimeSectionProperties Visible="True">
                                    <TimeEditProperties EditFormatString="hh:mm tt" />
                                </TimeSectionProperties>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh Tamat" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="KLH_ViewEndDate" runat="server" UseMaskBehavior="True" ClientInstanceName="KLH_ViewEndDate" DisplayFormatString="dd/MM/yyyy hh:mm tt" EditFormat="Custom" EnableClientSideAPI="True" EditFormatString="dd/MM/yyyy hh:mm tt" Width="80%">
                                <TimeSectionProperties Visible="True">
                                    <TimeEditProperties EditFormatString="hh:mm tt" />
                                </TimeSectionProperties>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Alamat">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="KLH_ViewLocation" runat="server" ClientInstanceName="KLH_ViewLocation" EnableClientSideAPI="True" Rows="5" Width="80%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem ColSpan="2" Width="60%">
                    </dx:EmptyLayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
    </dx:ASPxFormLayout>
    <dx:ASPxFormLayout ID="ASPxFormLayout3" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Senarai Aset Kenyataan Lelong">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxHyperLink ID="LinkSearchAssetInv" runat="server" ClientInstanceName="LinkSearchAssetInv" CssClass="myHyperlink" EnableClientSideAPI="True" Text="Carian Aset" NavigateUrl="javascript: LookupAssetInv();">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridView ID="GridList" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridList" EnableCallbackAnimation="True" KeyFieldName="KLD_ProcessId" OnHtmlDataCellPrepared="GridList_HtmlDataCellPrepared" Width="100%">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="Reg_Number" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="20%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan Aset Alih" FieldName="AIRMI_Desc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="40%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Jenama" FieldName="AIRMI_Brand" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="25%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="Tarikh Diterima" FieldName="AIRMI_ReceivedDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                            </PropertiesDateEdit>
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn FieldName="KLD_ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Padam" FieldName="KLD_AssetInvUniqueId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="5%">
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="KLD_AssetInvUniqueId" runat="server" EnableClientSideAPI="true" ImageUrl="~/Public/Images/GridIcons/GridDelete.png" Text="ASPxHyperLink">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="KLD_AssetInvType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
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
	cbp.PerformCallback('ITEMSELECTED');
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
            <dx:ASPxGridView ID="GridSearchAssetInv" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSearchAssetInv" DataSourceID="SearchDs" EnableCallbackAnimation="True" KeyFieldName="AssInvUniqueId" OnCustomCallback="GridSearchAssetInv_CustomCallback" Width="100%" OnAfterPerformCallback="GridSearchAssetInv_AfterPerformCallback">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="AssInvUniqueId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="AssInvRegNum" ShowInCustomizationForm="True" VisibleIndex="2" Width="12%">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="AssInvDesc" ShowInCustomizationForm="True" VisibleIndex="3" Width="11%">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="No. Pesanan Belian" FieldName="AIRMI_PoNumber" ShowInCustomizationForm="True" VisibleIndex="4" Width="7%">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="No. GRN" FieldName="AIRMI_GRNnumber" ShowInCustomizationForm="True" VisibleIndex="5" Width="7%">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                        </CellStyle>
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
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_FullName" ShowInCustomizationForm="True" VisibleIndex="1" Width="13%">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Pusat, Bahagian dan Jabatan" FieldName="Dept_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Bangunan dan Blok" FieldName="Build_Name" ShowInCustomizationForm="True" VisibleIndex="3" Width="9%">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Aras" FieldName="Floor_Name" ShowInCustomizationForm="True" VisibleIndex="4" Width="7%">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Ruang" FieldName="Space_Name" ShowInCustomizationForm="True" VisibleIndex="5" Width="9%">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                </CellStyle>
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
                    <dx:GridViewDataTextColumn FieldName="AIRMI_Brand" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AIRMI_ReceivedDate" ShowInCustomizationForm="True" Visible="False" VisibleIndex="19">
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
            <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMSDbConnectionString %>" SelectCommand="SELECT * FROM [V_LookupAssetAndInventoryReadyForDisposal] ORDER BY [AssInvRegNum]"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxTextBox ID="TempDeleteAssetInv" runat="server" ClientInstanceName="TempDeleteAssetInv" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
</dx:ASPxTextBox>

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


<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol3" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupMsg_Label" runat="server" ClientInstanceName="popupMsg_Label" EnableClientSideAPI="True" EncodeHtml="False">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:35%"></td>
                        <td style="width:30%; text-align:center; vertical-align:middle;">
                            <dx:aspxbutton ID="popupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupMsg_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupMsg.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:35%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>