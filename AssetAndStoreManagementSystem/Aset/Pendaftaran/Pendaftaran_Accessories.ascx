<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pendaftaran_Accessories.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pendaftaran.Pendaftaran_Accessories" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function cbp_ComponentsManagement_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != "")
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {
            if (s.cpMode.toString() == 'SAVE')
            {
                PopupComponentManagement.Hide();
                GridComponent.PerformCallback();
            }
        }
    }

    function NewComponentMode()
    {
        AIC_UniqueId.SetText('');
        cbp_ComponentsManagement.PerformCallback('NEW');
        LoadingPanel.SetText('Sistem sedang bersedia untuk pendaftaran komponen dan aksesori baharu.  Sila tunggu sebentar...');       
        PopupComponentManagement.Show();
        LoadingPanel.Show();
    }

    function EditComponentMode(Unique)
    {
        AIC_UniqueId.SetText(Unique.toString());
        LoadingPanel.SetText('Sistem sedang bersedia untuk kemaskini pendaftaran komponen dan aksesori.  Sila tunggu sebentar...');
        cbp_ComponentsManagement.PerformCallback('EDIT');
        PopupComponentManagement.Show();
        LoadingPanel.Show();
    }

    function OpenComponentManagementWindow()
    {
        PopupComponentManagement.Show();
    }

    function SaveComponent()
    {
        if (AIC_ParentUniqueId.GetText() == '')
        {
            popupMsg_Label.SetText('Sila pilih no siri pendaftaran aset alih terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {
            LoadingPanel.SetText('Sistem sedang menyimpan pendaftaran komponen dan aksesori.  Sila tunggu sebentar...');
            cbp_ComponentsManagement.PerformCallback('SAVE');
            LoadingPanel.Show();
        }
    }
</script>

<dx:ASPxTextBox ID="ComponentParentUniqueId" runat="server" ClientInstanceName="ComponentParentUniqueId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="ComponentParentType" runat="server" ClientInstanceName="ComponentParentType" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="ComponentEditMode" runat="server" ClientInstanceName="ComponentEditMode" EnableClientSideAPI="True" Width="170px" Text="0" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutItem ShowCaption="False">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer runat="server">
                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E1" runat="server" Text="Tambah Komponen Baharu" CssClass="myHyperlink" NavigateUrl="javascript: NewComponentMode();">
                    </dx:ASPxHyperLink>
                </dx:LayoutItemNestedControlContainer>
            </LayoutItemNestedControlCollection>
        </dx:LayoutItem>
        <dx:LayoutItem ShowCaption="False">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer runat="server">
                </dx:LayoutItemNestedControlContainer>
            </LayoutItemNestedControlCollection>
        </dx:LayoutItem>
        <dx:LayoutItem ShowCaption="False">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer runat="server">
                    <dx:ASPxGridView ID="GridComponent" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridComponent" DataSourceID="ComponentDs" EnableCallbackAnimation="True" OnAfterPerformCallback="GridComponent_AfterPerformCallback" OnCustomCallback="GridComponent_CustomCallback" Width="100%" OnHtmlDataCellPrepared="GridComponent_HtmlDataCellPrepared">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="AIC_RowId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="AIC_UniqueId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="RegNumber" GroupIndex="0" ReadOnly="True" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="AIC_ParentType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="AIC_Desc" ShowInCustomizationForm="True" VisibleIndex="4" Width="15%">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                <DataItemTemplate>
                                    <dx:ASPxHyperLink ID="AIC_Desc" ClientInstanceName="AIC_Desc" runat="server" Text="ASPxHyperLink">
                                    </dx:ASPxHyperLink>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Jenis" FieldName="AIC_TypeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="8%">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Jenama" FieldName="AIC_Brand" ShowInCustomizationForm="True" VisibleIndex="6" Width="8%">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Model" FieldName="AIC_Model" ShowInCustomizationForm="True" VisibleIndex="7" Width="8%">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Harga Belian (RM)" FieldName="AIC_UnitPrice" ShowInCustomizationForm="True" VisibleIndex="8" Width="5%" PropertiesTextEdit-DisplayFormatString="n">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="Mula Jaminan" FieldName="AIC_WarrantyStart" ShowInCustomizationForm="True" VisibleIndex="9" Width="6%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn Caption="Tamat Jaminan" FieldName="AIC_WarrantyEnd" ShowInCustomizationForm="True" VisibleIndex="10" Width="6%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="Status" FieldName="AIC_Status" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="11" Width="8%">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="Tarikh Dipasang" FieldName="AIC_InstalledDate" ShowInCustomizationForm="True" VisibleIndex="12" Width="6%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn Caption="Tarikh Dikeluar" FieldName="AIC_RemoveDate" ShowInCustomizationForm="True" VisibleIndex="13" Width="6%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn Caption="Tarikh Dilupus" FieldName="AIC_WriteOffDate" ShowInCustomizationForm="True" VisibleIndex="14" Width="6%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="Nota" FieldName="AIC_Note" ShowInCustomizationForm="True" VisibleIndex="15" Width="18%">
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AutoExpandAllGroups="True" />
                        <SettingsPager PageSize="15">
                        </SettingsPager>
                        <Settings GroupFormat="{1} {2}" />
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        <Styles>
                            <AlternatingRow Enabled="True">
                            </AlternatingRow>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="ComponentDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_DBConnectionString %>" OnSelecting="ComponentDs_Selecting" SelectCommand="SP_ListAllComponents" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2799D5EC-6391-4001-A9E3-3C711483EC77" Name="ParentId" Type="String" />
                            <asp:Parameter DefaultValue="2" Name="ParentType" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </dx:LayoutItemNestedControlContainer>
            </LayoutItemNestedControlCollection>
        </dx:LayoutItem>
    </Items>
</dx:ASPxFormLayout>

<dx:ASPxPopupControl ID="PopupComponentManagement" runat="server" Width="750px" AllowDragging="True" ClientInstanceName="PopupComponentManagement" EnableClientSideAPI="True" HeaderText="Pengurusan Komponen dan Aksesori Aset Alih" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True" Modal="True">
    <HeaderImage Url="~/Public/Images/DialogBox/ConfigWndow.png">
    </HeaderImage>
    <FooterContentTemplate>
         <div style="width:100%; padding:8px 0px 8px 0px; text-align:center; margin-left:auto; margin-right:auto;">
             <dx:ASPxButton ID="btnWorkflowProceed" runat="server" AutoPostBack="False" Text="Simpan dan Tutup" Theme="SoftOrange" Width="150px">
                 <ClientSideEvents Click="function(s, e) {
	SaveComponent();
}" />
             </dx:ASPxButton>
             &nbsp;
              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Batal" Theme="SoftOrange" Width="150px">
                 <ClientSideEvents Click="function(s, e) {
	PopupComponentManagement.Hide();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxCallbackPanel ID="cbp_ComponentsManagement" runat="server" EnableCallbackAnimation="True" EnableClientSideAPI="True" OnCallback="cbp_ComponentsManagement_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%" ClientInstanceName="cbp_ComponentsManagement">
        <SettingsLoadingPanel Enabled="False" ShowImage="False" />
        <ClientSideEvents EndCallback="function(s, e) {
	cbp_ComponentsManagement_EndCallback(s, e);
}" />
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" ColCount="4" Width="100%">
                    <Items>
                        <dx:LayoutItem Caption="No. Siri Pendaftaran" Width="25%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridLookup ID="AIC_ParentUniqueId" runat="server" ClientInstanceName="AIC_ParentUniqueId" EnableClientSideAPI="True" OnInit="AIC_ParentUniqueId_Init" Width="100%" AutoGenerateColumns="False" DataSourceID="ParentDs" KeyFieldName="UniqueId" TextFormatString="{0}">
                                        <GridViewProperties>
                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        </GridViewProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="RegNumber" ShowInCustomizationForm="True" VisibleIndex="0" Width="100%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="UniqueId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(AIC_ParentUniqueId.GetWidth());
}" />
                                    </dx:ASPxGridLookup>
                                    <asp:SqlDataSource ID="ParentDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_DBConnectionString %>" OnSelecting="ParentDs_Selecting" SelectCommand="SP_PopulateComponentParentGridLookup" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="2799D5EC-6391-4001-A9E3-3C711483EC77" Name="ParentId" Type="String" />
                                            <asp:Parameter DefaultValue="2" Name="ParentType" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Jenis" Width="75%" ColSpan="3">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridLookup ID="AIC_TypeId" runat="server" AutoGenerateColumns="False" ClientInstanceName="AIC_TypeId" DataSourceID="TypeDs" EnableClientSideAPI="True" KeyFieldName="T_Id" OnInit="AIC_TypeId_Init" TextFormatString="{1}" Width="100%">
                                        <GridViewProperties>
                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                            <Settings ShowFilterBar="Visible" />
                                        </GridViewProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="T_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Jenis" FieldName="T_Desc" ShowInCustomizationForm="True" VisibleIndex="1" Width="100%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <GridViewStyles>
                                            <AlternatingRow Enabled="True">
                                            </AlternatingRow>
                                        </GridViewStyles>
                                        <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(350);
}" />
                                    </dx:ASPxGridLookup>
                                    <asp:SqlDataSource ID="TypeDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [T_Id], [T_Desc] FROM [AssetStockType] ORDER BY [T_Desc]"></asp:SqlDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Keterangan" ColSpan="4" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                     <dx:ASPxTextBox ID="AIC_Desc" runat="server" ClientInstanceName="AIC_Desc" EnableClientSideAPI="True" Width="100%">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Jenama" ColSpan="2" Width="50%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="AIC_Brand" runat="server" ClientInstanceName="AIC_Brand" EnableClientSideAPI="True" Width="100%">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Model" ColSpan="2" Width="50%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                     <dx:ASPxTextBox ID="AIC_Model" runat="server" ClientInstanceName="AIC_Model" EnableClientSideAPI="True" Width="100%">
                                    </dx:ASPxTextBox>                                   
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Harga Belian (RM)" Width="25%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                     <dx:ASPxSpinEdit ID="AIC_UnitPrice" runat="server" ClientInstanceName="AIC_UnitPrice" DisplayFormatString="n" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" Width="100%">
                                        <SpinButtons ShowIncrementButtons="False">
                                        </SpinButtons>
                                    </dx:ASPxSpinEdit>                                   
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Jenis Pemasangan" Width="25%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="AIC_Status" runat="server" ClientInstanceName="AIC_Status" DataSourceID="ComponentStatusDs" EnableClientSideAPI="True" TextField="CS_Desc" ValueField="CS_RowId" ValueType="System.Int32" Width="100%">
                                        <Columns>
                                            <dx:ListBoxColumn FieldName="CS_RowId" Visible="False" />
                                            <dx:ListBoxColumn Caption="Status" FieldName="CS_Desc" />
                                        </Columns>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="ComponentStatusDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [CS_RowId], [CS_Desc] FROM [Master_ComponentStatus] ORDER BY [CS_RowId]"></asp:SqlDataSource>
                                  </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem Width="25%">
                        </dx:EmptyLayoutItem>
                        <dx:EmptyLayoutItem Width="25%">
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="Tarikh Mula Jaminan" Width="25%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                     <dx:ASPxDateEdit ID="AIC_WarrantyStart" runat="server" ClientInstanceName="AIC_WarrantyStart" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="100%">
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Tarikh Tamat Jaminan" Width="25%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">                                    
                                    <dx:ASPxDateEdit ID="AIC_WarrantyEnd" runat="server" ClientInstanceName="AIC_WarrantyEnd" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="100%">
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem Width="25%">
                        </dx:EmptyLayoutItem>
                        <dx:EmptyLayoutItem Width="25%">
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="Tarikh Dipasang" Width="25%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                     <dx:ASPxDateEdit ID="AIC_InstalledDate" runat="server" ClientInstanceName="AIC_InstalledDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="100%">
                                    </dx:ASPxDateEdit>                                   
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Tarikh Dikeluarkan" Width="25%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">                                  
                                    <dx:ASPxDateEdit ID="AIC_RemoveDate" runat="server" ClientInstanceName="AIC_RemoveDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="100%">
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Tarikh Dilupus" Width="25%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                      <dx:ASPxDateEdit ID="AIC_WriteOffDate" runat="server" ClientInstanceName="AIC_WriteOffDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="100%">
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem Width="25%">
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="Nota" ColSpan="4" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="AIC_Note" runat="server" ClientInstanceName="AIC_Note" EnableClientSideAPI="True" Width="100%">
                                    </dx:ASPxTextBox>                                   
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False" Width="25%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="AIC_RowId" runat="server" ClientInstanceName="AIC_RowId" Width="170px" ClientVisible="False">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False" Width="25%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="AIC_UniqueId" runat="server" ClientInstanceName="AIC_UniqueId" Width="170px" ClientVisible="False">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                </dx:ASPxFormLayout>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>














