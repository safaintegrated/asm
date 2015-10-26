<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pembekal_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Pembekal.Pembekal_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../SharedControls/Lookup_Vendor/LookupVendor_Controller.ascx" tagname="LookupVendor_Controller" tagprefix="uc1" %>

<%@ Register src="../../SharedControls/Lookup_KodBidang/Lookup_KodBidang_Controller.ascx" tagname="Lookup_KodBidang_Controller" tagprefix="uc2" %>

<%@ Register src="AuditTrail_Controller.ascx" tagname="AuditTrail_Controller" tagprefix="uc3" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />


<script>
    function OnPageLoad() {
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        ManageMainRibbonUtamaTab('false', 'false', 'false', 'false', 'false', 'false', 'true', 'false', 'true', 'true');
    }

    function cbp_Report_EndCallback(s, e) {
        PopupPrint.SetWidth(screen.width * 0.8);
        PopupPrint.SetHeight(screen.width * 0.45);
        PopupPrint.SetContentUrl('../../Report/Index.aspx');
        PopupPrint.Show();
    }

    function DeleteCode(Codex)
    {
        tmpCode.SetText(Codex.toString());
        cbp_PopupVendor.PerformCallback('REMOVECODE');
    }

    function DisableSagaFields()
    {
        apsu_suppid.SetEnabled(false);
        apsu_lname.SetEnabled(false);
        CombinedAddress.SetEnabled(false);
        apsu_phone.SetEnabled(false);
        apsu_fax.SetEnabled(false);
        apsu_contact.SetEnabled(false);
        apsu_vatregno.SetEnabled(false);
    }

    function ViewVendor(Idx)
    {
        apsu_suppid.SetText(Idx.toString());
        LoadingPanel.SetText('Sistem sedang membuka maklumat pembekal yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_PopupVendor.PerformCallback('LOAD');
    }

    function cbp_PopupVendor_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'LOAD')
            {
                ManagePopupToolbar(true, false, false, false);
                Form_PopupVendor.SetEnabled(false);
                PopupVendor.SetWidth(screen.width * 0.8);
                PopupVendor.Show();
            }
            else if (s.cpMode.toString() == 'ADDCODE')
            {
                Popup_LookupKodBidang.Hide();
                DisableSagaFields();
            }
            else if (s.cpMode.toString() == 'REMOVECODE')
                DisableSagaFields();
            else
            {
                PopupVendor.Hide();
                popupMsg_Label.SetText('Maklumat pembekal berjaya dikemaskini');
                popupMsg.Show();
                MainGrid.PerformCallback();
            }
        }
    }

    function Toolbar_popupManagement_ItemClick(s, e) {
        switch (e.item.name) {
            case 'btnEdit': EditMode(); break;
            case 'btnSave': SaveMode(); break;
            case 'btnKodBidang': KodBidangMode(); break;
            case 'btnCancel': CancelMode(); break;
        }
    }

    function ManagePopupToolbar(btnEdit, btnSave, btnKodBidang, btnCancel)
    {
        Toolbar_popupManagement.GetItemByName('btnEdit').SetEnabled(btnEdit);
        Toolbar_popupManagement.GetItemByName('btnSave').SetEnabled(btnSave);
        Toolbar_popupManagement.GetItemByName('btnKodBidang').SetEnabled(btnKodBidang);
        Toolbar_popupManagement.GetItemByName('btnCancel').SetEnabled(btnCancel);
    }

    function EditMode() {
        ManagePopupToolbar(false, true, true, true);
        Form_PopupVendor.SetEnabled(true);
        DisableSagaFields();
    }

    function SaveMode() {
       
        LoadingPanel.SetText('Sistem sedang menyimpan maklumat Pembekal.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_PopupVendor.PerformCallback('SAVE');
        
    }

    function CancelMode()
    { PopupVendor.Hide(); }

    function KodBidangMode()
    {
        GridLookupKodBidang.PerformCallback();
        Popup_LookupKodBidang.Show();
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

    function CetakClicked()
    { cbp_Report.PerformCallback(); }

    function AuditClicked() {
        GridAuditListing.PerformCallback();
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

    function AuditDetailSelected(ProcessId) {
        GridAuditHeaderDetails.PerformCallback(ProcessId);
    }

</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Pembekal" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Pembekal.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%;">
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
                        <dx:RibbonButtonItem Name="Impot" Size="Large" Text="Impot">
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
            <td style="padding-top:10px;">
                <dx:ASPxGridView ID="MainGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="MainGrid" DataSourceID="SqlDataSource1" KeyFieldName="apsu_suppid" OnCustomCallback="MainGrid_CustomCallback" Width="100%" OnHtmlDataCellPrepared="MainGrid_HtmlDataCellPrepared">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="ID Pembekal" FieldName="apsu_suppid" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                            <DataItemTemplate>
                                <dx:ASPxHyperLink ID="apsu_suppid" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                                </dx:ASPxHyperLink>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Nama Pembekal" FieldName="apsu_lname" ShowInCustomizationForm="True" VisibleIndex="1">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Telefon" FieldName="apsu_phone" ShowInCustomizationForm="True" VisibleIndex="2">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Fax" FieldName="apsu_fax" ShowInCustomizationForm="True" VisibleIndex="3">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Emel" FieldName="apsu_email" ShowInCustomizationForm="True" VisibleIndex="4">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Wakil" FieldName="apsu_contact" ShowInCustomizationForm="True" VisibleIndex="5">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="No. Pend. GST" FieldName="apsu_vatregno" ShowInCustomizationForm="True" VisibleIndex="6">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Kod Bidang" FieldName="KodBidang" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager PageSize="30">
                    </SettingsPager>
                    <Settings ShowFilterRow="True" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <Styles>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" SelectCommand="SELECT [apsu_suppid], [apsu_lname], [apsu_phone], [apsu_fax], [apsu_email], [apsu_contact], [apsu_vatregno], [KodBidang] FROM [V_AP_Supplier] ORDER BY [apsu_suppid]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
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



<uc3:AuditTrail_Controller ID="AuditTrail_Controller1" runat="server" />




<dx:ASPxPopupControl ID="PopupVendor" runat="server" AllowDragging="True" ClientInstanceName="PopupVendor" CloseAction="CloseButton" HeaderText="Pengurusan Pembekal" MaxHeight="700px" MinWidth="800px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto" ShowPageScrollbarWhenModal="True">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table style="width:100%; vertical-align:top; text-align:left">
        <tr>
            <td>
                <dx:ASPxMenu ID="Toolbar_popupManagement" runat="server" ClientInstanceName="Toolbar_popupManagement" EnableClientSideAPI="True" Width="100%">
                    <ClientSideEvents ItemClick="function(s, e) {
	Toolbar_popupManagement_ItemClick(s, e);
}" />
                    <Items>
                        <dx:MenuItem Name="btnEdit" Text="Kemaskini">
                            <Image IconID="edit_edit_16x16">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnSave" Text="Simpan">
                            <Image IconID="save_save_16x16">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnKodBidang" Text="Kod Bidang">
                            <Image IconID="find_find_16x16">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnCancel" Text="Batal">
                            <Image IconID="actions_cancel_16x16">
                            </Image>
                        </dx:MenuItem>
                    </Items>
                </dx:ASPxMenu>
            </td>
        </tr>
         <tr>
            <td style="padding-top:10px">
                <dx:ASPxCallbackPanel ID="cbp_PopupVendor" runat="server" ClientInstanceName="cbp_PopupVendor" OnCallback="cbp_PopupVendor_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
cbp_PopupVendor_EndCallback(s, e);	
}" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="Form_PopupVendor" runat="server" ColCount="2" Width="100%" ClientInstanceName="Form_PopupVendor">
                                <Items>
                                    <dx:LayoutGroup Caption="Maklumat Pembekal" Width="50%">
                                        <Items>
                                            <dx:LayoutItem Caption="ID Pembekal" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="apsu_suppid" runat="server" ClientInstanceName="apsu_suppid" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Nama Pembekal">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="apsu_lname" runat="server" ClientInstanceName="apsu_lname" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Alamat">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxMemo ID="CombinedAddress" runat="server" ClientInstanceName="CombinedAddress" EnableClientSideAPI="True" Height="71px" Width="100%">
                                                        </dx:ASPxMemo>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Telefon">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="apsu_phone" ClientInstanceName="apsu_phone" runat="server" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Faks">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="apsu_fax" ClientInstanceName="apsu_fax" runat="server" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Wakil Syarikat">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="apsu_contact" ClientInstanceName="apsu_contact" runat="server" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="No. Pendaftaran GST">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="apsu_vatregno" ClientInstanceName="apsu_vatregno" EnableClientSideAPI="True" runat="server" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Maklumat Kod Bidang" ColCount="3">
                                        <Items>
                                            <dx:LayoutItem Caption="No. Sijil" Width="33%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="CertNumber" ClientInstanceName="CertNumber" runat="server" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="No. Rujukan" Width="33%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="RegReference" ClientInstanceName="RegReference" runat="server" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Syarikat Bumiputra" Width="34%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxCheckBox ID="BumiStatus" runat="server" CheckState="Unchecked" ClientInstanceName="BumiStatus" EnableClientSideAPI="True">
                                                        </dx:ASPxCheckBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Tarikh Mula" Width="33%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="StartDate" ClientInstanceName="StartDate" runat="server" EnableClientSideAPI="True" Width="100%" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Tarikh Tamat" Width="33%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="EndDate" runat="server" ClientInstanceName="EndDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Senarai Kod Bidang" ColSpan="3" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="GridKodBidang" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridKodBidang" OnHtmlDataCellPrepared="GridKodBidang_HtmlDataCellPrepared" Width="100%">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="SetVen_SAGACode" FieldName="SetVen_SAGACode" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="Item" ShowInCustomizationForm="True" VisibleIndex="2" Width="80%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Kod Bidang" FieldName="ItemCode" ShowInCustomizationForm="True" VisibleIndex="1" Width="12%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Padam" FieldName="ItemCode" ShowInCustomizationForm="True" VisibleIndex="3" Width="8%">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxHyperLink ID="ItemCode" runat="server" EnableClientSideAPI="true" ImageUrl="~/Public/Images/GridIcons/GridDelete.png" Text="ASPxHyperLink">
                                                                        </dx:ASPxHyperLink>
                                                                    </DataItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
                                                            <Styles>
                                                                <AlternatingRow Enabled="True">
                                                                </AlternatingRow>
                                                            </Styles>
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
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
             </td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxPopupControl ID="Popup_LookupKodBidang" runat="server" AllowDragging="True" ClientInstanceName="Popup_LookupKodBidang" EnableClientSideAPI="True" HeaderText="Carian Kod Bidang" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="1000px">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <FooterTemplate>
        <div style="width:100%; vertical-align:top; text-align:center; padding-top:8px; padding-bottom:8px;">
            <dx:ASPxButton ID="SelectButton" ClientInstanceName="SelectButton" AutoPostBack="False" runat="server" Text="Ok" Theme="SoftOrange" EnableClientSideAPI="True" Width="100px">
                <ClientSideEvents Click="function(s, e) {
	cbp_PopupVendor.PerformCallback('ADDCODE');
}" />
            </dx:ASPxButton>
        </div>
    </FooterTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxGridView ID="GridLookupKodBidang" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridLookupKodBidang" DataSourceID="KodBidangDs" KeyFieldName="ItemCode" Width="100%" OnAfterPerformCallback="GridLookupKodBidang_AfterPerformCallback" OnCustomCallback="GridLookupKodBidang_CustomCallback">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Cat" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Kategori" Width="30%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SubCat" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Sub-Kategori" Width="30%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="Item" ShowInCustomizationForm="True" VisibleIndex="3" Width="25%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kod" FieldName="ItemCode" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="Pilih" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0" Width="5%">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowSelectByRowClick="True" AutoExpandAllGroups="True" />
        <Settings GroupFormat="{1} {2}" ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="KodBidangDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [MasterKodBidang] ORDER BY [Cat], [SubCat], [Item]"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>



<dx:ASPxTextBox ID="tmpCode" runat="server" ClientInstanceName="tmpCode" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
</dx:ASPxTextBox>




<dx:ASPxCallbackPanel ID="cbp_Report" runat="server" ClientInstanceName="cbp_Report" ClientVisible="False" OnCallback="cbp_Report_Callback" Width="200px" ShowLoadingPanel="False" ShowLoadingPanelImage="False">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Report_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>

<dx:ASPxPopupControl ID="PopupPrint" runat="server" AllowDragging="True" ClientInstanceName="PopupPrint" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Cetakan Senarai Pembekal" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowResize="True">
    <ClientSideEvents Closing="function(s, e) {
PopupPrint.SetContentUrl('about:blank');	
}" />
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server"></dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<dx:ASPxTextBox ID="EnableCreate" ClientInstanceName="EnableCreate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableUpdate" ClientInstanceName="EnableUpdate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableDelete" ClientInstanceName="EnableDelete" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
