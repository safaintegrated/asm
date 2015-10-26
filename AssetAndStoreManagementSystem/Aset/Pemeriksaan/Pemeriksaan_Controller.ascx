<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pemeriksaan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pemeriksaan.Pemeriksaan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="Tab_Pemeriksaan_Controller.ascx" tagname="Tab_Pemeriksaan_Controller" tagprefix="uc1" %>
<%@ Register src="Tab_HasilPemeriksaan_Controller.ascx" tagname="Tab_HasilPemeriksaan_Controller" tagprefix="uc2" %>
<%@ Register src="Tab_AliranKerja.ascx" tagname="Tab_AliranKerja" tagprefix="uc3" %>



<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function RefreshReferenceSection()
    {
        Ref_RowId.SetText(PEMH_RowId.GetText());
        cbp_Ref.PerformCallback();
    }

    function PemeriksaanSelected(R)
    {
        LoadingPanel.SetText('Sistem sedang membuka maklumat Pemeriksaan Aset.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        PEMH_RowId.SetText(R.toString());
        cbp_TabPemeriksaan.PerformCallback('LOAD');
       
    }

    function OnPageLoadEvents()
    {
        PageControl.SetActiveTabIndex(0);
        PageControl.SetVisible(true);

        var HasilPemeriksaan = PageControl.GetTab(1);
        HasilPemeriksaan.SetVisible(false);

        var AliranKerjaTab = PageControl.GetTab(2);
        AliranKerjaTab.SetVisible(false);

        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        EnableDisablePemeriksaanTab('false');
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
        EnableDisablePemeriksaanTab('true');
    }

    function TambahClicked()
    {
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod Tender baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        /*PEMH_RowId.SetText('');
        PEMH_Status.SetText('2');
        EnableDisablePemeriksaanTab('true');
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
        PEMH_Name.Focus();*/
        cbp_TabPemeriksaan.PerformCallback('ADD');
    }

    function SimpanClicked()
    {
        if (CheckPemeriksaanForm())
        {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod pemeriksaan.  Sila tunggu..');
            LoadingPanel.Show();
            cbp_TabPemeriksaan.PerformCallback('SAVE');
        }
    }

    function HantarClicked()
    {
        if (CheckPemeriksaanForm() && CheckAssetInvList())
        {
            LoadingPanel.SetText('Sistem sedang menghantar rekod pemeriksaan.  Sila tunggu..');
            LoadingPanel.Show();
            cbp_TabPemeriksaan.PerformCallback('POST');
        }
    }

    function PadamClicked()
    {
        popupDeleteHeaderConfirmation.Show();
    }

    function ProceedWithDeleteHeader() {
        LoadingPanel.SetText('Sistem sedang memadam rekod Tender yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_TabPemeriksaan.PerformCallback('DELETE');
    }

    function BatalCicked() {
        if (Ref_RowId.GetText() == '') {
            cbp_TabPemeriksaan.PerformCallback('CANCEL')
        }
        else {
            LoadingPanel.SetText('Sistem sedang memuat semula rekod pemeriksaan yang terakhir disimpan.  Sila tunggu sebentar..')
            LoadingPanel.Show();
            cbp_TabPemeriksaan.PerformCallback('LOAD')
        }
    }

    function CetakClicked()
    { }

    function CarianClicked()
    {
        popupSearch.SetWidth(screen.width * 0.85);
        popupSearch.Show();
        GridSearch.PerformCallback();
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
</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Pemeriksaan" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Inspection.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td colspan="2" style="width:100%; vertical-align:top; text-align:left;">
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
            <td style="width:80%; vertical-align:top; text-align:left; padding-top:10px;">
                <dx:ASPxPageControl ID="PageControl" runat="server" ActiveTabIndex="0" Width="100%" ClientInstanceName="PageControl" EnableClientSideAPI="True">
                    <TabPages>
                        <dx:TabPage Text="Pemeriksaan">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc1:Tab_Pemeriksaan_Controller ID="Tab_Pemeriksaan_Controller1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Hasil Pemeriksaan">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc2:Tab_HasilPemeriksaan_Controller ID="Tab_HasilPemeriksaan_Controller1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Aliran Kerja">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc3:Tab_AliranKerja ID="Tab_AliranKerja1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>
                </dx:ASPxPageControl>
            </td>
            <td style="width:20%; vertical-align:top; text-align:left; padding-top:46px;">
                <dx:ASPxCallbackPanel ID="cbp_Ref" runat="server" ClientInstanceName="cbp_Ref" OnCallback="cbp_Ref_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                <Items>
                                    <dx:LayoutGroup Caption="Rujukan">
                                        <Items>
                                            <dx:LayoutItem Caption="No. Rujukan">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_RefNumber" runat="server" ClientEnabled="False" ClientInstanceName="Ref_RefNumber" EnableClientSideAPI="True">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Kemaskini Terakhir">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="Ref_LastModDate" runat="server" ClientEnabled="False" ClientInstanceName="Ref_LastModDate" DisplayFormatString="dd/MM/yyyy" EnableClientSideAPI="True">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Status">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_Status" runat="server" ClientEnabled="False" ClientInstanceName="Ref_Status" EnableClientSideAPI="True">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_RowId" runat="server" ClientInstanceName="Ref_RowId" ClientVisible="False" Width="170px">
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
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>
 
<dx:ASPxTextBox ID="OpenFromMyTask" ClientInstanceName="OpenFromMyTask" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
 
<dx:ASPxLoadingPanel ID="LoadingPanel" ClientInstanceName="LoadingPanel" runat="server"></dx:ASPxLoadingPanel>

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

<dx:ASPxPopupControl ID="popupSearch" runat="server" AllowDragging="True" ClientInstanceName="popupSearch" EnableClientSideAPI="True" HeaderText="Carian Pemeriksaan" MaxHeight="550px" MinHeight="450px" MinWidth="650px" Modal="True" CloseAnimationType="Fade" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxGridView ID="GridSearch" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSearch" DataSourceID="SearchDs" EnableCallbackAnimation="True" KeyFieldName="PEMH_RowId" Width="100%" OnCustomCallback="GridSearch_CustomCallback" OnHtmlDataCellPrepared="GridSearch_HtmlDataCellPrepared">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="PEMH_RowId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Rujukan" FieldName="PEMH_RefNumber" ShowInCustomizationForm="True" VisibleIndex="1" Width="10%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama Pemeriksaan" FieldName="PEMH_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="23%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="PEMH_Name" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tarikh Mula" FieldName="PEMH_StartDate" ShowInCustomizationForm="True" VisibleIndex="3" Width="8%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Tarikh Tamat" FieldName="PEMH_EndDate" ShowInCustomizationForm="True" VisibleIndex="4" Width="8%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Lembaga Pemeriksa" FieldName="PEMH_LembagaPemeriksaUniqueId" ShowInCustomizationForm="True" VisibleIndex="5" Width="19%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Jumlah Aset" FieldName="TotalAssetInv" ShowInCustomizationForm="True" VisibleIndex="6" Width="7%" ReadOnly="True" PropertiesTextEdit-DisplayFormatString="n0">
<PropertiesTextEdit DisplayFormatString="n0"></PropertiesTextEdit>

                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>   
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status" FieldName="PEMH_Status" ShowInCustomizationForm="True" VisibleIndex="7" Width="17%" ReadOnly="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tarikh Dihantar" FieldName="PEMH_PostDate" ShowInCustomizationForm="True" VisibleIndex="8" Width="8%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                
            </dx:GridViewDataDateColumn>
        </Columns>
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SELECT [PEMH_RowId], [PEMH_RefNumber], [PEMH_Name], [PEMH_StartDate], [PEMH_EndDate], [PEMH_LembagaPemeriksaUniqueId], [TotalAssetInv], [PEMH_Status], [PEMH_PostDate] FROM [V_Pemeriksaan_Header] ORDER BY [PEMH_PostDate] DESC"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<dx:ASPxPopupControl ID="popupDeleteHeaderConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteHeaderConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol4" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupDeleteHeaderConfirmation_Label" runat="server" ClientInstanceName="popupDeleteHeaderConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:15%"></td>
                        <td style="width:35%; text-align:right; vertical-align:middle; padding-right:6px;">
                            <dx:aspxbutton ID="popupDeleteHeaderConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteHeaderConfirmation_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	ProceedWithDeleteHeader();
}" />
                            </dx:aspxbutton>
                        </td>
                         <td style="width:35%; text-align:left; vertical-align:middle; padding-left:6px;">
                            <dx:aspxbutton ID="popupDeleteHeaderConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteHeaderConfirmation_BtnCancel" Text="Batal" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupDeleteHeaderConfirmation.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:15%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>





