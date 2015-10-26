<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KategoriSubKategori_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.KategoriSubKategori.KategoriSubKategori_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="Lookup_Controller.ascx" tagname="Lookup_Controller" tagprefix="uc1" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function ViewCat(Idx)
    {
        LoadingPanel.SetText('Sistem sedang membuka maklumat kategori yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();

    }
    function OnPageLoad() {
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'false', 'true', 'true');
    }

    function MainRibbon_CommandExecuted(s, e) {
        switch (e.item.name) {
            case 'Kemaskini': KemaskiniClicked(); break;
            case 'Lulus': LulusClicked(); break;
            case 'Kuiri': KuiriClicked(); break;
            case 'Tutup': TutupClicked(); break;
            case 'Tambah': TambahClicked(); break;
            case 'Simpan': SimpanClicked(); break;
            case 'Hantar': HantarClicked(); break;
            case 'Padam': PadamClicked(); break;
            case 'Batal': BatalCicked(); break;
            case 'Cetak': CetakClicked(); break;
            case 'Carian': CarianClicked(); break;
            case 'Audit': AuditClicked(); break;
            case 'Lampiran': LampiranClicked(); break;
            case 'Gambar': GambarClicked(); break;
            case 'Impot': ImpotClicked(); break;
        }
    }

    function AuditClicked() {
        PopupAuditTrail.SetWidth(screen.width * 0.85);
        PopupAuditTrail.Show();
        GridAuditListing.PerformCallback();
    }

    function TutupClicked() {
        window.close();
    }

    function CetakClicked() {
        cbp_Report.PerformCallback();
    }

    function KemaskiniClicked() {
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'true');
        MainForm.SetEnabled(true);
    }

    function PadamClicked() {
        popupDeleteConfirmation.Show();
    }

    function BatalCicked() {
    }

    function TambahClicked() {
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod buletin baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupManagement.PerformCallback("ADD");
    }

    function CarianClicked() {

    }

    function SimpanClicked() {
    }

    function ManageMainRibbonUtamaTab(Kemaskini, Tambah, Simpan, Hantar, Padam, Batal, Cetak, Carian, Audit, Tutup) {
        if (EnableUpdate.GetText() == 'True') {
            if (Kemaskini == 'true')
                MainRibbon.GetItemByName("Kemaskini").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Kemaskini").SetEnabled(false);
        }

        if (EnableCreate.GetText() == 'True') {
            if (Tambah == 'true')
                MainRibbon.GetItemByName("Tambah").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Tambah").SetEnabled(false);
        }

        if (Simpan == 'true')
            MainRibbon.GetItemByName("Simpan").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Simpan").SetEnabled(false);

        if (Hantar == 'true')
            MainRibbon.GetItemByName("Hantar").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Hantar").SetEnabled(false);

        if (EnableDelete.GetText() == 'True') {
            if (Padam == 'true')
                MainRibbon.GetItemByName("Padam").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Padam").SetEnabled(false);
        }

        if (Batal == 'true')
            MainRibbon.GetItemByName("Batal").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Batal").SetEnabled(false);

        if (Cetak == 'true')
            MainRibbon.GetItemByName("Cetak").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Cetak").SetEnabled(false);

        if (Carian == 'true')
            MainRibbon.GetItemByName("Carian").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Carian").SetEnabled(false);

        if (Audit == 'true')
            MainRibbon.GetItemByName("Audit").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Audit").SetEnabled(false);

        if (Tutup == 'true')
            MainRibbon.GetItemByName("Tutup").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Tutup").SetEnabled(false);
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
        <dx:RibbonTab Name="Lampiran" Text="Muatnaik">
            <Groups>
                <dx:RibbonGroup Name="Muatnaik" Text="">
                    <Items>
                        <dx:RibbonButtonItem Size="Large" Text="Lampiran" Name="Lampiran">
                            <LargeImage IconID="mail_attachment_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Gambar" Size="Large" Text="Gambar">
                            <LargeImage IconID="content_image_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Impot" Size="Large" Text="Import">
                            <LargeImage IconID="actions_download_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                    </Items>
                </dx:RibbonGroup>
            </Groups>
        </dx:RibbonTab>
        <dx:RibbonTab Name="Laporan" Text="Laporan">
            <Groups>
                <dx:RibbonGroup>
                </dx:RibbonGroup>
            </Groups>
        </dx:RibbonTab>
        <dx:RibbonTab Name="Kelulusan" Text="Kelulusan">
            <Groups>
                <dx:RibbonGroup>
                    <Items>
                        <dx:RibbonButtonItem Name="Lulus" Size="Large" Text="Lulus">
                            <LargeImage IconID="actions_apply_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Kuiri" Size="Large" Text="Kuiri">
                            <LargeImage IconID="support_knowledgebasearticle_32x32">
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
                <dx:ASPxGridView ID="MainGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="MainGrid" DataSourceID="SqlDataSource1" KeyFieldName="CatId" OnCustomCallback="MainGrid_CustomCallback" OnHtmlDataCellPrepared="MainGrid_HtmlDataCellPrepared" Width="100%">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CatId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Kategori" FieldName="CatName" ShowInCustomizationForm="True" VisibleIndex="1">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                            <DataItemTemplate>
                                <dx:ASPxHyperLink ID="CatName" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                                </dx:ASPxHyperLink>
                            </DataItemTemplate>                            
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="VOT" FieldName="CatVot" ShowInCustomizationForm="True" VisibleIndex="2">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" /> 
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Jumlah Sub-Kategori" FieldName="SubcatCount" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="LessOrEqual" /> 
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <Styles>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [V_CategoriSubCategori] ORDER BY [CatName]"></asp:SqlDataSource>
             </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

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


<dx:ASPxTextBox ID="EnableCreate" ClientInstanceName="EnableCreate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableUpdate" ClientInstanceName="EnableUpdate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableDelete" ClientInstanceName="EnableDelete" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>





