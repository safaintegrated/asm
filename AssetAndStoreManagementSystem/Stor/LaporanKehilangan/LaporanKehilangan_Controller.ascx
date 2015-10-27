<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LaporanKehilangan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.LaporanKehilangan.LaporanKehilangan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>

    function OnPageLoadEvents() {
        PageControl.SetActiveTabIndex(1);
        PageControl.SetVisible(true);

        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        EnableDisableKehilangan('false');
    }

    function HideLoadingPanel() {
        alert('save');
        LoadingPanel.Hide();
        alert('simpan');
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
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'false');
        EnableDisableKehilangan('true');
    }

    function TambahClicked()
    {
        alert('1')
        EnableDisableKehilangan('true');
        alert('2')
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
    }

    function SimpanClicked()
    {
        var v = CheckLaporanKehilangan();
        if (v == true) {
            alert('1')
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat Laporan Kehilangan.  Sila tunggu sebentar..');
            alert('2')
            LoadingPanel.Show();
            alert('3')
            cbpLaporanKehilangan.PerformCallback('SAVE')
            alert('4')
        }
        else {
            alert('A');
        }

    }

    function CheckLaporanKehilangan() {


        if (txtJenisAset.GetText() == '') {
            popupMsg_Label.SetText('Jenis Aset perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtJenamaDanModel.GetText() == '') {
            popupMsg_Label.SetText('Jenama Dan Model Stok perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtKuantiti.GetText() == '') {
            popupMsg_Label.SetText('Kuantiti perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (deTarikhPerolehan.GetText() == '') {
            popupMsg_Label.SetText('Tarikh Perolehan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (deTarikhLaporan.GetText() == '') {
            popupMsg_Label.SetText('Tarikh Laporan Stok perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtStatus.GetText() == '') {
            popupMsg_Label.SetText('Status perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtJenisAsetAlihStok.GetText() == '') {
            popupMsg_Label.SetText('Jenis Aset Alih Stok perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtNoDaftarStok.GetText() == '') {
            popupMsg_Label.SetText('No Daftar Stok Stok perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtKeterangan.GetText() == '') {
            popupMsg_Label.SetText('Keterangan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtSubKategori.GetText() == '') {
            popupMsg_Label.SetText('Sub Kategori perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (deTarikhBeli.GetText() == '') {
            popupMsg_Label.SetText('Tarikh Beli Stok perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtHargaPerolehanAsal.GetText() == '') {
            popupMsg_Label.SetText('Harga Perolehan Asal perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtKuantitiKehilangan.GetText() == '') {
            popupMsg_Label.SetText('Kauntiti Kehilangan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtTempatKehilangan.GetText() == '') {
            popupMsg_Label.SetText('Tempat Kehilangan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtPuncaKehilangan.GetText() == '') {
            popupMsg_Label.SetText('Punca Kehilangan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtPegawaiYangBertanggungjawab.GetText() == '') {
            popupMsg_Label.SetText('Pegawai Yang Bertanggungjawab perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        if (txtJawatanPegawaiYangBertanggungjawab.GetText() == '') {
            popupMsg_Label.SetText('Jawatan Pegawai Yang Bertanggungjawab perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtTarafJawatan.GetText() == '') {
            popupMsg_Label.SetText('Taraf Jawatan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtNoLaporanPolis.GetText() == '') {
            popupMsg_Label.SetText('No Laporan Polis Stok perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (deTarikhLaporanPolis.GetText() == '') {
            popupMsg_Label.SetText('Tarikh Laporan Polis perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtLangkahLangkahSediaAda.GetText() == '') {
            popupMsg_Label.SetText('Langkah-langkah Sedia Ada perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtLangkahLangkahPencegahan.GetText() == '') {
            popupMsg_Label.SetText('Langkah-langkah Pencegahan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtTindakanKepadaPegawaiYangBertanggungjawab.GetText() == '') {
            popupMsg_Label.SetText('Tindakan Kepada Pegaai Yang Bertanggungjawab perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtCatatan.GetText() == '') {
            popupMsg_Label.SetText('Catatan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
       

        //alert('good');

        return true;

    }



    function HantarClicked()
    { }

    function PadamClicked()
    { }

    function BatalCicked()
    { }

    function CetakClicked()
    {
        
       

    }



    function CarianClicked()
    { }

    function AuditClicked()
    { }

    function TutupClicked()
    { window.close(); }

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

    function EnableDisableKehilangan(truefalse) {
        if (truefalse == 'true') {

            txtJenisAset.SetEnabled(true);
            txtJenamaDanModel.SetEnabled(true);
            txtKuantiti.SetEnabled(true);
            deTarikhPerolehan.SetEnabled(true);
            deTarikhLaporan.SetEnabled(true);
            txtStatus.SetEnabled(true);
            txtJenisAsetAlihStok.SetEnabled(true);
            txtNoDaftarStok.SetEnabled(true);
            txtKeterangan.SetEnabled(true);
            txtSubKategori.SetEnabled(true);
            deTarikhBeli.SetEnabled(true);
            txtHargaPerolehanAsal.SetEnabled(true);
            txtKuantitiKehilangan.SetEnabled(true);
            txtAnggaranNilaiSemasa.SetEnabled(true);
            txtTempatKehilangan.SetEnabled(true);
            txtPuncaKehilangan.SetEnabled(true);
            txtPegawaiYangBertanggungjawab.SetEnabled(true);
            txtJawatanPegawaiYangBertanggungjawab.SetEnabled(true);
            txtTarafJawatan.SetEnabled(true);
            txtNoLaporanPolis.SetEnabled(true);
            deTarikhLaporanPolis.SetEnabled(true);
            txtLangkahLangkahSediaAda.SetEnabled(true);
            txtLangkahLangkahPencegahan.SetEnabled(true);
            txtTindakanKepadaPegawaiYangBertanggungjawab.SetEnabled(true);
            txtCatatan.SetEnabled(true);

        

        }
        else {

            txtJenisAset.SetEnabled(false);
            txtJenamaDanModel.SetEnabled(false);
            txtKuantiti.SetEnabled(false);
            deTarikhPerolehan.SetEnabled(false);
            deTarikhLaporan.SetEnabled(false);
            txtStatus.SetEnabled(false);
            txtJenisAsetAlihStok.SetEnabled(false);
            txtNoDaftarStok.SetEnabled(false);
            txtKeterangan.SetEnabled(false);
            txtSubKategori.SetEnabled(false);
            deTarikhBeli.SetEnabled(false);
            txtHargaPerolehanAsal.SetEnabled(false);
            txtKuantitiKehilangan.SetEnabled(false);
            txtAnggaranNilaiSemasa.SetEnabled(false);
            txtTempatKehilangan.SetEnabled(false);
            txtPuncaKehilangan.SetEnabled(false);
            txtPegawaiYangBertanggungjawab.SetEnabled(false);
            txtJawatanPegawaiYangBertanggungjawab.SetEnabled(false);
            txtTarafJawatan.SetEnabled(false);
            txtNoLaporanPolis.SetEnabled(false);
            deTarikhLaporanPolis.SetEnabled(false);
            txtLangkahLangkahSediaAda.SetEnabled(false);
            txtLangkahLangkahPencegahan.SetEnabled(false);
            txtTindakanKepadaPegawaiYangBertanggungjawab.SetEnabled(false);
            txtCatatan.SetEnabled(false);

        }
    }

</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Laporan Kehilangan" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/PerakuanAmbilAlih.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutItem ColSpan="2" ShowCaption="False" Width="100%">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
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
                        <br />
                        <asp:Button ID="btnPrintReport" runat="server" OnClick="btnPrintReport_Click" Text="Print" />
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False" Width="85%" CssClass="MainFormSecondRowLeftColumnAddTopPadding">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        
                        <dx:ASPxFormLayout ID="ASPxFormLayout3" runat="server" Width="100%">
                            <Items>

                                <dx:LayoutGroup Caption="Maklumat Paparan" Width="100%">
                                    <Items>
                                        <dx:LayoutItem Caption="Nama Stor" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxComboBox ID="LK_NamaStor" runat="server">
                                                    </dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="No Daftar Stok" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxComboBox ID="LK_NoDaftarStor" runat="server" CssClass="ComboBoxForNamaStor">
                                                    </dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Width="100%" Caption="Keterangan Stok">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxComboBox ID="ASPxFormLayout3_E6" runat="server">
                                                    </dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>

                                <dx:LayoutGroup Caption="Maklumat Yang Perlu Diisi oleh Ketua PTJ" Width="100%">
                                    <Items>
                                        <dx:LayoutItem Caption="Jenis Aset">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtJenisAset" runat="server" Width="170px" ClientInstanceName="txtJenisAset" OnTextChanged="txtJenisAset_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Jenama Dan Model">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtJenamaDanModel" runat="server" Width="170px" ClientInstanceName="txtJenamaDanModel" OnTextChanged="txtJenamaDanModel_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Kuantiti">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtKuantiti" runat="server" Width="170px" ClientInstanceName="txtKuantiti" OnTextChanged="txtKuantiti_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tarikh Perolehan">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxDateEdit ID="deTarikhPerolehan" runat="server" ClientInstanceName="deTarikhPerolehan" OnDateChanged="deTarikhPerolehan_DateChanged">
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tarikh Laporan">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxDateEdit ID="deTarikhLaporan" runat="server" ClientInstanceName="deTarikhLaporan" OnDateChanged="deTarikhLaporan_DateChanged">
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Status">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtStatus" runat="server" Width="170px" ClientInstanceName="txtStatus" OnTextChanged="txtStatus_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Jenis Aset Alih Stok">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtJenisAsetAlihStok" runat="server" Width="170px" ClientInstanceName="txtJenisAsetAlihStok" OnTextChanged="txtJenisAsetAlihStok_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="No Daftar Stok">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtNoDaftarStok" runat="server" Width="170px" ClientInstanceName="txtNoDaftarStok" OnTextChanged="txtNoDaftarStok_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Keterangan Stok">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtKeterangan" runat="server" Width="170px" ClientInstanceName="txtKeterangan" OnTextChanged="txtKeterangan_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Sub Kategori">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtSubKategori" runat="server" Width="170px" ClientInstanceName="txtSubKategori" OnTextChanged="txtSubKategori_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tarikh Beli">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxDateEdit ID="deTarikhBeli" runat="server" ClientInstanceName="deTarikhBeli" OnDateChanged="deTarikhBeli_DateChanged">
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Harga Perolehan Asal">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtHargaPerolehanAsal" runat="server" Width="170px" ClientInstanceName="txtHargaPerolehanAsal" OnTextChanged="txtHargaPerolehanAsal_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Kuantiti Kehilangan">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtKuantitiKehilangan" runat="server" Width="170px" ClientInstanceName="txtKuantitiKehilangan" OnTextChanged="txtKuantitiKehilangan_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Anggaran Nilai Semasa">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtAnggaranNilaiSemasa" runat="server" Width="170px" ClientInstanceName="txtAnggaranNilaiSemasa" OnTextChanged="txtAnggaranNilaiSemasa_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tempat Kehilangan">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtTempatKehilangan" runat="server" Width="170px" ClientInstanceName="txtTempatKehilangan" OnTextChanged="txtTempatKehilangan_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Punca Kehilangan">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtPuncaKehilangan" runat="server" Width="170px" ClientInstanceName="txtPuncaKehilangan" OnTextChanged="txtPuncaKehilangan_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Pegawai Yang Bertanggungjawab">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtPegawaiYangBertanggungjawab" runat="server" Width="170px" ClientInstanceName="txtPegawaiYangBertanggungjawab" OnTextChanged="txtPegawaiYangBertanggungjawab_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Jawatan Pegawai Yang Bertanggungjawab">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtJawatanPegawaiYangBertanggungjawab" runat="server" Width="170px" ClientInstanceName="txtJawatanPegawaiYangBertanggungjawab" OnTextChanged="txtJawatanPegawaiYangBertanggungjawab_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Taraf Jawatan">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtTarafJawatan" runat="server" Width="170px" ClientInstanceName="txtTarafJawatan" OnTextChanged="txtTarafJawatan_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="No Laporan Polis">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtNoLaporanPolis" runat="server" Width="170px" ClientInstanceName="txtNoLaporanPolis" OnTextChanged="txtNoLaporanPolis_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tarikh Laporan Polis">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxDateEdit ID="deTarikhLaporanPolis" runat="server" ClientInstanceName="deTarikhLaporanPolis" OnDateChanged="deTarikhLaporanPolis_DateChanged">
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Langkah - langkah Sedia Ada">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtLangkahLangkahSediaAda" runat="server" Width="170px" ClientInstanceName="txtLangkahLangkahSediaAda" OnTextChanged="txtLangkahLangkahSediaAda_TextChanged">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Langkah - langkah Pencegahan">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtLangkahLangkahPencegahan" runat="server" ClientInstanceName="txtLangkahLangkahPencegahan" OnTextChanged="txtLangkahLangkahPencegahan_TextChanged" Width="170px">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tindakan Keatas Pegawai Yang Bertanggungjawab">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtTindakanKepadaPegawaiYangBertanggungjawab" runat="server" ClientInstanceName="txtTindakanKepadaPegawaiYangBertanggungjawab" OnTextChanged="txtTindakanKepadaPegawaiYangBertanggungjawab_TextChanged" Width="170px">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Catatan">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtCatatan" runat="server" ClientInstanceName="txtCatatan" OnTextChanged="txtCatatan_TextChanged" Width="170px">
                                                    </dx:ASPxTextBox>
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
                        
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False" Width="15%" CssClass="MainFormSecondRowRightColumnAddTopPadding10px">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Rujukan">
                            <Items>
                                <dx:LayoutItem Caption="No. Rujukan">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" CssClass="Reference_ReferenceNumber">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Tarikh">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                            <dx:ASPxDateEdit ID="ASPxFormLayout1_E2" runat="server" CssClass="Reference_Date">
                                            </dx:ASPxDateEdit>
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




















<dx:ASPxCallbackPanel ID="cbpLaporanKehilangan" runat="server" ClientInstanceName="cbpLaporanKehilangan" ClientVisible="False" OnCallback="cbpLaporanKehilangan_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback= "function(s, e) {
	HideLoadingPanel();
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


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

<dx:ASPxTextBox ID="OpenFromMyTask" ClientInstanceName="OpenFromMyTask" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
 
<dx:ASPxLoadingPanel ID="LoadingPanel" ClientInstanceName="LoadingPanel" runat="server"></dx:ASPxLoadingPanel>










































