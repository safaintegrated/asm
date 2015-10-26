<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pendaftaran_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pendaftaran.Pendaftaran_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="Pendaftaran_MainInfo.ascx" tagname="Pendaftaran_MainInfo" tagprefix="uc1" %>
<%@ Register src="Pendaftaran_VehicleInfo.ascx" tagname="Pendaftaran_VehicleInfo" tagprefix="uc2" %>
<%@ Register src="Pendaftaran_Accessories.ascx" tagname="Pendaftaran_Accessories" tagprefix="uc3" %>
<%@ Register src="Pendaftaran_Location.ascx" tagname="Pendaftaran_Location" tagprefix="uc4" %>
<%@ Register src="Pendaftaran_Accounting.ascx" tagname="Pendaftaran_Accounting" tagprefix="uc5" %>
<%@ Register src="Pendaftaran_Maintenance.ascx" tagname="Pendaftaran_Maintenance" tagprefix="uc6" %>
<%@ Register src="Pendaftaran_WriteOff.ascx" tagname="Pendaftaran_WriteOff" tagprefix="uc7" %>
<%@ Register src="Pendaftaran_Transfer.ascx" tagname="Pendaftaran_Transfer" tagprefix="uc8" %>

<script>
    function PageControl_ActiveTabChanged(s, e)
    {
        switch (s.GetActiveTabIndex())
        {
            case 4: AccountsTabChanged(); break;
        }
    }

    function AccountsTabChanged()
    {
        if (Accounting_EditMode.GetText() == '0')
        { ManageMainRibbonUtamaTab('true', 'false', 'false', 'false', 'false', 'false', 'true', 'false', 'true', 'true');}
        else
        { ManageMainRibbonUtamaTab('false','false','true','false','false','true','false','false','false','true'); }
    }

    function LoadLookupAssetInv(U, T)
    {
        //component
        var TabAksesori = PageControl.GetTab(2);
        TabAksesori.SetVisible(true);
        ComponentParentType.SetText(T.toString());
        ComponentParentUniqueId.SetText(U.toString());        
        ComponentEditMode.SetText('0');
        GridComponent.PerformCallback();

        //penempatan
        var TabPenempatan = PageControl.GetTab(3);
        TabPenempatan.SetVisible(true);
        PenempatanParentType.SetText(T.toString());
        PenempatanParentUniqueId.SetText(U.toString());
        GridAssetInvPenempatan.PerformCallback();

        //accounting
        var TabAkaun = PageControl.GetTab(4);
        TabAkaun.SetVisible(true);
        AIA_UniqueId.SetText(U.toString());
        Accounting_EditMode.SetText('0');
        cbp_AI_Accounting.PerformCallback('LOAD');

        //hide lookup window
        PopupSearchAssetInv.Hide();
    }

    function OnPageLoadEvents() {
        var TabMaklumatUtama = PageControl.GetTab(0);
        var TabKenderaan = PageControl.GetTab(1);
        var TabAksesori = PageControl.GetTab(2);
        var TabPenempatan = PageControl.GetTab(3);
        var TabAkaun = PageControl.GetTab(4);
        var TabPenyelenggaraan = PageControl.GetTab(5);
        var TabHapuskira = PageControl.GetTab(6);
        var TabPindahan = PageControl.GetTab(7);

        TabKenderaan.SetVisible(false);
        TabAksesori.SetVisible(false);
        TabPenempatan.SetVisible(false);
        TabAkaun.SetVisible(false);
        TabPenyelenggaraan.SetVisible(false);
        TabHapuskira.SetVisible(false);
        TabPindahan.SetVisible(false);

        PageControl.SetActiveTabIndex(0);
        PageControl.SetVisible(true);

        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
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

    function LulusClicked()
    { }

    function KuiriClicked()
    { }

    function KemaskiniClicked()
    {
        switch (PageControl.GetActiveTabIndex()) {
            case 4: EditAccountsInfo(); break;
        }
    }

    function TambahClicked()
    { }

    function SimpanClicked()
    {
        switch (PageControl.GetActiveTabIndex())
        {
            case 4: SaveAccountsInfo(); break;
        }
    }

    function HantarClicked()
    { }

    function PadamClicked()
    { }

    function BatalCicked()
    { }

    function CetakClicked()
    { }

    function CarianClicked()
    {
        PopupSearchAssetInv.SetContentUrl('Lookup/Index.aspx');
        PopupSearchAssetInv.SetWidth(screen.width * 0.85);
        PopupSearchAssetInv.Show();
    }

    function AuditClicked()
    { }

    function TutupClicked()
    { }

    function LampiranClicked()
    { }

    function GambarClicked()
    { }

    function ImpotClicked()
    { }

    function ManageMainRibbonUtamaTab(Kemaskini, Tambah, Simpan, Hantar, Padam, Batal, Cetak, Carian, Audit, Tutup) {
        if (Kemaskini == 'true')
            MainRibbon.GetItemByName("Kemaskini").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Kemaskini").SetEnabled(false);

        if (Tambah == 'true')
            MainRibbon.GetItemByName("Tambah").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Tambah").SetEnabled(false);

        if (Simpan == 'true')
            MainRibbon.GetItemByName("Simpan").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Simpan").SetEnabled(false);

        if (Hantar == 'true')
            MainRibbon.GetItemByName("Hantar").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Hantar").SetEnabled(false);

        if (Padam == 'true')
            MainRibbon.GetItemByName("Padam").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Padam").SetEnabled(false);

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

    function SaveAccountsInfo()
    {
        LoadingPanel.SetText('Sistem sedang menyimpan maklumat akaun aset.  Sila tunggu sebentar..')
        LoadingPanel.Show();
        cbp_AI_Accounting.PerformCallback('SAVE');
    }

    function EditAccountsInfo()
    {
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
        EnableDisableAccountingForm('true');
    }
</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Pendaftaran" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Belian.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td><dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
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
</dx:ASPxRibbon></td>
        </tr>
        <tr>
            <td style="width:100%; vertical-align:top; text-align:left;padding-top:10px;">
                <dx:ASPxPageControl ID="PageControl" runat="server" ActiveTabIndex="0" Width="100%" AccessibilityCompliant="True" ClientInstanceName="PageControl" ClientVisible="False" EnableClientSideAPI="True">
                    <TabPages>
                        <dx:TabPage Text="Maklumat Utama">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc1:Pendaftaran_MainInfo ID="Pendaftaran_MainInfo1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Maklumat Kenderaan">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc2:Pendaftaran_VehicleInfo ID="Pendaftaran_VehicleInfo1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Aksesori &amp; Komponen">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc3:Pendaftaran_Accessories ID="Pendaftaran_Accessories1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Penempatan">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc4:Pendaftaran_Location ID="Pendaftaran_Location1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Akaun">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc5:Pendaftaran_Accounting ID="Pendaftaran_Accounting1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Penyelenggaraan">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc6:Pendaftaran_Maintenance ID="Pendaftaran_Maintenance1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Pelupusan &amp; Hapuskira">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc7:Pendaftaran_WriteOff ID="Pendaftaran_WriteOff1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Pindahan">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc8:Pendaftaran_Transfer ID="Pendaftaran_Transfer1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>
                    <ClientSideEvents ActiveTabChanged="function(s, e) {
	PageControl_ActiveTabChanged(s, e);
}" />
                </dx:ASPxPageControl>
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

<dx:ASPxPopupControl ID="PopupSearchAssetInv" runat="server" AllowDragging="True" ClientInstanceName="PopupSearchAssetInv" EnableClientSideAPI="True" HeaderText="Carian Aset Alih" MaxHeight="650px" MinHeight="500px" MinWidth="800px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto" ShowPageScrollbarWhenModal="True">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl runat="server"></dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>
<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
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
                        <td style="width:30%; text-align:center; vertical-align:middle;">
                            <dx:aspxbutton ID="popupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupMsg_BtnOk" Text="Ok" Width="100px">
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



