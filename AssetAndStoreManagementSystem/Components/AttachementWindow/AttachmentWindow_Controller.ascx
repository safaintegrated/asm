<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttachmentWindow_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Components.AttachementWindow.AttachmentWindow_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>








 
<link href="../../Public/Css/Font.css" rel="stylesheet" />
 <style type="text/css">
        .CustomTextBox, .CustomTextBox input[type='text'] {
            padding: 0px;
            border-width: 0px;
        }
        .CustomTextBox input[type='text'] {
            opacity: 0;
            filter: alpha(opacity=0);
        }
     </style>

<script>
    function MainRibbon_CommandExecuted(s, e) {
        switch (e.item.name) {
            case 'Lampiran': LampiranClicked(); break;
        }
    }

    function LampiranClicked()
    {
        popupAttachment.Show();
    }
</script>
<dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ShowGroupLabels="False" ClientInstanceName="MainRibbon" CssClass="AppFont">
    <Tabs>
        <dx:RibbonTab Name="Utama" Text="Utama">
            <Groups>
                <dx:RibbonGroup Text="">
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
        <dx:RibbonTab Name="Lampiran" Text="Lampiran">
            <Groups>
                <dx:RibbonGroup Name="Muatnaik" Text="">
                    <Items>
                        <dx:RibbonButtonItem Size="Large" Text="Lampiran" Name="Lampiran">
                            <LargeImage IconID="mail_attachment_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                    </Items>
                </dx:RibbonGroup>
            </Groups>
        </dx:RibbonTab>
        <dx:RibbonTab Name="Laporan" Text="Laporan">
            <Groups>
                <dx:RibbonGroup>
                    <Items>
                        <dx:RibbonButtonItem Name="KEW.PA-1" Size="Large" Text="KEW.PA-1">
                            <LargeImage IconID="reports_report_32x32">
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
<dx:ASPxPopupControl ID="popupAttachment" runat="server" AllowDragging="True" ClientInstanceName="popupAttachment" EnableClientSideAPI="True" HeaderText="Muatnaik &amp; Senarai Lampiran" Width="800px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" CssClass="AppFont" MaxHeight="500px" ScrollBars="Auto" ShowPageScrollbarWhenModal="True" Height="300px" ShowFooter="True">
    <HeaderStyle HorizontalAlign="Center" />
    <FooterContentTemplate>
        <div style="width:350px; float:left; padding:8px 8px 8px 4px; margin:0">
            <dx:ASPxButton ID="ASPxButton8" runat="server" AutoPostBack="False" Text="Padam" Width="100px">
            </dx:ASPxButton>
            &nbsp;&nbsp;&nbsp;<dx:ASPxButton ID="ASPxButton9" runat="server" AutoPostBack="False" Text="Buka" Width="100px">
            </dx:ASPxButton>
            &nbsp;&nbsp;
            <dx:ASPxButton ID="ASPxButton10" runat="server" AutoPostBack="False" Text="Info" Width="100px">
                <ClientSideEvents Click="function(s, e) {
	PopupAttachmentInfo.Show();
}" />
            </dx:ASPxButton>
        </div>
         <div style="width:100px; float:right; padding:8px 0px 8px 8px; text-align:right; margin:0">
             <dx:ASPxButton ID="ASPxButton11" runat="server" AutoPostBack="False" Text="Tutup" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	popupAttachment.Hide();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="LAMPIRAN (0)" Width="100%" CssClass="AppFont">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <table style="width:100%;">
                    <tr>
                        <td style="width:100%; padding:4px 4px 4px 4px;">
                            <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ShowClearFileSelectionButton="False" ShowProgressPanel="True" UploadMode="Auto" Width="100%">
                                <BrowseButton Text="Klik di sini untuk memuatnaik fail anda">
                                </BrowseButton>
                            </dx:ASPxUploadControl>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%; padding:4px 4px 4px 4px;">
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Width="100%">
                                <Columns>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="5%">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="1" Width="5%">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nama Fail" ShowInCustomizationForm="True" VisibleIndex="2" Width="40%">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tarikh" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nota" ShowInCustomizationForm="True" VisibleIndex="4" Width="40%">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsPager Visible="False" Mode="ShowAllRecords">
                                </SettingsPager>
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                <Styles>
                                    <AlternatingRow Enabled="True">
                                    </AlternatingRow>
                                </Styles>
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxPopupControl ID="PopupAttachmentInfo" runat="server" HeaderText="Info fail" Width="450px" CssClass="AppFont" ClientInstanceName="PopupAttachmentInfo" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True">
    <HeaderStyle HorizontalAlign="Center" />
    <FooterContentTemplate>
        <div style="width:90%; margin-left:auto; margin-right:auto; padding:8px 8px 8px 8px; text-align:center; vertical-align:middle;">
            <dx:ASPxButton ID="ASPxButton12" runat="server" AutoPostBack="False" Text="Buka" Width="100px">
            </dx:ASPxButton>
            &nbsp;<dx:ASPxButton ID="ASPxButton13" runat="server" AutoPostBack="False" Text="Simpan &amp; Tutup" Theme="SoftOrange" Width="100px" Wrap="True">
            </dx:ASPxButton>
            &nbsp;<dx:ASPxButton ID="ASPxButton14" runat="server" AutoPostBack="False" Text="Batal" Width="100px">
            </dx:ASPxButton>
            &nbsp;&nbsp;&nbsp;
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" CssClass="AppFont" Width="100%">
        <Items>
            <dx:LayoutGroup ShowCaption="True" Caption="Maklumat Tambahan Fail">
                <Items>
                    <dx:LayoutItem Caption="Nama Fail">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nota">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="ASPxFormLayout1_E2" runat="server" Rows="4" Width="100%">
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutItem Caption="Muatnaik Oleh">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E3" runat="server" Text="ASPxLabel">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Tarikh Muatnaik">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E4" runat="server" Text="ASPxLabel">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Jenis Fail">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E5" runat="server" Text="ASPxLabel">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
    </dx:ASPxFormLayout>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


