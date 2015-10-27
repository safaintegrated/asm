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
                                                                <dx:ASPxComboBox ID="CbPurchaseType" runat="server" ClientInstanceName="CbPurchaseType" DataSourceID="odsPurchaseType" TextField="Name" ValueField="Code" Width="100%" EnableClientSideAPI="True">
                                                                </dx:ASPxComboBox>
                                                                <asp:ObjectDataSource ID="odsPurchaseType" runat="server" SelectMethod="FindAll" TypeName="Data.Models.PurchaseTypeModel"></asp:ObjectDataSource>
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
}
" />
                                                                </dx:ASPxButton>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ColSpan="2" ShowCaption="False">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                                <dx:ASPxGridView ID="TabItemGrid" runat="server" ClientInstanceName="TabItemGrid" OnCustomCallback="TabItemGrid_CustomCallback" Width="100%" AutoGenerateColumns="False" DataSourceID="odsPurchaseItem">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="PurchaseRequestId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="UnitOfMeasurementId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="UnitOfMeasurementName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="CategoryId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="CategoryName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="SubCategoryId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Sub-Kategori" FieldName="SubCategoryName" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="AssetTypeId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="AssetTypeName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="TaxCodeSagaId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="TaxCodeSagaName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Kuantiti" FieldName="Qty" ShowInCustomizationForm="True" VisibleIndex="12">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Harga Seunit" FieldName="PricePerUnit" ShowInCustomizationForm="True" VisibleIndex="13">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="TotalC" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="TotalD" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="TotalE" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Sub-Total" FieldName="SubTotal" ShowInCustomizationForm="True" VisibleIndex="17">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataCheckColumn FieldName="Deleted" ShowInCustomizationForm="True" Visible="False" VisibleIndex="19">
                                                                        </dx:GridViewDataCheckColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" Visible="False" VisibleIndex="20">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="UpdatedBy" ShowInCustomizationForm="True" Visible="False" VisibleIndex="21">
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
                                                                <asp:ObjectDataSource ID="odsPurchaseItem" runat="server" SelectMethod="FindAll" TypeName="Data.Models.PurchaseRequestItemModel"></asp:ObjectDataSource>
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
<dx:ASPxPopupControl ID="popupItemList" runat="server" AllowDragging="True" ClientInstanceName="popupItemList" EnableClientSideAPI="True" HeaderText="Senarai Aset" MaxHeight="650px" MinHeight="450px" MinWidth="650px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True">
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
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxGridView ID="GridItemList" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridItemList" DataSourceID="odsMainInfo" EnableCallbackAnimation="True" OnAfterPerformCallback="GridItemList_AfterPerformCallback" OnCustomCallback="GridItemList_CustomCallback" Width="100%">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Specification" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CategoryId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CategoryName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SubCategoryId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SubCategoryName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Type" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Brand" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Model" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Made" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ManufacturingSerialNumber" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="WarrantyStart" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                        <PropertiesDateEdit DisplayFormatString="">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="WarrantyEnd" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                        <PropertiesDateEdit DisplayFormatString="">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="AssetTypeId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AssetTypeName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RegistrationNumber" ShowInCustomizationForm="True" VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NasionalCode" ShowInCustomizationForm="True" Visible="False" VisibleIndex="17">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="MaintenanceRequired" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LoanApplicable" ShowInCustomizationForm="True" Visible="False" VisibleIndex="19">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SupplierId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="20">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SupplierName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="21">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SupplierAddress" ShowInCustomizationForm="True" Visible="False" VisibleIndex="22">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProcurementMethodId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="23">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProcurementMethodName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="24">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PONumber" ShowInCustomizationForm="True" VisibleIndex="25">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="PODate" ShowInCustomizationForm="True" VisibleIndex="26">
                        <PropertiesDateEdit DisplayFormatString="">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="InvoiceNumber" ShowInCustomizationForm="True" Visible="False" VisibleIndex="27">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="VoucherNumber" ShowInCustomizationForm="True" Visible="False" VisibleIndex="28">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="VoucherDate" ShowInCustomizationForm="True" Visible="False" VisibleIndex="29">
                        <PropertiesDateEdit DisplayFormatString="">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="GRNNumber" ShowInCustomizationForm="True" Visible="False" VisibleIndex="30">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="GRNDate" ShowInCustomizationForm="True" Visible="False" VisibleIndex="31">
                        <PropertiesDateEdit DisplayFormatString="">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="DeliveryNumber" ShowInCustomizationForm="True" Visible="False" VisibleIndex="32">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UnitOfMeasurementId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="33">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UnitOfMeasurementName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="34">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Qty" ShowInCustomizationForm="True" Visible="False" VisibleIndex="35">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PurchasePrice" ShowInCustomizationForm="True" VisibleIndex="36">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="37">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Deleted" ShowInCustomizationForm="True" Visible="False" VisibleIndex="38">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" Visible="False" VisibleIndex="39">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UpdatedBy" ShowInCustomizationForm="True" Visible="False" VisibleIndex="40">
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
            <asp:ObjectDataSource ID="odsMainInfo" runat="server" SelectMethod="FindAll" TypeName="DataAccess.Models.MainRegistrationInfoModel"></asp:ObjectDataSource>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

