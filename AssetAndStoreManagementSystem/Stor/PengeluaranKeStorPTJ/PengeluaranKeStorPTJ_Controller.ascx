<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PengeluaranKeStorPTJ_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PengeluaranKeStorPTJ.PengeluaranKeStorPTJ_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>








<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
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
    { }

    function TambahClicked()
    { }

    function SimpanClicked()
    { }

    function HantarClicked()
    { }

    function PadamClicked()
    { }

    function BatalCicked()
    { }

    function CetakClicked()
    { }

    function CarianClicked()
    { }

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
<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Pengeluaran Ke Stor PTJ" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/PengeluaranStokKeStorPTJ.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table class="dxflInternalEditorTable_SP2010Blue">
        <tr>
            <td colspan="2"  style="width:100%; vertical-align:top; text-align:left;">
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
            <td style="width:80%; vertical-align:top; text-align:left; padding-top:10px">
                <dx:ASPxFormLayout ID="ASPxFormLayout3" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Maklumat Stor PTJ" ColCount="2" Width="100%">
                            <Items>
                                <dx:LayoutItem Caption="Nama Stor PTJ" Width="60%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ASPxFormLayout3_E2" runat="server" CssClass="ComboBoxForPusatTanggungjawab">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Tarikh Sebenar Pindahan" Width="40%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit ID="ASPxFormLayout3_E3" runat="server" CssClass="DateEditorInForm">
                                            </dx:ASPxDateEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Senarai Stok Yang Dipindahkan" Width="100%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxHyperLink ID="ASPxFormLayout3_E1" runat="server" Text="Carian Stok">
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
                                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Width="100%">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="No. Pendaftaran Stok" ShowInCustomizationForm="True" VisibleIndex="0" Width="15%">
                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Keterangan Stok" ShowInCustomizationForm="True" VisibleIndex="1" Width="50%">
                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Unit Pengukuran" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Kuantiti Di Stor Pusat" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Kuantiti Yang Dipindahkan" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsPager Visible="False">
                                                </SettingsPager>
                                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
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
            </td>
            <td style="width:20%; vertical-align:top; text-align:left; padding-top:10px">
                <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Rujukan">
                            <Items>
                                <dx:LayoutItem Caption="No. Rujukan">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout2_E1" runat="server" Width="90%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Tarikh">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit ID="ASPxFormLayout2_E2" runat="server" Width="60%">
                                            </dx:ASPxDateEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Status">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout2_E3" runat="server" Width="90%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                </dx:ASPxFormLayout>
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

