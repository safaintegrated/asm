<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Permohonan.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanBelian_Stor.Tab_Permohonan" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register src="Tab_ItemListing_Controller.ascx" tagname="Tab_ItemListing_Controller" tagprefix="uc1" %>
<%@ Register src="Tab_ItemDetails_Controller.ascx" tagname="Tab_ItemDetails_Controller" tagprefix="uc2" %>




<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<style>
    .AddTopPadding {
        padding-top:15px;
    }
</style>

<script>
    function cbp_Header_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        
            if (s.cpMode.toString() == 'LOAD')
            {
                if (s.cpErrMsg.toString() == '')
                {
                    EnableHeaderForm('false');
                }
                else
                {
                    popupMsg_Label.SetText(s.cpErrMsg.toString());
                    popupMsg.Show();
                    popupMsg_BtnOk.Focus();
                }
            }
            else if (s.cpMode.toString() == 'SAVE')
            {
                if (s.cpErrMsg.toString() != '')
                {
                    popupMsg_Label.SetText(s.cpErrMsg.toString());
                    popupMsg.Show();
                    popupMsg_BtnOk.Focus();
                }
                else
                {
                    EnableHeaderForm('false');
                    TabItemDetail_EditMode.SetText('0');
                    FormPRItemDetails.SetEnabled(false);
                    ManageMainRibbonUtamaTab('true', 'true', 'false', 'true', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                    MainRibbon.GetItemByName("Lampiran").SetEnabled(false);

                    popupMsg_Label.SetText('Rekod permohonan pembelian telah berjaya disimpan.');
                    popupMsg.Show();
                    popupMsg_BtnOk.Focus();
                }
            }
            else if (s.cpMode.toString() == 'POST')
            {
                if (s.cpErrMsg.toString() != '') {
                    popupMsg_Label.SetText(s.cpErrMsg.toString());
                    popupMsg.Show();
                    popupMsg_BtnOk.Focus();
                }
                else {
                    EnableHeaderForm('false');
                    TabItemDetail_EditMode.SetText('0');
                    FormPRItemDetails.SetEnabled(false);
                    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                    MainRibbon.GetItemByName("Lampiran").SetEnabled(false);

                    cbp_PrRef.PerformCallback();

                    popupMsg_Label.SetText('Rekod permohonan pembelian telah berjaya dihantar kepada<br>'+s.cpReceipient.toString());
                    popupMsg.Show();
                    popupMsg_BtnOk.Focus()


                }
            }
            else if (s.cpMode.toString() == 'ADD') {
                if (s.cpErrMsg.toString() == '')
                {   
                    EnableHeaderForm('true');
                    ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'false', 'true');
                    MainRibbon.GetItemByName("Lampiran").SetEnabled(true);
                }
                else {
                    popupMsg_Label.SetText(s.cpErrMsg.toString());
                    popupMsg.Show();
                    popupMsg_BtnOk.Focus();
                }
            }
        
    }

    function FillVendorInfo(Values)
    {
        PRH_VendorAddress.SetText(Values[2].toString());
        PRH_SetVen_SAGACode.SetText(Values[1].toString());
        //PRH_SetVen_Name.SetText(Values[0].toString());
    }

    function EnableHeaderForm(EnableDisable)
    {
        if (EnableDisable == 'true')
        {
            PRH_Purpose.SetEnabled(true);
            PRH_SetVen_Name.SetEnabled(true);
            PRH_ProcurementITypeId.SetEnabled(true);
            PRH_ProcurementMethodId.SetEnabled(true);
            PRH_ProcurementCatId.SetEnabled(true);

            if (AllPtjAccess.GetText() == 'Ya')
                PRH_PtjId.SetEnabled(true);
            else
                PRH_PtjId.SetEnabled(false);

            LinkAddNewPrItem.SetEnabled(true);
            EnableDisablePrItemListGrid('true');
        }
        else {
            PRH_Purpose.SetEnabled(false);
            PRH_SetVen_Name.SetEnabled(false);
            PRH_ProcurementITypeId.SetEnabled(false);
            PRH_ProcurementMethodId.SetEnabled(false);
            PRH_ProcurementCatId.SetEnabled(false);
            PRH_PtjId.SetEnabled(false);
            LinkAddNewPrItem.SetEnabled(false);
            EnableDisablePrItemListGrid('false');
        }
    }
</script>
<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Maklumat Permohonan" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxCallbackPanel ID="cbp_Header" runat="server" ClientInstanceName="cbp_Header" EnableCallbackAnimation="True" OnCallback="cbp_Header_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
<SettingsLoadingPanel Enabled="False" ShowImage="False"></SettingsLoadingPanel>

                                <ClientSideEvents EndCallback="function(s, e) {
	cbp_Header_EndCallback(s, e);
}" />
                                <panelcollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxFormLayout ID="FormHeader" runat="server" ClientInstanceName="FormHeader" ColCount="3" Width="100%">
                                            <Items>
                                                <dx:LayoutItem Caption="Nama Pemohon" Width="40%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="NamaPemohon" ClientInstanceName="NamaPemohon" ClientEnabled="false" runat="server" Width="100%" EnableClientSideAPI="True">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="ID Pembekal" Width="20%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="FormHeader_E1" runat="server" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Jenis Perolehan" Width="20%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxComboBox ID="PRH_ProcurementITypeId" ClientInstanceName="PRH_ProcurementITypeId" EnableClientSideAPI="true" runat="server" Width="100%" DataSourceID="ProcureTypeDs" TextField="ProcurementTypeName" ValueField="ProcurementITypeId" ValueType="System.Int32">
                                                                <Columns>
                                                                    <dx:ListBoxColumn FieldName="ProcurementITypeId" Visible="False" />
                                                                    <dx:ListBoxColumn Caption="Jenis Perolehan" FieldName="ProcurementTypeName" />
                                                                </Columns>
                                                            </dx:ASPxComboBox>
                                                            <asp:SqlDataSource ID="ProcureTypeDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [ProcurementITypeId], [ProcurementTypeName] FROM [ProcurementType] ORDER BY [ProcurementTypeName]"></asp:SqlDataSource>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Pusat Tanggungjawab" Width="40%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxComboBox ID="PRH_PtjId" ClientInstanceName="PRH_PtjId" EnableClientSideAPI="true" runat="server" Width="100%" DataSourceID="PTJ_Ds" TextField="PTJ_Name" ValueField="PTJ_Id" ValueType="System.Int32">
                                                                <Columns>
                                                                    <dx:ListBoxColumn FieldName="PTJ_Id" Visible="False" />
                                                                    <dx:ListBoxColumn Caption="Nama Pusat Tanggungjawab" FieldName="PTJ_Name" />
                                                                </Columns>
                                                            </dx:ASPxComboBox>
                                                            <asp:SqlDataSource ID="PTJ_Ds" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PTJ_Id], [PTJ_Name] FROM [PusatTanggungJawab] ORDER BY [PTJ_Name]"></asp:SqlDataSource>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Nama Pembekal" Width="40%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxGridLookup ID="PRH_SetVen_Name" runat="server" AutoGenerateColumns="False" AutoResizeWithContainer="True" ClientEnabled="False" ClientInstanceName="PRH_SetVen_Name" DataSourceID="VendorDs" EnableClientSideAPI="True" KeyFieldName="SetVen_SAGACode" MultiTextSeparator="-" OnInit="PRH_SetVen_Name_Init" TextFormatString="({1}) {0}" Width="100%">
                                                                <GridViewProperties>
                                                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                </GridViewProperties>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="Nama Pembekal" FieldName="SetVen_Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="70%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Kod Pembekal" FieldName="SetVen_SAGACode" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="30%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Alamat Pembekal" FieldName="VendorAddress" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <GridViewStyles>
                                                                    <AlternatingRow Enabled="True">
                                                                    </AlternatingRow>
                                                                </GridViewStyles>
                                                                <ClientSideEvents DropDown="function(s, e) {
	s.GetGridView().SetWidth(650);
}" Init="function(s, e) {
	s.GetGridView().SetWidth(650);
}" ValueChanged="function(s, e) {
	var GV = PRH_SetVen_Name.GetGridView();
	GV.GetRowValues(GV.GetFocusedRowIndex(), 'SetVen_Name;SetVen_SAGACode;VendorAddress', FillVendorInfo);
}" />
                                                            </dx:ASPxGridLookup>
                                                            <asp:SqlDataSource ID="VendorDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [SetVen_Name], [SetVen_SAGACode], [VendorAddress] FROM [V_VendorInGridLookup] ORDER BY [SetVen_Name]"></asp:SqlDataSource>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Kaedah Perolehan" Width="20%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxComboBox ID="PRH_ProcurementMethodId" ClientInstanceName="PRH_ProcurementMethodId" EnableClientSideAPI="true" runat="server" Width="100%" DataSourceID="ProcureMethod" TextField="ProcurementMethodName" ValueField="ProcurementMethodId" ValueType="System.Int32">
                                                                <Columns>
                                                                    <dx:ListBoxColumn FieldName="ProcurementMethodId" Visible="False" />
                                                                    <dx:ListBoxColumn Caption="Kaedah Perolehan" FieldName="ProcurementMethodName" />
                                                                </Columns>
                                                            </dx:ASPxComboBox>
                                                            <asp:SqlDataSource ID="ProcureMethod" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [ProcurementMethodId], [ProcurementMethodName] FROM [ProcurementMethod] ORDER BY [ProcurementMethodName]"></asp:SqlDataSource>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Perihal Pembelian" Width="40%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxMemo ID="PRH_Purpose" ClientInstanceName="PRH_Purpose" EnableClientSideAPI="true" runat="server" Width="100%" Rows="3">
                                                                <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                                            </dx:ASPxMemo>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Alamat Pembekal" Width="40%" RowSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxMemo ID="PRH_VendorAddress" runat="server" ClientEnabled="False" ClientInstanceName="PRH_VendorAddress" CssClass="MemoBoxAlamatPembekal" EnableClientSideAPI="True" Rows="5" Width="100%">
                                                                <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                                            </dx:ASPxMemo>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Kategori Perolehan" Width="20%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxComboBox ID="PRH_ProcurementCatId" runat="server" ClientInstanceName="PRH_ProcurementCatId" DataSourceID="ProcureCat" EnableClientSideAPI="True" TextField="ProcurementCatName" ValueField="ProcurementCatId" ValueType="System.Int32" Width="100%">
                                                                <Columns>
                                                                    <dx:ListBoxColumn FieldName="ProcurementCatId" Visible="False" />
                                                                    <dx:ListBoxColumn Caption="Kategori Perolehan" FieldName="ProcurementCatName" />
                                                                </Columns>
                                                            </dx:ASPxComboBox>
                                                            <asp:SqlDataSource ID="ProcureCat" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [ProcurementCatId], [ProcurementCatName] FROM [ProcurementCategory] ORDER BY [ProcurementCatName]"></asp:SqlDataSource>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="TabPermohonan_ProcessId" EnableClientSideAPI="true"  ClientInstanceName="TabPermohonan_ProcessId" runat="server" Width="170px" ClientVisible="False">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Status" Width="20%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxGridLookup ID="ASPxGridLookup1" runat="server" AutoGenerateColumns="False" DataSourceID="StatusBelianStor" KeyFieldName="StatusId">
                                                                <GridViewProperties>
                                                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                </GridViewProperties>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn FieldName="StatusId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="StatusName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:ASPxGridLookup>
                                                            <asp:SqlDataSource ID="StatusBelianStor" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [StatusPembelian]"></asp:SqlDataSource>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="PRH_SetVen_SAGACode" ClientInstanceName="PRH_SetVen_SAGACode" EnableClientSideAPI="True" runat="server" Width="170px" ClientVisible="False">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="PRH_EmpSysId" runat="server" ClientInstanceName="PRH_EmpSysId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="AllPtjAccess" runat="server" ClientInstanceName="AllPtjAccess" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="TabPermohonan_Revision" runat="server" ClientInstanceName="TabPermohonan_Revision" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                            <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                                            <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                                            <Paddings Padding="0px" />
                                            <Border BorderStyle="None" />
                                        </dx:ASPxFormLayout>
                                    </dx:PanelContent>
                                </panelcollection>
                            </dx:ASPxCallbackPanel>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
            <ParentContainerStyle>
                <Paddings Padding="0px" />
            </ParentContainerStyle>
        </dx:LayoutGroup>
        <dx:LayoutGroup Caption="Maklumat Item" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxPageControl ID="PR_PageControl" runat="server" ActiveTabIndex="1" Width="100%" AccessibilityCompliant="True" ClientInstanceName="PR_PageControl" EnableClientSideAPI="True">
                                <TabPages>
                                    <dx:TabPage Text="Senarai Item" TabStyle-Width="100%" Name="ItemListing">
<TabStyle Width="100%"></TabStyle>
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <uc1:Tab_ItemListing_Controller ID="Tab_ItemListing_Controller1" runat="server" />
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="Maklumat Item"  TabStyle-Width="100%" ClientVisible="False" Name="ItemDetails">
<TabStyle Width="100%"></TabStyle>
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <uc2:Tab_ItemDetails_Controller ID="Tab_ItemDetails_Controller1" runat="server" />
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                                <TabStyle Wrap="True">
                                </TabStyle>
                            </dx:ASPxPageControl>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
            <ParentContainerStyle>
                <Paddings Padding="0px" />
            </ParentContainerStyle>
        </dx:LayoutGroup>
    </Items>
    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
    <Paddings Padding="0px" />
    <Border BorderStyle="None" />
</dx:ASPxFormLayout>



