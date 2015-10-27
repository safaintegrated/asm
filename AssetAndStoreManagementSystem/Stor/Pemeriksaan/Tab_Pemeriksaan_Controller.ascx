<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Pemeriksaan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Pemeriksaan.Tab_Pemeriksaan_Controller" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<dx:ASPxCallbackPanel ID="cbp_TabPemeriksaan" runat="server" ClientInstanceName="cbp_TabPemeriksaan" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_TabPemeriksaan_EndCallback(s, e);
}" />
    <PanelCollection>
        <dx:PanelContent runat="server">
            <dx:ASPxFormLayout runat="server" Width="100%" ID="NamaStor" ClientInstanceName="NamaStor">
                <Items>


                    <dx:LayoutGroup Caption="Maklumat Pemeriksaan" Width="100%">
                        <Items>
                            <dx:LayoutItem Width="100%" Caption="Nama Pemeriksaan">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                        <dx:ASPxGridLookup ID="glLembagaName" runat="server" AutoGenerateColumns="False" ClientInstanceName="glLembagaName" DataSourceID="dsLembaga" EnableClientSideAPI="True" KeyFieldName="LPH_UniqueId" TextFormatString="{1}" Width="50%" ReadOnly="True">
                                            <GridViewProperties>
                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                <Settings ShowFilterRow="True" />
                                            </GridViewProperties>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="LPH_UniqueId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="LPH_LembagaName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="LPH_AssignYear" ShowInCustomizationForm="True" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="LPH_StartDate" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="LPH_EndDate" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewDataDateColumn>
                                            </Columns>
                                            <ClientSideEvents ValueChanged="function(s, e) {
glLembagaName_ValueChanged();
}" />
                                        </dx:ASPxGridLookup>
                                        <asp:SqlDataSource ID="dsLembaga" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [LPH_UniqueId], [LPH_LembagaName], [LPH_AssignYear], [LPH_StartDate], [LPH_EndDate] FROM [LembagaPemeriksa_Header] ORDER BY [LPH_StartDate] DESC"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Ahli Jawatankuasa" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server">
                                        <dx:ASPxGridView ID="gvPemeriksaanInvestigator" runat="server" AutoGenerateColumns="False" ClientInstanceName="gvPemeriksaanInvestigator" Width="100%">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Nama" FieldName="LPD_EmpName" ShowInCustomizationForm="True" VisibleIndex="0" Width="25%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Jawatan" FieldName="LPD_EmpDesignation" ShowInCustomizationForm="True" VisibleIndex="1" Width="10%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Gred Jawatan" FieldName="LPD_EmpGrade" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Emel" FieldName="LPD_EmpEmail" ShowInCustomizationForm="True" VisibleIndex="3" Width="20%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Telefon" FieldName="LPD_Telephone" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Peranan" FieldName="MIR_Desc" ShowInCustomizationForm="True" VisibleIndex="5" Width="25%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="LPD_MIR_Id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="LPD_EmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowClientEventsOnLoad="False" AllowDragDrop="False" AllowGroup="False" AllowSort="False" />
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <Styles>
                                                <AlternatingRow Enabled="True">
                                                </AlternatingRow>
                                            </Styles>
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutGroup Caption="Lokasi Pemeriksaan">
                                <Items>
                                    <dx:LayoutItem Caption="Jabatan">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="txtLokasiPtj" ClientEnabled="true" ClientInstanceName="txtLokasiPtj" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Stor">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="txtLokasiStor" ClientEnabled="true" ClientInstanceName="txtLokasiStor" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                                <dx:ASPxTextBox ID="txtStoreId" runat="server" ClientInstanceName="txtStoreId" Width="170px">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutItem Caption="Tarikh Mula">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxDateEdit ID="deTarikhMula" ClientEnabled="true" ClientInstanceName="deTarikhMula" runat="server">
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Tarikh Tamat">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxDateEdit ID="deTarikhTamat" ClientEnabled="true" ClientInstanceName="deTarikhTamat" runat="server">
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Tahun">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="txtTahun" ClientEnabled="true" ClientInstanceName="txtTahun" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Maklumat Pemeriksaan" Width="100%" ColCount="2">
                        <Items>
                            <dx:LayoutItem ColSpan="2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                        <dx:ASPxHyperLink ID="NamaStor_E1" runat="server" NavigateUrl="javascript: LookupStok();" Text="Pilih Stok">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Senarai Stok" ColSpan="2" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="gvSenaraiStok" runat="server" Width="100%" ClientInstanceName="gvSenaraiStok" AutoGenerateColumns="False" KeyFieldName="Id" OnDataBinding="gvSenaraiStok_DataBinding">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Id" FieldName="Id" Name="Id" ReadOnly="True" ShowInCustomizationForm="True" UnboundType="Integer" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Id Stok" FieldName="StockId" Name="StockId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Kod Stok" FieldName="StockCode" Name="StockCode" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="StockName" Name="StockName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Baki Terkini" FieldName="CurrentBalance" Name="CurrentBalance" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Paras Menokok" FieldName="ParasMenokok" Name="ParasMenokok" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Baki Sebenar" Name="PhsycalBalance" ShowInCustomizationForm="True" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsDataSecurity AllowEdit="False" />
                                        </dx:ASPxGridView>
                                        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"></asp:ObjectDataSource>
                                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
                                        <dx:ASPxTextBox ID="txtPemeriksaanId" runat="server" ClientInstanceName="txtPemeriksaanId" Width="170px">
                                        </dx:ASPxTextBox>
                                        <dx:ASPxGridViewExporter ID="gvePemeriksaanStok" runat="server" GridViewID="gvSenaraiStok" ExportedRowType="All" ExportEmptyDetailGrid="True">
                                        </dx:ASPxGridViewExporter>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>


                    <dx:LayoutGroup Caption="Muat Turun">
                        <Items>
                            <dx:LayoutItem Caption="Download">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxButton ID="btnDownloadCsv" UseSubmitBehavior="false" runat="server" OnClick="ASPxButton2_Click" Text="Download CSV" ClientInstanceName="btnDownloadCsv">
                                        </dx:ASPxButton>  
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
<dx:ASPxPopupControl ID="popupSearchStock" runat="server" AllowDragging="True" ClientInstanceName="popupSearchStock" CloseAnimationType="Fade" EnableClientSideAPI="True" HeaderText="Carian Stok" MaxHeight="550px" MinHeight="500px" MinWidth="650px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
        <FooterContentTemplate>
         <div style="width:100%; padding:8px 0px 8px 0px; text-align:center; margin-left:auto; margin-right:auto;">
             <dx:ASPxButton ID="btnWorkflowProceed" runat="server" AutoPostBack="False" Text="Ok" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	SelectStock();
}" />
             </dx:ASPxButton>
             &nbsp;
              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Batal" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	popupSearchStock.Hide();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ClientSideEvents Closing="function(s, e) {
	
}" />
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxTextBox ID="txtPemeriksaanStoreId" runat="server" ClientInstanceName="txtPemeriksaanStoreId" Text="0" Width="170px">
    </dx:ASPxTextBox>
        <dx:ASPxGridView ID="gvSearchStockReg" runat="server" AutoGenerateColumns="False" ClientInstanceName="gvSearchStockReg" DataSourceID="SqlDataSource1" KeyFieldName="StockRegId" OnCustomCallback="gvSearchStockReg_CustomCallback">
            <Columns>
                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="StoreId" ShowInCustomizationForm="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DateTime" ShowInCustomizationForm="True" VisibleIndex="2">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="StockRegId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StockId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StockRegNo" ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StockDetail" ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StoreId1" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StoreName" ShowInCustomizationForm="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PtjId" ShowInCustomizationForm="True" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Balance" ShowInCustomizationForm="True" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CurrentPrice" ShowInCustomizationForm="True" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindLatestStockRegistrationByStoreId" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtPemeriksaanStoreId" DefaultValue="0" Name="StoreId" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>