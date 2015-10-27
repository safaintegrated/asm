<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_MaklumatStok.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.DaftarStok.Tab_MaklumatStok" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<script>
    //function FillStockInfo(Values) {
    //    ST_StockDetail.SetText(Values[0].toString());
    //    ST_StockMeasurement.SetText(Values[1].toString());
    //    ST_StockGroup.SetText(Values[2].toString());
    //    ST_StockSubCategory.SetText(Values[3].toString());
    //    ST_StockCategory.SetText(Values[4].toString());
    //}

    //function BtnSaveStockRegistration_Click()
    //{
    //    LoadingPanel.SetText('Sistem sedang menyimpan maklumat item pendaftaran.  Sila tunggu sebentar..');
    //    LoadingPanel.Show();
        
    //    //TODO: check field validation

    //    cbp_save.PerformCallback('SAVE')
    //}

</script>

<dx:ASPxFormLayout ID="formLayout" runat="server" Width="100%" ColCount="2">
                    <Items>
                        <dx:LayoutGroup Caption="Maklumat Stor" Width="50%">
                            <Items>
                                <dx:LayoutItem Caption="Pusat Tanggung Jawab">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                            <dx:ASPxGridLookup ID="glPtj" runat="server" AutoGenerateColumns="False" ClientInstanceName="glPtj" DataSourceID="dsPtj" KeyFieldName="PTJ_Id" TextFormatString="({0}) {1}" Width="100%">
                                                <GridViewProperties>
                                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                    <Settings ShowFilterRow="True" />
                                                </GridViewProperties>
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Kod PTJ" FieldName="PTJ_Code" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Nama PTJ" FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <ClientSideEvents EndCallback="function(s, e) {
glStore.GetGridView().Refresh();
glLocation.GetGridView().Refresh();
}" RowClick="function(s, e) {
glStore.GetGridView().Refresh();
glLocation.GetGridView().Refresh();
}
" />
                                            </dx:ASPxGridLookup>
                                            <asp:SqlDataSource ID="dsPtj" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllPtj" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Stor">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridLookup ID="glStore" runat="server" AutoGenerateColumns="False" ClientInstanceName="glStore" DataSourceID="dsStore" KeyFieldName="ST_StoreId" TextFormatString="{1}" Width="100%">
                                                <GridViewProperties>
                                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                    <Settings ShowFilterRow="True" />
                                                </GridViewProperties>
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ST_StoreId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Nama Stor" FieldName="ST_StoreName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <ClientSideEvents EndCallback="function(s, e) {
glLocation.GetGridView().Refresh();
}" RowClick="function(s, e) {
glLocation.GetGridView().Refresh();
}" />
                                            </dx:ASPxGridLookup>
                                            <asp:SqlDataSource ID="dsStore" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllStoreByPtjId" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="glPtj" DefaultValue="0" Name="PtjId" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Lokasi">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridLookup ID="glLocation" runat="server" AutoGenerateColumns="False" ClientInstanceName="glLocation" DataSourceID="dsLocation" KeyFieldName="LocationId" TextFormatString="{1}" Width="100%">
                                                <GridViewProperties>
                                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                    <Settings ShowFilterRow="True" />
                                                </GridViewProperties>
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="LocationId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Nama / Zon" FieldName="LocationName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Seksyen" FieldName="LocationSection" ShowInCustomizationForm="True" VisibleIndex="2">
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
                                                    <asp:ControlParameter ControlID="glStore" Name="StoreId" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Registration Id">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtStockRegId" runat="server" ClientInstanceName="txtStockRegId" Width="170px">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Maklumat Stok" Width="50%">
                            <Items>
                                <dx:LayoutItem Caption="No. Pendaftaran Stok" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                            <dx:ASPxGridLookup ID="glStock" runat="server" AutoGenerateColumns="False" ClientInstanceName="glStock" DataSourceID="StockDataSource" KeyFieldName="Stock_Id" TextFormatString="({1}) {2}" Width="100%">
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
                                                    <dx:GridViewDataTextColumn Caption="Status Tarikh Luput" FieldName="Stock_StatusExpiryDate" ShowInCustomizationForm="True" VisibleIndex="3" Visible="False">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Kumpulan Stok" FieldName="StockGroup" ShowInCustomizationForm="True" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Kategori" FieldName="Category" ShowInCustomizationForm="True" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sub Kategori" FieldName="SubCategory" ShowInCustomizationForm="True" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Unit Pengukuran" FieldName="Measurement" ShowInCustomizationForm="True" VisibleIndex="7" Visible="False">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <ClientSideEvents ValueChanged="function(s, e) {
	var GV = glStock.GetGridView();
	GV.GetRowValues(GV.GetFocusedRowIndex(), 'Stock_Detail;Measurement;StockGroup;Category;SubCategory', FillStockInfo);
}


" />
                                            </dx:ASPxGridLookup>
                                            <asp:SqlDataSource ID="StockDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_Store_Find_Stock" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Keterangan Stok" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server">
                                            <dx:ASPxTextBox ID="txtStockDetail" runat="server" ClientInstanceName="txtStockDetail" CssClass="TextBoxForName" ReadOnly="True" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Kumpulan Stok" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server">
                                            <dx:ASPxTextBox ID="txtStockGroup" runat="server" Width="100%" ClientInstanceName="txtStockGroup" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Unit Pengukuran" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer10" runat="server">
                                            <dx:ASPxTextBox ID="txtStockMeasurement" runat="server" Width="100%" ClientInstanceName="txtStockMeasurement" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Kategori">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server">
                                            <dx:ASPxTextBox ID="txtStockCategory" runat="server" Width="100%" ClientInstanceName="txtStockCategory" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Sub-Kategori">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtStockSubCategory" runat="server" ClientInstanceName="txtStockSubCategory" OnTextChanged="ASPxFormLayout1_E5_TextChanged" Width="100%" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Pendaftaran" Width="50%" ColCount="2" ColSpan="2">
                            <Items>
                                <dx:LayoutItem Caption="No PK/BPPS/BTB" Width="50%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                                            <dx:ASPxTextBox ID="txtNoPkBppsBtb" runat="server" ClientInstanceName="txtNoPkBppsBtb" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Paras Menokok" Width="50%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtParasMenokok" runat="server" ClientInstanceName="txtParasMenokok" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Terima Daripada">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtInTo" runat="server" ClientInstanceName="txtInTo" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Kuantiti Di Pohon">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtInQuantityRequest" runat="server" ClientInstanceName="txtInQuantityRequest" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Kuantiti Di Terima">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtInQuantity" runat="server" ClientInstanceName="txtInQuantity" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Harga Seunit (RM)">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtInUnitPrice" runat="server" ClientInstanceName="txtInUnitPrice" Width="100%">
                                            </dx:ASPxTextBox>
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


<dx:ASPxCallbackPanel ID="cbp_save" runat="server" ClientInstanceName="cbp_save" Width="200px" OnCallback="cbp_Callback">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_EndCallback(s, e);	
}" />
    <PanelCollection>
        <dx:PanelContent runat="server"></dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>

<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>











