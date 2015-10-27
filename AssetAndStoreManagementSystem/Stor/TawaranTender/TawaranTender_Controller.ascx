﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TawaranTender_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.TawaranTender.TawaranTender_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="Tab_KenyataanTawaranTenderPelupusan.ascx" tagname="Tab_KenyataanTawaranTenderPelupusan" tagprefix="uc1" %>
<%@ Register src="Tab_BorangTenderPelupusanAsetAlih.ascx" tagname="Tab_BorangTenderPelupusanAsetAlih" tagprefix="uc2" %>
<%@ Register src="Tab_JadualTenderPelupusanAsetAlih.ascx" tagname="Tab_JadualTenderPelupusanAsetAlih" tagprefix="uc3" %>


<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function TawaranTenderSelected(Id) {
        alert('1')
        LoadingPanel.SetText('Sistem sedang membuka maklumat Tawaran Tender.  Sila tunggu sebentar..');
        alert('2')
        LoadingPanel.Show();
        alert('3')
        txtTawaranTenderId.SetText(Id.toString());
        alert('4')
        //txtPemeriksaanId.SetText(R.toString());
        cbpTawaranTender.PerformCallback('LOAD');
        alert('5')
    }

    function SelectKenyataanTawaranTender()
    {
        LoadingPanel.SetText('Sistem sedang mendaftar Ali Lembaga Pemeriksa yang telah dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        alert('1');
        //cbp_LembagaPemeriksa.PerformCallback('ADDMEMBER')
        //alert('2');
    }

    function LookupPelupusan() {
        alert('A');
        popupSearchTawaranTender.SetWidth(screen.width * 0.85);
        alert('B');
        popupSearchTawaranTender.Show();
        alert('C');
        glSenaraiTawaranTender.PerformCallback();
        alert('D');
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
    { }

    function TambahClicked()
    {
        alert('1')
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
        alert('2')
        deTarikhBolehLihat.Focus();
        alert('3')
    }

    function SimpanClicked()
    {
        var v = CheckTawaranTender();
        if (v == true) {
            alert('1')
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat Tawaran Sebutharga.  Sila tunggu sebentar..');
            alert('2')
            LoadingPanel.Show();
            alert('3')
            cbpTawaranTender.PerformCallback('SAVE')
            alert('4')
        }
        else {
            alert('5');
        }
    }


    function CheckTawaranTender() {

        if (deTarikhBolehLihat.GetText() == '') {
            popupMsg_Label.SetText('Tarikh Boleh Lihat Sebutharga perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (deTarikhBolehLihatHingga.GetText() == '') {
            popupMsg_Label.SetText('Tarikh Boleh Lihat Hingga Sebutharga Stok perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (teJamBolehLihat.GetText() == '') {
            popupMsg_Label.SetText('No Sebutharga perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (teJamBolehLihatHingga.GetText() == '') {
            popupMsg_Label.SetText('Tarikh Tutup Sebutharga perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (deTenderAkanDitutupPada.GetText() == '') {
            popupMsg_Label.SetText('Tarikh Tutup Sebutharga perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        
        if (txtNoTender.GetText() == '') {
            popupMsg_Label.SetText('Tarikh Tutup Sebutharga perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

        if (txtPetiAlamatTender.GetText() == '') {
            popupMsg_Label.SetText('Tarikh Tutup Sebutharga perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        
        //alert('good');

        return true;

    }
    function HideLoadingPanel() {
        LoadingPanel.Hide();
       // popupMsg_Label.SetText('Rekod Telah Berjaya Disimpan.');
       // popupMsg.Show();
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
        alert('1');
        popupSearch.SetWidth(screen.width * 0.85);
        alert('2');
        popupSearch.Show();
        alert('3');
        GridSearch.PerformCallback();
        alert('4');
    }

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


</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Tawaran Tender" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/PemeriksaanStok.png">
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
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False" Width="80%" CssClass="MainFormSecondRowLeftColumnAddTopPadding">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" AccessibilityCompliant="True" ActiveTabIndex="0" Width="100%" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged">
                            <TabPages>
                                <%--<dx:TabPage Text="Arahan Kepada Lembaga Pemeriksaan">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                           
                                            <uc4:Tab_ArahanKepadaLembagaPemeriksaan ID="Tab_ArahanKepadaLembagaPemeriksaan1" runat="server" />
                                           
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>--%>
                                <dx:TabPage Text="Kenyataan Tawaran Tender Pelupusan">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            
                                            <uc1:Tab_KenyataanTawaranTenderPelupusan ID="Tab_KenyataanTawaranTenderPelupusan" runat="server" />
                                            
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Borang Tender Pelupusan Aset Alih">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            
                                            <uc2:Tab_BorangTenderPelupusanAsetAlih ID="Tab_BorangTenderPelupusanAsetAlih" runat="server" />
                                            
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Jadual Tender Pelupusan Aset Alih">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                           
                                            <uc3:Tab_JadualTenderPelupusanAsetAlih ID="Tab_JadualTenderPelupusanAsetAlih" runat="server" />
                                           
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>
                        
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False" Width="20%"  CssClass="MainFormSecondRowRightColumnAddTopPadding">
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
                                <dx:LayoutItem Caption="Status">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server" CssClass="Reference_Status">
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
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
        <Paddings Padding="0px" />
        <Border BorderStyle="None" />
    </dx:ASPxFormLayout>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>



<dx:ASPxTextBox ID="OpenFromMyTask" ClientInstanceName="OpenFromMyTask" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
 

<dx:ASPxPopupControl ID="popupSearch" runat="server" AllowDragging="True" ClientInstanceName="popupSearch" EnableClientSideAPI="True" HeaderText="Carian Tawaran Tender" MaxHeight="550px" MinHeight="450px" MinWidth="650px" Modal="True" CloseAnimationType="Fade" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxGridView ID="GridSearch" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSearch" DataSourceID="SearchDs" EnableCallbackAnimation="True" Width="100%" OnHtmlDataCellPrepared="GridSearch_HtmlDataCellPrepared" OnCustomCallback="GridSearch_CustomCallback" KeyFieldName="TawaranTenderId"> 
        <Columns>
		
	    <dx:GridViewDataTextColumn FieldName="NoTender" ShowInCustomizationForm="True" VisibleIndex="0" Caption="No Tender">
            
		<DataItemTemplate>
                     <dx:ASPxHyperLink ID="NoTender" runat="server" EnableClientSideAPI="true" Text="ASPxHyperLink">
                     </dx:ASPxHyperLink>
                 </DataItemTemplate>
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                 </CellStyle>

            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="TarikhLihatPada" ShowInCustomizationForm="True" VisibleIndex="3" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
	    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="TarikhLihatHingga" ShowInCustomizationForm="True" VisibleIndex="4" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>

        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsLoadingPanel Mode="Disabled" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SELECT [TawaranTenderId],[NoTender],[TarikhLihatPada], [TarikhLihatHingga] FROM [KenyataanTawaranTender] ORDER BY [NoTender]"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>










































































        








 
<dx:ASPxLoadingPanel ID="LoadingPanel" ClientInstanceName="LoadingPanel" runat="server"></dx:ASPxLoadingPanel>












































































        








 