<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PermohonanBelian_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.PurchaseRequest.PermohonanBelian_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="~/Shared/PurchaseRequest/PermohonanBelian_PrHeader.ascx" tagname="PermohonanBelian_PrHeader" tagprefix="uc1" %>
<%@ Register src="~/Shared/PurchaseRequest/PermohonanBelian_TabItem.ascx" tagname="PermohonanBelian_TabItem" tagprefix="uc2" %>
<%@ Register src="~/Shared/PurchaseRequest/PermohonanBelian_PopupNewAsset.ascx" tagname="PermohonanBelian_PopupNewAsset" tagprefix="uc3" %>

<style type="text/css">
    .DefaultMainContainerTable {
        width: 100%;
        vertical-align:top;
        text-align:left;
    }
</style>

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
                <dx:ASPxGridView ID="MainGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="MainGrid" DataSourceID="odsPurchaseRequest" Width="100%" OnCustomCallback="MainGrid_CustomCallback" OnHtmlDataCellPrepared="MainGrid_HtmlDataCellPrepared" KeyFieldName="Id">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Instruction" ShowInCustomizationForm="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RequesterId" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RequestorName" ShowInCustomizationForm="True" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ProcurementTypeId" ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ProcurementTypeName" ShowInCustomizationForm="True" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ProcurementCategoryId" ShowInCustomizationForm="True" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ProcurementCategory" ShowInCustomizationForm="True" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ProcurementMethodId" ShowInCustomizationForm="True" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ProcurementMethod" ShowInCustomizationForm="True" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ReceiverId" ShowInCustomizationForm="True" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SupplierId" ShowInCustomizationForm="True" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SupplierName" ShowInCustomizationForm="True" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RevisionNumber" ShowInCustomizationForm="True" VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ProcessId" ShowInCustomizationForm="True" VisibleIndex="14">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PrNumber" ShowInCustomizationForm="True" VisibleIndex="15">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="StatusName" ShowInCustomizationForm="True" VisibleIndex="16">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" VisibleIndex="17">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="Deleted" ShowInCustomizationForm="True" VisibleIndex="18">
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" VisibleIndex="19">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UpdatedBy" ShowInCustomizationForm="True" VisibleIndex="20">
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
                <asp:ObjectDataSource ID="odsPurchaseRequest" runat="server" SelectMethod="FindAll" TypeName="DataAccess.Models.PurchaseRequestModel"></asp:ObjectDataSource>
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