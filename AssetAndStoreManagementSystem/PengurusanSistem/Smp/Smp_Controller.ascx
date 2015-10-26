<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Smp_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Smp.Smp_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function cbp_TestSmp_EndCallback(s, e) {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else {
            popupMsg_Label.SetText('Ujian komunikasi kepada pangkalan data SMP telah berjaya.');
            popupMsg.Show();
        }
    }

    function btnTest_Click(s, e) {
        LoadingPanel.SetText('Sistem sedang menguji konfigurasi SMP yang dimasukkan.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_TestSmp.PerformCallback();
    }

    function OnPageLoad()
    {
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        LoadingPanel.SetText('Sistem sedang membuka kembali konfigurasi SMP yang terakhir disimpan.  Sila tunggu');
        LoadingPanel.Show();
        cbp.PerformCallback('LOAD');
    }

    function cbp_EndCallback(s, e) {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else {
            if (s.cpMode.toString() == 'LOAD') {
                ManageMainRibbonUtamaTab('true', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'true');
                MainForm.SetEnabled(false);

            }
            else {
                MainForm.SetEnabled(false);
                ManageMainRibbonUtamaTab('true', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'true');
                popupMsg_Label.SetText('Konfigurasi SMP telah disimpan dengan jayanya.');
                popupMsg.Show();
            }
        }
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

    function KemaskiniClicked() {
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
        MainForm.SetEnabled(true);
    }

    function TambahClicked()
    { }

    function SimpanClicked() {
        LoadingPanel.SetText('Sistem sedang menyimpan konfigurasi SMP.  Sila tunggu');
        LoadingPanel.Show();
        cbp.PerformCallback('SAVE');
    }

    function HantarClicked()
    { }

    function PadamClicked()
    { }

    function BatalCicked() {
        LoadingPanel.SetText('Sistem sedang membuka kembali konfigurasi SMP yang terakhir disimpan.  Sila tunggu');
        LoadingPanel.Show();
        cbp.PerformCallback('LOAD');
    }

    function CetakClicked()
    { }

    function CarianClicked()
    { }

    function AuditClicked()
    { }

    function TutupClicked() {
        window.close();
        return true;
    }

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
</script>




<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Sistem Maklumat Pekerja (SMP)" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/SMP.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%">
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
</dx:ASPxRibbon>
</td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <dx:ASPxCallbackPanel ID="cbp" runat="server" ClientInstanceName="cbp" OnCallback="cbp_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="MainForm" runat="server" ColCount="3" Width="100%" ClientInstanceName="MainForm">
                                <Items>
                                    <dx:LayoutItem Caption="Konfigurasi Pangkalan Data SMP" ColSpan="3" Width="100%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxMemo ID="ConnString" runat="server" ClientInstanceName="ConnString" EnableClientSideAPI="True" Rows="3" Width="100%">
                                                    <ClientSideEvents Init="function(s, e) {
s.GetInputElement().style.overflowY='hidden';	
}" />
                                                </dx:ASPxMemo>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kemaskini Terakhir Oleh" ColSpan="2" Width="40%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxLabel ID="LastModBy" runat="server" Text="ASPxLabel">
                                                </dx:ASPxLabel>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kemaskini Terakhir Pada" Width="60%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxLabel ID="LastModDate" runat="server" Text="ASPxLabel">
                                                </dx:ASPxLabel>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="3" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="3" CssClass="DbTestButton" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" CssClass="DbTestButton">
                                                <dx:ASPxButton ID="btnTest" runat="server" AutoPostBack="False" ClientInstanceName="btnTest" EnableClientSideAPI="True" Text="Ujian" Width="100px">
                                                    <ClientSideEvents Click="function(s, e) {
	btnTest_Click(s, e);
}" />
                                                </dx:ASPxButton>
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
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

<dx:ASPxCallbackPanel ID="cbp_TestSmp" runat="server" ClientInstanceName="cbp_TestSmp" ClientVisible="False" OnCallback="cbp_TestSmp_Callback" Width="200px" ShowLoadingPanel="False" ShowLoadingPanelImage="False">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_TestSmp_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


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

<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>