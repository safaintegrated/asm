<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KategoriSubKategori_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.KategoriSubKategori.KategoriSubKategori_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register src="Lookup_Controller.ascx" tagname="Lookup_Controller" tagprefix="uc1" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<script src="Js_KategoriSubKategori.js" type="text/javascript"></script>

<script>


    function GetSelectedCat(IDCat)
    {
        alert('Ona');
        CatId.SetText(IDCat.toString());
        cbp_CatInfo.PerformCallback();
    }


</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Kategori &amp; Sub-Kategori" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/CategorySubcategory.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%">
        <tr>
            <td>
                <dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
    <Tabs>
        <dx:RibbonTab Name="Utama" Text="Utama">
            <Groups>
                <dx:RibbonGroup Text="Pengurusan Rekod" Name="Pengurusan Rekod">
                    <Items>
                        <dx:RibbonButtonItem BeginGroup="True" Name="Kemaskini" Size="Large" Text="Kemaskini">
                            <LargeImage IconID="edit_edit_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Tambah" Size="Large" Text="Tambah">
                            <LargeImage IconID="actions_add_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Simpan" Size="Large" Text="Simpan">
                            <LargeImage IconID="save_save_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Hantar" Size="Large" Text="Hantar">
                            <LargeImage IconID="mail_send_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Padam" Size="Large" Text="Padam">
                            <LargeImage IconID="edit_delete_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Batal" Size="Large" Text="Batal">
                            <LargeImage IconID="actions_deletelist_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Cetak" Size="Large" Text="Cetak">
                            <LargeImage IconID="print_print_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Carian" Size="Large" Text="Carian">
                            <LargeImage IconID="find_find_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Audit" Size="Large" Text="Audit">
                            <LargeImage IconID="arrange_bringtofrontoftext_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Tutup" Size="Large" Text="Tutup">
                            <LargeImage IconID="actions_close_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                    </Items>
                </dx:RibbonGroup>
            </Groups>
        </dx:RibbonTab>
    </Tabs>
    <Styles>
        <Item Width="70px">
        </Item>
    </Styles>
                    <ClientSideEvents CommandExecuted="function(s, e) {
	MainRibbon_CommandExecuted(s, e);
}" />
</dx:ASPxRibbon>
            </td>
        </tr>
         <tr>
            <td style="padding-top:10px;">
                <dx:ASPxFormLayout ID="MainForm" runat="server" Width="100%" ClientInstanceName="MainForm">
                    <Items>
                        <dx:LayoutGroup Caption="Maklumat Kategori" Width="100%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxCallbackPanel ID="cbp_CatInfo" runat="server" ClientInstanceName="cbp_CatInfo" EnableCallbackAnimation="True" OnCallback="cbp_CatInfo_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
<SettingsLoadingPanel Enabled="False" ShowImage="False"></SettingsLoadingPanel>

                                                <ClientSideEvents EndCallback="function(s, e) {
	cbp_CatInfo_EndCallback(s, e);
}" />
                                                <panelcollection>
                                                    <dx:PanelContent runat="server">
                                                        <dx:ASPxFormLayout ID="FormCatInfo" runat="server" ClientInstanceName="FormCatInfo" Width="100%" ColCount="3">
                                                            <Items>
                                                                <dx:LayoutItem Caption="Pelupusan Daftar Stok" Width="20%">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxTextBox ID="PelupusanDaftarStor" ClientInstanceName="PelupusanDaftarStor" runat="server" CssClass="TextBoxForId" EnableClientSideAPI="True" OnTextChanged="Stock_RegisterNo_TextChanged">
                                                                            </dx:ASPxTextBox>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem Caption="Pelupusan Keterangan Stok" Width="40%">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxComboBox ID="PelupusanKeteranganStor" runat="server" ClientInstanceName="PelupusanKeteranganStor" CssClass="ComboCategoriType" DataSourceID="SqlDataSourceJenisPelupusan" EnableClientSideAPI="True" TextField="DisposalType" ValueField="DisposalId" ValueType="System.Int32">
                                                                                <Columns>
                                                                                    <dx:ListBoxColumn FieldName="DisposalId" Visible="False" />
                                                                                    <dx:ListBoxColumn Caption="Jenis" FieldName="DisposalType" />
                                                                                </Columns>
                                                                            </dx:ASPxComboBox>
                                                                            <asp:SqlDataSource ID="SqlDataSourceJenisPelupusan" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SELECT [DisposalId], [DisposalType] FROM [PelupusanType] ORDER BY [DisposalType]"></asp:SqlDataSource>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem Caption="" Width="20%" ShowCaption="False">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxTextBox ID="PelupusanId" runat="server" ClientInstanceName="PelupusanId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                                                            </dx:ASPxTextBox>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                </dx:LayoutItem>
                                                                <dx:EmptyLayoutItem Width="40%">
                                                                </dx:EmptyLayoutItem>
                                                                <dx:EmptyLayoutItem Width="40%">
                                                                </dx:EmptyLayoutItem>
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
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Senarai Pelupusan Stok" Width="100%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxCallbackPanel ID="cbp_SubCatInfo" runat="server" ClientInstanceName="cbp_SubCatInfo" EnableCallbackAnimation="True" OnCallback="cbp_SubCatInfo_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
<SettingsLoadingPanel Enabled="False" ShowImage="False"></SettingsLoadingPanel>

                                                <ClientSideEvents EndCallback="function(s, e) {
	cbp_SubCatInfo_EndCallback(s, e);
}" />
                                                <panelcollection>
                                                    <dx:PanelContent runat="server">
                                                        <dx:ASPxFormLayout ID="FormSubCatListing" runat="server" ClientInstanceName="FormSubCatListing" Width="100%">
                                                            <Items>
                                                                <dx:LayoutItem ShowCaption="False" Width="100%">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxHyperLink ID="ASPxFormLayout1_E12" runat="server" Text="Tambah sub-kategori baru" CssClass="myHyperlink" EnableClientSideAPI="True" NavigateUrl="javascript: AddNewSubCat();">
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
                                                                            <dx:ASPxGridView ID="GridSubCatList" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridSubCatList" OnHtmlDataCellPrepared="GridSubCatList_HtmlDataCellPrepared">
                                                                                <Columns>
                                                                                    <dx:GridViewDataTextColumn Caption="No Daftar Stok" ShowInCustomizationForm="True" VisibleIndex="0" Width="10%" FieldName="Stock_RegisterNo">
                                                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                        <DataItemTemplate>
                                                                                            <dx:ASPxTextBox ID="o" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                        </DataItemTemplate>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="Keterangan Stok" ShowInCustomizationForm="True" VisibleIndex="1" Width="25%" FieldName="Stock_Detail">
                                                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                         <DataItemTemplate>
                                                                                            <dx:ASPxTextBox ID="SubCatName" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                        </DataItemTemplate>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="Harga Stok" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%" FieldName="Stock_Price">
                                                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                         <DataItemTemplate>
                                                                                            <dx:ASPxTextBox ID="SubCatGLAsset" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                        </DataItemTemplate>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="Kuantiti Di Rekod" ShowInCustomizationForm="True" VisibleIndex="3" Width="15%" FieldName="Stock_QuantityRecord">
                                                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                         <DataItemTemplate>
                                                                                            <dx:ASPxTextBox ID="SubCatGLInventori" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                        </DataItemTemplate>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                     <dx:GridViewDataTextColumn Caption="Padam" ShowInCustomizationForm="True" VisibleIndex="7" Width="5%" FieldName="Stock_Id">
                                                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                         <DataItemTemplate>
                                                                                             <dx:ASPxHyperLink ID="SubCatId" EnableClientSideAPI="true" ToolTip="Padam sub-kategori ini" runat="server" Text="ASPxHyperLink" ImageUrl="~/Public/Images/GridIcons/GridDelete.png">
                                                                                             </dx:ASPxHyperLink>
                                                                                         </DataItemTemplate>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="Kuantiti Fizikal" FieldName="Stock_QuantityPhysical" ShowInCustomizationForm="True" VisibleIndex="4" Width="15%">
                                                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                        <DataItemTemplate>
                                                                                            <dx:ASPxTextBox ID="SubCatGLMaintenance" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                        </DataItemTemplate>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="Cadangan" FieldName="Stock_Suggestion" ShowInCustomizationForm="True" VisibleIndex="5" Width="15%">
                                                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                        <DataItemTemplate>
                                                                                            <dx:ASPxTextBox ID="SubCatGLSpareParts" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                        </DataItemTemplate>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn FieldName="Countx" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="Status" FieldName="Stock_Status" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                           <DataItemTemplate>
                                                                                            <dx:ASPxTextBox ID="A" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                        </DataItemTemplate>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                </Columns>
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
                        </dx:LayoutGroup>
                    </Items>
                    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                    <Paddings Padding="0px" />
                    <Border BorderStyle="None" />
                </dx:ASPxFormLayout>
             </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

<dx:ASPxCallbackPanel ID="cbp_Save0" runat="server" ClientInstanceName="cbp_Save" Width="200px" OnCallback="cbp_Save_Callback">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Save_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>
<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px" Font-Names="Myriad Pro" Font-Size="Small">
            <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol3" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupMsg_Label" runat="server" ClientInstanceName="popupMsg_Label" EnableClientSideAPI="True" EncodeHtml="False">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:35%"></td>
                        <td style="width:30%">
                            <dx:aspxbutton ID="popupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupMsg_BtnOk" Text="Ok" Width="100%">
                                <ClientSideEvents Click="function(s, e) {
	popupMsg.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:35%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>


<dx:ASPxPopupControl ID="popupDeleteConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol4" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupDeleteConfirmation_Label" runat="server" ClientInstanceName="popupDeleteConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Adakah anda pasti untuk memadam rekod ini?">
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
    popupDeleteConfirmation.Hide();
   LoadingPanel.SetText('Sistem sedang memadam rekod pengguna sistem yang dipilih.  Sila tunggu sebentar');
   LoadingPanel.Show();
cbp_Save.PerformCallback('DELETE');
}
" />
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


<dx:ASPxLoadingPanel ID="LoadingPanel0" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>


<uc1:Lookup_Controller ID="Lookup_Controller" runat="server" />



<dx:ASPxCallbackPanel ID="cbp_Save" runat="server" ClientInstanceName="cbp_Save" ClientVisible="False" OnCallback="cbp_Save_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Save_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>




<dx:ASPxPopupControl ID="PopupAuditTrail" runat="server" AllowDragging="True" AllowResize="True" ClientInstanceName="PopupAuditTrail" EnableClientSideAPI="True" HeaderText="Senarai Audit Untuk Kategori dan Sub-Kategori" MaxWidth="1800px" MinHeight="600px" MinWidth="650px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
</dx:ASPxPopupControl>





<dx:ASPxCallbackPanel ID="cbp_Report" runat="server" ClientInstanceName="cbp_Report" ClientVisible="False" OnCallback="cbp_Report_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	window.open('../../Report/Viewer/Index.aspx');
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>










<dx:ASPxTextBox ID="EnableDelete" ClientInstanceName="EnableDelete" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>















