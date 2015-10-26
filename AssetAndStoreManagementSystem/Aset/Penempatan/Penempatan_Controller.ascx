<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Penempatan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Penempatan.Penempatan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="Tab_Penempatan.ascx" tagname="Tab_Penempatan" tagprefix="uc1" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<script>
    function LoadSelectedPenempatan(P)
    {
        PH_ProcessId.SetText(P.toString());
        LoadingPanel.SetText('Sistem rekod penempatan yang telah dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Penempatan.PerformCallback('LOAD');
    }

    function OnPageLoadEvents() {
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        EnableDisableForm('false');
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

    function LulusClicked()
    { }

    function KuiriClicked()
    { }

    function KemaskiniClicked()
    {
        GridPenempatanListEnableDisable('true');
        EnableDisableForm('true');
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
    }

    function TambahClicked()
    {        
        EnableDisableForm('true');
        LoadingPanel.SetText('Sistem sedang menyediakan rekod penempatan baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Penempatan.PerformCallback('ADD');
    }

    function SimpanClicked()
    {
        if (CheckHeader())
        {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod penempatan.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_Penempatan.PerformCallback('SAVE');
        }
    }

    function HantarClicked()
    {
        if (CheckHeader() && CheckDetails())
        {
            GridPenempatanListEnableDisable('true');
            EnableDisableForm('true');
            MainRibbon.GetItemByName("Kemaskini").SetEnabled(false);

            LoadingPanel.SetText('Sistem sedang menghantar rekod penempatan.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_Penempatan.PerformCallback('POST');
        }
    }

    function PadamClicked()
    { }

    function BatalCicked()
    {
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        
        cbp_Penempatan.PerformCallback('CANCEL');
    }

    function CetakClicked()
    { }

    function CarianClicked()
    {
        popupSearchPenempatan.SetWidth(screen.width * 0.85);
        popupSearchPenempatan.SetContentUrl('Lookup/Index.aspx');
        popupSearchPenempatan.Show();
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
</script>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Penempatan" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Placement.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
        <Items>
            <dx:LayoutItem ShowCaption="False" Width="100%">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxRibbon ID="MainRibbon" runat="server" AllowMinimize="False" ClientInstanceName="MainRibbon" ShowFileTab="False" Width="100%">
                            <Tabs>
                                <dx:RibbonTab Name="Utama" Text="Utama">
                                    <Groups>
                                        <dx:RibbonGroup Name="Pengurusan Rekod" Text="Pengurusan Rekod">
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
                                                <dx:RibbonButtonItem Name="Lampiran" Size="Large" Text="Lampiran">
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
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False" Width="100%">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <uc1:Tab_Penempatan ID="Tab_Penempatan1" runat="server" />
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
</PanelCollection>
</dx:ASPxRoundPanel>

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


<dx:ASPxPopupControl ID="popupSearchPenempatan" runat="server" AllowDragging="True" ClientInstanceName="popupSearchPenempatan" CloseAnimationType="Fade" EnableClientSideAPI="True" HeaderText="Carian Rekod Penempatan" MaxHeight="550px" MinHeight="500px" MinWidth="650px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ClientSideEvents Closing="function(s, e) {
	popupSearchPenempatan.SetContentUrl('about:blank');
}" />
    <ContentCollection>
<dx:PopupControlContentControl runat="server"></dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>



