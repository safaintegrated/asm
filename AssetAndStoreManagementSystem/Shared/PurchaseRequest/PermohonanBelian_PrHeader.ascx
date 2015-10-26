<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PermohonanBelian_PrHeader.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.PurchaseRequest.PermohonanBelian_PrHeader" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

<script>

</script>
<dx:ASPxCallbackPanel ID="cbp_PermohonanBelian_PrHeader" runat="server" ClientInstanceName="cbp_PermohonanBelian_PrHeader" OnCallback="cbp_PermohonanBelian_PrHeader_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_PermohonanBelian_PrHeader_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Maklumat Pembelian" Width="100%" ColCount="4">
                <Items>
                    <dx:LayoutItem Caption="Perihal Belian" ColSpan="2" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="PRH_Purpose" runat="server" ClientInstanceName="PRH_Purpose" EnableClientSideAPI="True" Rows="4" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Arahan" ColSpan="2" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="PRH_DeliveryInstruction" runat="server" ClientInstanceName="PRH_DeliveryInstruction" EnableClientSideAPI="True" Rows="4" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Dimohon Oleh" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PRH_RequestBy" runat="server" AutoGenerateColumns="False" ClientInstanceName="PRH_RequestBy" DataSourceID="odsRequestor" EnableClientSideAPI="True" Width="100%" TextFormatString="{0}" KeyFieldName="Id">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Name" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Code" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn FieldName="Deleted" ShowInCustomizationForm="True" VisibleIndex="4">
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="UpdatedBy" ShowInCustomizationForm="True" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents ValueChanged="function(s, e) {
	PRH_RequestBy_ValueChanged(s, e);
}" />
                                </dx:ASPxGridLookup>
                                <asp:ObjectDataSource ID="odsRequestor" runat="server" SelectMethod="FindAll" TypeName="DataAccess.Models.RequestorModel"></asp:ObjectDataSource>
                                <asp:SqlDataSource ID="RequestByDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" SelectCommand="SELECT * FROM [UT_Email] WHERE ([utem_code] IS NOT NULL) ORDER BY [utem_name]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Jenis Perolehan" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="PRH_ProcurementITypeId" runat="server" ClientInstanceName="PRH_ProcurementITypeId" EnableClientSideAPI="True" Width="100%" DataSourceID="odsProcurementType" TextField="Name" ValueField="Id">
                                </dx:ASPxComboBox>
                                <asp:ObjectDataSource ID="odsProcurementType" runat="server" SelectMethod="FindAll" TypeName="DataAccess.Models.ProcurementTypeModel"></asp:ObjectDataSource>
                                <asp:SqlDataSource ID="ProcurementTypeDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [ProcurementType] ORDER BY [ProcurementTypeName]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kategori Perolehan" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="PRH_ProcurementCatId" runat="server" ClientInstanceName="PRH_ProcurementCatId" EnableClientSideAPI="True" Width="100%" DataSourceID="odsProcurementCategory" TextField="Name" ValueField="Id">
                                </dx:ASPxComboBox>
                                <asp:ObjectDataSource ID="odsProcurementCategory" runat="server" SelectMethod="FindAll" TypeName="DataAccess.Models.ProcurementCategoryModel"></asp:ObjectDataSource>
                                <asp:SqlDataSource ID="ProcurementCatDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [ProcurementCategory] ORDER BY [ProcurementCatName]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kaedah Perolehan" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="PRH_ProcurementMethodId" runat="server" ClientInstanceName="PRH_ProcurementMethodId" EnableClientSideAPI="True" Width="100%" DataSourceID="odsProcurementMethod" TextField="Name" ValueField="Id">
                                </dx:ASPxComboBox>
                                <asp:ObjectDataSource ID="odsProcurementMethod" runat="server" SelectMethod="FindAll" TypeName="DataAccess.Models.ProcurementMethodModel"></asp:ObjectDataSource>
                                <asp:SqlDataSource ID="ProcurementMethodDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [ProcurementMethod] ORDER BY [ProcurementMethodName]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Hantar Kepada" ColCount="4">
                <Items>
                    <dx:LayoutItem Caption="Penerima" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PRH_PurchaserId" runat="server" EnableClientSideAPI="True" Width="100%" ClientInstanceName="PRH_PurchaserId" AutoGenerateColumns="False" DataSourceID="odsReceipient" TextFormatString="{0}" KeyFieldName="Id">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Code" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Name" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Address1" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Address2" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Address3" ShowInCustomizationForm="True" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn FieldName="Deleted" ShowInCustomizationForm="True" VisibleIndex="6">
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="UpdatedBy" ShowInCustomizationForm="True" VisibleIndex="8">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents ValueChanged="function(s, e) {
	PRH_PurchaserId_ValueChanged(s, e);
}" />
                                </dx:ASPxGridLookup>
                                <asp:ObjectDataSource ID="odsReceipient" runat="server" SelectMethod="FindAll" TypeName="DataAccess.Models.PuDeliveryAddressModel"></asp:ObjectDataSource>
                                <asp:SqlDataSource ID="ReceipientDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" SelectCommand="SELECT * FROM [PU_Deliveryadd] ORDER BY [puda_purchaserid]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_DeliveryAdd1" ClientInstanceName="PRH_DeliveryAdd1" runat="server" EnableClientSideAPI="True" Width="100%" ClientEnabled="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_DeliveryAdd2" ClientInstanceName="PRH_DeliveryAdd2" runat="server" EnableClientSideAPI="True" Width="100%" ClientEnabled="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_DeliveryAdd3" ClientInstanceName="PRH_DeliveryAdd3" runat="server" EnableClientSideAPI="True" Width="100%" ClientEnabled="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Maklumat Pembekal" ColCount="2">
                <Items>
                    <dx:LayoutItem Caption="Nama Pembekal" Width="60%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PRH_SupplierCode" runat="server" AutoGenerateColumns="False" DataSourceID="odsSupplier" TextFormatString="{1}" Width="100%" ClientInstanceName="PRH_SupplierCode" EnableClientSideAPI="True" KeyFieldName="Id">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="true"/>
                                        
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Code" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Name" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Address1" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Address2" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Address3" ShowInCustomizationForm="True" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Address4" ShowInCustomizationForm="True" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Phone" ShowInCustomizationForm="True" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Fax" ShowInCustomizationForm="True" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Email" ShowInCustomizationForm="True" VisibleIndex="8">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Contact" ShowInCustomizationForm="True" VisibleIndex="9">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="10">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="GlacControlCode" ShowInCustomizationForm="True" VisibleIndex="11">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="GlacDescription" ShowInCustomizationForm="True" VisibleIndex="12">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CertificateNumber" ShowInCustomizationForm="True" VisibleIndex="13">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="RegistrationReference" ShowInCustomizationForm="True" VisibleIndex="14">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn FieldName="StartDate" ShowInCustomizationForm="True" VisibleIndex="15">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataDateColumn FieldName="EndDate" ShowInCustomizationForm="True" VisibleIndex="16">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn FieldName="VatRegstrionNo" ShowInCustomizationForm="True" VisibleIndex="17">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="BumiStatus" ShowInCustomizationForm="True" VisibleIndex="18">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" VisibleIndex="19">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn FieldName="Deleted" ShowInCustomizationForm="True" VisibleIndex="20">
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" VisibleIndex="21">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="UpdatedBy" ShowInCustomizationForm="True" VisibleIndex="22">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(650);
}" ValueChanged="function(s, e) {
	PRH_SupplierCode_ValueChanged(s, e);
}" />
                                </dx:ASPxGridLookup>
                                <asp:ObjectDataSource ID="odsSupplier" runat="server" SelectMethod="FindAll" TypeName="DataAccess.Models.SupplierModel"></asp:ObjectDataSource>
                                <asp:SqlDataSource ID="VendorDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" SelectCommand="SELECT [apsu_suppid], [apsu_lname], [apsu_address1], [apsu_address2], [apsu_address3], [apsu_address4], [apglc_controlglac], [glac_desc] FROM [AP_Supplier] WHERE (([apglc_controlglac] IS NOT NULL) AND ([apsu_status] = @apsu_status)) ORDER BY [apsu_suppid]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="O" Name="apsu_status" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kod GL Pembekal" Width="40%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_SupplierGLCode" runat="server" Width="100%" ClientEnabled="False" ClientInstanceName="PRH_SupplierGLCode" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Alamat 1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_VendorAddress1" runat="server" Width="100%" ClientInstanceName="PRH_VendorAddress1" ClientEnabled="False" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Keterangan GL">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_SupplierGLDesc" runat="server" Width="100%" ClientEnabled="False" ClientInstanceName="PRH_SupplierGLDesc" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Alamat 2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_VendorAddress2" ClientInstanceName="PRH_VendorAddress2" runat="server" Width="100%" ClientEnabled="False" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="Alamat 3">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_VendorAddress3" ClientInstanceName="PRH_VendorAddress3" runat="server" Width="100%" ClientEnabled="False" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="Alamat 4">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_VendorAddress4" ClientInstanceName="PRH_VendorAddress4" runat="server" Width="100%" ClientEnabled="False" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>

    <dx:ASPxTextBox ID="PRH_ProcessId" ClientInstanceName="PRH_ProcessId" ClientEnabled="false" runat="server" Width="170px" ClientVisible="False">
    </dx:ASPxTextBox> 
    <dx:ASPxTextBox ID="PRH_Revision" ClientInstanceName="PRH_Revision" ClientEnabled="false" runat="server" Width="170px" ClientVisible="False">
    </dx:ASPxTextBox> 
    <dx:ASPxTextBox ID="PTJ_SagaCode" ClientInstanceName="PTJ_SagaCode" ClientEnabled="false" runat="server" Width="170px" ClientVisible="False">
    </dx:ASPxTextBox> 
    <dx:ASPxTextBox ID="PRH_Status" ClientInstanceName="PRH_Status" ClientEnabled="false" runat="server" Width="170px" ClientVisible="False">
    </dx:ASPxTextBox> 
    <dx:ASPxTextBox ID="PRH_PRnumber" ClientInstanceName="PRH_PRnumber" ClientEnabled="false" runat="server" Width="170px" ClientVisible="False">
    </dx:ASPxTextBox> 
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>








