<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_SenaraiStok.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.DaftarStok.Tab_SenaraiStok" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function FillStoreInfo(Values) {
        ST_Txt_StoreId.SetText(Values);
    }
    function BtnSubmit_Click() {
        cbp.PerformCallback('REFRESH_DAFTAR_STOCK');
    }

    function ButtonSubmitEndCallBack() {
    }

</script>

<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Senarai Stok Di Dalam Stor" Width="100%" ColCount="2">
            <Items>
                <dx:LayoutItem Caption="Pusat Tanggungjawab" Width="50%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridLookup ID="glSenaraiPtj" runat="server" AutoGenerateColumns="False" ClientInstanceName="glSenaraiPtj" DataSourceID="dsPtj" KeyFieldName="PTJ_Id" TextFormatString="({0}) {1}" Width="100%">
                                <GridViewProperties>
                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                    <Settings ShowFilterRow="True" />
                                </GridViewProperties>
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Kod" FieldName="PTJ_Code" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nama" FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <ClientSideEvents EndCallback="function(s, e) {
	glSenaraiStore.GetGridView().Refresh();

}
" />
                            </dx:ASPxGridLookup>
                            <asp:SqlDataSource ID="dsPtj" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllPtj" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Stor" Width="50%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridLookup ID="glSenaraiStore" runat="server" AutoGenerateColumns="False" ClientInstanceName="glSenaraiStore" DataSourceID="dsStore" KeyFieldName="ST_StoreId" OnTextChanged="ST_StoreId_TextChanged" TextFormatString="{1}" Width="100%">
                                <GridViewProperties>
                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                    <Settings ShowFilterRow="True" />
                                </GridViewProperties>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="ST_StoreId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ST_StoreName" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ST_StorePTJId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ST_StoreOfficerEmpSysId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="EmployeeIdNo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PTJ_Code" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PTJ_Name" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <ClientSideEvents EndCallback="function(s, e) {
	glSenaraiLocation.GetGridView().Refresh();

}
" />
                            </dx:ASPxGridLookup>
                            <asp:SqlDataSource ID="dsStore" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllStoreByPtjId" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="glSenaraiPtj" DefaultValue="0" Name="PtjId" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Lokasi" Width="50%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridLookup ID="glSenaraiLocation" runat="server" AutoGenerateColumns="False" ClientInstanceName="glSenaraiLocation" DataSourceID="dsLocation" EnableClientSideAPI="True" KeyFieldName="LocationId" TextFormatString="{1} - {2} - {3} - {4} - {5} - {6}" Width="100%">
                                <GridViewProperties>
                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                    <Settings ShowFilterRow="True" />
                                </GridViewProperties>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="LocationId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nama" FieldName="LocationName" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Seksyen / Gudang" FieldName="LocationSection" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Baris" FieldName="LocationLine" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Rak" FieldName="LocationShelf" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tingkat" FieldName="LocationLevel" ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Petak" FieldName="LocationSwath" ShowInCustomizationForm="True" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="StoreId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridLookup>
                            <asp:SqlDataSource ID="dsLocation" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindLocationStoreById" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="glSenaraiStore" DefaultValue="0" Name="StoreId" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Jenis Stok" Width="50%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridLookup ID="glSenaraiStock" runat="server" AutoGenerateColumns="False" ClientInstanceName="glSenaraiStock" DataSourceID="dsStock" EnableClientSideAPI="True" KeyFieldName="Stock_Id" TextFormatString="({1}) {2}" Width="100%">
                                <GridViewProperties>
                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                    <Settings ShowFilterRow="True" />
                                </GridViewProperties>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Stock_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="No Pendaftaran" FieldName="Stock_RegisterNo" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="Stock_Detail" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Stock_StatusExpiryDate" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="StockGroup" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Category" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="SubCategory" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Measurement" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridLookup>
                            <asp:SqlDataSource ID="dsStock" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_Store_Find_Stock" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False" Width="50%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Jana Senarai" HorizontalAlign="Right" ShowCaption="False" Width="50%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxButton ID="ST_Btn_Submit" runat="server" OnClick="ST_Btn_Submit_Click" Text="Jana Senarai">
                                <ClientSideEvents Click="function(s, e) {
	BtnSubmit_Click();
}" />
                            </dx:ASPxButton>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
        <dx:LayoutGroup>
            <Items>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridView ID="ST_Grid_DaftarStock" runat="server" AutoGenerateColumns="False" DataSourceID="DaftarStockDataSource" KeyFieldName="Id" OnCustomCallback="ST_Grid_DaftarStock_CustomCallback" Width="100%">
                                <Columns>
                                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PtjId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="StoreId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="LocationId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="StockId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="No Rujukan" FieldName="NoPkBppsBtb" ShowInCustomizationForm="True" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Baki" FieldName="CurrentBalance" ShowInCustomizationForm="True" VisibleIndex="18">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ParasMenokok" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TransactionType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Masuk Daripada" FieldName="TransInFrom" ShowInCustomizationForm="True" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TransInQuantityRequest" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Kuantiti Masuk" FieldName="TransInQuantity" ShowInCustomizationForm="True" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TransInUnitPrice" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Keluar Kepada" FieldName="TransOutTo" ShowInCustomizationForm="True" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TransOutQuantityRequest" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TransOutUnitPrice" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Kuantiti Keluar" FieldName="TransOutQuantity" ShowInCustomizationForm="True" VisibleIndex="17">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="DateTime" ShowInCustomizationForm="True" VisibleIndex="6">
                                    </dx:GridViewDataDateColumn>
                                </Columns>
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="DaftarStockDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" OnSelecting="DaftarStockDataSource_Selecting" SelectCommand="SELECT * FROM [StockRegistration] WHERE (([StockId] = @StockId) AND ([LocationId] = @LocationId)) ORDER BY [DateTime]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="glSenaraiStock" Name="StockId" PropertyName="Value" Type="Int32" />
                                    <asp:ControlParameter ControlID="glSenaraiLocation" Name="LocationId" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
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





















<dx:ASPxCallbackPanel ID="cbp" runat="server" ClientInstanceName="cbp" ClientVisible="False" OnCallback="cbp_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	ButtonSubmitEndCallBack();
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


































