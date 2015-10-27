<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_HasilPemeriksaan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Pemeriksaan.Tab_HasilPemeriksaan_Controller" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />


<dx:ASPxCallbackPanel ID="cbp_HasilPemeriksaan" runat="server" OnCallback="cbp_HasilPemeriksaan_Callback" Width="100%" ClientInstanceName="cbp_HasilPemeriksaan">
    <ClientSideEvents EndCallback="function(s, e) {
	OnHasilPemeriksaanEndCallBack(s,e);
}" />
    <PanelCollection>
        <dx:PanelContent runat="server">
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Muatnaik Oleh" ColCount="2" Width="100%">
                        <Items>
                            <dx:LayoutItem Caption="Muatnaik Fail Pemeriksaan (CSV)" ColSpan="2" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxUploadControl ID="PemeriksaanCsvUpload" runat="server" ClientInstanceName="PemeriksaanCsvUpload" CssClass="TextBoxForName" OnFileUploadComplete="PemeriksaanCsvUpload_FileUploadComplete" ShowProgressPanel="True" UploadMode="Auto">
                                            <ClientSideEvents FileUploadComplete="function(s, e) {
	PemeriksaanFileUploadComplete(s, e);
}"
                                                TextChanged="function(s, e) {
	PemeriksaanCsvUpload.Upload();
}" />
                                            <BrowseButton Text="Pilih Fail">
                                            </BrowseButton>
                                            <AdvancedModeSettings>
                                                <FileListItemStyle CssClass="pending dxucFileListItem">
                                                </FileListItemStyle>
                                            </AdvancedModeSettings>
                                        </dx:ASPxUploadControl>
                                        <dx:ASPxTextBox ID="txtFileName" runat="server" ClientInstanceName="txtFileName" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Status Fail Pemeriksaan">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxLabel ID="lblFileStatus" runat="server" Text="Status Fail">
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Hasil Pemeriksaan">
                        <Items>
                            <dx:LayoutItem Caption="Senarai Stok">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridLookup ID="ASPxFormLayout1_E9" runat="server">
                                            <GridViewProperties>
                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                            </GridViewProperties>
                                        </dx:ASPxGridLookup>
                                        <br />
                                        <dx:ASPxGridView ID="gvSenaraiStok" runat="server" AutoGenerateColumns="False" ClientInstanceName="gvSenaraiStok" KeyFieldName="Id" OnHtmlDataCellPrepared="gvSenaraiStok_HtmlDataCellPrepared" Width="100%">
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
                                                <dx:GridViewDataTextColumn Caption="Baki Sebenar" FieldName="PhysicalBalance" Name="PhysicalBalance" ShowInCustomizationForm="True" VisibleIndex="5">
                                                    <DataItemTemplate>
                                                        <dx:ASPxTextBox ID="PhysicalBalance" runat="server" ClientInstanceName="PhysicalBalance" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager Visible="False">
                                            </SettingsPager>
                                            <SettingsDataSecurity AllowEdit="False" />
                                        </dx:ASPxGridView>
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

<dx:ASPxPopupControl ID="popupInvalidAttachment" runat="server" ClientInstanceName="popupInvalidAttachment" CloseAnimationType="Fade" EnableClientSideAPI="True" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px" HeaderText="Muatnaik fail gagal">
    <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
    </HeaderImage>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <table style="width: 100%; vertical-align: top; text-align: left;">
                <tr>
                    <td style="width: 100%; vertical-align: top; text-align: center;">

                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fail yang dipilih gagal dimuatnaik.&lt;br&gt;Sila pastikan fail yang dipilih bersaiz tidak lebih daripada 10Mb." EncodeHtml="False">
                        </dx:ASPxLabel>

                    </td>
                </tr>
                <tr>
                    <td style="width: 100%; vertical-align: top; text-align: left; padding-top: 10px;">
                        <div style="width: 120px; text-align: center; margin-left: auto; margin-right: auto;">
                            <dx:ASPxButton ID="ASPxButton16" runat="server" Text="Ok" Width="100%" AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) {
	popupInvalidAttachment.Hide();
}" />
                            </dx:ASPxButton>
                        </div>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>















