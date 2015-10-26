<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Buletin_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Buletin.Buletin_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<script>
    function ViewAuditDetails(Pidx)
    {
        Pid.SetText(Pidx.toString());
        GridAuditHeaderDetails.PerformCallback();
    }

    function PrepareToUpload() {
        popupUploadImage.Show();
    }

    function ViewBuletin(Idx)
    {
        BLT_Id.SetText(Idx.toString());
        LoadingPanel.SetText('Sistem sedang membuka maklumat buletin yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupManagement.PerformCallback('LOAD');
    }

    function ProceedWithDelete()
    {
        LoadingPanel.SetText('Sistem sedang memadam rekod buletin yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupManagement.PerformCallback('DELETE');
    }

    function ImageUploader_FileUploadComplete(s, e)
    {
        if (e.isValid) {
            if (s.cpErrMsg.toString() == '')
            {
                popupUploadImage.Hide();
                BLT_Image.SetText(s.cppopupAttachImage_SystemFileName.toString());
                cbp_popupManagement.PerformCallback("LOADIMAGE");
            }
            else {
                popupMsg_Label.SetText(s.cpErrMsg.toString());
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
            }
        }
        else {
            popupInvalidAttachment.Show();
        }
    }

    function cbp_popupManagement_EndCallback(s, e) {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else {
            if (s.cpMode.toString() == 'ADD') {
                ManagePopupToolbar(false, true, false, true);
                popupManagement.SetWidth(screen.width * 0.7);
                Form_popupManagement.SetEnabled(true);
                popupManagement.Show();
            }
            else if (s.cpMode.toString() == 'SAVE') {
                popupManagement.Hide();
                MainGrid.PerformCallback();
                popupMsg_Label.SetText('Rekod Buletin telah disimpan dengan jayanya.');
                popupMsg.Show();
            }
            else if (s.cpMode.toString() == 'DELETE')
            {
                popupManagement.Hide();
                popupDeleteConfirmation.Hide();
                MainGrid.PerformCallback();
                popupMsg_Label.SetText('Rekod Buletin telah dipadam dengan jayanya.');
                popupMsg.Show();
            }
            else if (s.cpMode.toString() == 'LOAD') {
                ManagePopupToolbar(true, false, false, false);
                Form_popupManagement.SetEnabled(false);
                popupManagement.SetWidth(screen.width * 0.7);
                popupManagement.Show();
            }

        }
    }

    function ManagePopupToolbar(btnEdit, btnSave, btnDelete, btnCancel) {
        Toolbar_popupManagement.GetItemByName('btnEdit').SetEnabled(btnEdit);
        Toolbar_popupManagement.GetItemByName('btnSave').SetEnabled(btnSave);
        Toolbar_popupManagement.GetItemByName('btnDelete').SetEnabled(btnDelete);
        Toolbar_popupManagement.GetItemByName('btnCancel').SetEnabled(btnCancel);
    }

    function OnPageLoad() {
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'false', 'true', 'true');
        OnLoadManagePopupToolbar();
    }

    function OnLoadManagePopupToolbar() {
        if (EnableUpdate.GetText() == 'True')
            Toolbar_popupManagement.GetItemByName("btnEdit").SetVisible(true);
        else
            Toolbar_popupManagement.GetItemByName("btnEdit").SetVisible(false);


        if (EnableCreate.GetText() == 'True')
            Toolbar_popupManagement.GetItemByName("btnSave").SetVisible(true);
        else
            Toolbar_popupManagement.GetItemByName("btnSave").SetVisible(false);


        if (EnableDelete.GetText() == 'True')
            Toolbar_popupManagement.GetItemByName("btnDelete").SetVisible(true);
        else
            Toolbar_popupManagement.GetItemByName("btnDelete").SetVisible(false);

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

    function AuditClicked()
    {
        PopupAuditTrail.SetWidth(screen.width * 0.85);
        PopupAuditTrail.Show();
        GridAuditListing.PerformCallback();
    }

    function TutupClicked()
    {
        window.close();
    }

    function CetakClicked()
    {
        cbp_Report.PerformCallback();
    }

    function KemaskiniClicked()
    {
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'true');
        MainForm.SetEnabled(true);
    }

    function PadamClicked()
    {
        popupDeleteConfirmation.Show();
    }

    function BatalCicked()
    {
    }

    function TambahClicked()
    {
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod buletin baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupManagement.PerformCallback("ADD");
    }

    function CarianClicked()
    {
       
    }

    function SimpanClicked()
    {
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

    function Toolbar_popupManagement_ItemClick(s, e) {
        switch (e.item.name) {
            case 'btnEdit': EditMode(); break;
            case 'btnSave': SaveMode(); break;
            case 'btnDelete': DeleteMode(); break;
            case 'btnCancel': CancelMode(); break;
        }
    }

    function CancelMode() {
        popupManagement.Hide();
    }

    function EditMode() {
        ManagePopupToolbar(false, true, true, true);
        Form_popupManagement.SetEnabled(true);
    }

    function SaveMode() {
        if (BLT_StartDate.GetText() == '' || BLT_EndDate.GetText() == '' || BLT_Title.GetText() == '' || BLT_Content.GetText() == '') {
            popupMsg_Label.SetText('Tajuk, Kandungan, Tarikh Mula an Tarikh Tamat perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
        }
        else {
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat Buletin.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_popupManagement.PerformCallback('SAVE');
        }
    }

    function DeleteMode()
    {
        popupDeleteConfirmation.Show();
    }

    function cbp_Report_EndCallback(s, e) {
        PopupPrint.SetWidth(screen.width * 0.8);
        PopupPrint.SetHeight(screen.width * 0.45);
        PopupPrint.SetContentUrl('../../Report/Index.aspx');
        PopupPrint.Show();
    }

</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Buletin" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Buletin.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
               <dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%" AllowMinimize="False">
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
                        <dx:RibbonButtonItem Name="KEW.PA-1" Size="Large" Text="KEW.PA-1">
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
</dx:ASPxRibbon>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <dx:ASPxGridView ID="MainGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="MainGrid" DataSourceID="SqlDataSource1" KeyFieldName="BLT_Id" OnCustomCallback="MainGrid_CustomCallback" OnHtmlDataCellPrepared="MainGrid_HtmlDataCellPrepared" Width="100%">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="BLT_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Tajuk" FieldName="BLT_Title" ShowInCustomizationForm="True" VisibleIndex="1" Width="80%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                            <DataItemTemplate>
                                <dx:ASPxHyperLink ID="BLT_Title" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                                </dx:ASPxHyperLink>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Mula" FieldName="BLT_StartDate" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Equals" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn Caption="Tamat" FieldName="BLT_EndDate" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Equals" />
                        </dx:GridViewDataDateColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <Styles>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [BLT_Id], [BLT_Title], [BLT_StartDate], [BLT_EndDate] FROM [Buletin] ORDER BY [BLT_Title]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>





<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px">
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





<dx:ASPxPopupControl ID="popupUploadImage" runat="server" ClientInstanceName="popupUploadImage" EnableClientSideAPI="True" HeaderText="Muatnaik imej buletin" Width="500px" AllowDragging="True" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxUploadControl ID="ImageUploader" runat="server" ClientInstanceName="ImageUploader" ShowProgressPanel="True" UploadMode="Auto" Width="100%" OnFileUploadComplete="ImageUploader_FileUploadComplete" ShowClearFileSelectionButton="False">
        <ValidationSettings AllowedFileExtensions=".pdf, .gif, .jpg, .jpeg, .bmp, .png, .gif" GeneralErrorText="Sistem telah menghadapi masalah teknikal untuk memuatnaik imej" MaxFileSize="4194304" MaxFileSizeErrorText="Saiz fail yang dipilih melebihi saiz 4Mb.  Sila pilih fail yang lain." MultiSelectionErrorText="Saiz fail-fail yang dipilih melebihi saiz 4Mb.  Sila pilih fail yang lain." NotAllowedFileExtensionErrorText="Jenis fail yang dipilih tidak sah.  Sila pilih fail yang lain.">
        </ValidationSettings>
        <ClientSideEvents TextChanged="function(s, e) {
	ImageUploader.Upload();
}" FileUploadComplete="function(s, e) {
	ImageUploader_FileUploadComplete(s, e);
}" />
        <BrowseButton Text="Pilih Imej..">
        </BrowseButton>
        <AdvancedModeSettings>
            <FileListItemStyle CssClass="pending dxucFileListItem">
            </FileListItemStyle>
        </AdvancedModeSettings>
    </dx:ASPxUploadControl>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>







<dx:ASPxPopupControl ID="popupInvalidAttachment" runat="server" ClientInstanceName="popupInvalidAttachment" CloseAnimationType="Fade" EnableClientSideAPI="True" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px" HeaderText="Muatnaik gambar gagal">
    <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="width:100%; vertical-align:top; text-align:center;">
                
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Gambar yang dimuatnaik mempunyai jenis fail yang tidak dibenarkan atau bersaiz lebih daripada 4Mb." EncodeHtml="False">
                </dx:ASPxLabel>
                
            </td>
        </tr>
        <tr>
            <td style="width:100%; vertical-align:top; text-align:left; padding-top:10px;"><div style="width:120px; text-align:center; margin-left:auto; margin-right:auto;">
                <dx:ASPxButton ID="ASPxButton16" runat="server" Text="Ok" Width="100%" AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {
popupInvalidAttachment.Hide();	
}" />
                </dx:ASPxButton>
                </div></td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>













<dx:ASPxPopupControl ID="popupDeleteConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol4" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupDeleteConfirmation_Label" runat="server" ClientInstanceName="popupDeleteConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:15%"></td>
                        <td style="width:35%; text-align:right; vertical-align:middle; padding-right:6px;">
                            <dx:aspxbutton ID="popupDeleteConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteConfirmation_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	ProceedWithDelete();
}" />
                            </dx:aspxbutton>
                        </td>
                         <td style="width:35%; text-align:left; vertical-align:middle; padding-left:6px;">
                            <dx:aspxbutton ID="popupDeleteConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteConfirmation_BtnCancel" Text="Batal" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupDeleteConfirmation.Hide();
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

<dx:ASPxCallbackPanel ID="cbp_Report" runat="server" ClientInstanceName="cbp_Report" ClientVisible="False" OnCallback="cbp_Report_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Report_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>

<dx:ASPxTextBox ID="EnableCreate" ClientInstanceName="EnableCreate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableUpdate" ClientInstanceName="EnableUpdate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableDelete" ClientInstanceName="EnableDelete" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
















<dx:ASPxPopupControl ID="popupManagement" runat="server" ClientInstanceName="popupManagement" EnableClientSideAPI="True" HeaderText="Pengurusan Buletin" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="True" MinWidth="900px" AllowDragging="True" MaxHeight="600px" ScrollBars="Auto" ShowPageScrollbarWhenModal="True">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td>
                <dx:ASPxMenu ID="Toolbar_popupManagement" runat="server" Width="100%" ClientInstanceName="Toolbar_popupManagement" EnableClientSideAPI="True">
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
                        <dx:MenuItem Name="btnDelete" Text="Padam">
                            <Image IconID="edit_delete_16x16">
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
            <td style="padding-top:10px;">
                <dx:ASPxCallbackPanel ID="cbp_popupManagement" runat="server" ClientInstanceName="cbp_popupManagement" OnCallback="cbp_popupManagement_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_popupManagement_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="Form_popupManagement" runat="server" ColCount="2" ClientInstanceName="Form_popupManagement" Width="100%">
                                <Items>
                                    <dx:LayoutGroup ColCount="2" GroupBoxDecoration="None" Width="80%">
                                        <Items>
                                            <dx:LayoutItem Caption="Tajuk" ColSpan="2" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="BLT_Title" runat="server" ClientInstanceName="BLT_Title" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Mula" Width="10%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="BLT_StartDate" runat="server" ClientInstanceName="BLT_StartDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Tamat" Width="90%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="BLT_EndDate" runat="server" ClientInstanceName="BLT_EndDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Kandungan Buletin" ColSpan="2" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxMemo ID="BLT_Content" runat="server" ClientInstanceName="BLT_Content" EnableClientSideAPI="True" Rows="10" Width="100%">
                                                        </dx:ASPxMemo>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="BLT_Id" runat="server" ClientInstanceName="BLT_Id" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                        </dx:ASPxTextBox>
                                                        <dx:ASPxTextBox ID="BLT_Image" runat="server" ClientInstanceName="BLT_Image" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup GroupBoxDecoration="None" Width="20px">
                                        <Items>
                                            <dx:LayoutItem Caption="Imej Buletin" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxImage ID="BLT_ImagePic" runat="server" ClientInstanceName="BLT_ImagePic" EnableClientSideAPI="True" ShowLoadingImage="True" Height="160px" Width="160px">
                                                            <ClientSideEvents Click="function(s, e) {
	PrepareToUpload();
}" />
                                                        </dx:ASPxImage>
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

<dx:ASPxPopupControl ID="PopupPrint" runat="server" AllowDragging="True" ClientInstanceName="PopupPrint" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Cetakan Senarai Buletin" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowResize="True">
    <ClientSideEvents Closing="function(s, e) {
PopupPrint.SetContentUrl('about:blank');	
}" />
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server"></dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<dx:ASPxPopupControl ID="PopupAuditTrail" runat="server" ClientInstanceName="PopupAuditTrail" EnableClientSideAPI="True" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="1000px" HeaderText="Senarai Audit Buletin" AllowDragging="True" Height="650px" ScrollBars="Auto" ShowPageScrollbarWhenModal="True" MaxHeight="800px">
    <HeaderImage Url="~/Public/Images/DialogBox/Audit.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxFormLayout ID="FormAuditTrail" runat="server" ClientInstanceName="FormAuditTrail" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Senarai Audit" Width="40%">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxGridView ID="GridAuditListing" runat="server" ClientInstanceName="GridAuditListing" Width="100%" AutoGenerateColumns="False" DataSourceID="AuditMasterDs" KeyFieldName="ProcessId" OnCustomCallback="GridAuditListing_CustomCallback" OnHtmlDataCellPrepared="GridAuditListing_HtmlDataCellPrepared">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Kemaskini Oleh" FieldName="ModifiedBy" ShowInCustomizationForm="True" VisibleIndex="1" Width="75%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"> </CellStyle>
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="ModifiedBy" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="ModifiedDate" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"> </CellStyle>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="Tindakan" FieldName="ActionText" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="15%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"> </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" />
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    <Styles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </Styles>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="AuditMasterDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SELECT [ProcessId], [ModifiedBy], [ModifiedDate], [ActionText] FROM [V_Buletin_MasterAudit] ORDER BY [ModifiedDate] DESC"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Data Audit" Width="60%">
                <Items>
                    <dx:LayoutItem Caption="Maklumat Pengguna Sistem" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                <dx:ASPxGridView ID="GridAuditHeaderDetails" runat="server" ClientInstanceName="GridAuditHeaderDetails" Width="100%" AutoGenerateColumns="False" DataSourceID="AuditHeaderDs" EnableCallbackAnimation="True" OnCustomCallback="GridAuditHeaderDetails_CustomCallback">
                                   
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="RowControl" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Medan" FieldName="ColumnName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="30%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sebelum" FieldName="Before" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="35%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Selepas" FieldName="After" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="35%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <SettingsLoadingPanel Mode="Disabled" />
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    <Styles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </Styles>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="AuditHeaderDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SP_Buletin_AuditDetails" SelectCommandType="StoredProcedure" OnSelecting="AuditHeaderDs_Selecting">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="XX" Name="ProcessId" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="Pid" runat="server" ClientInstanceName="Pid" EnableClientSideAPI="True" Width="170px" ClientVisible="false">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
        <Paddings Padding="0px" />
        <Border BorderStyle="None" />
    </dx:ASPxFormLayout>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>













