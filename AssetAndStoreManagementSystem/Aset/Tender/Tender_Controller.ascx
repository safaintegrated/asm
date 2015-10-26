<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tender_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Tender.Tender_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/Aset/Tender/Tab_Maklumat.ascx" TagPrefix="uc2" TagName="Tab_Maklumat" %>



<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<script>
    function TenderSelected(ProcessId) {
        TH_ProcessID.SetText(ProcessId.toString());
        LoadingPanel.SetText('Sistem sedang membuka maklumat Tender yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp.PerformCallback('LOAD');
    }

    function OnPageLoadEvents() {
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        EnableDisableScreen('false');
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
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'true');
        EnableDisableScreen('true');
    }

    function TambahClicked() {
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod Tender baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp.PerformCallback('ADD');
    }

    function SimpanClicked() {
        if (CheckHeaderBeforeSave() && CheckGridBeforeSave()) {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod Tender.  Sila tunggu sebentar..')
            LoadingPanel.Show();
            cbp.PerformCallback('SAVE');
        }
    }

    function HantarClicked()
    { }

    function PadamClicked() {
        popupDeleteHeaderConfirmation.Show();
    }

    function BatalCicked() {
        if (Ref_RefProcessId.GetText() == '') {
            cbp.PerformCallback('CANCEL')
        }
        else {
            LoadingPanel.SetText('Sistem sedang memuat semula rekod Tender yang terakhir disimpan.  Sila tunggu sebentar..')
            LoadingPanel.Show();
            cbp.PerformCallback('LOAD')
        }
    }

    function CetakClicked()
    { }

    function CarianClicked() {
        popupSearch.SetWidth(screen.width * 0.6);
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

    function CheckHeaderBeforeSave() {
        if (
                TH_NoTender.GetText() == '' ||
                TH_StartDate.GetText() == '' ||
                TH_EndDate.GetText() == '' ||
                TH_ReservedPrice.GetText() == '' ||
                TH_DocumentPrice.GetText() == '' ||
                TH_Address.GetText() == ''
            ) {
            popupMsg_Label.SetText('Semua medan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        else
            return true;
    }

    function CheckGridBeforeSave() {
        if (GridList.GetVisibleRowsOnPage() == 0) {
            popupMsg_Label.SetText('Sekurang-kurangnya 1 aset alih perlu dipilih.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        else
            return true;
    }

    function ProceedWithDeleteHeader() {
        LoadingPanel.SetText('Sistem sedang memadam rekod Tender yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp.PerformCallback('DELETE');
    }
</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Tawaran Tender" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Transfer.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
    <table style="width:100%; vertical-align:top; text-align:left">
        <tr>
            <td colspan="2"><dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
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
                    
                    <Items>
                        <dx:RibbonButtonItem Name="KEW.PA-24" Size="Large" Text="KEW.PA-24">
                            <LargeImage IconID="reports_report_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="KEW.PA-25" Size="Large" Text="KEW.PA-25">
                            <LargeImage IconID="reports_report_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="KEW.PA-26" Size="Large" Text="KEW.PA-26">
                            <LargeImage IconID="reports_report_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                    </Items>
                    
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
            <td style="width:80%; vertical-align:top; text-align:left; padding-top:10px;">
                <uc2:Tab_Maklumat runat="server" ID="Tab_Maklumat" />
            </td>
            <td style="width:20%; vertical-align:top; text-align:left; padding-top:10px;">
                 <dx:ASPxCallbackPanel ID="cbp_Ref" runat="server" ClientInstanceName="cbp_Ref" EnableCallbackAnimation="True" OnCallback="cbp_Ref_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
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
                                                         <dx:ASPxTextBox ID="Ref_RefNumber" runat="server" ClientEnabled="False" ClientInstanceName="Ref_RefNumber" CssClass="TextBoxForId" EnableClientSideAPI="True">
                                                         </dx:ASPxTextBox>
                                                     </dx:LayoutItemNestedControlContainer>
                                                 </LayoutItemNestedControlCollection>
                                             </dx:LayoutItem>
                                             <dx:LayoutItem Caption="Kemaskini Terakhir Oleh">
                                                 <LayoutItemNestedControlCollection>
                                                     <dx:LayoutItemNestedControlContainer runat="server">
                                                         <dx:ASPxTextBox ID="Ref_RefEmpName" runat="server" ClientEnabled="False" ClientInstanceName="Ref_RefEmpName" EnableClientSideAPI="True" Width="100%">
                                                         </dx:ASPxTextBox>
                                                     </dx:LayoutItemNestedControlContainer>
                                                 </LayoutItemNestedControlCollection>
                                             </dx:LayoutItem>
                                             <dx:LayoutItem Caption="Kemaskini Terakhir Pada">
                                                 <LayoutItemNestedControlCollection>
                                                     <dx:LayoutItemNestedControlContainer runat="server" CssClass="DateEditor">
                                                         <dx:ASPxDateEdit ID="Ref_RefDate" runat="server" ClientEnabled="False" ClientInstanceName="Ref_RefDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True">
                                                         </dx:ASPxDateEdit>
                                                     </dx:LayoutItemNestedControlContainer>
                                                 </LayoutItemNestedControlCollection>
                                             </dx:LayoutItem>
                                             <dx:LayoutItem ShowCaption="False">
                                                 <LayoutItemNestedControlCollection>
                                                     <dx:LayoutItemNestedControlContainer runat="server">
                                                         <dx:ASPxTextBox ID="Ref_RefProcessId" runat="server" ClientInstanceName="Ref_RefProcessId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
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
<dx:ASPxPopupControl ID="popupSearch" runat="server" AllowDragging="True" ClientInstanceName="popupSearch" EnableClientSideAPI="True" HeaderText="Carian Tender" MaxHeight="650px" MinHeight="450px" MinWidth="650px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>    
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            <dx:ASPxGridView ID="GridSearch" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSearch" DataSourceID="SearchDs" EnableCallbackAnimation="True" KeyFieldName="TH_ProcessID" OnCustomCallback="GridSearch_CustomCallback" Width="100%" OnHtmlDataCellPrepared="GridSearch_HtmlDataCellPrepared">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="TH_ProcessID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="No. Rujukan" FieldName="TH_RefNumber" ShowInCustomizationForm="True" VisibleIndex="1">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="No. Tender" FieldName="TH_NoTender" ShowInCustomizationForm="True" VisibleIndex="2">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                        </CellStyle>
                        <DataItemTemplate>
                            <dx:ASPxHyperLink ID="TH_NoTender" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                            </dx:ASPxHyperLink>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Tarikh Mula" FieldName="TH_StartDate" ShowInCustomizationForm="True" VisibleIndex="3" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                        </CellStyle>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn Caption="Tarikh Tamat" FieldName="TH_EndDate" ShowInCustomizationForm="True" VisibleIndex="4" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                        </CellStyle>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Harga Simpanan" FieldName="TH_ReservedPrice" ShowInCustomizationForm="True" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="n">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsLoadingPanel Mode="Disabled" ShowImage="False" />
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <Styles>
                    <AlternatingRow Enabled="True">
                    </AlternatingRow>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [TH_ProcessID], [TH_RefNumber], [TH_NoTender], [TH_StartDate], [TH_EndDate], [TH_ReservedPrice] FROM [Tender_Header] ORDER BY [TH_RefNumber]"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>


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





