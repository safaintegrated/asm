<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PermohonanBelian_TabItem.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.PurchaseRequest.PermohonanBelian_TabItem" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>

</script>
<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                        <Items>
                                            <dx:LayoutGroup Caption="Item untuk Permohonan Belian Ini" ColCount="2" Width="100%">
                                                <Items>
                                                    <dx:LayoutItem Caption="Jenis Pembelian" Width="30%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                                <dx:ASPxComboBox ID="CbPurchaseType" runat="server" ClientInstanceName="CbPurchaseType" DataSourceID="odsPurchaseType" TextField="Name" ValueField="Id" Width="100%" EnableClientSideAPI="True">
                                                                </dx:ASPxComboBox>
                                                                <asp:ObjectDataSource ID="odsPurchaseType" runat="server" SelectMethod="FindAll" TypeName="DataAccess.Models.PurchaseTypeModel"></asp:ObjectDataSource>
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
                                                                <dx:ASPxGridView ID="TabItemGrid" runat="server" ClientInstanceName="TabItemGrid" OnCustomCallback="TabItemGrid_CustomCallback" Width="100%" AutoGenerateColumns="False">
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
                                                                <dx:ASPxTextBox ID="TabItem_RevNum0" runat="server" ClientEnabled="False" ClientInstanceName="TabItem_RevNum" EnableClientSideAPI="True" Width="170px">
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
