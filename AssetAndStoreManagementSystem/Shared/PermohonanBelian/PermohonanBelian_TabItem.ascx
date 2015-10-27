<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PermohonanBelian_TabItem.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.PermohonanBelian.PermohonanBelian_TabItem" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function btnSelectPurchaseType_Click(s, e) {
        if (CbPurchaseType.GetText() == '') {
            popupMsg_Label.SetText('Sila pilih jenis pembelian terlebih dahulu.');
            popupMsg.Show();
        }
        else {
            switch (CbPurchaseType.GetValue().toString()) {
                case "1": cbp_FormNextItemNumber.PerformCallback('1'); break;   //Aset Baharu
                case "2": cbp_FormNextItemNumber.PerformCallback('2'); break;   //Penyelenggaraan
                case "3": cbp_FormNextItemNumber.PerformCallback('3'); break;   //Alat Ganti
                case "4": cbp_FormNextItemNumber.PerformCallback('4'); break;   //Tambahan
                case "5": cbp_FormNextItemNumber.PerformCallback('5'); break;   //Stok
                case "6": cbp_FormNextItemNumber.PerformCallback('6'); break;   //Lain-lain
            }
        }
    }

   

    function cbp_FormNextItemNumber_EndCallback(s, e)
    {
        switch (s.cpPurchaseType.toString())
        {
            case "1": NewAssetMode(s.cpNextItemNumber.toString()); break;   //Aset Baharu
            case "2": NewAssetMode(s.cpNextItemNumber.toString()); break;   //Penyelenggaraan
            case "3": NewAssetMode(s.cpNextItemNumber.toString()); break;   //Alat Ganti
            case "4": NewAssetMode(s.cpNextItemNumber.toString()); break;   //Tambahan
            case "5": NewAssetMode(s.cpNextItemNumber.toString()); break;   //Stok
            case "6": NewAssetMode(s.cpNextItemNumber.toString()); break;   //Lain-lain

        }
    }

    function NewAssetMode(num)
    {
        NewAsset_PRI_ProcessId.SetText(TabItem_ProcessId.GetText());
        NewAsset_PRI_ItemNumber.SetText(num.toString());
        NewAsset_PRI_Revision.SetText(TabItem_RevNum.GetText());
        cbp_LineItem_NewAsset.PerformCallback('NEW');
    }

    function EnableDisableItemForm(EnableDisable) {
        CbPurchaseType.SetEnabled(EnableDisable);
        btnSelectPurchaseType.SetEnabled(EnableDisable);
    }
</script>
<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                        <Items>
                                            <dx:LayoutGroup Caption="Item untuk Permohonan Belian Ini" ColCount="2" Width="100%">
                                                <Items>
                                                    <dx:LayoutItem Caption="Jenis Pembelian" Width="30%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                                <dx:ASPxComboBox ID="CbPurchaseType" runat="server" ClientInstanceName="CbPurchaseType" DataSourceID="PurchaseTypeDs" TextField="PurchaseName" ValueField="PurchaseId" ValueType="System.Int32" Width="100%" EnableClientSideAPI="True">
                                                                </dx:ASPxComboBox>
                                                                <asp:SqlDataSource ID="PurchaseTypeDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [MasterPurchasingType] ORDER BY [PurchaseName]"></asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ShowCaption="False" Width="70%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                                                <dx:ASPxButton ID="btnSelectPurchaseType" runat="server" AutoPostBack="False" ClientInstanceName="btnSelectPurchaseType" Text="Pilih" Width="120px" EnableClientSideAPI="True">
                                                                    <ClientSideEvents Click="function(s, e) {
	btnSelectPurchaseType_Click(s, e);
}" />
                                                                </dx:ASPxButton>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ColSpan="2" ShowCaption="False">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                                <dx:ASPxGridView ID="TabItemGrid" runat="server" ClientInstanceName="TabItemGrid" OnCustomCallback="TabItemGrid_CustomCallback" Width="100%" AutoGenerateColumns="False" DataSourceID="PrItemDs" KeyFieldName="PRI_ProcessId">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="PRI_ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PRI_ItemNumber" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Jenis Belian" FieldName="PRI_PurchaseType" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                                                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="PRI_Desc" ShowInCustomizationForm="True" VisibleIndex="0" Width="39%">
                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Sub-Kategori" FieldName="PRI_SubCatId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="27%">
                                                                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Kuantiti" FieldName="PRI_Qty" ShowInCustomizationForm="True" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="n0" Width="7%">
<PropertiesTextEdit DisplayFormatString="n0"></PropertiesTextEdit>

                                                                            <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Harga Seunit" FieldName="PRI_UnitPrice" ShowInCustomizationForm="True" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="n" Width="7%">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                                                                             <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Sub-Total" FieldName="PRI_TotalRowAmount" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="n" Width="7%">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                                                                             <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PRI_Revision" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <SettingsPager Mode="ShowAllRecords">
                                                                    </SettingsPager>
                                                                    <SettingsLoadingPanel Mode="Disabled" ShowImage="False" />
                                                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                                    <Styles>
                                                                        <AlternatingRow Enabled="True">
                                                                        </AlternatingRow>
                                                                    </Styles>
                                                                </dx:ASPxGridView>
                                                                <asp:SqlDataSource ID="PrItemDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SELECT * FROM [V_PR_ItemListing] WHERE (([PRI_ProcessId] = @PRI_ProcessId) AND ([PRI_Revision] = @PRI_Revision)) ORDER BY [PRI_ItemNumber]">
                                                                    <SelectParameters>
                                                                        <asp:Parameter Name="PRI_ProcessId" Type="String" />
                                                                        <asp:Parameter Name="PRI_Revision" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ShowCaption="False">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="TabItem_ProcessId" runat="server" ClientEnabled="False" ClientInstanceName="TabItem_ProcessId" EnableClientSideAPI="True" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ShowCaption="False">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="TabItem_RevNum" runat="server" ClientEnabled="False" ClientInstanceName="TabItem_RevNum" EnableClientSideAPI="True" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                        </Items>
                                    </dx:ASPxFormLayout>
<dx:ASPxCallbackPanel ID="cbp_FormNextItemNumber" runat="server" ClientInstanceName="cbp_FormNextItemNumber" ClientVisible="False" OnCallback="cbp_FormNextItemNumber_Callback" Width="200px" ShowLoadingPanel="False" ShowLoadingPanelImage="False">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_FormNextItemNumber_EndCallback(s,e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>
