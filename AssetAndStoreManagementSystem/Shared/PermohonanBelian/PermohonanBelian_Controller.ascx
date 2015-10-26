<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PermohonanBelian_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.PermohonanBelian.PermohonanBelian_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="~/Shared/PermohonanBelian/PermohonanBelian_PrHeader.ascx" tagname="PermohonanBelian_PrHeader" tagprefix="uc1" %>

<%@ Register src="~/Shared/PermohonanBelian/PermohonanBelian_TabItem.ascx" tagname="PermohonanBelian_TabItem" tagprefix="uc2" %>

<%@ Register src="~/Shared/PermohonanBelian/PermohonanBelian_PopupNewAsset.ascx" tagname="PermohonanBelian_PopupNewAsset" tagprefix="uc3" %>

<style type="text/css">
    .DefaultMainContainerTable {
        width: 100%;
        vertical-align:top;
        text-align:left;
    }
</style>

<script>
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

    function TambahClicked()
    {
        LoadingPanel.SetText('Sistem sedang bersedia untuk memproses rekod permohonan belian baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_PermohonanBelian_PrHeader.PerformCallback('NEW');
    }

    function Toolbar_PopupPr_ItemClick(s, e)
    {
        switch (e.item.name)
        {
            case 'btnSave': Toolbar_SimpanClicked(); break;
        }
    }

    function Toolbar_SimpanClicked()
    {
        if (
            PRH_Purpose.GetText() == '' ||
            PRH_RequestBy.GetText() == '' ||
            PRH_ProcurementITypeId.GetText() == '' ||
            PRH_ProcurementCatId.GetText() == '' ||
            PRH_ProcurementMethodId.GetText() == '' ||
            //PRH_PurchaserId.GetText() == '' || 
            PRH_SupplierCode.GetText() == ''
            )
        {
            popupMsg_Label.SetText('Semua medan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
        }
        else
        {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod permohonan belian.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_PermohonanBelian_PrHeader.PerformCallback('SAVE');
        }
    }

    function Manage_Toolbar_PopupPr(btnEdit, btnSave, btnSubmit, btnCancel, btnWithdraw, btnApprove, btnReject) {
        Toolbar_PopupPr.GetItemByName('btnEdit').SetEnabled(btnEdit);
        Toolbar_PopupPr.GetItemByName('btnSave').SetEnabled(btnSave);
        Toolbar_PopupPr.GetItemByName('btnSubmit').SetEnabled(btnSubmit);
        Toolbar_PopupPr.GetItemByName('btnCancel').SetEnabled(btnCancel);
        Toolbar_PopupPr.GetItemByName('btnWithdraw').SetEnabled(btnWithdraw);
        Toolbar_PopupPr.GetItemByName('btnApprove').SetEnabled(btnApprove);
        Toolbar_PopupPr.GetItemByName('btnReject').SetEnabled(btnReject);
    }

    function ViewPr(p, r)
    {
        PRH_ProcessId.SetText(p.toString());
        PRH_Revision.SetText(r.toString());
        LoadingPanel.SetText('Sistem sedang membuka maklumat permohonan belian yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_PermohonanBelian_PrHeader.PerformCallback('VIEW');
    }
</script>
<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Permohonan Belian" ShowCollapseButton="true" Width="100%">
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%; vertical-align:top;text-align:left;">
        <tr>
            <td>
                <dx:ASPxRibbon ID="MainRibbon" runat="server" ClientInstanceName="MainRibbon" ShowFileTab="False" Width="100%" AllowMinimize="False">
                    <Tabs>
                        <dx:RibbonTab Name="Utama" Text="Utama">
                            <Groups>
                                <dx:RibbonGroup Name="Pengurusan Rekod" Text="Pengurusan Rekod">
                                    <Items>
                                        <dx:RibbonButtonItem Name="Tambah" Size="Large" Text="Tambah">
                                            <LargeImage IconID="actions_add_32x32">
                                            </LargeImage>
                                        </dx:RibbonButtonItem>
                                        <dx:RibbonButtonItem Name="Cetak" Size="Large" Text="Cetak">
                                            <LargeImage IconID="print_print_32x32">
                                            </LargeImage>
                                        </dx:RibbonButtonItem>
                                        <dx:RibbonButtonItem Name="Carian" Size="Large" Text="Carian">
                                            <LargeImage IconID="find_find_32x32">
                                            </LargeImage>
                                        </dx:RibbonButtonItem>
                                        <dx:RibbonButtonItem Name="Tutup" Size="Large" Text="Tutup">
                                            <LargeImage IconID="actions_close_32x32">
                                            </LargeImage>
                                        </dx:RibbonButtonItem>
                                    </Items>
                                </dx:RibbonGroup>
                            </Groups>
                        </dx:RibbonTab>
                    </Tabs>
                    <Styles>
                        <Item Width="70px">
                        </Item>
                    </Styles>
                    <ClientSideEvents CommandExecuted="function(s, e) {
	MainRibbon_CommandExecuted(s, e);
}" />
                </dx:ASPxRibbon>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <dx:ASPxGridView ID="MainGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="MainGrid" DataSourceID="MainGridDs" KeyFieldName="PRH_ProcessId" Width="100%" OnCustomCallback="MainGrid_CustomCallback" OnHtmlDataCellPrepared="MainGrid_HtmlDataCellPrepared">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="PRH_ProcessId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_Purpose" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Perihal Belian">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                            <DataItemTemplate>
                                <dx:ASPxHyperLink ID="PRH_Purpose" EnableClientSideAPI="True" runat="server" Text="ASPxHyperLink">
                                </dx:ASPxHyperLink>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_SupplierName" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Pembekal">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_SupplierCode" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_VendorAddress1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_VendorAddress2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_VendorAddress3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_VendorAddress4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_RequestBy" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Dimohon Oleh">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_PurchaserId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_DeliveryAdd1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_DeliveryAdd2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_DeliveryAdd3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_DeliveryInstruction" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_ProcurementITypeId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_ProcurementMethodId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_ProcurementCatId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_PRnumber" ShowInCustomizationForm="True" VisibleIndex="17" Caption="No. Permohonan Belian">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="PRH_CreationDate" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_CreatedBy" ShowInCustomizationForm="True" Visible="False" VisibleIndex="19">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_Revision" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="20">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRH_Status" ShowInCustomizationForm="True" Visible="False" VisibleIndex="21">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PTJ_SagaCode" ShowInCustomizationForm="True" Visible="False" VisibleIndex="22">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="StatusName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="23" Caption="Status">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsLoadingPanel Mode="Disabled" ShowImage="False" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <Styles>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="MainGridDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SP_PR_Header_Listing" SelectCommandType="StoredProcedure" OnSelecting="MainGridDs_Selecting">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="530" Name="CurrUser" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

<dx:ASPxPopupControl ID="PopupPr" runat="server" ClientInstanceName="PopupPr" CloseAction="CloseButton" EnableClientSideAPI="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True" MinHeight="600px" MinWidth="800px" Modal="True">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table class="DefaultMainContainerTable">
        <tr>
            <td>
                <dx:ASPxMenu ID="Toolbar_PopupPr" runat="server" ClientInstanceName="Toolbar_PopupPr" EnableClientSideAPI="True" Width="100%">
                    <ClientSideEvents ItemClick="function(s, e) {
	Toolbar_PopupPr_ItemClick(s, e);
}" />
                    <Items>
                        <dx:MenuItem Name="btnEdit" Text="Kemaskini">
                            <Image IconID="edit_edit_32x32">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnSave" Text="Simpan">
                            <Image IconID="save_save_32x32">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnSubmit" Text="Hantar">
                            <Image IconID="mail_send_32x32">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnCancel" Text="Batal Kemaskini">
                            <Image IconID="actions_deletelist_32x32">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnWithdraw" Text="Batal Permohonan">
                            <Image IconID="edit_delete_32x32">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnApprove" Text="Diluluskan">
                            <Image IconID="actions_apply_32x32">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnReject" Text="Tidak Diluluskan">
                            <Image IconID="actions_cancel_32x32">
                            </Image>
                        </dx:MenuItem>
                    </Items>
                </dx:ASPxMenu>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <dx:ASPxPageControl ID="PageControl_PopupPr" runat="server" ActiveTabIndex="0" ClientInstanceName="PageControl_PopupPr" EnableClientSideAPI="True" Width="100%">
                    <TabPages>
                        <dx:TabPage Text="Utama">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc1:PermohonanBelian_PrHeader ID="PermohonanBelian_PrHeader1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Item">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    
                                    <uc2:PermohonanBelian_TabItem ID="PermohonanBelian_TabItem1" runat="server" />
                                    
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Senarai Semak">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Aliran Kerja">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>
                </dx:ASPxPageControl>
            </td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>


<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px">
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
                        <td style="width:30%">
                            <dx:aspxbutton ID="popupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupMsg_BtnOk" Text="Ok" Width="100%">
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
<uc3:PermohonanBelian_PopupNewAsset ID="PermohonanBelian_PopupNewAsset1" runat="server" />

