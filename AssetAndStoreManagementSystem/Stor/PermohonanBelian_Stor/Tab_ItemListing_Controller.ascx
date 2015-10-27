﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_ItemListing_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanBelian_Stor.Tab_ItemListing_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function ProceedWithDelete()
    {
        popupDeleteConfirmation.Hide();
        cbp_deletePrItem.PerformCallback(PRI_ItemNumber.GetText());
    }

    function DeletePrDetails(PrItemNumber)
    {
        PRI_ItemNumber.SetText(PrItemNumber.toString());
        popupDeleteConfirmation.Show();
    }

    function ViewPrDetails(PrItemNumber)
    {
        LoadingPanel.SetText('Sistem sedang membuka maklumat item.  Sila tunggu sebentar');
        LoadingPanel.Show();
        PRI_ItemNumber.SetText(PrItemNumber.toString());
        cbp_SavePRItem.PerformCallback('LOAD');
    }

    function CreateNewPrItem()
    {
        cbp_GenerateNewItem.PerformCallback();
    }

    function cbp_GenerateNewItem_EndCallback(s, e)
    {
        LoadingPanel.SetText('Sistem sedang mencipta maklumat item baru.  Sila tunggu sebentar');
        LoadingPanel.Show();
        PRI_ItemNumber.SetText(s.cpNextNumber.toString());
        PRI_ProcessId.SetText(TabItemListing_PRProcessId.GetText());
        TabItemDetail_EditMode.SetText('1');
        cbp_SavePRItem.PerformCallback('LOAD');
    }

    function GridPRItemListing_EndCallback() {
        if (TabItemListing_EditMode.GetText() == '0')
        { EnableDisablePrItemListGrid('false') }
        else
        { EnableDisablePrItemListGrid('true'); }
    }

    function EnableDisablePrItemListGrid(EnableDisable)
    {
        var PRI_ItemNumber;

        for (var i = 0; i < GridPRItemListing.GetVisibleRowsOnPage() ; i++)
        {
            PRI_ItemNumber = ASPxClientControl.GetControlCollection().GetByName('PRI_ItemNumber_' + i.toString());

            if (EnableDisable == 'true')
                PRI_ItemNumber.SetEnabled(true);
            else
                PRI_ItemNumber.SetEnabled(false);
        }
    }
</script>
<dx:ASPxFormLayout ID="FormPRItemListing" runat="server" ClientInstanceName="FormPRItemListing" Width="100%">
    <Items>
        <dx:LayoutItem ShowCaption="False" Width="100%">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer runat="server">
                    <dx:ASPxHyperLink ID="LinkAddNewPrItem" runat="server" Text="Tambah item baru.." CssClass="myHyperlink" NavigateUrl="javascript: CreateNewPrItem();" ClientInstanceName="LinkAddNewPrItem" EnableClientSideAPI="True">
                    </dx:ASPxHyperLink>
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
                    <dx:ASPxGridView ID="GridPRItemListing" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridPRItemListing" DataSourceID="PR_ItemListing_Ds" EnableCallbackAnimation="True" KeyFieldName="PRI_ItemNumber" OnHtmlDataCellPrepared="GridPRItemListing_HtmlDataCellPrepared" OnCustomCallback="GridPRItemListing_CustomCallback">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="n" FieldName="PRI_TotalRowAmount"    ShowInColumn="PRI_TotalRowAmount"    ShowInGroupFooterColumn="PRI_TotalRowAmount"     SummaryType="Sum" ValueDisplayFormat="n" />
                        </TotalSummary>
                        <ClientSideEvents EndCallback="function(s, e) {
	GridPRItemListing_EndCallback();
}" />
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="#" ShowInCustomizationForm="True" VisibleIndex="0" Width="3%" FieldName="RowNumber" ReadOnly="True">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Padam" ShowInCustomizationForm="True" VisibleIndex="7" Width="5%" FieldName="PRI_ItemNumber">
                                 <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>
                                <DataItemTemplate>
                                    <dx:ASPxHyperLink ID="PRI_ItemNumber" EnableClientSideAPI="true" runat="server" Text="" ImageUrl="~/Public/Images/GridIcons/GridDelete.png">
                                    </dx:ASPxHyperLink>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Jenis Belian" ShowInCustomizationForm="True" VisibleIndex="1" Width="12%" FieldName="PRI_PurchaseType" ReadOnly="True">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Keterangan" ShowInCustomizationForm="True" VisibleIndex="2" Width="34%" FieldName="PRI_Desc">
                                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                <DataItemTemplate>
                                    <dx:ASPxHyperLink ID="PRI_Desc" runat="server" Text="ASPxHyperLink" EnableClientSideAPI="true">
                                    </dx:ASPxHyperLink>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Kod GL (VOT)" ShowInCustomizationForm="True" VisibleIndex="6" Width="16%" FieldName="PRI_GLcode" ReadOnly="True">
                                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Kuantiti" ShowInCustomizationForm="True" VisibleIndex="3" Width="8%" FieldName="PRI_Qty" PropertiesTextEdit-DisplayFormatString="n0">
<PropertiesTextEdit DisplayFormatString="n0"></PropertiesTextEdit>

                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Kos Seunit (RM)" ShowInCustomizationForm="True" VisibleIndex="4" Width="12%" FieldName="PRI_UnitPrice" PropertiesTextEdit-DisplayFormatString="n">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                             <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Jumlah" FieldName="PRI_TotalRowAmount" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="10%" PropertiesTextEdit-DisplayFormatString="n">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                               <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" />
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        <Styles>
                            <AlternatingRow Enabled="True">
                            </AlternatingRow>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="PR_ItemListing_Ds" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="PR_ItemListing_Ds_Selecting" SelectCommand="SP_PermohonanBelian_GetAllItems" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="XXX" Name="ProcessId" Type="String" />
                            <asp:Parameter DefaultValue="0" Name="Revision" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </dx:LayoutItemNestedControlContainer>
            </LayoutItemNestedControlCollection>
        </dx:LayoutItem>
    </Items>
    <Paddings Padding="0px" />
    <Border BorderStyle="None" />
</dx:ASPxFormLayout>
<dx:ASPxTextBox ID="TabItemListing_PRProcessId" runat="server" ClientInstanceName="TabItemListing_PRProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="TabItemListing_PrRevision" runat="server" ClientInstanceName="TabItemListing_PrRevision" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="TabItemListing_EditMode" runat="server" ClientInstanceName="TabItemListing_EditMode" EnableClientSideAPI="True" Text="0" Width="170px" ClientVisible="False">
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



<dx:ASPxCallbackPanel ID="cbp_GenerateNewItem" runat="server" ClientInstanceName="cbp_GenerateNewItem" ClientVisible="False" OnCallback="cbp_GenerateNewItem_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_GenerateNewItem_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>




<dx:ASPxCallbackPanel ID="cbp_deletePrItem" runat="server" ClientInstanceName="cbp_deletePrItem" ClientVisible="False" OnCallback="cbp_deletePrItem_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {
	GridPRItemListing.PerformCallback();
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>





