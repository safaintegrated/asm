<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_HasilPemeriksaan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Verifikasi.Tab_HasilPemeriksaan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function CsvUpload_FileUploadComplete(s, e)
    { }

    function cbp_CheckInvestigatorRights_EndCallback(s, e)
    { }



</script>

<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Muatnaik Oleh" Width="100%" ColCount="2">
            <Items>
                <dx:LayoutItem Caption="Muatnaik Fail Pemeriksaan (CSV)" ColSpan="2" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxUploadControl ID="CsvUpload" runat="server" ClientInstanceName="CsvUpload" CssClass="TextBoxForName" ShowProgressPanel="True" UploadMode="Auto">
                                <ClientSideEvents FileUploadComplete="function(s, e) {
	CsvUpload_FileUploadComplete(s, e);
}" TextChanged="function(s, e) {
	CsvUpload.Upload();
}" />
                                <BrowseButton Text="Pilih Fail">
                                </BrowseButton>
                                <AdvancedModeSettings>
                                    <FileListItemStyle CssClass="pending dxucFileListItem">
                                    </FileListItemStyle>
                                </AdvancedModeSettings>
                            </dx:ASPxUploadControl>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Nama Pemeriksa" Width="20%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="Result_InvestigatorName" runat="server" CssClass="TextBoxForName" ClientEnabled="False" ClientInstanceName="Result_InvestigatorName" EnableClientSideAPI="True">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Tarikh" Width="80%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxDateEdit ID="Result_PostDate" runat="server" CssClass="DateEditor" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" ClientEnabled="False" ClientInstanceName="Result_PostDate" EnableClientSideAPI="True">
                            </dx:ASPxDateEdit>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
    </Items>
    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
</dx:ASPxFormLayout>
<dx:ASPxCallbackPanel ID="cbp_ResultGrid" runat="server" ClientInstanceName="cbp_ResultGrid" OnCallback="cbp_ResultGrid_Callback" Width="100%">
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Hasil Pemeriksaan" ColCount="3" Width="100%">
                <Items>
                    <dx:LayoutItem ColSpan="3" ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridView ID="GridInspectionResult" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridInspectionResult" Width="100%">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="No Siri Pendaftaran" ShowInCustomizationForm="True" VisibleIndex="0" Width="10%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan Aset" ShowInCustomizationForm="True" VisibleIndex="1" Width="35%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Status KEWPA2/KEWPA3" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Status Pemeriksaan" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Catatan &amp; Cadangan" ShowInCustomizationForm="True" VisibleIndex="4" Width="35%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" />
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
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="width:100%; vertical-align:top; text-align:center;">
                
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fail yang dipilih gagal dimuatnaik.&lt;br&gt;Sila pastikan fail yang dipilih bersaiz tidak lebih daripada 10Mb." EncodeHtml="False">
                </dx:ASPxLabel>
                
            </td>
        </tr>
        <tr>
            <td style="width:100%; vertical-align:top; text-align:left; padding-top:10px;"><div style="width:120px; text-align:center; margin-left:auto; margin-right:auto;">
                <dx:ASPxButton ID="ASPxButton16" runat="server" Text="Ok" Width="100%" AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {
	popupInvalidAttachment.Hide();
}" />
                </dx:ASPxButton>
                </div></td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>






<dx:ASPxCallbackPanel ID="cbp_CheckInvestigatorRights" runat="server" ClientInstanceName="cbp_CheckInvestigatorRights" ClientVisible="False" OnCallback="cbp_CheckInvestigatorRights_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
cbp_CheckInvestigatorRights_EndCallback(s, e);	
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>







<dx:ASPxTextBox ID="Result_CsvFileName" runat="server" ClientInstanceName="Result_CsvFileName" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
</dx:ASPxTextBox>








<dx:ASPxTextBox ID="Result_RowId" runat="server" ClientInstanceName="Result_RowId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
</dx:ASPxTextBox>








